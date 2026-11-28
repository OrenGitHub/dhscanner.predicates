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
%   6. a call whose arg 0 names a script file -> that script : a rendered
%      template ( Laravel `view( File, .. )`, a Blade `@include`, whose
%      compiled `$__env->make( File, .. )` the php fronts rewrite to the file ).
%      The script is the caller of its top level calls ( kb_called_from_script ,
%      kbgen >= 2.10.0 ) : any one of them names its location
%   5. a lambda passed as an argument of a call site in the caller's body :
%      a ruby block ( `json_result(@category) do |cat| ... end` , the
%      parsers lower the block to the call's last arg ) or a js callback.
%      An over approximation : the callee is assumed to call it
%
% Moved from queryengine's utils.pl ( utils_control_flow_reaches_call_bounded
% and friends ), OrenGitHub/dhscanner.runner#143.
% -----------------------------------------------------------------------------

:- dynamic kb_called_from_script/2.

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

callgraph_reach_edge(Caller, Script) :-
    kb_called_from(Render, Caller),
    kb_arg_i_for_call(Arg0, 0, Render),
    kb_const_string(Arg0, File),
    once((
        kb_called_from_script(TopLevelCall, File),
        kb_called_from(TopLevelCall, Script)
    )).

callgraph_reach_edge(Caller, Lambda) :-
    kb_called_from(CallSite, Caller),
    kb_arg_i_for_call(Lambda, _, CallSite),
    kb_callable_source_body_length(Lambda, _).

% -----------------------------------------------------------------------------
% callgraph_reaches_call_bounded_chain( Source, CallSite, N, Chain )
%
% As callgraph_reaches_call_bounded/3, plus how : `Chain` is the call sites
% from Source down to the callable that contains CallSite, Source side
% first, `[]` when Source contains it. One shortest chain per callable
% ( breadth first, the first parent wins ). A hop with no call site in the
% kb ( a next.js HOC unwrap, a java virtual dispatch ) is spelled by the
% callee's own location.

callgraph_reaches_call_bounded_chain(Source, CallSite, N, Chain) :-
    callgraph_reach_bfs_parents([Source], [Source], N, [], Parents),
    pairs_keys(Parents, Reached),
    member(Callable, [Source|Reached]),
    kb_called_from(CallSite, Callable),
    callgraph_reach_chain_to(Callable, Source, Parents, [], Chain).

% Parents : Callee-( Caller, CallSite ) for every callable reached from Source
callgraph_reach_bfs_parents([], _, _, Parents, Parents) :- !.
callgraph_reach_bfs_parents(_, _, 0, Parents, Parents) :- !.
callgraph_reach_bfs_parents(Frontier, Seen, N, Parents0, Parents) :-
    findall(Callee-(Caller, CallSite), (
        member(Caller, Frontier),
        callgraph_reach_edge(Caller, Callee),
        \+ memberchk(Callee, Seen),
        callgraph_reach_edge_call_site(Caller, Callee, CallSite)
    ), Found),
    callgraph_first_parent_per_callee(Found, [], New),
    pairs_keys(New, NewCallables0),
    sort(NewCallables0, NewCallables),
    ord_union(Seen, NewCallables, Seen1),
    append(Parents0, New, Parents1),
    N_MINUS_1 is N - 1,
    callgraph_reach_bfs_parents(NewCallables, Seen1, N_MINUS_1, Parents1, Parents).

callgraph_first_parent_per_callee([], Acc, New) :- reverse(Acc, New).
callgraph_first_parent_per_callee([Callee-P|Rest], Acc, New) :-
    (   memberchk(Callee-_, Acc)
    ->  callgraph_first_parent_per_callee(Rest, Acc, New)
    ;   callgraph_first_parent_per_callee(Rest, [Callee-P|Acc], New)
    ).

callgraph_reach_chain_to(Source, Source, _, Chain, Chain) :- !.
callgraph_reach_chain_to(Callable, Source, Parents, Acc, Chain) :-
    memberchk(Callable-(Caller, CallSite), Parents),
    callgraph_reach_chain_to(Caller, Source, Parents, [CallSite|Acc], Chain).

% the call site of one callgraph_reach_edge/2 hop, once ; the callee itself
% when the kb has none
callgraph_reach_edge_call_site(Caller, Callee, CallSite) :-
    once((
        kb_called_from(CallSite, Caller),
        callgraph_reach_call_site_resolves_to(CallSite, Callee)
    ;   CallSite = Callee
    )).

callgraph_reach_call_site_resolves_to(CallSite, Callee) :-
    kb_call_1st_party_func_defined_in_file(CallSite, FuncName, FilePath),
    kb_func_def(Callee, FuncName, FilePath, _).
callgraph_reach_call_site_resolves_to(CallSite, Callee) :-
    kb_call_1st_party_func_defined_in_dir(CallSite, FuncName, DirPath),
    kb_func_def(Callee, FuncName, _, DirPath).
callgraph_reach_call_site_resolves_to(CallSite, Callee) :-
    callgraph_class_method_callee(CallSite, Callee).
callgraph_reach_call_site_resolves_to(CallSite, Lambda) :-
    kb_arg_i_for_call(Lambda, _, CallSite).
callgraph_reach_call_site_resolves_to(CallSite, Script) :-
    kb_arg_i_for_call(Arg0, 0, CallSite),
    kb_const_string(Arg0, File),
    kb_called_from_script(TopLevelCall, File),
    kb_called_from(TopLevelCall, Script).
