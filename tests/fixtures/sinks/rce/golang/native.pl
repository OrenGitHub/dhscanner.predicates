% fixture : sinks/rce/golang/native.pl

% exec.Command( "sh", "-c", cmd )
kb_call_resolved(startloc_22_9_endloc_22_40_cmd_slash_server_slash_main_dot_go, 'os/exec.Command').
% exec.CommandContext( ctx, "sh", "-c", cmd )
kb_call_resolved(startloc_23_9_endloc_23_50_cmd_slash_server_slash_main_dot_go, 'os/exec.CommandContext').
% exec.LookPath( name ) : resolves a binary, runs nothing
kb_call_resolved(startloc_24_9_endloc_24_35_cmd_slash_server_slash_main_dot_go, 'os/exec.LookPath').
% cmd.Run() on the *exec.Cmd : the sink is the Command call that built it
kb_call_resolved(startloc_25_9_endloc_25_20_cmd_slash_server_slash_main_dot_go, 'os/exec.Cmd.Run').

must(sinks_cmd_exec_golang(startloc_22_9_endloc_22_40_cmd_slash_server_slash_main_dot_go)).
must(sinks_cmd_exec_golang(startloc_23_9_endloc_23_50_cmd_slash_server_slash_main_dot_go)).
% wired into the family api
must(sinks_cmd_exec(startloc_22_9_endloc_22_40_cmd_slash_server_slash_main_dot_go)).

must_not(sinks_cmd_exec_golang(startloc_24_9_endloc_24_35_cmd_slash_server_slash_main_dot_go)).
must_not(sinks_cmd_exec_golang(startloc_25_9_endloc_25_20_cmd_slash_server_slash_main_dot_go)).
must_not(sinks_cmd_exec(startloc_24_9_endloc_24_35_cmd_slash_server_slash_main_dot_go)).
