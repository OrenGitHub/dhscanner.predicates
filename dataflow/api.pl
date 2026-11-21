:- style_check(-singleton).

dataflow_intra_path(U, V, Path) :-
    between(1, 10, N),
    dataflow_bounded_intra_path(U, V, N, [U], Path),
    !.

dataflow_bounded_intra_path(A, C, N, _, [(A, C)]) :-
    N >= 1,
    kb_dataflow_edge(A, C).

dataflow_bounded_intra_path(A, C, N, Visited, [(A, B)|Path]) :-
    N >= 2,
    kb_dataflow_edge(A, B),
    \+ member(B, Visited),
    N_MINUS_1 is N - 1,
    dataflow_bounded_intra_path(B, C, N_MINUS_1, [B|Visited], Path).

% the source itself is the arg : a param passed on as is, `RedirectToReturnUrl( returnUrl )`.
% The kb locates such an arg at the variable's own definition, so the caller side path is
% empty ( the clause below needs at least one edge ). `U` is bound : start from its calls.
dataflow_inter_path(U, V, [(U, Param)|CalleeSidePath]) :-
    kb_arg_i_for_call(U, Index, Call),
    dataflow_inter_callee(Call, Callee),
    kb_param_i_of_callable(Param, Index, Callee),
    Param \== U,
    between(1, 10, CalleeSideDataflowPathLen),
    dataflow_bounded_intra_path(Param, V, CalleeSideDataflowPathLen, [U, Param], CalleeSidePath).

dataflow_inter_path(U, V, Path) :-
    dataflow_inter_edge(Call, Callee),
    between(1, 10, CallerSideDataflowPathLen),
    between(1, 10, CalleeSideDataflowPathLen),
    dataflow_bounded_intra_path(U, Call, CallerSideDataflowPathLen, [U], CallerSidePath),
    dataflow_bounded_intra_path(Callee, V, CalleeSideDataflowPathLen, [U, Call, Callee], CalleeSidePath),
    \+ member(Callee, [U, Call]),
    append(CallerSidePath, [(Call, Callee)|CalleeSidePath], Path).

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
