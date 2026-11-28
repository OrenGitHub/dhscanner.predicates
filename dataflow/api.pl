:- style_check(-singleton).

:- [ 'predicates/dataflow/php/blade' ].
:- [ 'predicates/dataflow/php/globals' ].

dataflow_intra_path(U, V, Path) :-
    between(1, 10, N),
    dataflow_bounded_intra_path(U, V, N, [U], Path),
    !.

dataflow_bounded_intra_path(A, C, N, _, [(A, C)]) :-
    N >= 1,
    dataflow_edge(A, C).

dataflow_bounded_intra_path(A, C, N, Visited, [(A, B)|Path]) :-
    N >= 2,
    dataflow_edge(A, B),
    \+ member(B, Visited),
    N_MINUS_1 is N - 1,
    dataflow_bounded_intra_path(B, C, N_MINUS_1, [B|Visited], Path).

% an edge : the kb's own, or one the kb cannot see ( a value passed to a
% Blade template, `php/blade.pl` ; a php global written then read in a
% callee, `php/globals.pl` ). Bounded like every other edge : each one
% counts against the path length.
dataflow_edge(A, B) :- kb_dataflow_edge(A, B).
dataflow_edge(A, B) :- dataflow_edge_blade(A, B).
dataflow_edge(A, B) :- dataflow_edge_php_globals(A, B).

% -----------------------------------------------------------------------------
% dataflow_inter_path( U, V, Path )
%
% U reaches V across one call, else across two ( `U` and `V` bound ), the
% shortest first, as the template prefers an intra path :
%
%     def post( self, request ):                   U = request
%         items = request.POST['items']
%         return export( key, items )              hop 1 : items -> export( _, items )
%     def export( key, items ):
%         return Response( render( items ) )       hop 2 : items passed as is -> render( items )
%     def render( items ):
%         for item in items:
%             requests.get( item['href'] )         V
%
% Every step walks forward from the bound side : every node within 10 intra
% edges of U ( U itself included : a source passed on as is,
% `RedirectToReturnUrl( returnUrl )` ), a call crossing from one of them
% ( `dataflow_inter_step/2` ), again from there, and V within 10 intra edges
% of the last crossing. No search over every inter edge of the kb : that one
% ( `dataflow_inter_edge/2` first ) ran past the queryengine timeout on a
% large kb whenever no 1 hop path existed. Every reach is breadth first, each
% node once with its shortest path.

dataflow_inter_path(U, V, Path) :-
    dataflow_inter_path_1_hop(U, V, Path),
    !.
dataflow_inter_path(U, V, Path) :-
    dataflow_inter_path_2_hops(U, V, Path),
    !.

dataflow_inter_path_1_hop(U, V, Path) :-
    dataflow_reach(U, 10, Reached1),
    member(From1-Rev1, Reached1),
    dataflow_inter_step(From1, To1),
    To1 \== U,
    dataflow_reach(To1, 10, Reached2),
    memberchk(V-Rev2, Reached2),
    reverse(Rev1, Caller),
    reverse(Rev2, Callee),
    append([Caller, [(From1, To1)], Callee], Path),
    !.

dataflow_inter_path_2_hops(U, V, Path) :-
    dataflow_reach(U, 10, Reached1),
    member(From1-Rev1, Reached1),
    dataflow_inter_step(From1, To1),
    To1 \== U,
    dataflow_reach(To1, 10, Reached2),
    member(From2-Rev2, Reached2),
    dataflow_inter_step(From2, To2),
    \+ memberchk(To2, [U, To1]),
    dataflow_reach(To2, 10, Reached3),
    memberchk(V-Rev3, Reached3),
    reverse(Rev1, Caller),
    reverse(Rev2, Middle),
    reverse(Rev3, Callee),
    append([Caller, [(From1, To1)], Middle, [(From2, To2)], Callee], Path),
    !.

% one call crossing from a bound node : an arg into its param, or a value a
% 1st party method returns into the calls of that method ( `dataflow_inter_edge/2`,
% from the bound side )
dataflow_inter_step(From, To) :- dataflow_arg_to_param(From, To).
dataflow_inter_step(From, To) :- dataflow_return_to_call(From, To).

% the param an arg flows into, the arg bound
dataflow_arg_to_param(Arg, Param) :-
    kb_arg_i_for_call(Arg, Index, Call),
    dataflow_inter_callee(Call, Callee),
    kb_param_i_of_callable(Param, Index, Callee).

