% -----------------------------------------------------------------------------
% kb_* fact vocabulary this release of dhscanner.predicates targets.
%
% Target : dhscanner-kbgen 2.4.0 ( Hackage ). Every fact kbgen emits is listed
% here, with its arity, as `dynamic` + `discontiguous`, so that :
%
%   - a fixture kb only has to state the facts it cares about ; a catalog
%     clause that reads a fact the fixture leaves out fails cleanly instead
%     of throwing "Unknown procedure".
%   - the load gate ( tests/check.pl ) can tell a real KB fact from a typo :
%     a `kb_*` predicate a catalog calls that is NOT listed here is reported
%     as undefined.
%
% Regenerate when kbgen adds / renames / changes the arity of a fact ( the
% list is the set of `printf "kb_...( ... )."` emitters in kbgen's
% src/Kbgen.hs ), and record the new kbgen version here and in CHANGELOG.md.
% -----------------------------------------------------------------------------

kb_schema_kbgen_version('2.4.0').

kb_schema_fact(kb_arg_i_for_call/3).
kb_schema_fact(kb_assign_value_to_toplevel_varname/4).
kb_schema_fact(kb_call_1st_party_func_defined_in_dir/3).
kb_schema_fact(kb_call_1st_party_func_defined_in_file/3).
kb_schema_fact(kb_call_guarded_by_cond_in_else_part/3).
kb_schema_fact(kb_call_guarded_by_cond_in_then_part/3).
kb_schema_fact(kb_call_method_of_class/3).
kb_schema_fact(kb_call_method_of_untyped_named_param/3).
kb_schema_fact(kb_call_resolved/2).
kb_schema_fact(kb_callable_has_annotation/2).
kb_schema_fact(kb_callable_returns_value/2).
kb_schema_fact(kb_callable_returns_without_value/2).
kb_schema_fact(kb_callable_source_body_length/2).
kb_schema_fact(kb_called_from/2).
kb_schema_fact(kb_class_def/3).
kb_schema_fact(kb_class_has_1st_party_super/3).
kb_schema_fact(kb_class_has_3rd_party_super/3).
kb_schema_fact(kb_class_has_annotation/2).
kb_schema_fact(kb_class_name/2).
kb_schema_fact(kb_comparison/4).
kb_schema_fact(kb_const_int/2).
kb_schema_fact(kb_const_null/1).
kb_schema_fact(kb_const_string/2).
kb_schema_fact(kb_dataflow_edge/2).
kb_schema_fact(kb_field_read_resolved/2).
kb_schema_fact(kb_func_def/4).
kb_schema_fact(kb_gated_return/2).
kb_schema_fact(kb_keyword_arg_for_call/3).
kb_schema_fact(kb_method_has_name/2).
kb_schema_fact(kb_method_of_class/2).
kb_schema_fact(kb_param_has_annotation/2).
kb_schema_fact(kb_param_has_name/2).
kb_schema_fact(kb_param_has_resolved_type/2).
kb_schema_fact(kb_param_i_of_callable/3).
kb_schema_fact(kb_top_level_if_then_else_gadget/4).

:- forall(kb_schema_fact(PI), ( dynamic(PI), discontiguous(PI) )).
