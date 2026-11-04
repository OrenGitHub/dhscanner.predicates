% fixture : endpoints/nodejs/nextjs.pl

% -----------------------------------------------------------------------------
% app/api/users/route.ts

% export async function GET( req : NextRequest ) { ... }
kb_func_def(startloc_5_1_endloc_9_2_app_slash_api_slash_users_slash_route_dot_ts, 'GET', 'app/api/users/route.ts', 'app/api/users').
kb_param_i_of_callable(startloc_5_27_endloc_5_44_app_slash_api_slash_users_slash_route_dot_ts, 0, startloc_5_1_endloc_9_2_app_slash_api_slash_users_slash_route_dot_ts).
kb_param_has_name(startloc_5_27_endloc_5_44_app_slash_api_slash_users_slash_route_dot_ts, 'req').
kb_param_has_resolved_type(startloc_5_27_endloc_5_44_app_slash_api_slash_users_slash_route_dot_ts, 'next/server.NextRequest').

% export async function POST( request : Request ) { ... }   ( both alternative gates )
kb_func_def(startloc_11_1_endloc_15_2_app_slash_api_slash_users_slash_route_dot_ts, 'POST', 'app/api/users/route.ts', 'app/api/users').
kb_param_i_of_callable(startloc_11_28_endloc_11_45_app_slash_api_slash_users_slash_route_dot_ts, 0, startloc_11_1_endloc_15_2_app_slash_api_slash_users_slash_route_dot_ts).
kb_param_has_name(startloc_11_28_endloc_11_45_app_slash_api_slash_users_slash_route_dot_ts, 'request').
kb_param_has_resolved_type(startloc_11_28_endloc_11_45_app_slash_api_slash_users_slash_route_dot_ts, 'nodejs.Request').

% export async function PUT( req : NextRequest ) { ... }   ( direct shape )
kb_func_def(startloc_17_1_endloc_25_2_app_slash_api_slash_users_slash_route_dot_ts, 'PUT', 'app/api/users/route.ts', 'app/api/users').
kb_param_i_of_callable(startloc_17_27_endloc_17_44_app_slash_api_slash_users_slash_route_dot_ts, 0, startloc_17_1_endloc_25_2_app_slash_api_slash_users_slash_route_dot_ts).
kb_param_has_name(startloc_17_27_endloc_17_44_app_slash_api_slash_users_slash_route_dot_ts, 'req').
kb_param_has_resolved_type(startloc_17_27_endloc_17_44_app_slash_api_slash_users_slash_route_dot_ts, 'next/server.NextRequest').
kb_callable_source_body_length(startloc_17_1_endloc_25_2_app_slash_api_slash_users_slash_route_dot_ts, 6).

% -----------------------------------------------------------------------------
% app/api/v2/contacts/bulk/route.ts ( wrapper shape )
%
%   export const PUT = async ( request : NextRequest ) =>
%       authenticatedApiClient( { handler : async ( { parsedInput } ) => { ... } } ) ;

kb_func_def(startloc_3_14_endloc_8_7_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 'PUT', 'app/api/v2/contacts/bulk/route.ts', 'app/api/v2/contacts/bulk').
kb_param_i_of_callable(startloc_3_28_endloc_3_49_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 0, startloc_3_14_endloc_8_7_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts).
kb_param_has_name(startloc_3_28_endloc_3_49_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 'request').
kb_param_has_resolved_type(startloc_3_28_endloc_3_49_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 'next/server.NextRequest').
kb_callable_source_body_length(startloc_3_14_endloc_8_7_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 1).
% authenticatedApiClient( ... )
kb_called_from(startloc_4_5_endloc_8_6_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, startloc_3_14_endloc_8_7_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts).
% dictify( kv( "handler", <lambda> ) )
kb_arg_i_for_call(startloc_4_28_endloc_8_5_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 0, startloc_4_5_endloc_8_6_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts).
kb_arg_i_for_call(startloc_5_9_endloc_7_10_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 0, startloc_4_28_endloc_8_5_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts).
kb_arg_i_for_call(startloc_5_9_endloc_5_16_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 0, startloc_5_9_endloc_7_10_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts).
kb_const_string(startloc_5_9_endloc_5_16_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 'handler').
kb_arg_i_for_call(startloc_5_18_endloc_7_10_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 1, startloc_5_9_endloc_7_10_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts).
kb_callable_source_body_length(startloc_5_18_endloc_7_10_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 4).

% -----------------------------------------------------------------------------
% near misses

