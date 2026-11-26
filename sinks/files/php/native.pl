:- style_check(-singleton).

% -----------------------------------------------------------------------------
% PHP file sinks.
%
% include / require ( and their _once forms ) of a non constant file : the
% parsers model it as a call of `<dhscanner-instrumentation>[dynamic-import]`
% with the file as its only arg ( parsers >= 1.1.69 ) :
%
%   include $file;                        dynamic-import( $file )
%   require_once __DIR__ . '/a.php';      dynamic-import( __DIR__ . '/a.php' )
%   include 'fixed.php';                  stays a constant string, no call
%
% A tainted file runs any reachable php file ( local file inclusion ), so
% the call is a read sink -> `sinks_arbitrary_file_read_php( Call )`.
%
% No taint check here, dataflow is composed on top.
% -----------------------------------------------------------------------------

sinks_arbitrary_file_read_php(Call) :-
    kb_call_resolved(Call, '<dhscanner-instrumentation>[dynamic-import]').
