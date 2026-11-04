% -----------------------------------------------------------------------------
% The host interface : dhscanner.service.queryengine loads these catalogs
% ( its utils.pl includes 'predicates/api', the root api.pl of this repo ),
% and the two sides call into each other.
%
% host_calls( Name/Arity ) : the catalog predicates the host calls, from its
%   templates/*.pl and utils.pl. This is the public API of a release : the
%   load gate fails if one of them is missing, and renaming one or changing
%   its arity is a MAJOR version bump ( see CONTRIBUTING.md ). Keep the list
%   in sync with queryengine when it starts calling something new.
%
% host_predicate( Name/Arity ) : helpers the host defines in its utils.pl
%   that some catalogs call. Tests load the definitions below in their place.
%   Each MUST stay identical to the host's, and the list should only shrink :
%   new catalogs use plain SWI built-ins instead ( e.g.
%   `atom_concat(_, Suffix, Atom)` rather than `endswith/2` ).
% -----------------------------------------------------------------------------

% queryengine templates/*.pl
host_calls(dataflow_bounded_intra_path/5).
host_calls(dataflow_inter_path/3).
host_calls(endpoints_http/4).
host_calls(endpoints_http_auth/3).
host_calls(endpoints_http_servlet/2).
host_calls(endpoints_user_input_servlet/1).
host_calls(sanitizers_condition_checks_input/6).
host_calls(sanitizers_top_level_if_then_else/4).
host_calls(sinks_arbitrary_file_deletion/1).
host_calls(sinks_arbitrary_file_read/1).
host_calls(sinks_arbitrary_file_write/1).
host_calls(sinks_http_request/1).
host_calls(sinks_open_redirect/1).
host_calls(sinks_sqli/1).
host_calls(sinks_ssrf/1).
% queryengine utils.pl
host_calls(callgraph_callable_calls_callable/2).
host_calls(dataflow_intra_path/3).
host_calls(endpoints_hoc_dict_handler_unwrap_nextjs/2).
host_calls(endpoints_user_input/1).
host_calls(sinks_cmd_exec/1).
host_calls(sinks_sqli_php_yii/1).
host_calls(sinks_unsafe_deserialization/1).

host_predicate(endswith/2).

% queryengine utils.pl
endswith(StringInput, StringSuffix) :- atom_concat(_, StringSuffix, StringInput).