% the calls a returned value flows into, the value bound : the calls named
% after its method ( `X.new` for `initialize`, as `callgraph_class_method_callee/2` )
% that resolve to that very method
dataflow_return_to_call(Returned, Call) :-
    kb_callable_returns_value(Method, Returned),
    kb_method_has_name(Method, Name),
    dataflow_call_name(Name, Called),
    (   kb_call_method_of_class(Call, Called, _)
    ;   kb_call_resolved(Call, Called)
    ),
    callgraph_class_method_callee(Call, Method).

dataflow_call_name(Name, Name).
dataflow_call_name(initialize, new).

% dataflow_reach( U, MaxEdges, Reached ) : every node within MaxEdges intra
% edges of U, as Node-RevPath ( the edges from U, last first ), U-[] first
dataflow_reach(U, MaxEdges, Reached) :-
    dataflow_reach_levels([U-[]], [U], MaxEdges, [U-[]], Reached).

dataflow_reach_levels([], _, _, Reached, Reached) :- !.
dataflow_reach_levels(_, _, 0, Reached, Reached) :- !.
dataflow_reach_levels(Frontier, Visited, Depth, Acc, Reached) :-
    findall(B-[(A, B)|Rev], ( member(A-Rev, Frontier), dataflow_edge(A, B), \+ memberchk(B, Visited) ), Candidates),
    dataflow_first_per_node(Candidates, [], Next),
    findall(B, member(B-_, Next), New),
    append(Visited, New, Visited1),
    append(Acc, Next, Acc1),
    Depth1 is Depth - 1,
    dataflow_reach_levels(Next, Visited1, Depth1, Acc1, Reached).

dataflow_first_per_node([], _, []).
dataflow_first_per_node([B-Rev|Rest], Seen, Next) :-
    (   memberchk(B, Seen)
    ->  Next = Next1
    ;   Next = [B-Rev|Next1]
    ),
    dataflow_first_per_node(Rest, [B|Seen], Next1).

% the 1st party callable a call resolves to, the call bound ( same three ways as
% `dataflow_inter_edge_from_arg_to_param/2` below )
dataflow_inter_callee(Call, Func) :-
    kb_call_1st_party_func_defined_in_dir(Call, FuncName, FuncDefinedInDir),
    kb_func_def(Func, FuncName, _, FuncDefinedInDir).
dataflow_inter_callee(Call, Func) :-
    kb_call_1st_party_func_defined_in_file(Call, FuncName, FuncDefinedInFile),
    kb_func_def(Func, FuncName, FuncDefinedInFile, _).
dataflow_inter_callee(Call, Method) :-
    callgraph_class_method_callee(Call, Method).

dataflow_inter_edge(U, V) :- dataflow_inter_edge_from_arg_to_param(U, V).
dataflow_inter_edge(U, V) :- dataflow_inter_edge_from_return_to_call(U, V).

% a value a method of a 1st party class returns flows to the call ( OrenGitHub/dhscanner.runner#158 ) :
%
%     def show
%       redirect_to avatar_url                                           Call ( :9 )
%     def avatar_url
%       "#{base_url}/integrations/slack/#{params[:sender_type]}.png"    Returned ( :30 )
%
% ( Chatwoot `slack_uploads_controller.rb` ). The callee is the one `callgraph_class_method_callee/2`
% resolves, and every value it returns ( `kb_callable_returns_value/2`, a ruby def returns its last
% expression ) flows to every call of it : context insensitive, one tainted return is enough.
dataflow_inter_edge_from_return_to_call(Returned, Call) :-
    callgraph_class_method_callee(Call, Method),
    kb_callable_returns_value(Method, Returned).

dataflow_inter_edge_from_arg_to_param(Arg, Param) :-
    kb_call_1st_party_func_defined_in_dir(Call, FuncName, FuncDefinedInDir),
    kb_func_def(Func, FuncName, _, FuncDefinedInDir),
    kb_arg_i_for_call(Arg, Index, Call),
    kb_param_i_of_callable(Param, Index, Func).

dataflow_inter_edge_from_arg_to_param(Arg, Param) :-
    kb_call_1st_party_func_defined_in_file(Call, FuncName, FuncDefinedInFile),
    kb_func_def(Func, FuncName, FuncDefinedInFile, _),
    kb_arg_i_for_call(Arg, Index, Call),
    kb_param_i_of_callable(Param, Index, Func).

% a method of a 1st party class : `CategoryUser.set_notification_level_for_category( user, level, id )`
% ( `callgraph_class_method_callee/2`, OrenGitHub/dhscanner.runner#152 ). Positional args only : a
% ruby `key: value` arg is not a positional param.
dataflow_inter_edge_from_arg_to_param(Arg, Param) :-
    callgraph_class_method_callee(Call, Method),
    kb_arg_i_for_call(Arg, Index, Call),
    kb_param_i_of_callable(Param, Index, Method).
