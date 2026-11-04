% fixture : sinks/files/golang/native.pl

% os.Remove( path )
kb_call_resolved(startloc_30_2_endloc_30_20_cmd_slash_server_slash_main_dot_go, 'os.Remove').

% os.RemoveAll( path ) : not in the catalog
kb_call_resolved(startloc_31_2_endloc_31_23_cmd_slash_server_slash_main_dot_go, 'os.RemoveAll').
% os.Open( path ) : opening is not deleting
kb_call_resolved(startloc_32_2_endloc_32_18_cmd_slash_server_slash_main_dot_go, 'os.Open').

must(sinks_arbitrary_file_deletion_golang(startloc_30_2_endloc_30_20_cmd_slash_server_slash_main_dot_go)).
% wired into the family api
must(sinks_arbitrary_file_deletion(startloc_30_2_endloc_30_20_cmd_slash_server_slash_main_dot_go)).

must_not(sinks_arbitrary_file_deletion_golang(startloc_31_2_endloc_31_23_cmd_slash_server_slash_main_dot_go)).
must_not(sinks_arbitrary_file_deletion_golang(startloc_32_2_endloc_32_18_cmd_slash_server_slash_main_dot_go)).
must_not(sinks_arbitrary_file_deletion(startloc_32_2_endloc_32_18_cmd_slash_server_slash_main_dot_go)).
