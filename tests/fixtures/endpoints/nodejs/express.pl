% fixture : endpoints/nodejs/express.pl

% router.route( '/files' ).get( ( req, res ) => { res.sendFile( req.query.name ) ; res.json( {} ) } )
kb_call_resolved(startloc_3_1_endloc_6_3_server_slash_routes_dot_js, 'express.Router.route.get').
kb_arg_i_for_call(startloc_3_30_endloc_6_2_server_slash_routes_dot_js, 0, startloc_3_1_endloc_6_3_server_slash_routes_dot_js).
kb_param_i_of_callable(startloc_3_32_endloc_3_35_server_slash_routes_dot_js, 0, startloc_3_30_endloc_6_2_server_slash_routes_dot_js).
kb_param_has_name(startloc_3_32_endloc_3_35_server_slash_routes_dot_js, 'req').
kb_param_i_of_callable(startloc_3_37_endloc_3_40_server_slash_routes_dot_js, 1, startloc_3_30_endloc_6_2_server_slash_routes_dot_js).
kb_param_has_name(startloc_3_37_endloc_3_40_server_slash_routes_dot_js, 'res').
% res.sendFile( ... )
kb_call_method_of_untyped_named_param(startloc_4_5_endloc_4_35_server_slash_routes_dot_js, 'sendFile', startloc_3_37_endloc_3_40_server_slash_routes_dot_js).
% res.json( {} )
kb_call_method_of_untyped_named_param(startloc_5_5_endloc_5_17_server_slash_routes_dot_js, 'json', startloc_3_37_endloc_3_40_server_slash_routes_dot_js).

% router.route( '/upload' ).post( ( req, res ) => { res.sendFile( ... ) } ) : not a get route
kb_call_resolved(startloc_8_1_endloc_10_3_server_slash_routes_dot_js, 'express.Router.route.post').
kb_arg_i_for_call(startloc_8_32_endloc_10_2_server_slash_routes_dot_js, 0, startloc_8_1_endloc_10_3_server_slash_routes_dot_js).
kb_param_i_of_callable(startloc_8_34_endloc_8_37_server_slash_routes_dot_js, 0, startloc_8_32_endloc_10_2_server_slash_routes_dot_js).
kb_param_has_name(startloc_8_34_endloc_8_37_server_slash_routes_dot_js, 'req').
kb_param_i_of_callable(startloc_8_39_endloc_8_42_server_slash_routes_dot_js, 1, startloc_8_32_endloc_10_2_server_slash_routes_dot_js).
kb_param_has_name(startloc_8_39_endloc_8_42_server_slash_routes_dot_js, 'res').
kb_call_method_of_untyped_named_param(startloc_9_5_endloc_9_35_server_slash_routes_dot_js, 'sendFile', startloc_8_39_endloc_8_42_server_slash_routes_dot_js).

% router.route( '/docs' ).get( ( request, response ) => { response.sendFile( ... ) } ) : other param names
kb_call_resolved(startloc_12_1_endloc_14_3_server_slash_routes_dot_js, 'express.Router.route.get').
kb_arg_i_for_call(startloc_12_29_endloc_14_2_server_slash_routes_dot_js, 0, startloc_12_1_endloc_14_3_server_slash_routes_dot_js).
kb_param_i_of_callable(startloc_12_31_endloc_12_38_server_slash_routes_dot_js, 0, startloc_12_29_endloc_14_2_server_slash_routes_dot_js).
kb_param_has_name(startloc_12_31_endloc_12_38_server_slash_routes_dot_js, 'request').
kb_param_i_of_callable(startloc_12_40_endloc_12_48_server_slash_routes_dot_js, 1, startloc_12_29_endloc_14_2_server_slash_routes_dot_js).
kb_param_has_name(startloc_12_40_endloc_12_48_server_slash_routes_dot_js, 'response').
kb_call_method_of_untyped_named_param(startloc_13_5_endloc_13_40_server_slash_routes_dot_js, 'sendFile', startloc_12_40_endloc_12_48_server_slash_routes_dot_js).

% user input : req of a get route
must(endpoints_user_input_express(startloc_3_32_endloc_3_35_server_slash_routes_dot_js)).
% sink : res.sendFile in a get route
must(sinks_arbitrary_file_read_express_sendFile(startloc_4_5_endloc_4_35_server_slash_routes_dot_js)).

% res is param 1, not the request
must_not(endpoints_user_input_express(startloc_3_37_endloc_3_40_server_slash_routes_dot_js)).
% post route
must_not(endpoints_user_input_express(startloc_8_34_endloc_8_37_server_slash_routes_dot_js)).
must_not(sinks_arbitrary_file_read_express_sendFile(startloc_9_5_endloc_9_35_server_slash_routes_dot_js)).
% `request` / `response` names
must_not(endpoints_user_input_express(startloc_12_31_endloc_12_38_server_slash_routes_dot_js)).
must_not(sinks_arbitrary_file_read_express_sendFile(startloc_13_5_endloc_13_40_server_slash_routes_dot_js)).
% res.json is not sendFile
must_not(sinks_arbitrary_file_read_express_sendFile(startloc_5_5_endloc_5_17_server_slash_routes_dot_js)).

% wired into the family apis
must(endpoints_user_input(startloc_3_32_endloc_3_35_server_slash_routes_dot_js)).
must(sinks_arbitrary_file_read(startloc_4_5_endloc_4_35_server_slash_routes_dot_js)).
must_not(endpoints_user_input(startloc_8_34_endloc_8_37_server_slash_routes_dot_js)).
