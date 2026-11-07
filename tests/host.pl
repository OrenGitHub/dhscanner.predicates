% -----------------------------------------------------------------------------
% The host interface : dhscanner.service.queryengine loads these catalogs
% ( each kbapi template includes 'predicates/api', the root api.pl of this
% repo ).
%
% host_calls( Name/Arity ) : the catalog predicates the host calls, from its
%   kbapi templates ( templates/*.pl ). This is the public API of a release :
%   the load gate fails if one of them is missing, and renaming one or
%   changing its arity is a MAJOR version bump ( see CONTRIBUTING.md ). Keep
%   the list in sync with queryengine when it starts calling something new.
%
% The catalogs call nothing in the host : they use SWI built-ins only.
% -----------------------------------------------------------------------------

host_calls(callgraph_reaches_call_bounded/3).
host_calls(dataflow_bounded_intra_path/5).
host_calls(dataflow_inter_path/3).
host_calls(endpoints_http/4).
host_calls(endpoints_http_auth/3).
host_calls(endpoints_http_servlet/2).
host_calls(endpoints_user_input_servlet/1).
host_calls(endpoints_user_input_of_method_rails/2).
host_calls(sanitizers_condition_checks_input/6).
host_calls(sanitizers_top_level_if_then_else/4).
host_calls(sinks_arbitrary_file_deletion/1).
host_calls(sinks_arbitrary_file_read/1).
host_calls(sinks_arbitrary_file_write/1).
host_calls(sinks_http_request/1).
host_calls(sinks_open_redirect/1).
host_calls(sinks_sqli/1).
host_calls(sinks_ssrf/1).
