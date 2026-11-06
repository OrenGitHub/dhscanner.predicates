:- style_check(-singleton).

% -----------------------------------------------------------------------------
% callgraph_reaches_call_bounded( Source, CallSite, N )
%
% Every call site in a callable reachable from Source ( any callable
% location atom, e.g. an http handler ) within N callable-to-callable hops,
% Source itself included ( 0 hops ). Callers classify the call site, e.g.
% with a `sinks_*/1` predicate ( kbapi `SelectControlFlowReachableSinks` ).
%
% Breadth first over callables with a seen set : the call sites within N
% hops are the same as with path enumeration, but java virtual dispatch
% makes the callable graph dense enough for path enumeration to blow up
% ( runner #119 ).
%
% One-hop edges ( callgraph_reach_edge/2 ), the ways the KB resolves a
% call out of a callable's body :
%
%   1. a 1st-party call resolved to a function in a file
%   2. a 1st-party call resolved to a function in a dir
%   3. a next.js HOC wrapper -> its inner handler lambda
%      ( endpoints_hoc_dict_handler_unwrap_nextjs/2 ) : the exported
%      `PUT` only calls `authenticatedApiClient({ handler : <lambda> })`,
%      the request handling lives in the lambda
%   4. java virtual dispatch ( callgraph_callable_calls_callable/2 )
%   5. a lambda passed as an argument of a call site in the caller's body :
%      a ruby block ( `json_result(@category) do |cat| ... end` , the
%      parsers lower the block to the call's last arg ) or a js callback.
%      An over approximation : the callee is assumed to call it
%
% Moved from queryengine's utils.pl ( utils_control_flow_reaches_call_bounded
% and friends ), OrenGitHub/dhscanner.runner#143.
% -----------------------------------------------------------------------------

callgraph_reaches_call_bounded(Source, CallSite, N) :-
    callgraph_callables_within(Source, N, Callables),
    member(Callable, Callables),
    kb_called_from(CallSite, Callable).

callgraph_callables_within(Source, N, Callables) :-
    callgraph_reach_bfs([Source], [Source], N, Callables).

callgraph_reach_bfs([], Seen, _, Seen) :- !.
callgraph_reach_bfs(_, Seen, 0, Seen) :- !.
callgraph_reach_bfs(Frontier, Seen, N, Callables) :-
    findall(Callee, ( member(Caller, Frontier), callgraph_reach_edge(Caller, Callee) ), Callees),
    sort(Callees, Sorted),
    ord_subtract(Sorted, Seen, New),
    ord_union(Seen, New, Seen1),
    N_MINUS_1 is N - 1,
    callgraph_reach_bfs(New, Seen1, N_MINUS_1, Callables).

callgraph_reach_edge(Caller, Callee) :-
    kb_called_from(CallSite, Caller),
    kb_call_1st_party_func_defined_in_file(CallSite, FuncName, FilePath),
    kb_func_def(Callee, FuncName, FilePath, _).

callgraph_reach_edge(Caller, Callee) :-
    kb_called_from(CallSite, Caller),
    kb_call_1st_party_func_defined_in_dir(CallSite, FuncName, DirPath),
    kb_func_def(Callee, FuncName, _, DirPath).

callgraph_reach_edge(Wrapper, Handler) :-
    endpoints_hoc_dict_handler_unwrap_nextjs(Wrapper, Handler).

callgraph_reach_edge(Caller, Callee) :-
    callgraph_callable_calls_callable(Caller, Callee).

callgraph_reach_edge(Caller, Lambda) :-
    kb_called_from(CallSite, Caller),
    kb_arg_i_for_call(Lambda, _, CallSite),
    kb_callable_source_body_length(Lambda, _).