% app/users/page.ts : export async function GET( req : NextRequest ) -- not a route.ts
kb_func_def(startloc_2_1_endloc_4_2_app_slash_users_slash_page_dot_ts, 'GET', 'app/users/page.ts', 'app/users').
kb_param_i_of_callable(startloc_2_27_endloc_2_44_app_slash_users_slash_page_dot_ts, 0, startloc_2_1_endloc_4_2_app_slash_users_slash_page_dot_ts).
kb_param_has_name(startloc_2_27_endloc_2_44_app_slash_users_slash_page_dot_ts, 'req').
kb_param_has_resolved_type(startloc_2_27_endloc_2_44_app_slash_users_slash_page_dot_ts, 'next/server.NextRequest').

% app/api/items/route.ts
%   export async function GET( request : Request ) -- GET only takes `req : NextRequest`
kb_func_def(startloc_2_1_endloc_4_2_app_slash_api_slash_items_slash_route_dot_ts, 'GET', 'app/api/items/route.ts', 'app/api/items').
kb_param_i_of_callable(startloc_2_27_endloc_2_44_app_slash_api_slash_items_slash_route_dot_ts, 0, startloc_2_1_endloc_4_2_app_slash_api_slash_items_slash_route_dot_ts).
kb_param_has_name(startloc_2_27_endloc_2_44_app_slash_api_slash_items_slash_route_dot_ts, 'request').
kb_param_has_resolved_type(startloc_2_27_endloc_2_44_app_slash_api_slash_items_slash_route_dot_ts, 'nodejs.Request').
%   export async function POST( body : NextRequest ) -- not a request-ish name
kb_func_def(startloc_6_1_endloc_8_2_app_slash_api_slash_items_slash_route_dot_ts, 'POST', 'app/api/items/route.ts', 'app/api/items').
kb_param_i_of_callable(startloc_6_28_endloc_6_45_app_slash_api_slash_items_slash_route_dot_ts, 0, startloc_6_1_endloc_8_2_app_slash_api_slash_items_slash_route_dot_ts).
kb_param_has_name(startloc_6_28_endloc_6_45_app_slash_api_slash_items_slash_route_dot_ts, 'body').
kb_param_has_resolved_type(startloc_6_28_endloc_6_45_app_slash_api_slash_items_slash_route_dot_ts, 'next/server.NextRequest').
%   export async function PUT( req ) -- untyped request param
kb_func_def(startloc_10_1_endloc_12_2_app_slash_api_slash_items_slash_route_dot_ts, 'PUT', 'app/api/items/route.ts', 'app/api/items').
kb_param_i_of_callable(startloc_10_27_endloc_10_30_app_slash_api_slash_items_slash_route_dot_ts, 0, startloc_10_1_endloc_12_2_app_slash_api_slash_items_slash_route_dot_ts).
kb_param_has_name(startloc_10_27_endloc_10_30_app_slash_api_slash_items_slash_route_dot_ts, 'req').

% app/api/v2/tags/route.ts : a 2-statement PUT that also calls a HOC with a handler
%   export const PUT = async ( request : NextRequest ) => { log() ; return withAuth( { handler : async () => { ... } } ) }
kb_func_def(startloc_3_14_endloc_9_2_app_slash_api_slash_v2_slash_tags_slash_route_dot_ts, 'PUT', 'app/api/v2/tags/route.ts', 'app/api/v2/tags').
kb_param_i_of_callable(startloc_3_28_endloc_3_49_app_slash_api_slash_v2_slash_tags_slash_route_dot_ts, 0, startloc_3_14_endloc_9_2_app_slash_api_slash_v2_slash_tags_slash_route_dot_ts).
kb_param_has_name(startloc_3_28_endloc_3_49_app_slash_api_slash_v2_slash_tags_slash_route_dot_ts, 'request').
kb_param_has_resolved_type(startloc_3_28_endloc_3_49_app_slash_api_slash_v2_slash_tags_slash_route_dot_ts, 'next/server.NextRequest').
kb_callable_source_body_length(startloc_3_14_endloc_9_2_app_slash_api_slash_v2_slash_tags_slash_route_dot_ts, 2).
kb_called_from(startloc_5_12_endloc_8_6_app_slash_api_slash_v2_slash_tags_slash_route_dot_ts, startloc_3_14_endloc_9_2_app_slash_api_slash_v2_slash_tags_slash_route_dot_ts).
kb_arg_i_for_call(startloc_5_21_endloc_8_5_app_slash_api_slash_v2_slash_tags_slash_route_dot_ts, 0, startloc_5_12_endloc_8_6_app_slash_api_slash_v2_slash_tags_slash_route_dot_ts).
kb_arg_i_for_call(startloc_6_9_endloc_7_10_app_slash_api_slash_v2_slash_tags_slash_route_dot_ts, 0, startloc_5_21_endloc_8_5_app_slash_api_slash_v2_slash_tags_slash_route_dot_ts).
kb_arg_i_for_call(startloc_6_9_endloc_6_16_app_slash_api_slash_v2_slash_tags_slash_route_dot_ts, 0, startloc_6_9_endloc_7_10_app_slash_api_slash_v2_slash_tags_slash_route_dot_ts).
kb_const_string(startloc_6_9_endloc_6_16_app_slash_api_slash_v2_slash_tags_slash_route_dot_ts, 'handler').
kb_arg_i_for_call(startloc_6_18_endloc_7_10_app_slash_api_slash_v2_slash_tags_slash_route_dot_ts, 1, startloc_6_9_endloc_7_10_app_slash_api_slash_v2_slash_tags_slash_route_dot_ts).
kb_callable_source_body_length(startloc_6_18_endloc_7_10_app_slash_api_slash_v2_slash_tags_slash_route_dot_ts, 3).

