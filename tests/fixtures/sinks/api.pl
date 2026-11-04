% fixture : sinks/api.pl
%
% One minimal kb per family entry point. sinks_has_prepared_statement_fqn/1
% is not exercised : both its leaves read kb_has_fqn/2, which kbgen never
% emits ( known_undefined in tests/check.pl ).

% sinks_cmd_exec : exec.Command( "sh", "-c", cmd )
kb_call_resolved(startloc_10_5_endloc_10_40_cmd_slash_main_dot_go, 'os/exec.Command').
% sinks_sqli : connection.cursor().execute( sql )
kb_call_resolved(startloc_20_5_endloc_20_45_app_slash_db_dot_py, 'django.db.connection.cursor.execute').
% sinks_ssrf : requests.get( url )
kb_call_resolved(startloc_30_5_endloc_30_30_app_slash_views_dot_py, 'requests.get').
% sinks_http_request : http.Get( url )
kb_call_resolved(startloc_40_5_endloc_40_30_cmd_slash_main_dot_go, 'net/http.Get').
% sinks_arbitrary_file_read : open( path )
kb_call_resolved(startloc_50_5_endloc_50_20_app_slash_views_dot_py, 'open').
% sinks_arbitrary_file_write : await writeFile( path, data ) , the sink is arg 0
kb_call_resolved(startloc_60_11_endloc_60_40_src_slash_upload_dot_js, 'fs/promises.writeFile').
kb_arg_i_for_call(startloc_60_21_endloc_60_25_src_slash_upload_dot_js, 0, startloc_60_11_endloc_60_40_src_slash_upload_dot_js).
kb_arg_i_for_call(startloc_60_27_endloc_60_31_src_slash_upload_dot_js, 1, startloc_60_11_endloc_60_40_src_slash_upload_dot_js).
% sinks_arbitrary_file_deletion : os.Remove( path )
kb_call_resolved(startloc_70_5_endloc_70_25_cmd_slash_main_dot_go, 'os.Remove').
% sinks_open_redirect : django.shortcuts.redirect( next )
kb_call_resolved(startloc_80_12_endloc_80_40_app_slash_views_dot_py, 'django.shortcuts.redirect').
% sinks_unsafe_deserialization : YAML.load_stream( doc )
kb_call_resolved(startloc_90_7_endloc_90_30_app_slash_models_slash_import_dot_rb, 'YAML.load_stream').

% near misses
% exec.LookPath( name ) : runs nothing
kb_call_resolved(startloc_11_5_endloc_11_30_cmd_slash_main_dot_go, 'os/exec.LookPath').
% Unit.objects.filter( pk = pk ) : parameterized ORM query
kb_call_resolved(startloc_21_5_endloc_21_40_app_slash_db_dot_py, 'weblate.trans.models.Unit.objects.filter').
% urllib.request.Request( url ) : building a request is not sending it
kb_call_resolved(startloc_31_5_endloc_31_35_app_slash_views_dot_py, 'urllib.request.Request').
% YAML.safe_load( doc )
kb_call_resolved(startloc_91_7_endloc_91_30_app_slash_models_slash_import_dot_rb, 'YAML.safe_load').

must(sinks_cmd_exec(startloc_10_5_endloc_10_40_cmd_slash_main_dot_go)).
must(sinks_sqli(startloc_20_5_endloc_20_45_app_slash_db_dot_py)).
must(sinks_ssrf(startloc_30_5_endloc_30_30_app_slash_views_dot_py)).
must(sinks_http_request(startloc_40_5_endloc_40_30_cmd_slash_main_dot_go)).
must(sinks_arbitrary_file_read(startloc_50_5_endloc_50_20_app_slash_views_dot_py)).
must(sinks_arbitrary_file_write(startloc_60_21_endloc_60_25_src_slash_upload_dot_js)).
must(sinks_arbitrary_file_deletion(startloc_70_5_endloc_70_25_cmd_slash_main_dot_go)).
must(sinks_open_redirect(startloc_80_12_endloc_80_40_app_slash_views_dot_py)).
must(sinks_unsafe_deserialization(startloc_90_7_endloc_90_30_app_slash_models_slash_import_dot_rb)).

must_not(sinks_cmd_exec(startloc_11_5_endloc_11_30_cmd_slash_main_dot_go)).
must_not(sinks_sqli(startloc_21_5_endloc_21_40_app_slash_db_dot_py)).
must_not(sinks_ssrf(startloc_31_5_endloc_31_35_app_slash_views_dot_py)).
% families do not bleed into each other : net/http.Get is http_request, not ssrf
must_not(sinks_ssrf(startloc_40_5_endloc_40_30_cmd_slash_main_dot_go)).
% file write marks the path argument, not the data argument nor the call
must_not(sinks_arbitrary_file_write(startloc_60_27_endloc_60_31_src_slash_upload_dot_js)).
must_not(sinks_arbitrary_file_write(startloc_60_11_endloc_60_40_src_slash_upload_dot_js)).
% os.Remove deletes, it does not read
must_not(sinks_arbitrary_file_read(startloc_70_5_endloc_70_25_cmd_slash_main_dot_go)).
must_not(sinks_unsafe_deserialization(startloc_91_7_endloc_91_30_app_slash_models_slash_import_dot_rb)).
% a redirect sink is not a cmd exec sink
must_not(sinks_cmd_exec(startloc_80_12_endloc_80_40_app_slash_views_dot_py)).
