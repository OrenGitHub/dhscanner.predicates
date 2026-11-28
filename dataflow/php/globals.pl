:- style_check(-singleton).

% -----------------------------------------------------------------------------
% php `$GLOBALS` : a value written to a global flows to a read of the same
% global in a function the writer calls.
%
%   function greeting() {
%       return 'hello ' . $GLOBALS['name'];                  // Read
%   }
%   $GLOBALS['name'] = $user->name;                          // Write
%   echo greeting();                                         // Call
%
% In the kb ( parsers >= 1.1.71, fronts f22917f ), a constant key :
%
%   read   <dhscanner-instrumentation>[native-php-globals-read]( 'GLOBALS', 'name' )
%   write  <dhscanner-instrumentation>[native-php-globals-write]( 'GLOBALS', 'name', $user->name )
%
% the written value already flows to the write call ( kb_dataflow_edge ),
% and a read's value is the read call itself.
%
% Edge : Write -> Read when the caller of Write also calls a 1st party
% callable ( `dataflow_inter_callee/2` ) that contains Read, with the same
% constant name and key. `$GLOBALS` lives for one request, so the write
% only reaches reads in the same execution : the call is what ties them.
% Exactly one call deep, on purpose : no closure over the callgraph.
%
% Not covered : a read in the writer's own caller ( no call in between ), a
% read two or more calls deep, a dynamic key ( `$GLOBALS[ $k ]`, not lowered ),
% `global $x;` declarations. The kb has no statement order, so a call
% before the write also counts.
% -----------------------------------------------------------------------------

:- use_module(library(solution_sequences)).

% dataflow_edge_php_globals( Write, Read )
dataflow_edge_php_globals(Write, Read) :-
    kb_call_resolved(Write, '<dhscanner-instrumentation>[native-php-globals-write]'),
    distinct(Read, dataflow_php_globals_read_via_call(Write, Read)).

dataflow_php_globals_read_via_call(Write, Read) :-
    dataflow_php_globals_key(Write, Name, Key),
    kb_called_from(Write, Caller),
    kb_called_from(Call, Caller),
    dataflow_inter_callee(Call, Callee),
    kb_called_from(Read, Callee),
    kb_call_resolved(Read, '<dhscanner-instrumentation>[native-php-globals-read]'),
    dataflow_php_globals_key(Read, Name, Key).

dataflow_php_globals_key(Call, Name, Key) :-
    kb_arg_i_for_call(NameArg, 0, Call),
    kb_const_string(NameArg, Name),
    kb_arg_i_for_call(KeyArg, 1, Call),
    kb_const_string(KeyArg, Key).