% app/api/v2/notes/route.ts : a 1-statement PUT whose HOC config value is not a callable
%   export const PUT = async ( request : NextRequest ) => withAuth( { handler : notesHandlerName } )
kb_func_def(startloc_3_14_endloc_4_60_app_slash_api_slash_v2_slash_notes_slash_route_dot_ts, 'PUT', 'app/api/v2/notes/route.ts', 'app/api/v2/notes').
kb_param_i_of_callable(startloc_3_28_endloc_3_49_app_slash_api_slash_v2_slash_notes_slash_route_dot_ts, 0, startloc_3_14_endloc_4_60_app_slash_api_slash_v2_slash_notes_slash_route_dot_ts).
kb_param_has_name(startloc_3_28_endloc_3_49_app_slash_api_slash_v2_slash_notes_slash_route_dot_ts, 'request').
kb_param_has_resolved_type(startloc_3_28_endloc_3_49_app_slash_api_slash_v2_slash_notes_slash_route_dot_ts, 'next/server.NextRequest').
kb_callable_source_body_length(startloc_3_14_endloc_4_60_app_slash_api_slash_v2_slash_notes_slash_route_dot_ts, 1).
kb_called_from(startloc_4_5_endloc_4_59_app_slash_api_slash_v2_slash_notes_slash_route_dot_ts, startloc_3_14_endloc_4_60_app_slash_api_slash_v2_slash_notes_slash_route_dot_ts).
kb_arg_i_for_call(startloc_4_14_endloc_4_58_app_slash_api_slash_v2_slash_notes_slash_route_dot_ts, 0, startloc_4_5_endloc_4_59_app_slash_api_slash_v2_slash_notes_slash_route_dot_ts).
kb_arg_i_for_call(startloc_4_16_endloc_4_56_app_slash_api_slash_v2_slash_notes_slash_route_dot_ts, 0, startloc_4_14_endloc_4_58_app_slash_api_slash_v2_slash_notes_slash_route_dot_ts).
kb_arg_i_for_call(startloc_4_16_endloc_4_23_app_slash_api_slash_v2_slash_notes_slash_route_dot_ts, 0, startloc_4_16_endloc_4_56_app_slash_api_slash_v2_slash_notes_slash_route_dot_ts).
kb_const_string(startloc_4_16_endloc_4_23_app_slash_api_slash_v2_slash_notes_slash_route_dot_ts, 'handler').
kb_arg_i_for_call(startloc_4_26_endloc_4_56_app_slash_api_slash_v2_slash_notes_slash_route_dot_ts, 1, startloc_4_16_endloc_4_56_app_slash_api_slash_v2_slash_notes_slash_route_dot_ts).

% -----------------------------------------------------------------------------
% GET

must(endpoints_http_get_nextjs(startloc_5_1_endloc_9_2_app_slash_api_slash_users_slash_route_dot_ts, startloc_5_27_endloc_5_44_app_slash_api_slash_users_slash_route_dot_ts, 'app/api/users')).
% not a route.ts
must_not(endpoints_http_get_nextjs(startloc_2_1_endloc_4_2_app_slash_users_slash_page_dot_ts, _, _)).
% `request : Request` is accepted by POST / PUT, not by GET
must_not(endpoints_http_get_nextjs(startloc_2_1_endloc_4_2_app_slash_api_slash_items_slash_route_dot_ts, _, _)).

% -----------------------------------------------------------------------------
% POST

