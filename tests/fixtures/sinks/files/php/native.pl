% fixture : sinks/files/php/native.pl

% include $file;
kb_call_resolved(startloc_8_1_endloc_8_14_app_slash_views_slash_page_dot_php, '<dhscanner-instrumentation>[dynamic-import]').
% require_once __DIR__ . '/a.php';
kb_call_resolved(startloc_9_1_endloc_9_32_app_slash_views_slash_page_dot_php, '<dhscanner-instrumentation>[dynamic-import]').
% other instrumentation calls are not includes
kb_call_resolved(startloc_10_1_endloc_10_20_app_slash_views_slash_page_dot_php, '<dhscanner-instrumentation>[foreach]').
% file_exists( $file ) : a check
kb_call_resolved(startloc_11_5_endloc_11_23_app_slash_views_slash_page_dot_php, 'file_exists').

must(sinks_arbitrary_file_read_php(startloc_8_1_endloc_8_14_app_slash_views_slash_page_dot_php)).
must(sinks_arbitrary_file_read_php(startloc_9_1_endloc_9_32_app_slash_views_slash_page_dot_php)).
% wired into the family api
must(sinks_arbitrary_file_read(startloc_8_1_endloc_8_14_app_slash_views_slash_page_dot_php)).

must_not(sinks_arbitrary_file_read_php(startloc_10_1_endloc_10_20_app_slash_views_slash_page_dot_php)).
must_not(sinks_arbitrary_file_read_php(startloc_11_5_endloc_11_23_app_slash_views_slash_page_dot_php)).
