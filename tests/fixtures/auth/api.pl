% fixture : auth/api.pl
%
% auth/api.pl only loads auth/nodejs/native.pl and auth/common.pl : this
% fixture checks the two are wired together, a common.pl shape recognizer
% firing on a nodejs leaf.

% apps/web/middleware.ts
%
% export function requireUser( req ) {
%     if ( !req.session ) return Response.json( body, { status: 401 } );
% }                                                   // + fall-through return null
kb_func_def(startloc_3_8_endloc_6_2_apps_slash_web_slash_middleware_dot_ts, 'requireUser', 'apps/web/middleware.ts', 'apps/web').
kb_callable_returns_value(startloc_3_8_endloc_6_2_apps_slash_web_slash_middleware_dot_ts, startloc_3_8_endloc_6_2_apps_slash_web_slash_middleware_dot_ts).
kb_callable_returns_value(startloc_3_8_endloc_6_2_apps_slash_web_slash_middleware_dot_ts, startloc_4_32_endloc_4_94_apps_slash_web_slash_middleware_dot_ts).
kb_called_from(startloc_4_32_endloc_4_94_apps_slash_web_slash_middleware_dot_ts, startloc_3_8_endloc_6_2_apps_slash_web_slash_middleware_dot_ts).
kb_call_resolved(startloc_4_32_endloc_4_94_apps_slash_web_slash_middleware_dot_ts, 'nodejs.Response.json').
kb_arg_i_for_call(startloc_4_70_endloc_4_93_apps_slash_web_slash_middleware_dot_ts, 1, startloc_4_32_endloc_4_94_apps_slash_web_slash_middleware_dot_ts).
kb_arg_i_for_call(startloc_4_72_endloc_4_83_apps_slash_web_slash_middleware_dot_ts, 0, startloc_4_70_endloc_4_93_apps_slash_web_slash_middleware_dot_ts).
kb_arg_i_for_call(startloc_4_72_endloc_4_78_apps_slash_web_slash_middleware_dot_ts, 0, startloc_4_72_endloc_4_83_apps_slash_web_slash_middleware_dot_ts).
kb_const_string(startloc_4_72_endloc_4_78_apps_slash_web_slash_middleware_dot_ts, 'status').
kb_arg_i_for_call(startloc_4_80_endloc_4_83_apps_slash_web_slash_middleware_dot_ts, 1, startloc_4_72_endloc_4_83_apps_slash_web_slash_middleware_dot_ts).
kb_const_int(startloc_4_80_endloc_4_83_apps_slash_web_slash_middleware_dot_ts, 401).

% export function requireBody( req ) {
%     if ( !req.body ) return Response.json( body, { status: 400 } );   <-- 400 is not in the bad-code catalog
% }                                                   // + fall-through return null
kb_func_def(startloc_8_8_endloc_11_2_apps_slash_web_slash_middleware_dot_ts, 'requireBody', 'apps/web/middleware.ts', 'apps/web').
kb_callable_returns_value(startloc_8_8_endloc_11_2_apps_slash_web_slash_middleware_dot_ts, startloc_8_8_endloc_11_2_apps_slash_web_slash_middleware_dot_ts).
kb_callable_returns_value(startloc_8_8_endloc_11_2_apps_slash_web_slash_middleware_dot_ts, startloc_9_29_endloc_9_91_apps_slash_web_slash_middleware_dot_ts).
kb_called_from(startloc_9_29_endloc_9_91_apps_slash_web_slash_middleware_dot_ts, startloc_8_8_endloc_11_2_apps_slash_web_slash_middleware_dot_ts).
kb_call_resolved(startloc_9_29_endloc_9_91_apps_slash_web_slash_middleware_dot_ts, 'nodejs.Response.json').
kb_arg_i_for_call(startloc_9_67_endloc_9_90_apps_slash_web_slash_middleware_dot_ts, 1, startloc_9_29_endloc_9_91_apps_slash_web_slash_middleware_dot_ts).
kb_arg_i_for_call(startloc_9_69_endloc_9_80_apps_slash_web_slash_middleware_dot_ts, 0, startloc_9_67_endloc_9_90_apps_slash_web_slash_middleware_dot_ts).
kb_arg_i_for_call(startloc_9_69_endloc_9_75_apps_slash_web_slash_middleware_dot_ts, 0, startloc_9_69_endloc_9_80_apps_slash_web_slash_middleware_dot_ts).
kb_const_string(startloc_9_69_endloc_9_75_apps_slash_web_slash_middleware_dot_ts, 'status').
kb_arg_i_for_call(startloc_9_77_endloc_9_80_apps_slash_web_slash_middleware_dot_ts, 1, startloc_9_69_endloc_9_80_apps_slash_web_slash_middleware_dot_ts).
kb_const_int(startloc_9_77_endloc_9_80_apps_slash_web_slash_middleware_dot_ts, 400).

% apps/web/app/api/me/route.ts
% requireUser( req ) ; requireBody( req )
kb_call_1st_party_func_defined_in_file(startloc_5_3_endloc_5_20_apps_slash_web_slash_app_slash_api_slash_me_slash_route_dot_ts, 'requireUser', 'apps/web/middleware.ts').
kb_call_1st_party_func_defined_in_file(startloc_6_3_endloc_6_20_apps_slash_web_slash_app_slash_api_slash_me_slash_route_dot_ts, 'requireBody', 'apps/web/middleware.ts').

must(auth_authenticating_function(startloc_5_3_endloc_5_20_apps_slash_web_slash_app_slash_api_slash_me_slash_route_dot_ts, 'requireUser', startloc_3_8_endloc_6_2_apps_slash_web_slash_middleware_dot_ts)).
must(auth_function_returns_bad_http_response(startloc_3_8_endloc_6_2_apps_slash_web_slash_middleware_dot_ts)).
must(auth_return_value_is_bad_http_response(startloc_4_32_endloc_4_94_apps_slash_web_slash_middleware_dot_ts)).

must_not(auth_authenticating_function(startloc_6_3_endloc_6_20_apps_slash_web_slash_app_slash_api_slash_me_slash_route_dot_ts)).
must_not(auth_function_returns_bad_http_response(startloc_8_8_endloc_11_2_apps_slash_web_slash_middleware_dot_ts)).
