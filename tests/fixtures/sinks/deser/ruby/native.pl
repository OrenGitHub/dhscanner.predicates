% fixture : sinks/deser/ruby/native.pl

% YAML.load_stream( params[ :doc ] )
kb_call_resolved(startloc_15_7_endloc_15_40_app_slash_controllers_slash_imports_controller_dot_rb, 'YAML.load_stream').
% YAML.safe_load( params[ :doc ] ) : the safe loader
kb_call_resolved(startloc_16_7_endloc_16_40_app_slash_controllers_slash_imports_controller_dot_rb, 'YAML.safe_load').
% parser.load_stream( doc ) on an unresolved receiver
kb_call_resolved(startloc_17_7_endloc_17_30_app_slash_controllers_slash_imports_controller_dot_rb, 'Unknown.load_stream').

must(sinks_unsafe_deserialization_ruby(startloc_15_7_endloc_15_40_app_slash_controllers_slash_imports_controller_dot_rb)).
% wired into the family api
must(sinks_unsafe_deserialization(startloc_15_7_endloc_15_40_app_slash_controllers_slash_imports_controller_dot_rb)).

must_not(sinks_unsafe_deserialization_ruby(startloc_16_7_endloc_16_40_app_slash_controllers_slash_imports_controller_dot_rb)).
must_not(sinks_unsafe_deserialization_ruby(startloc_17_7_endloc_17_30_app_slash_controllers_slash_imports_controller_dot_rb)).
must_not(sinks_unsafe_deserialization(startloc_16_7_endloc_16_40_app_slash_controllers_slash_imports_controller_dot_rb)).