% `request` + `nodejs.Request` : the second alternative of both helpers
must(endpoints_http_post_nextjs(startloc_11_1_endloc_15_2_app_slash_api_slash_users_slash_route_dot_ts, startloc_11_28_endloc_11_45_app_slash_api_slash_users_slash_route_dot_ts, 'app/api/users')).
% `body : NextRequest` : not a request-ish name
must_not(endpoints_http_post_nextjs(startloc_6_1_endloc_8_2_app_slash_api_slash_items_slash_route_dot_ts, _, _)).
% a GET is not a POST
must_not(endpoints_http_post_nextjs(startloc_5_1_endloc_9_2_app_slash_api_slash_users_slash_route_dot_ts, _, _)).

% -----------------------------------------------------------------------------
% PUT

% direct shape
must(endpoints_http_put_nextjs_direct(startloc_17_1_endloc_25_2_app_slash_api_slash_users_slash_route_dot_ts, startloc_17_27_endloc_17_44_app_slash_api_slash_users_slash_route_dot_ts, 'app/api/users')).
must(endpoints_http_put_nextjs(startloc_17_1_endloc_25_2_app_slash_api_slash_users_slash_route_dot_ts, startloc_17_27_endloc_17_44_app_slash_api_slash_users_slash_route_dot_ts, 'app/api/users')).
% wrapper shape : the inner handler lambda, request object stays the wrapper's param
must(endpoints_hoc_dict_handler_unwrap_nextjs(startloc_3_14_endloc_8_7_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, startloc_5_18_endloc_7_10_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts)).
must(endpoints_http_put_nextjs_wrapper(startloc_5_18_endloc_7_10_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, startloc_3_28_endloc_3_49_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 'app/api/v2/contacts/bulk')).
must(endpoints_http_put_nextjs(startloc_5_18_endloc_7_10_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, startloc_3_28_endloc_3_49_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 'app/api/v2/contacts/bulk')).
% the wrapper itself still matches the direct shape
must(endpoints_http_put_nextjs(startloc_3_14_endloc_8_7_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, startloc_3_28_endloc_3_49_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 'app/api/v2/contacts/bulk')).
% untyped `req`
must_not(endpoints_http_put_nextjs(startloc_10_1_endloc_12_2_app_slash_api_slash_items_slash_route_dot_ts, _, _)).
% 2-statement body : not a thin wrapper
must_not(endpoints_hoc_dict_handler_unwrap_nextjs(startloc_3_14_endloc_9_2_app_slash_api_slash_v2_slash_tags_slash_route_dot_ts, _)).
must_not(endpoints_http_put_nextjs(startloc_6_18_endloc_7_10_app_slash_api_slash_v2_slash_tags_slash_route_dot_ts, _, _)).
% the config value is a name, not a callable
must_not(endpoints_hoc_dict_handler_unwrap_nextjs(startloc_3_14_endloc_4_60_app_slash_api_slash_v2_slash_notes_slash_route_dot_ts, _)).

% -----------------------------------------------------------------------------
% user input

% req : NextRequest
must(endpoints_user_input_nextjs(startloc_5_27_endloc_5_44_app_slash_api_slash_users_slash_route_dot_ts)).
% request : Request
must(endpoints_user_input_nextjs(startloc_11_28_endloc_11_45_app_slash_api_slash_users_slash_route_dot_ts)).
% untyped `req`
must_not(endpoints_user_input_nextjs(startloc_10_27_endloc_10_30_app_slash_api_slash_items_slash_route_dot_ts)).
% `body : NextRequest`
must_not(endpoints_user_input_nextjs(startloc_6_28_endloc_6_45_app_slash_api_slash_items_slash_route_dot_ts)).

% -----------------------------------------------------------------------------
% wired into the family api

must(endpoints_http_get(startloc_5_1_endloc_9_2_app_slash_api_slash_users_slash_route_dot_ts, startloc_5_27_endloc_5_44_app_slash_api_slash_users_slash_route_dot_ts, 'app/api/users')).
must(endpoints_http_post(startloc_11_1_endloc_15_2_app_slash_api_slash_users_slash_route_dot_ts, startloc_11_28_endloc_11_45_app_slash_api_slash_users_slash_route_dot_ts, 'app/api/users')).
must(endpoints_http_put(startloc_5_18_endloc_7_10_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, startloc_3_28_endloc_3_49_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 'app/api/v2/contacts/bulk')).
must(endpoints_http(startloc_17_1_endloc_25_2_app_slash_api_slash_users_slash_route_dot_ts, put, startloc_17_27_endloc_17_44_app_slash_api_slash_users_slash_route_dot_ts, 'app/api/users')).
must(endpoints_user_input(startloc_5_27_endloc_5_44_app_slash_api_slash_users_slash_route_dot_ts)).
must_not(endpoints_http(startloc_2_1_endloc_4_2_app_slash_users_slash_page_dot_ts, _, _, _)).
