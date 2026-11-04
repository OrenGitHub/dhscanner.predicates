% fixture : auth/nodejs/native.pl

% -----------------------------------------------------------------------------
% apps/web/lib/api-key.ts : request-header gates

% export function authenticateApiKey( request ) {
%     const apiKey = request.headers.get( 'x-api-key' );
%     if ( !apiKey ) return null;
%     ...
% }
kb_func_def(startloc_3_8_endloc_9_2_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, 'authenticateApiKey', 'apps/web/lib/api-key.ts', 'apps/web/lib').
kb_called_from(startloc_4_20_endloc_4_53_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, startloc_3_8_endloc_9_2_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts).
kb_call_resolved(startloc_4_20_endloc_4_53_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, 'nodejs.Request.headers.get').
kb_arg_i_for_call(startloc_4_40_endloc_4_51_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, 0, startloc_4_20_endloc_4_53_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts).
kb_const_string(startloc_4_40_endloc_4_51_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, 'x-api-key').
kb_dataflow_edge(startloc_4_20_endloc_4_53_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, startloc_4_11_endloc_4_17_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts).
kb_dataflow_edge(startloc_4_11_endloc_4_17_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, startloc_5_10_endloc_5_17_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts).
kb_gated_return(startloc_5_10_endloc_5_17_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, startloc_5_26_endloc_5_30_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts).
kb_const_null(startloc_5_26_endloc_5_30_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts).

% export function authenticateBearer( request ) {
%     const auth = request.headers.get( 'authorization' );
%     if ( !auth ) return 'unauthorized';      <-- gated return, but not null
% }
kb_func_def(startloc_11_8_endloc_17_2_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, 'authenticateBearer', 'apps/web/lib/api-key.ts', 'apps/web/lib').
kb_called_from(startloc_12_18_endloc_12_55_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, startloc_11_8_endloc_17_2_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts).
kb_call_resolved(startloc_12_18_endloc_12_55_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, 'nodejs.Request.headers.get').
kb_arg_i_for_call(startloc_12_38_endloc_12_53_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, 0, startloc_12_18_endloc_12_55_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts).
kb_const_string(startloc_12_38_endloc_12_53_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, 'authorization').
kb_dataflow_edge(startloc_12_18_endloc_12_55_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, startloc_12_11_endloc_12_15_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts).
kb_dataflow_edge(startloc_12_11_endloc_12_15_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, startloc_13_10_endloc_13_15_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts).
kb_gated_return(startloc_13_10_endloc_13_15_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, startloc_13_24_endloc_13_38_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts).
kb_const_string(startloc_13_24_endloc_13_38_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, 'unauthorized').

% export function authenticateDynamic( request, headerName ) {
%     const v = request.headers.get( headerName );   <-- key is not a const string
%     if ( !v ) return null;
% }
kb_func_def(startloc_19_8_endloc_25_2_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, 'authenticateDynamic', 'apps/web/lib/api-key.ts', 'apps/web/lib').
kb_called_from(startloc_20_15_endloc_20_49_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, startloc_19_8_endloc_25_2_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts).
kb_call_resolved(startloc_20_15_endloc_20_49_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, 'nodejs.Request.headers.get').
kb_arg_i_for_call(startloc_20_37_endloc_20_47_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, 0, startloc_20_15_endloc_20_49_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts).
kb_dataflow_edge(startloc_20_15_endloc_20_49_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, startloc_20_11_endloc_20_12_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts).
kb_dataflow_edge(startloc_20_11_endloc_20_12_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, startloc_21_10_endloc_21_12_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts).
kb_gated_return(startloc_21_10_endloc_21_12_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, startloc_21_21_endloc_21_25_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts).
kb_const_null(startloc_21_21_endloc_21_25_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts).

