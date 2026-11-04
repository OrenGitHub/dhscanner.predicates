% fixture : endpoints/golang/echo.pl

% g.GET( "/users", func( c echo.Context ) error {
%     q := c
%     id := q.QueryParam( "id" )            <-- reached from c in two dataflow hops
%     other := ctx.QueryParam( "x" )         <-- some other context : no dataflow from c
% } )
kb_call_resolved(startloc_8_2_endloc_13_4_api_slash_routes_dot_go, 'echo.Group.GET').
kb_arg_i_for_call(startloc_8_8_endloc_8_16_api_slash_routes_dot_go, 0, startloc_8_2_endloc_13_4_api_slash_routes_dot_go).
kb_const_string(startloc_8_8_endloc_8_16_api_slash_routes_dot_go, '/users').
kb_arg_i_for_call(startloc_8_18_endloc_13_3_api_slash_routes_dot_go, 1, startloc_8_2_endloc_13_4_api_slash_routes_dot_go).
kb_param_i_of_callable(startloc_8_24_endloc_8_38_api_slash_routes_dot_go, 0, startloc_8_18_endloc_13_3_api_slash_routes_dot_go).
kb_param_has_resolved_type(startloc_8_24_endloc_8_38_api_slash_routes_dot_go, 'echo.Context').
kb_dataflow_edge(startloc_8_24_endloc_8_38_api_slash_routes_dot_go, startloc_9_5_endloc_9_11_api_slash_routes_dot_go).
kb_dataflow_edge(startloc_9_5_endloc_9_11_api_slash_routes_dot_go, startloc_10_11_endloc_10_31_api_slash_routes_dot_go).
kb_call_resolved(startloc_10_11_endloc_10_31_api_slash_routes_dot_go, 'echo.Context.QueryParam').
kb_call_resolved(startloc_11_14_endloc_11_35_api_slash_routes_dot_go, 'echo.Context.QueryParam').

% g.GET( prefix, func( c echo.Context ) error { c.QueryParam( "q" ) } ) : url is not a const string
kb_call_resolved(startloc_15_2_endloc_17_4_api_slash_routes_dot_go, 'echo.Group.GET').
kb_arg_i_for_call(startloc_15_8_endloc_15_14_api_slash_routes_dot_go, 0, startloc_15_2_endloc_17_4_api_slash_routes_dot_go).
kb_arg_i_for_call(startloc_15_16_endloc_17_3_api_slash_routes_dot_go, 1, startloc_15_2_endloc_17_4_api_slash_routes_dot_go).
kb_param_i_of_callable(startloc_15_22_endloc_15_36_api_slash_routes_dot_go, 0, startloc_15_16_endloc_17_3_api_slash_routes_dot_go).
kb_param_has_resolved_type(startloc_15_22_endloc_15_36_api_slash_routes_dot_go, 'echo.Context').
kb_dataflow_edge(startloc_15_22_endloc_15_36_api_slash_routes_dot_go, startloc_16_5_endloc_16_22_api_slash_routes_dot_go).
kb_call_resolved(startloc_16_5_endloc_16_22_api_slash_routes_dot_go, 'echo.Context.QueryParam').

% g.POST( "/items", func( c echo.Context ) error { c.QueryParam( "q" ) } ) : not a GET route
kb_call_resolved(startloc_19_2_endloc_21_4_api_slash_routes_dot_go, 'echo.Group.POST').
kb_arg_i_for_call(startloc_19_9_endloc_19_17_api_slash_routes_dot_go, 0, startloc_19_2_endloc_21_4_api_slash_routes_dot_go).
kb_const_string(startloc_19_9_endloc_19_17_api_slash_routes_dot_go, '/items').
kb_arg_i_for_call(startloc_19_19_endloc_21_3_api_slash_routes_dot_go, 1, startloc_19_2_endloc_21_4_api_slash_routes_dot_go).
kb_param_i_of_callable(startloc_19_25_endloc_19_39_api_slash_routes_dot_go, 0, startloc_19_19_endloc_21_3_api_slash_routes_dot_go).
kb_param_has_resolved_type(startloc_19_25_endloc_19_39_api_slash_routes_dot_go, 'echo.Context').
kb_dataflow_edge(startloc_19_25_endloc_19_39_api_slash_routes_dot_go, startloc_20_5_endloc_20_22_api_slash_routes_dot_go).
kb_call_resolved(startloc_20_5_endloc_20_22_api_slash_routes_dot_go, 'echo.Context.QueryParam').

% the context flows into QueryParam inside a GET lambda with a const url
must(endpoints_user_input_echo(startloc_10_11_endloc_10_31_api_slash_routes_dot_go)).

% no dataflow from the route's context
must_not(endpoints_user_input_echo(startloc_11_14_endloc_11_35_api_slash_routes_dot_go)).
% url is a variable
must_not(endpoints_user_input_echo(startloc_16_5_endloc_16_22_api_slash_routes_dot_go)).
% POST route
must_not(endpoints_user_input_echo(startloc_20_5_endloc_20_22_api_slash_routes_dot_go)).

% wired into the family api
must(endpoints_user_input(startloc_10_11_endloc_10_31_api_slash_routes_dot_go)).
must_not(endpoints_user_input(startloc_20_5_endloc_20_22_api_slash_routes_dot_go)).
