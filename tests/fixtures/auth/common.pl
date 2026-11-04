% fixture : auth/common.pl
%
% The tier-1 name catalogs ( auth_authenticating_function_name/1,
% auth_early_return_authenticating_function_name/1,
% auth_capability_verifier_name/1 ) are empty by design, so the name-based
% clauses can never match : only the shape-based clauses are covered with
% must cases, the name-based ones get must_not cases.

% -----------------------------------------------------------------------------
% apps/web/lib/responses.ts : the bad-http helpers the guards return through
% ( Response.json( body, { status: <code> } ), see auth/nodejs/native.pl )

% export const notAuthenticatedResponse = () => Response.json( body, { status: 401 } );
kb_func_def(startloc_3_8_endloc_5_2_apps_slash_web_slash_lib_slash_responses_dot_ts, 'notAuthenticatedResponse', 'apps/web/lib/responses.ts', 'apps/web/lib').
kb_callable_returns_value(startloc_3_8_endloc_5_2_apps_slash_web_slash_lib_slash_responses_dot_ts, startloc_4_10_endloc_4_72_apps_slash_web_slash_lib_slash_responses_dot_ts).
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
kb_called_from(startloc_12_10_endloc_12_72_apps_slash_web_slash_lib_slash_responses_dot_ts, startloc_11_8_endloc_13_2_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_call_resolved(startloc_12_10_endloc_12_72_apps_slash_web_slash_lib_slash_responses_dot_ts, 'nodejs.Response.json').
kb_arg_i_for_call(startloc_12_48_endloc_12_71_apps_slash_web_slash_lib_slash_responses_dot_ts, 1, startloc_12_10_endloc_12_72_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_arg_i_for_call(startloc_12_50_endloc_12_61_apps_slash_web_slash_lib_slash_responses_dot_ts, 0, startloc_12_48_endloc_12_71_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_arg_i_for_call(startloc_12_50_endloc_12_56_apps_slash_web_slash_lib_slash_responses_dot_ts, 0, startloc_12_50_endloc_12_61_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_const_string(startloc_12_50_endloc_12_56_apps_slash_web_slash_lib_slash_responses_dot_ts, 'status').
kb_arg_i_for_call(startloc_12_58_endloc_12_61_apps_slash_web_slash_lib_slash_responses_dot_ts, 1, startloc_12_50_endloc_12_61_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_const_int(startloc_12_58_endloc_12_61_apps_slash_web_slash_lib_slash_responses_dot_ts, 404).

% export const successResponse = () => Response.json( body, { status: 200 } );
kb_func_def(startloc_15_8_endloc_17_2_apps_slash_web_slash_lib_slash_responses_dot_ts, 'successResponse', 'apps/web/lib/responses.ts', 'apps/web/lib').
kb_callable_returns_value(startloc_15_8_endloc_17_2_apps_slash_web_slash_lib_slash_responses_dot_ts, startloc_16_10_endloc_16_72_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_called_from(startloc_16_10_endloc_16_72_apps_slash_web_slash_lib_slash_responses_dot_ts, startloc_15_8_endloc_17_2_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_call_resolved(startloc_16_10_endloc_16_72_apps_slash_web_slash_lib_slash_responses_dot_ts, 'nodejs.Response.json').
kb_arg_i_for_call(startloc_16_48_endloc_16_71_apps_slash_web_slash_lib_slash_responses_dot_ts, 1, startloc_16_10_endloc_16_72_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_arg_i_for_call(startloc_16_50_endloc_16_61_apps_slash_web_slash_lib_slash_responses_dot_ts, 0, startloc_16_48_endloc_16_71_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_arg_i_for_call(startloc_16_50_endloc_16_56_apps_slash_web_slash_lib_slash_responses_dot_ts, 0, startloc_16_50_endloc_16_61_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_const_string(startloc_16_50_endloc_16_56_apps_slash_web_slash_lib_slash_responses_dot_ts, 'status').
kb_arg_i_for_call(startloc_16_58_endloc_16_61_apps_slash_web_slash_lib_slash_responses_dot_ts, 1, startloc_16_50_endloc_16_61_apps_slash_web_slash_lib_slash_responses_dot_ts).
kb_const_int(startloc_16_58_endloc_16_61_apps_slash_web_slash_lib_slash_responses_dot_ts, 200).

% -----------------------------------------------------------------------------
% apps/web/lib/guards.ts : middleware guards, every return value listed
% ( the fall-through `return null` sits at the callable's own location )

% export function requireUser( req ) {               1 bad + fall-through
%     if ( !session ) return responses.notAuthenticatedResponse();
% }
kb_func_def(startloc_5_8_endloc_9_2_apps_slash_web_slash_lib_slash_guards_dot_ts, 'requireUser', 'apps/web/lib/guards.ts', 'apps/web/lib').
kb_callable_returns_value(startloc_5_8_endloc_9_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_5_8_endloc_9_2_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_callable_returns_value(startloc_5_8_endloc_9_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_7_25_endloc_7_65_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_call_resolved(startloc_7_25_endloc_7_65_apps_slash_web_slash_lib_slash_guards_dot_ts, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "apps/web/lib/responses.ts", firstPartyImportedName = Just "responses"}).notAuthenticatedResponse').

% export function requireAdmin( req ) {              2 bad + fall-through
%     if ( !session ) return responses.notAuthenticatedResponse();
%     if ( !admin ) return responses.forbiddenResponse();
% }
kb_func_def(startloc_11_8_endloc_17_2_apps_slash_web_slash_lib_slash_guards_dot_ts, 'requireAdmin', 'apps/web/lib/guards.ts', 'apps/web/lib').
kb_callable_returns_value(startloc_11_8_endloc_17_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_11_8_endloc_17_2_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_callable_returns_value(startloc_11_8_endloc_17_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_13_25_endloc_13_65_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_callable_returns_value(startloc_11_8_endloc_17_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_15_23_endloc_15_56_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_call_resolved(startloc_13_25_endloc_13_65_apps_slash_web_slash_lib_slash_guards_dot_ts, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "apps/web/lib/responses.ts", firstPartyImportedName = Just "responses"}).notAuthenticatedResponse').
kb_call_resolved(startloc_15_23_endloc_15_56_apps_slash_web_slash_lib_slash_guards_dot_ts, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "apps/web/lib/responses.ts", firstPartyImportedName = Just "responses"}).forbiddenResponse').

% export function requireOwner( req ) {              3 bad + fall-through
%     ... notAuthenticatedResponse() ... forbiddenResponse() ... notFoundResponse() ...
% }
kb_func_def(startloc_19_8_endloc_27_2_apps_slash_web_slash_lib_slash_guards_dot_ts, 'requireOwner', 'apps/web/lib/guards.ts', 'apps/web/lib').
kb_callable_returns_value(startloc_19_8_endloc_27_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_19_8_endloc_27_2_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_callable_returns_value(startloc_19_8_endloc_27_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_21_25_endloc_21_65_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_callable_returns_value(startloc_19_8_endloc_27_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_23_23_endloc_23_56_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_callable_returns_value(startloc_19_8_endloc_27_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_25_23_endloc_25_55_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_call_resolved(startloc_21_25_endloc_21_65_apps_slash_web_slash_lib_slash_guards_dot_ts, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "apps/web/lib/responses.ts", firstPartyImportedName = Just "responses"}).notAuthenticatedResponse').
kb_call_resolved(startloc_23_23_endloc_23_56_apps_slash_web_slash_lib_slash_guards_dot_ts, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "apps/web/lib/responses.ts", firstPartyImportedName = Just "responses"}).forbiddenResponse').
kb_call_resolved(startloc_25_23_endloc_25_55_apps_slash_web_slash_lib_slash_guards_dot_ts, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "apps/web/lib/responses.ts", firstPartyImportedName = Just "responses"}).notFoundResponse').

% export function requireTeamOwner( req ) {          4 bad + fall-through
kb_func_def(startloc_29_8_endloc_39_2_apps_slash_web_slash_lib_slash_guards_dot_ts, 'requireTeamOwner', 'apps/web/lib/guards.ts', 'apps/web/lib').
kb_callable_returns_value(startloc_29_8_endloc_39_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_29_8_endloc_39_2_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_callable_returns_value(startloc_29_8_endloc_39_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_31_25_endloc_31_65_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_callable_returns_value(startloc_29_8_endloc_39_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_33_23_endloc_33_56_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_callable_returns_value(startloc_29_8_endloc_39_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_35_23_endloc_35_55_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_callable_returns_value(startloc_29_8_endloc_39_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_37_23_endloc_37_56_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_call_resolved(startloc_31_25_endloc_31_65_apps_slash_web_slash_lib_slash_guards_dot_ts, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "apps/web/lib/responses.ts", firstPartyImportedName = Just "responses"}).notAuthenticatedResponse').
kb_call_resolved(startloc_33_23_endloc_33_56_apps_slash_web_slash_lib_slash_guards_dot_ts, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "apps/web/lib/responses.ts", firstPartyImportedName = Just "responses"}).forbiddenResponse').
kb_call_resolved(startloc_35_23_endloc_35_55_apps_slash_web_slash_lib_slash_guards_dot_ts, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "apps/web/lib/responses.ts", firstPartyImportedName = Just "responses"}).notFoundResponse').
kb_call_resolved(startloc_37_23_endloc_37_56_apps_slash_web_slash_lib_slash_guards_dot_ts, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "apps/web/lib/responses.ts", firstPartyImportedName = Just "responses"}).forbiddenResponse').

% export function requireSession( req ) {            1 bad + fall-through + a bare `return;`
%     if ( !session ) return responses.notAuthenticatedResponse();
%     if ( preflight ) return;
% }
kb_func_def(startloc_41_8_endloc_46_2_apps_slash_web_slash_lib_slash_guards_dot_ts, 'requireSession', 'apps/web/lib/guards.ts', 'apps/web/lib').
kb_callable_returns_value(startloc_41_8_endloc_46_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_41_8_endloc_46_2_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_callable_returns_value(startloc_41_8_endloc_46_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_43_25_endloc_43_65_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_callable_returns_without_value(startloc_41_8_endloc_46_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_44_22_endloc_44_29_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_call_resolved(startloc_43_25_endloc_43_65_apps_slash_web_slash_lib_slash_guards_dot_ts, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "apps/web/lib/responses.ts", firstPartyImportedName = Just "responses"}).notAuthenticatedResponse').

% export function maybeUser( req ) {                 1 bad + 1 success + fall-through
%     if ( !session ) return responses.notAuthenticatedResponse();
%     if ( cached ) return responses.successResponse();
% }
kb_func_def(startloc_48_8_endloc_54_2_apps_slash_web_slash_lib_slash_guards_dot_ts, 'maybeUser', 'apps/web/lib/guards.ts', 'apps/web/lib').
kb_callable_returns_value(startloc_48_8_endloc_54_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_48_8_endloc_54_2_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_callable_returns_value(startloc_48_8_endloc_54_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_50_25_endloc_50_65_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_callable_returns_value(startloc_48_8_endloc_54_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_52_23_endloc_52_54_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_call_resolved(startloc_50_25_endloc_50_65_apps_slash_web_slash_lib_slash_guards_dot_ts, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "apps/web/lib/responses.ts", firstPartyImportedName = Just "responses"}).notAuthenticatedResponse').
kb_call_resolved(startloc_52_23_endloc_52_54_apps_slash_web_slash_lib_slash_guards_dot_ts, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "apps/web/lib/responses.ts", firstPartyImportedName = Just "responses"}).successResponse').

% a callable without the parser-injected fall-through ( 1 bad return only )
kb_func_def(startloc_56_8_endloc_58_2_apps_slash_web_slash_lib_slash_guards_dot_ts, 'rejectAll', 'apps/web/lib/guards.ts', 'apps/web/lib').
kb_callable_returns_value(startloc_56_8_endloc_58_2_apps_slash_web_slash_lib_slash_guards_dot_ts, startloc_57_12_endloc_57_52_apps_slash_web_slash_lib_slash_guards_dot_ts).
kb_call_resolved(startloc_57_12_endloc_57_52_apps_slash_web_slash_lib_slash_guards_dot_ts, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "apps/web/lib/responses.ts", firstPartyImportedName = Just "responses"}).notAuthenticatedResponse').

% -----------------------------------------------------------------------------
% apps/web/app/api/route.ts : calls to the guards

% requireUser( req )      ( imported from its file )
kb_call_1st_party_func_defined_in_file(startloc_10_3_endloc_10_20_apps_slash_web_slash_app_slash_api_slash_route_dot_ts, 'requireUser', 'apps/web/lib/guards.ts').
% requireAdmin( req )     ( resolved through its dir )
kb_call_1st_party_func_defined_in_dir(startloc_11_3_endloc_11_21_apps_slash_web_slash_app_slash_api_slash_route_dot_ts, 'requireAdmin', 'apps/web/lib').
% requireSession( req )
kb_call_1st_party_func_defined_in_file(startloc_12_3_endloc_12_23_apps_slash_web_slash_app_slash_api_slash_route_dot_ts, 'requireSession', 'apps/web/lib/guards.ts').
% maybeUser( req )
kb_call_1st_party_func_defined_in_dir(startloc_13_3_endloc_13_18_apps_slash_web_slash_app_slash_api_slash_route_dot_ts, 'maybeUser', 'apps/web/lib').

% -----------------------------------------------------------------------------
% apps/web/lib/signing.ts : capability verifiers

% export function validateSignedUrl( payload, signature ) {
%     const expected = crypto.createHmac( 'sha256', secret ).update( payload ).digest( 'hex' );
%     if ( expected !== signature ) return false;
%     return validateSignedUrl( payload, signature );   // ( recursive, loop-guard case )
% }
kb_func_def(startloc_3_8_endloc_10_2_apps_slash_web_slash_lib_slash_signing_dot_ts, 'validateSignedUrl', 'apps/web/lib/signing.ts', 'apps/web/lib').
kb_called_from(startloc_4_22_endloc_4_90_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_3_8_endloc_10_2_apps_slash_web_slash_lib_slash_signing_dot_ts).
kb_call_resolved(startloc_4_22_endloc_4_90_apps_slash_web_slash_lib_slash_signing_dot_ts, 'nodejs.crypto.createHmac.update.digest').
kb_dataflow_edge(startloc_4_22_endloc_4_90_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_4_11_endloc_4_19_apps_slash_web_slash_lib_slash_signing_dot_ts).
kb_comparison(startloc_5_10_endloc_5_33_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_5_10_endloc_5_18_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_5_23_endloc_5_32_apps_slash_web_slash_lib_slash_signing_dot_ts, neq).
kb_dataflow_edge(startloc_4_11_endloc_4_19_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_5_10_endloc_5_18_apps_slash_web_slash_lib_slash_signing_dot_ts).
kb_gated_return(startloc_5_10_endloc_5_33_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_5_42_endloc_5_47_apps_slash_web_slash_lib_slash_signing_dot_ts).
kb_called_from(startloc_8_12_endloc_8_50_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_3_8_endloc_10_2_apps_slash_web_slash_lib_slash_signing_dot_ts).
kb_call_1st_party_func_defined_in_file(startloc_8_12_endloc_8_50_apps_slash_web_slash_lib_slash_signing_dot_ts, 'validateSignedUrl', 'apps/web/lib/signing.ts').

% export function verifyToken( token ) {
%     const payload = jwt.verify( token, secret );
%     if ( expectedUser === payload ) return true;     <-- crypto output on the rhs
% }
kb_func_def(startloc_12_8_endloc_17_2_apps_slash_web_slash_lib_slash_signing_dot_ts, 'verifyToken', 'apps/web/lib/signing.ts', 'apps/web/lib').
kb_called_from(startloc_13_21_endloc_13_47_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_12_8_endloc_17_2_apps_slash_web_slash_lib_slash_signing_dot_ts).
kb_call_resolved(startloc_13_21_endloc_13_47_apps_slash_web_slash_lib_slash_signing_dot_ts, 'nodejs.jsonwebtoken.verify').
kb_dataflow_edge(startloc_13_21_endloc_13_47_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_14_28_endloc_14_35_apps_slash_web_slash_lib_slash_signing_dot_ts).
kb_comparison(startloc_14_10_endloc_14_35_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_14_10_endloc_14_22_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_14_28_endloc_14_35_apps_slash_web_slash_lib_slash_signing_dot_ts, eq).
kb_gated_return(startloc_14_10_endloc_14_35_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_14_44_endloc_14_48_apps_slash_web_slash_lib_slash_signing_dot_ts).

% export function hashPassword( password ) {
%     const h = crypto.createHmac( 'sha256', salt ).update( password ).digest( 'hex' );
%     if ( !password ) return null;                 <-- gate is not a comparison
%     return h;                                     <-- digest never compared
% }
kb_func_def(startloc_19_8_endloc_24_2_apps_slash_web_slash_lib_slash_signing_dot_ts, 'hashPassword', 'apps/web/lib/signing.ts', 'apps/web/lib').
kb_called_from(startloc_20_15_endloc_20_85_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_19_8_endloc_24_2_apps_slash_web_slash_lib_slash_signing_dot_ts).
kb_call_resolved(startloc_20_15_endloc_20_85_apps_slash_web_slash_lib_slash_signing_dot_ts, 'nodejs.crypto.createHmac.update.digest').
kb_dataflow_edge(startloc_20_15_endloc_20_85_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_20_11_endloc_20_12_apps_slash_web_slash_lib_slash_signing_dot_ts).
kb_gated_return(startloc_21_10_endloc_21_19_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_21_28_endloc_21_32_apps_slash_web_slash_lib_slash_signing_dot_ts).
kb_callable_returns_value(startloc_19_8_endloc_24_2_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_22_12_endloc_22_13_apps_slash_web_slash_lib_slash_signing_dot_ts).

% -----------------------------------------------------------------------------
% apps/web/lib/upload.ts : an intermediate 1st party callable

% export function checkUpload( req ) { return validateSignedUrl( ... ); }
kb_func_def(startloc_3_8_endloc_6_2_apps_slash_web_slash_lib_slash_upload_dot_ts, 'checkUpload', 'apps/web/lib/upload.ts', 'apps/web/lib').
kb_called_from(startloc_4_12_endloc_4_45_apps_slash_web_slash_lib_slash_upload_dot_ts, startloc_3_8_endloc_6_2_apps_slash_web_slash_lib_slash_upload_dot_ts).
kb_call_1st_party_func_defined_in_dir(startloc_4_12_endloc_4_45_apps_slash_web_slash_lib_slash_upload_dot_ts, 'validateSignedUrl', 'apps/web/lib').

% -----------------------------------------------------------------------------
% apps/web/app/api/upload/route.ts : handlers

% export async function POST( req ) { if ( !validateSignedUrl( ... ) ) ... }   1 hop
kb_func_def(startloc_5_17_endloc_12_2_apps_slash_web_slash_app_slash_api_slash_upload_slash_route_dot_ts, 'POST', 'apps/web/app/api/upload/route.ts', 'apps/web/app/api/upload').
kb_called_from(startloc_6_10_endloc_6_40_apps_slash_web_slash_app_slash_api_slash_upload_slash_route_dot_ts, startloc_5_17_endloc_12_2_apps_slash_web_slash_app_slash_api_slash_upload_slash_route_dot_ts).
kb_call_1st_party_func_defined_in_file(startloc_6_10_endloc_6_40_apps_slash_web_slash_app_slash_api_slash_upload_slash_route_dot_ts, 'validateSignedUrl', 'apps/web/lib/signing.ts').

% export async function PUT( req ) { checkUpload( req ); }                      2 hops
kb_func_def(startloc_14_17_endloc_20_2_apps_slash_web_slash_app_slash_api_slash_upload_slash_route_dot_ts, 'PUT', 'apps/web/app/api/upload/route.ts', 'apps/web/app/api/upload').
kb_called_from(startloc_15_5_endloc_15_22_apps_slash_web_slash_app_slash_api_slash_upload_slash_route_dot_ts, startloc_14_17_endloc_20_2_apps_slash_web_slash_app_slash_api_slash_upload_slash_route_dot_ts).
kb_call_1st_party_func_defined_in_dir(startloc_15_5_endloc_15_22_apps_slash_web_slash_app_slash_api_slash_upload_slash_route_dot_ts, 'checkUpload', 'apps/web/lib').

% export async function GET( req ) { hashPassword( pw ); }                      not a verifier
kb_func_def(startloc_22_17_endloc_26_2_apps_slash_web_slash_app_slash_api_slash_upload_slash_route_dot_ts, 'GET', 'apps/web/app/api/upload/route.ts', 'apps/web/app/api/upload').
kb_called_from(startloc_23_5_endloc_23_22_apps_slash_web_slash_app_slash_api_slash_upload_slash_route_dot_ts, startloc_22_17_endloc_26_2_apps_slash_web_slash_app_slash_api_slash_upload_slash_route_dot_ts).
kb_call_1st_party_func_defined_in_file(startloc_23_5_endloc_23_22_apps_slash_web_slash_app_slash_api_slash_upload_slash_route_dot_ts, 'hashPassword', 'apps/web/lib/signing.ts').

% -----------------------------------------------------------------------------
% expectations

% authenticating function : shape clause via the defined-in-file call ( pins Name + Func )
must(auth_authenticating_function(startloc_10_3_endloc_10_20_apps_slash_web_slash_app_slash_api_slash_route_dot_ts, 'requireUser', startloc_5_8_endloc_9_2_apps_slash_web_slash_lib_slash_guards_dot_ts)).
% shape clause via the defined-in-dir call
must(auth_authenticating_function(startloc_11_3_endloc_11_21_apps_slash_web_slash_app_slash_api_slash_route_dot_ts, 'requireAdmin', startloc_11_8_endloc_17_2_apps_slash_web_slash_lib_slash_guards_dot_ts)).
% /1 projection
must(auth_authenticating_function(startloc_10_3_endloc_10_20_apps_slash_web_slash_app_slash_api_slash_route_dot_ts)).
% guard with a bare return / guard with a success return : not authenticators
must_not(auth_authenticating_function(startloc_12_3_endloc_12_23_apps_slash_web_slash_app_slash_api_slash_route_dot_ts)).
must_not(auth_authenticating_function(startloc_13_3_endloc_13_18_apps_slash_web_slash_app_slash_api_slash_route_dot_ts)).

% shapes 1v1 .. 4v1 ( each callable matches exactly its own shape )
must(auth_authenticating_function_by_1v1_return_values(startloc_5_8_endloc_9_2_apps_slash_web_slash_lib_slash_guards_dot_ts)).
must(auth_authenticating_function_by_2v1_return_values(startloc_11_8_endloc_17_2_apps_slash_web_slash_lib_slash_guards_dot_ts)).
must(auth_authenticating_function_by_3v1_return_values(startloc_19_8_endloc_27_2_apps_slash_web_slash_lib_slash_guards_dot_ts)).
must(auth_authenticating_function_by_4v1_return_values(startloc_29_8_endloc_39_2_apps_slash_web_slash_lib_slash_guards_dot_ts)).
must(auth_authenticating_function_by_return_values(startloc_19_8_endloc_27_2_apps_slash_web_slash_lib_slash_guards_dot_ts)).
must(auth_authenticating_function_by_return_values(startloc_29_8_endloc_39_2_apps_slash_web_slash_lib_slash_guards_dot_ts)).
% enumeration with F unbound finds exactly the four guards
must(( findall(F, ( auth_authenticating_function_by_return_values(F),
                    sub_atom(F, _, _, 0, guards_dot_ts) ), Fs),
       Fs == [ startloc_5_8_endloc_9_2_apps_slash_web_slash_lib_slash_guards_dot_ts,
               startloc_11_8_endloc_17_2_apps_slash_web_slash_lib_slash_guards_dot_ts,
               startloc_19_8_endloc_27_2_apps_slash_web_slash_lib_slash_guards_dot_ts,
               startloc_29_8_endloc_39_2_apps_slash_web_slash_lib_slash_guards_dot_ts ] )).
must_not(auth_authenticating_function_by_2v1_return_values(startloc_5_8_endloc_9_2_apps_slash_web_slash_lib_slash_guards_dot_ts)).
% bare `return;` gate
must_not(auth_authenticating_function_by_return_values(startloc_41_8_endloc_46_2_apps_slash_web_slash_lib_slash_guards_dot_ts)).
% one return is a success response
must_not(auth_authenticating_function_by_return_values(startloc_48_8_endloc_54_2_apps_slash_web_slash_lib_slash_guards_dot_ts)).
% no fall-through
must_not(auth_authenticating_function_by_return_values(startloc_56_8_endloc_58_2_apps_slash_web_slash_lib_slash_guards_dot_ts)).

% bad-http dispatchers : per-function ( 401 / 403 / 404 ) and per-return ( 3 codes + wrapper )
must(auth_function_returns_bad_http_response(startloc_3_8_endloc_5_2_apps_slash_web_slash_lib_slash_responses_dot_ts)).
must(auth_function_returns_bad_http_response(startloc_7_8_endloc_9_2_apps_slash_web_slash_lib_slash_responses_dot_ts)).
must(auth_function_returns_bad_http_response(startloc_11_8_endloc_13_2_apps_slash_web_slash_lib_slash_responses_dot_ts)).
must_not(auth_function_returns_bad_http_response(startloc_15_8_endloc_17_2_apps_slash_web_slash_lib_slash_responses_dot_ts)).
must(auth_return_value_is_bad_http_response(startloc_4_10_endloc_4_72_apps_slash_web_slash_lib_slash_responses_dot_ts)).
must(auth_return_value_is_bad_http_response(startloc_8_10_endloc_8_72_apps_slash_web_slash_lib_slash_responses_dot_ts)).
must(auth_return_value_is_bad_http_response(startloc_12_10_endloc_12_72_apps_slash_web_slash_lib_slash_responses_dot_ts)).
must(auth_return_value_is_bad_http_response(startloc_15_23_endloc_15_56_apps_slash_web_slash_lib_slash_guards_dot_ts)).
must_not(auth_return_value_is_bad_http_response(startloc_16_10_endloc_16_72_apps_slash_web_slash_lib_slash_responses_dot_ts)).
must_not(auth_return_value_is_bad_http_response(startloc_52_23_endloc_52_54_apps_slash_web_slash_lib_slash_guards_dot_ts)).

% early-return authenticating function : both levels hang off the empty name catalog
must_not(auth_early_return_authenticating_function(_)).

% gated return on a comparison ( pins Lhs / Rhs / Op / ReturnedValue )
must(kb_gated_return_on_comparison(startloc_5_10_endloc_5_18_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_5_23_endloc_5_32_apps_slash_web_slash_lib_slash_signing_dot_ts, neq, startloc_5_42_endloc_5_47_apps_slash_web_slash_lib_slash_signing_dot_ts)).
must(kb_gated_return_on_comparison(startloc_14_10_endloc_14_22_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_14_28_endloc_14_35_apps_slash_web_slash_lib_slash_signing_dot_ts, eq, startloc_14_44_endloc_14_48_apps_slash_web_slash_lib_slash_signing_dot_ts)).
% `if ( !password ) return null` is gated, but not by a comparison
must_not(kb_gated_return_on_comparison(_, _, _, startloc_21_28_endloc_21_32_apps_slash_web_slash_lib_slash_signing_dot_ts)).

% capability verifier by shape : crypto output on the lhs ( hmac ) / on the rhs ( jwt )
must(auth_capability_verifier_by_shape(startloc_3_8_endloc_10_2_apps_slash_web_slash_lib_slash_signing_dot_ts)).
must(auth_capability_verifier(startloc_12_8_endloc_17_2_apps_slash_web_slash_lib_slash_signing_dot_ts)).
must(auth_capability_verifier_dataflow_side(startloc_4_22_endloc_4_90_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_5_10_endloc_5_18_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_5_23_endloc_5_32_apps_slash_web_slash_lib_slash_signing_dot_ts)).
must(auth_capability_verifier_dataflow_side(startloc_13_21_endloc_13_47_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_14_10_endloc_14_22_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_14_28_endloc_14_35_apps_slash_web_slash_lib_slash_signing_dot_ts)).
% the hmac flows into neither side of the jwt comparison
must_not(auth_capability_verifier_dataflow_side(startloc_4_22_endloc_4_90_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_14_10_endloc_14_22_apps_slash_web_slash_lib_slash_signing_dot_ts, startloc_14_28_endloc_14_35_apps_slash_web_slash_lib_slash_signing_dot_ts)).
% digest computed but never compared
must_not(auth_capability_verifier(startloc_19_8_endloc_24_2_apps_slash_web_slash_lib_slash_signing_dot_ts)).
% name tier is empty by design
must_not(auth_capability_verifier_by_name(_)).

% reaching a verifier : 1 hop ( defined-in-file ) / 2 hops ( defined-in-dir both legs )
must(auth_reaches_capability_verifier_1hop(startloc_5_17_endloc_12_2_apps_slash_web_slash_app_slash_api_slash_upload_slash_route_dot_ts, startloc_3_8_endloc_10_2_apps_slash_web_slash_lib_slash_signing_dot_ts)).
must(auth_reaches_capability_verifier(startloc_5_17_endloc_12_2_apps_slash_web_slash_app_slash_api_slash_upload_slash_route_dot_ts, startloc_3_8_endloc_10_2_apps_slash_web_slash_lib_slash_signing_dot_ts)).
must(auth_reaches_capability_verifier_2hop(startloc_14_17_endloc_20_2_apps_slash_web_slash_app_slash_api_slash_upload_slash_route_dot_ts, startloc_3_8_endloc_10_2_apps_slash_web_slash_lib_slash_signing_dot_ts)).
must(auth_reaches_capability_verifier(startloc_14_17_endloc_20_2_apps_slash_web_slash_app_slash_api_slash_upload_slash_route_dot_ts, startloc_3_8_endloc_10_2_apps_slash_web_slash_lib_slash_signing_dot_ts)).
must(auth_1st_party_call_to_func(startloc_15_5_endloc_15_22_apps_slash_web_slash_app_slash_api_slash_upload_slash_route_dot_ts, startloc_3_8_endloc_6_2_apps_slash_web_slash_lib_slash_upload_dot_ts)).
% PUT does not call the verifier directly
must_not(auth_reaches_capability_verifier_1hop(startloc_14_17_endloc_20_2_apps_slash_web_slash_app_slash_api_slash_upload_slash_route_dot_ts, _)).
% loop guards : the verifier calling itself ( V -> V ; POST -> V -> V )
must_not(auth_reaches_capability_verifier(startloc_3_8_endloc_10_2_apps_slash_web_slash_lib_slash_signing_dot_ts, _)).
must_not(auth_reaches_capability_verifier_2hop(startloc_5_17_endloc_12_2_apps_slash_web_slash_app_slash_api_slash_upload_slash_route_dot_ts, _)).
% GET reaches hashPassword, which is not a verifier
must_not(auth_reaches_capability_verifier(startloc_22_17_endloc_26_2_apps_slash_web_slash_app_slash_api_slash_upload_slash_route_dot_ts, _)).