% export function logUserAgent( request ) {
%     console.log( request.headers.get( 'user-agent' ) );   <-- never gates a return
% }
kb_func_def(startloc_27_8_endloc_29_2_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, 'logUserAgent', 'apps/web/lib/api-key.ts', 'apps/web/lib').
kb_called_from(startloc_28_18_endloc_28_52_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, startloc_27_8_endloc_29_2_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts).
kb_call_resolved(startloc_28_18_endloc_28_52_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, 'nodejs.Request.headers.get').
kb_arg_i_for_call(startloc_28_38_endloc_28_50_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, 0, startloc_28_18_endloc_28_52_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts).
kb_const_string(startloc_28_38_endloc_28_50_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, 'user-agent').

% -----------------------------------------------------------------------------
% apps/web/lib/responses.ts : Response.json( body, { status: <code> } )
% lowered to Response.json( body, dictify( kv( "status", <code> ) ) )

% export const notAuthenticatedResponse = () => Response.json( body, { status: 401 } );
kb_func_def(startloc_3_8_endloc_5_2_apps_slash_web_slash_lib_slash_responses_dot_ts, 'notAuthenticatedResponse', 'apps/web/lib/responses.ts', 'apps/web/lib').
kb_callable_returns_value(startloc_3_8_endloc_5_2_apps_slash_web_slash_lib_slash_responses_dot_ts, startloc_4_10_endloc_4_72_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_callable_returns_value(startloc_3_8_endloc_5_2_apps_slash_web_slash_lib_slash_responses_dot_ts, startloc_3_8_endloc_5_2_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_called_from(startloc_4_10_endloc_4_72_apps_slash_web_slash_lib_slash_responses_dot_ts, startloc_3_8_endloc_5_2_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_call_resolved(startloc_4_10_endloc_4_72_apps_slash_web_slash_lib_slash_responses_dot_ts, 'nodejs.Response.json').
kb_arg_i_for_call(startloc_4_48_endloc_4_71_apps_slash_web_slash_lib_slash_responses_dot_ts, 1, startloc_4_10_endloc_4_72_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_arg_i_for_call(startloc_4_50_endloc_4_61_apps_slash_web_slash_lib_slash_responses_dot_ts, 0, startloc_4_48_endloc_4_71_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_arg_i_for_call(startloc_4_50_endloc_4_56_apps_slash_web_slash_lib_slash_responses_dot_ts, 0, startloc_4_50_endloc_4_61_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_const_string(startloc_4_50_endloc_4_56_apps_slash_web_slash_lib_slash_responses_dot_ts, 'status').
kb_arg_i_for_call(startloc_4_58_endloc_4_61_apps_slash_web_slash_lib_slash_responses_dot_ts, 1, startloc_4_50_endloc_4_61_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_const_int(startloc_4_58_endloc_4_61_apps_slash_web_slash_lib_slash_responses_dot_ts, 401).

% export const forbiddenResponse = () => Response.json( body, { status: 403 } );
kb_func_def(startloc_7_8_endloc_9_2_apps_slash_web_slash_lib_slash_responses_dot_ts, 'forbiddenResponse', 'apps/web/lib/responses.ts', 'apps/web/lib').
kb_callable_returns_value(startloc_7_8_endloc_9_2_apps_slash_web_slash_lib_slash_responses_dot_ts, startloc_8_10_endloc_8_72_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_callable_returns_value(startloc_7_8_endloc_9_2_apps_slash_web_slash_lib_slash_responses_dot_ts, startloc_7_8_endloc_9_2_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_called_from(startloc_8_10_endloc_8_72_apps_slash_web_slash_lib_slash_responses_dot_ts, startloc_7_8_endloc_9_2_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_call_resolved(startloc_8_10_endloc_8_72_apps_slash_web_slash_lib_slash_responses_dot_ts, 'nodejs.Response.json').
kb_arg_i_for_call(startloc_8_48_endloc_8_71_apps_slash_web_slash_lib_slash_responses_dot_ts, 1, startloc_8_10_endloc_8_72_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_arg_i_for_call(startloc_8_50_endloc_8_61_apps_slash_web_slash_lib_slash_responses_dot_ts, 0, startloc_8_48_endloc_8_71_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_arg_i_for_call(startloc_8_50_endloc_8_56_apps_slash_web_slash_lib_slash_responses_dot_ts, 0, startloc_8_50_endloc_8_61_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_const_string(startloc_8_50_endloc_8_56_apps_slash_web_slash_lib_slash_responses_dot_ts, 'status').
kb_arg_i_for_call(startloc_8_58_endloc_8_61_apps_slash_web_slash_lib_slash_responses_dot_ts, 1, startloc_8_50_endloc_8_61_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_const_int(startloc_8_58_endloc_8_61_apps_slash_web_slash_lib_slash_responses_dot_ts, 403).

% export const notFoundResponse = () => Response.json( body, { status: 404 } );
kb_func_def(startloc_11_8_endloc_13_2_apps_slash_web_slash_lib_slash_responses_dot_ts, 'notFoundResponse', 'apps/web/lib/responses.ts', 'apps/web/lib').
kb_callable_returns_value(startloc_11_8_endloc_13_2_apps_slash_web_slash_lib_slash_responses_dot_ts, startloc_12_10_endloc_12_72_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_callable_returns_value(startloc_11_8_endloc_13_2_apps_slash_web_slash_lib_slash_responses_dot_ts, startloc_11_8_endloc_13_2_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_called_from(startloc_12_10_endloc_12_72_apps_slash_web_slash_lib_slash_responses_dot_ts, startloc_11_8_endloc_13_2_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_call_resolved(startloc_12_10_endloc_12_72_apps_slash_web_slash_lib_slash_responses_dot_ts, 'nodejs.Response.json').
kb_arg_i_for_call(startloc_12_48_endloc_12_71_apps_slash_web_slash_lib_slash_responses_dot_ts, 1, startloc_12_10_endloc_12_72_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_arg_i_for_call(startloc_12_50_endloc_12_61_apps_slash_web_slash_lib_slash_responses_dot_ts, 0, startloc_12_48_endloc_12_71_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_arg_i_for_call(startloc_12_50_endloc_12_56_apps_slash_web_slash_lib_slash_responses_dot_ts, 0, startloc_12_50_endloc_12_61_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_const_string(startloc_12_50_endloc_12_56_apps_slash_web_slash_lib_slash_responses_dot_ts, 'status').
kb_arg_i_for_call(startloc_12_58_endloc_12_61_apps_slash_web_slash_lib_slash_responses_dot_ts, 1, startloc_12_50_endloc_12_61_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_const_int(startloc_12_58_endloc_12_61_apps_slash_web_slash_lib_slash_responses_dot_ts, 404).

% export const successResponse = () => Response.json( body, { status: 200 } );   <-- not a bad code
kb_func_def(startloc_15_8_endloc_17_2_apps_slash_web_slash_lib_slash_responses_dot_ts, 'successResponse', 'apps/web/lib/responses.ts', 'apps/web/lib').
kb_callable_returns_value(startloc_15_8_endloc_17_2_apps_slash_web_slash_lib_slash_responses_dot_ts, startloc_16_10_endloc_16_72_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_callable_returns_value(startloc_15_8_endloc_17_2_apps_slash_web_slash_lib_slash_responses_dot_ts, startloc_15_8_endloc_17_2_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_called_from(startloc_16_10_endloc_16_72_apps_slash_web_slash_lib_slash_responses_dot_ts, startloc_15_8_endloc_17_2_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_call_resolved(startloc_16_10_endloc_16_72_apps_slash_web_slash_lib_slash_responses_dot_ts, 'nodejs.Response.json').
kb_arg_i_for_call(startloc_16_48_endloc_16_71_apps_slash_web_slash_lib_slash_responses_dot_ts, 1, startloc_16_10_endloc_16_72_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_arg_i_for_call(startloc_16_50_endloc_16_61_apps_slash_web_slash_lib_slash_responses_dot_ts, 0, startloc_16_48_endloc_16_71_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_arg_i_for_call(startloc_16_50_endloc_16_56_apps_slash_web_slash_lib_slash_responses_dot_ts, 0, startloc_16_50_endloc_16_61_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_const_string(startloc_16_50_endloc_16_56_apps_slash_web_slash_lib_slash_responses_dot_ts, 'status').
kb_arg_i_for_call(startloc_16_58_endloc_16_61_apps_slash_web_slash_lib_slash_responses_dot_ts, 1, startloc_16_50_endloc_16_61_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_const_int(startloc_16_58_endloc_16_61_apps_slash_web_slash_lib_slash_responses_dot_ts, 200).

% export const retryLaterResponse = () => Response.json( body, { retryAfter: 401 } );
% an int-valued kv-pair whose key is not 'status' ( the catalog's own example )
kb_func_def(startloc_19_8_endloc_21_2_apps_slash_web_slash_lib_slash_responses_dot_ts, 'retryLaterResponse', 'apps/web/lib/responses.ts', 'apps/web/lib').
kb_callable_returns_value(startloc_19_8_endloc_21_2_apps_slash_web_slash_lib_slash_responses_dot_ts, startloc_20_10_endloc_20_76_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_called_from(startloc_20_10_endloc_20_76_apps_slash_web_slash_lib_slash_responses_dot_ts, startloc_19_8_endloc_21_2_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_call_resolved(startloc_20_10_endloc_20_76_apps_slash_web_slash_lib_slash_responses_dot_ts, 'nodejs.Response.json').
kb_arg_i_for_call(startloc_20_48_endloc_20_75_apps_slash_web_slash_lib_slash_responses_dot_ts, 1, startloc_20_10_endloc_20_76_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_arg_i_for_call(startloc_20_50_endloc_20_65_apps_slash_web_slash_lib_slash_responses_dot_ts, 0, startloc_20_48_endloc_20_75_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_arg_i_for_call(startloc_20_50_endloc_20_60_apps_slash_web_slash_lib_slash_responses_dot_ts, 0, startloc_20_50_endloc_20_65_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_const_string(startloc_20_50_endloc_20_60_apps_slash_web_slash_lib_slash_responses_dot_ts, 'retryAfter').
kb_arg_i_for_call(startloc_20_62_endloc_20_65_apps_slash_web_slash_lib_slash_responses_dot_ts, 1, startloc_20_50_endloc_20_65_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_const_int(startloc_20_62_endloc_20_65_apps_slash_web_slash_lib_slash_responses_dot_ts, 401).

% -----------------------------------------------------------------------------
% apps/web/lib/guards.ts : returns through the imported `responses` helpers

% return responses.notAuthenticatedResponse();
kb_call_resolved(startloc_5_12_endloc_5_52_apps_slash_web_slash_lib_slash_guards_dot_ts, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "apps/web/lib/responses.ts", firstPartyImportedName = Just "responses"}).notAuthenticatedResponse').
% return responses.forbiddenResponse();
kb_call_resolved(startloc_6_12_endloc_6_45_apps_slash_web_slash_lib_slash_guards_dot_ts, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "apps/web/lib/responses.ts", firstPartyImportedName = Just "responses"}).forbiddenResponse').
% return responses.notFoundResponse();
kb_call_resolved(startloc_7_12_endloc_7_44_apps_slash_web_slash_lib_slash_guards_dot_ts, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "apps/web/lib/responses.ts", firstPartyImportedName = Just "responses"}).notFoundResponse').
% return responses.successResponse();   <-- wraps a 200
kb_call_resolved(startloc_8_12_endloc_8_43_apps_slash_web_slash_lib_slash_guards_dot_ts, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "apps/web/lib/responses.ts", firstPartyImportedName = Just "responses"}).successResponse').

% -----------------------------------------------------------------------------
% apps/web/lib/signing.ts : crypto leaves

% crypto.createHmac( 'sha256', secret ).update( payload ).digest( 'hex' )
kb_call_resolved(startloc_4_20_endloc_4_80_apps_slash_web_slash_lib_slash_signing_dot_ts, 'nodejs.crypto.createHmac.update.digest').
% crypto.timingSafeEqual( a, b )
kb_call_resolved(startloc_5_10_endloc_5_40_apps_slash_web_slash_lib_slash_signing_dot_ts, 'nodejs.crypto.timingSafeEqual').
% jwt.verify( token, secret )
kb_call_resolved(startloc_6_10_endloc_6_35_apps_slash_web_slash_lib_slash_signing_dot_ts, 'nodejs.jsonwebtoken.verify').
% await jwtVerify( token, key )
kb_call_resolved(startloc_7_16_endloc_7_38_apps_slash_web_slash_lib_slash_signing_dot_ts, 'nodejs.jose.jwtVerify').
% crypto.createHmac( 'sha256', secret ) : building the hmac is not computing the digest
kb_call_resolved(startloc_9_15_endloc_9_50_apps_slash_web_slash_lib_slash_signing_dot_ts, 'nodejs.crypto.createHmac').
% jwt.sign( payload, secret ) : signing is not verifying
kb_call_resolved(startloc_10_15_endloc_10_40_apps_slash_web_slash_lib_slash_signing_dot_ts, 'nodejs.jsonwebtoken.sign').

% -----------------------------------------------------------------------------
% expectations

% header gate : headers.get( 'x-api-key' ) flows into an `if ( !v ) return null`
must(auth_early_return_null_on_missing_request_header_value(startloc_3_8_endloc_9_2_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, 'x-api-key')).
must(kb_gated_return_null(startloc_5_10_endloc_5_17_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts)).
% gate returns a string, not null
must_not(kb_gated_return_null(startloc_13_10_endloc_13_15_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts)).
must_not(auth_early_return_null_on_missing_request_header_value(startloc_11_8_endloc_17_2_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, _)).
% header key is not a compile-time string
must_not(auth_early_return_null_on_missing_request_header_value(startloc_19_8_endloc_25_2_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, _)).
% header value never reaches a null gate
must_not(auth_early_return_null_on_missing_request_header_value(startloc_27_8_endloc_29_2_apps_slash_web_slash_lib_slash_api_dash_key_dot_ts, _)).

% per-function bad-http leaves
must(auth_function_returns_bad_http_response_ts_401(startloc_3_8_endloc_5_2_apps_slash_web_slash_lib_slash_responses_dot_ts)).
must(auth_function_returns_bad_http_response_ts_403(startloc_7_8_endloc_9_2_apps_slash_web_slash_lib_slash_responses_dot_ts)).
must(auth_function_returns_bad_http_response_ts_404(startloc_11_8_endloc_13_2_apps_slash_web_slash_lib_slash_responses_dot_ts)).
must(auth_ts_response_json_with_status(startloc_3_8_endloc_5_2_apps_slash_web_slash_lib_slash_responses_dot_ts, 401)).
must_not(auth_function_returns_bad_http_response_ts_403(startloc_3_8_endloc_5_2_apps_slash_web_slash_lib_slash_responses_dot_ts)).
% 200 is not a bad code
must_not(auth_function_returns_bad_http_response_ts_401(startloc_15_8_endloc_17_2_apps_slash_web_slash_lib_slash_responses_dot_ts)).
% { retryAfter: 401 } : the 'status' key gate
must_not(auth_function_returns_bad_http_response_ts_401(startloc_19_8_endloc_21_2_apps_slash_web_slash_lib_slash_responses_dot_ts)).
must_not(auth_ts_response_json_with_status(startloc_19_8_endloc_21_2_apps_slash_web_slash_lib_slash_responses_dot_ts, _)).

% per-return bad-http leaves ( return Response.json( ... ) )
must(auth_return_value_is_bad_http_response_ts_401(startloc_4_10_endloc_4_72_apps_slash_web_slash_lib_slash_responses_dot_ts)).
must(auth_return_value_is_bad_http_response_ts_403(startloc_8_10_endloc_8_72_apps_slash_web_slash_lib_slash_responses_dot_ts)).
must(auth_return_value_is_bad_http_response_ts_404(startloc_12_10_endloc_12_72_apps_slash_web_slash_lib_slash_responses_dot_ts)).
must(auth_ts_response_json_at_with_status(startloc_12_10_endloc_12_72_apps_slash_web_slash_lib_slash_responses_dot_ts, 404)).
must_not(auth_return_value_is_bad_http_response_ts_401(startloc_16_10_endloc_16_72_apps_slash_web_slash_lib_slash_responses_dot_ts)).
must_not(auth_ts_response_json_at_with_status(startloc_20_10_endloc_20_76_apps_slash_web_slash_lib_slash_responses_dot_ts, _)).

% 1-hop wrapper : responses.<helper>() resolved through the FirstPartyImport atom
must(auth_1st_party_wrapper_helper(startloc_5_12_endloc_5_52_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_3_8_endloc_5_2_apps_slash_web_slash_lib_slash_responses_dot_ts)).
must(auth_return_value_is_bad_http_response_via_1st_party_wrapper(startloc_5_12_endloc_5_52_apps_slash_web_slash_lib_slash_guards_dot_ts)).
must(auth_return_value_is_bad_http_response_via_1st_party_wrapper(startloc_6_12_endloc_6_45_apps_slash_web_slash_lib_slash_guards_dot_ts)).
must(auth_return_value_is_bad_http_response_via_1st_party_wrapper(startloc_7_12_endloc_7_44_apps_slash_web_slash_lib_slash_guards_dot_ts)).
% wrapper around a 200
must_not(auth_return_value_is_bad_http_response_via_1st_party_wrapper(startloc_8_12_endloc_8_43_apps_slash_web_slash_lib_slash_guards_dot_ts)).
% nodejs.Response.json is not a FirstPartyImport atom
must_not(auth_1st_party_wrapper_helper(startloc_4_10_endloc_4_72_apps_slash_web_slash_lib_slash_responses_dot_ts, _)).

% crypto leaves
must(auth_crypto_leaf_call(startloc_4_20_endloc_4_80_apps_slash_web_slash_lib_slash_signing_dot_ts)).
must(auth_crypto_leaf_call(startloc_5_10_endloc_5_40_apps_slash_web_slash_lib_slash_signing_dot_ts)).
must(auth_crypto_leaf_call(startloc_6_10_endloc_6_35_apps_slash_web_slash_lib_slash_signing_dot_ts)).
must(auth_crypto_leaf_call(startloc_7_16_endloc_7_38_apps_slash_web_slash_lib_slash_signing_dot_ts)).
must_not(auth_crypto_leaf_call(startloc_9_15_endloc_9_50_apps_slash_web_slash_lib_slash_signing_dot_ts)).
must_not(auth_crypto_leaf_call(startloc_10_15_endloc_10_40_apps_slash_web_slash_lib_slash_signing_dot_ts)).

% wired into the family dispatchers ( auth/common.pl )
must(auth_function_returns_bad_http_response(startloc_7_8_endloc_9_2_apps_slash_web_slash_lib_slash_responses_dot_ts)).
must(auth_return_value_is_bad_http_response(startloc_7_12_endloc_7_44_apps_slash_web_slash_lib_slash_guards_dot_ts)).
must(auth_return_value_is_bad_http_response(startloc_4_10_endloc_4_72_apps_slash_web_slash_lib_slash_responses_dot_ts)).
must_not(auth_function_returns_bad_http_response(startloc_15_8_endloc_17_2_apps_slash_web_slash_lib_slash_responses_dot_ts)).
must_not(auth_return_value_is_bad_http_response(startloc_8_12_endloc_8_43_apps_slash_web_slash_lib_slash_guards_dot_ts)).
