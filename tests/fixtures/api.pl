% fixture : api.pl
%
% The root only includes the six families ( the load gate checks every
% file is reached from it ) ; one call into each family checks the wiring.

% sinks : os/exec.Command( name, args... )
kb_call_resolved(startloc_12_9_endloc_12_40_cmd_slash_run_dot_go, 'os/exec.Command').
% sinks near miss : os/exec.LookPath( name ) only resolves a path
kb_call_resolved(startloc_13_9_endloc_13_40_cmd_slash_run_dot_go, 'os/exec.LookPath').

% sanitizers : response.sendError( 403 )
kb_call_resolved(startloc_30_9_endloc_30_40_src_slash_main_slash_java_slash_Api_dot_java, 'jakarta.servlet.http.HttpServletResponse.sendError').
% sanitizers near miss : response.sendRedirect( url ) is not an error
kb_call_resolved(startloc_31_9_endloc_31_40_src_slash_main_slash_java_slash_Api_dot_java, 'jakarta.servlet.http.HttpServletResponse.sendRedirect').

% dataflow : a -> b -> c inside one function
kb_dataflow_edge(startloc_5_1_endloc_5_2_app_slash_flow_dot_py, startloc_6_1_endloc_6_2_app_slash_flow_dot_py).
kb_dataflow_edge(startloc_6_1_endloc_6_2_app_slash_flow_dot_py, startloc_7_1_endloc_7_2_app_slash_flow_dot_py).

must(sinks_cmd_exec(startloc_12_9_endloc_12_40_cmd_slash_run_dot_go)).
must(sanitizers_error_call(startloc_30_9_endloc_30_40_src_slash_main_slash_java_slash_Api_dot_java)).
must(dataflow_intra_path(startloc_5_1_endloc_5_2_app_slash_flow_dot_py, startloc_7_1_endloc_7_2_app_slash_flow_dot_py, _)).

must_not(sinks_cmd_exec(startloc_13_9_endloc_13_40_cmd_slash_run_dot_go)).
must_not(sanitizers_error_call(startloc_31_9_endloc_31_40_src_slash_main_slash_java_slash_Api_dot_java)).
% edges are directed
must_not(dataflow_intra_path(startloc_7_1_endloc_7_2_app_slash_flow_dot_py, startloc_5_1_endloc_5_2_app_slash_flow_dot_py, _)).
% nothing in this kb is an endpoint, an authenticator or a call edge
must_not(endpoints_http(_, _, _, _)).
must_not(auth_authenticating_function(_)).
must_not(callgraph_callable_calls_callable(_, _)).
