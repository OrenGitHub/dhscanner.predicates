% fixture : endpoints/api.pl

% -----------------------------------------------------------------------------
% next.js : app/api/users/route.ts

% export async function GET( req : NextRequest ) { ... }
kb_func_def(startloc_5_1_endloc_12_2_app_slash_api_slash_users_slash_route_dot_ts, 'GET', 'app/api/users/route.ts', 'app/api/users').
kb_param_i_of_callable(startloc_5_27_endloc_5_44_app_slash_api_slash_users_slash_route_dot_ts, 0, startloc_5_1_endloc_12_2_app_slash_api_slash_users_slash_route_dot_ts).
kb_param_has_name(startloc_5_27_endloc_5_44_app_slash_api_slash_users_slash_route_dot_ts, 'req').
kb_param_has_resolved_type(startloc_5_27_endloc_5_44_app_slash_api_slash_users_slash_route_dot_ts, 'next/server.NextRequest').

% export async function POST( request : Request ) { ... }
kb_func_def(startloc_14_1_endloc_20_2_app_slash_api_slash_users_slash_route_dot_ts, 'POST', 'app/api/users/route.ts', 'app/api/users').
kb_param_i_of_callable(startloc_14_28_endloc_14_45_app_slash_api_slash_users_slash_route_dot_ts, 0, startloc_14_1_endloc_20_2_app_slash_api_slash_users_slash_route_dot_ts).
kb_param_has_name(startloc_14_28_endloc_14_45_app_slash_api_slash_users_slash_route_dot_ts, 'request').
kb_param_has_resolved_type(startloc_14_28_endloc_14_45_app_slash_api_slash_users_slash_route_dot_ts, 'nodejs.Request').

% export async function PUT( req : NextRequest ) { ... }
kb_func_def(startloc_22_1_endloc_28_2_app_slash_api_slash_users_slash_route_dot_ts, 'PUT', 'app/api/users/route.ts', 'app/api/users').
kb_param_i_of_callable(startloc_22_27_endloc_22_44_app_slash_api_slash_users_slash_route_dot_ts, 0, startloc_22_1_endloc_28_2_app_slash_api_slash_users_slash_route_dot_ts).
kb_param_has_name(startloc_22_27_endloc_22_44_app_slash_api_slash_users_slash_route_dot_ts, 'req').
kb_param_has_resolved_type(startloc_22_27_endloc_22_44_app_slash_api_slash_users_slash_route_dot_ts, 'next/server.NextRequest').

% inside GET : const user = await requireUser( req ) ;
kb_called_from(startloc_6_16_endloc_6_32_app_slash_api_slash_users_slash_route_dot_ts, startloc_5_1_endloc_12_2_app_slash_api_slash_users_slash_route_dot_ts).
kb_call_1st_party_func_defined_in_file(startloc_6_16_endloc_6_32_app_slash_api_slash_users_slash_route_dot_ts, 'requireUser', 'lib/auth.ts').

% inside PUT : await loadSession( req ) ; ( not a guard, see lib/session.ts )
kb_called_from(startloc_23_5_endloc_23_25_app_slash_api_slash_users_slash_route_dot_ts, startloc_22_1_endloc_28_2_app_slash_api_slash_users_slash_route_dot_ts).
kb_call_1st_party_func_defined_in_file(startloc_23_5_endloc_23_25_app_slash_api_slash_users_slash_route_dot_ts, 'loadSession', 'lib/session.ts').

% lib/auth.ts :
%   export function requireUser( req ) {
%       if ( ! req.cookies.get( 'session' ) ) return Response.json( {}, { status : 401 } ) ;
%   }                                     ( + the parser-injected fall-through )
kb_func_def(startloc_1_1_endloc_4_2_lib_slash_auth_dot_ts, 'requireUser', 'lib/auth.ts', 'lib').
kb_callable_returns_value(startloc_1_1_endloc_4_2_lib_slash_auth_dot_ts, startloc_1_1_endloc_4_2_lib_slash_auth_dot_ts).
kb_callable_returns_value(startloc_1_1_endloc_4_2_lib_slash_auth_dot_ts, startloc_2_48_endloc_2_86_lib_slash_auth_dot_ts).
kb_called_from(startloc_2_48_endloc_2_86_lib_slash_auth_dot_ts, startloc_1_1_endloc_4_2_lib_slash_auth_dot_ts).
kb_call_resolved(startloc_2_48_endloc_2_86_lib_slash_auth_dot_ts, 'nodejs.Response.json').
kb_arg_i_for_call(startloc_2_66_endloc_2_85_lib_slash_auth_dot_ts, 1, startloc_2_48_endloc_2_86_lib_slash_auth_dot_ts).
kb_arg_i_for_call(startloc_2_68_endloc_2_83_lib_slash_auth_dot_ts, 0, startloc_2_66_endloc_2_85_lib_slash_auth_dot_ts).
kb_arg_i_for_call(startloc_2_68_endloc_2_74_lib_slash_auth_dot_ts, 0, startloc_2_68_endloc_2_83_lib_slash_auth_dot_ts).
kb_const_string(startloc_2_68_endloc_2_74_lib_slash_auth_dot_ts, 'status').
kb_arg_i_for_call(startloc_2_77_endloc_2_80_lib_slash_auth_dot_ts, 1, startloc_2_68_endloc_2_83_lib_slash_auth_dot_ts).
kb_const_int(startloc_2_77_endloc_2_80_lib_slash_auth_dot_ts, 401).

% lib/session.ts :
%   export function loadSession( req ) {
%       if ( ! sid ) return Response.json( {}, { status : 401 } ) ;
%       return db.find( sid ) ;            <-- a success return : not a guard
%   }
kb_func_def(startloc_1_1_endloc_5_2_lib_slash_session_dot_ts, 'loadSession', 'lib/session.ts', 'lib').
kb_callable_returns_value(startloc_1_1_endloc_5_2_lib_slash_session_dot_ts, startloc_1_1_endloc_5_2_lib_slash_session_dot_ts).
kb_callable_returns_value(startloc_1_1_endloc_5_2_lib_slash_session_dot_ts, startloc_2_25_endloc_2_63_lib_slash_session_dot_ts).
kb_callable_returns_value(startloc_1_1_endloc_5_2_lib_slash_session_dot_ts, startloc_3_12_endloc_3_24_lib_slash_session_dot_ts).
kb_call_resolved(startloc_2_25_endloc_2_63_lib_slash_session_dot_ts, 'nodejs.Response.json').
kb_arg_i_for_call(startloc_2_43_endloc_2_62_lib_slash_session_dot_ts, 1, startloc_2_25_endloc_2_63_lib_slash_session_dot_ts).
kb_arg_i_for_call(startloc_2_45_endloc_2_60_lib_slash_session_dot_ts, 0, startloc_2_43_endloc_2_62_lib_slash_session_dot_ts).
kb_arg_i_for_call(startloc_2_45_endloc_2_51_lib_slash_session_dot_ts, 0, startloc_2_45_endloc_2_60_lib_slash_session_dot_ts).
kb_const_string(startloc_2_45_endloc_2_51_lib_slash_session_dot_ts, 'status').
kb_arg_i_for_call(startloc_2_54_endloc_2_57_lib_slash_session_dot_ts, 1, startloc_2_45_endloc_2_60_lib_slash_session_dot_ts).
kb_const_int(startloc_2_54_endloc_2_57_lib_slash_session_dot_ts, 401).

% -----------------------------------------------------------------------------
% spring : src/main/java/com/acme/ItemController.java
%
%   @RequestMapping( "/api/items" )
%   class ItemController {
%       @GetMapping( "/{id}" ) @PreAuthorize( "hasRole('ADMIN')" )
%       Item get( @PathVariable String id, HttpServletRequest request ) { ... }
%       @PostMapping @PreAuthorize( "permitAll()" )   Item create( ... ) { ... }
%       @PutMapping( "/{id}" )    Item replace( ... ) { ... }
%       @DeleteMapping( "/{id}" ) void remove( ... ) { ... }
%       @PatchMapping( "/{id}" )  Item patch( ... ) { ... }
%   }

kb_class_has_annotation(startloc_3_1_endloc_30_2_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, startloc_2_1_endloc_2_31_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_call_resolved(startloc_2_1_endloc_2_31_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 'org.springframework.web.bind.annotation.RequestMapping').
kb_arg_i_for_call(startloc_2_18_endloc_2_30_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 0, startloc_2_1_endloc_2_31_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_const_string(startloc_2_18_endloc_2_30_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, '/api/items').

% get
kb_method_of_class(startloc_6_5_endloc_8_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, startloc_3_1_endloc_30_2_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_callable_has_annotation(startloc_6_5_endloc_8_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, startloc_5_5_endloc_5_26_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_call_resolved(startloc_5_5_endloc_5_26_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 'org.springframework.web.bind.annotation.GetMapping').
kb_arg_i_for_call(startloc_5_18_endloc_5_25_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 0, startloc_5_5_endloc_5_26_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_const_string(startloc_5_18_endloc_5_25_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, '/{id}').
kb_callable_has_annotation(startloc_6_5_endloc_8_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, startloc_5_28_endloc_5_63_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_call_resolved(startloc_5_28_endloc_5_63_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 'org.springframework.security.access.prepost.PreAuthorize').
kb_arg_i_for_call(startloc_5_42_endloc_5_62_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 0, startloc_5_28_endloc_5_63_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_const_string(startloc_5_42_endloc_5_62_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 'hasRole(\'ADMIN\')').
% @PathVariable String id
kb_param_i_of_callable(startloc_6_14_endloc_6_37_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 0, startloc_6_5_endloc_8_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_param_has_annotation(startloc_6_14_endloc_6_37_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, startloc_6_14_endloc_6_27_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_call_resolved(startloc_6_14_endloc_6_27_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 'org.springframework.web.bind.annotation.PathVariable').
% HttpServletRequest request : a servlet-shaped param, but the verb is known
kb_param_i_of_callable(startloc_6_39_endloc_6_65_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 1, startloc_6_5_endloc_8_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_param_has_name(startloc_6_39_endloc_6_65_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 'request').
kb_param_has_resolved_type(startloc_6_39_endloc_6_65_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 'jakarta.servlet.http.HttpServletRequest').
kb_callable_source_body_length(startloc_6_5_endloc_8_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 1).

% create
kb_method_of_class(startloc_11_5_endloc_13_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, startloc_3_1_endloc_30_2_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_callable_has_annotation(startloc_11_5_endloc_13_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, startloc_10_5_endloc_10_17_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_call_resolved(startloc_10_5_endloc_10_17_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 'org.springframework.web.bind.annotation.PostMapping').
kb_callable_has_annotation(startloc_11_5_endloc_13_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, startloc_10_19_endloc_10_47_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_call_resolved(startloc_10_19_endloc_10_47_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 'org.springframework.security.access.prepost.PreAuthorize').
kb_arg_i_for_call(startloc_10_33_endloc_10_46_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 0, startloc_10_19_endloc_10_47_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_const_string(startloc_10_33_endloc_10_46_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 'permitAll()').

% replace
kb_method_of_class(startloc_16_5_endloc_18_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, startloc_3_1_endloc_30_2_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_callable_has_annotation(startloc_16_5_endloc_18_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, startloc_15_5_endloc_15_26_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_call_resolved(startloc_15_5_endloc_15_26_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 'org.springframework.web.bind.annotation.PutMapping').
kb_arg_i_for_call(startloc_15_18_endloc_15_25_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 0, startloc_15_5_endloc_15_26_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_const_string(startloc_15_18_endloc_15_25_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, '/{id}').

% remove
kb_method_of_class(startloc_21_5_endloc_23_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, startloc_3_1_endloc_30_2_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_callable_has_annotation(startloc_21_5_endloc_23_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, startloc_20_5_endloc_20_29_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_call_resolved(startloc_20_5_endloc_20_29_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 'org.springframework.web.bind.annotation.DeleteMapping').
kb_arg_i_for_call(startloc_20_21_endloc_20_28_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 0, startloc_20_5_endloc_20_29_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_const_string(startloc_20_21_endloc_20_28_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, '/{id}').

% patch
kb_method_of_class(startloc_26_5_endloc_28_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, startloc_3_1_endloc_30_2_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_callable_has_annotation(startloc_26_5_endloc_28_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, startloc_25_5_endloc_25_28_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_call_resolved(startloc_25_5_endloc_25_28_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 'org.springframework.web.bind.annotation.PatchMapping').
kb_arg_i_for_call(startloc_25_20_endloc_25_27_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 0, startloc_25_5_endloc_25_28_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java).
kb_const_string(startloc_25_20_endloc_25_27_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, '/{id}').

% -----------------------------------------------------------------------------
% servlet : src/main/java/com/acme/LoginFilter.java
%
%   void doFilter( HttpServletRequest request, ... ) {
%       String next = request.getParameter( "next" ) ; ...
%   }

kb_param_i_of_callable(startloc_10_19_endloc_10_45_src_slash_main_slash_java_slash_com_slash_acme_slash_LoginFilter_dot_java, 0, startloc_10_5_endloc_14_6_src_slash_main_slash_java_slash_com_slash_acme_slash_LoginFilter_dot_java).
kb_param_has_name(startloc_10_19_endloc_10_45_src_slash_main_slash_java_slash_com_slash_acme_slash_LoginFilter_dot_java, 'request').
kb_param_has_resolved_type(startloc_10_19_endloc_10_45_src_slash_main_slash_java_slash_com_slash_acme_slash_LoginFilter_dot_java, 'jakarta.servlet.http.HttpServletRequest').
kb_callable_source_body_length(startloc_10_5_endloc_14_6_src_slash_main_slash_java_slash_com_slash_acme_slash_LoginFilter_dot_java, 3).
kb_called_from(startloc_11_23_endloc_11_53_src_slash_main_slash_java_slash_com_slash_acme_slash_LoginFilter_dot_java, startloc_10_5_endloc_14_6_src_slash_main_slash_java_slash_com_slash_acme_slash_LoginFilter_dot_java).
kb_call_resolved(startloc_11_23_endloc_11_53_src_slash_main_slash_java_slash_com_slash_acme_slash_LoginFilter_dot_java, 'jakarta.servlet.http.HttpServletRequest.getParameter').
kb_dataflow_edge(startloc_10_19_endloc_10_45_src_slash_main_slash_java_slash_com_slash_acme_slash_LoginFilter_dot_java, startloc_11_23_endloc_11_43_src_slash_main_slash_java_slash_com_slash_acme_slash_LoginFilter_dot_java).
kb_dataflow_edge(startloc_11_23_endloc_11_43_src_slash_main_slash_java_slash_com_slash_acme_slash_LoginFilter_dot_java, startloc_11_23_endloc_11_53_src_slash_main_slash_java_slash_com_slash_acme_slash_LoginFilter_dot_java).

% -----------------------------------------------------------------------------
% django : app/urls.py + app/views.py
%
%   path( "health/", health )         def health( request ) : ...

kb_call_resolved(startloc_4_5_endloc_4_30_app_slash_urls_dot_py, 'django.urls.path').
kb_arg_i_for_call(startloc_4_10_endloc_4_19_app_slash_urls_dot_py, 0, startloc_4_5_endloc_4_30_app_slash_urls_dot_py).
kb_const_string(startloc_4_10_endloc_4_19_app_slash_urls_dot_py, 'health/').
kb_arg_i_for_call(startloc_1_1_endloc_2_20_app_slash_views_dot_py, 1, startloc_4_5_endloc_4_30_app_slash_urls_dot_py).
kb_func_def(startloc_1_1_endloc_2_20_app_slash_views_dot_py, 'health', 'app/views.py', 'app').
kb_param_i_of_callable(startloc_1_12_endloc_1_19_app_slash_views_dot_py, 0, startloc_1_1_endloc_2_20_app_slash_views_dot_py).
kb_param_has_name(startloc_1_12_endloc_1_19_app_slash_views_dot_py, 'request').

% -----------------------------------------------------------------------------
% rails : app/controllers/users_controller.rb
%
%   class UsersController < ApplicationController
%       def index ... end
%   end

kb_class_def(startloc_1_1_endloc_6_4_app_slash_controllers_slash_users_controller_dot_rb, 'UsersController', 'app/controllers/users_controller.rb').
kb_method_of_class(startloc_2_5_endloc_4_8_app_slash_controllers_slash_users_controller_dot_rb, startloc_1_1_endloc_6_4_app_slash_controllers_slash_users_controller_dot_rb).
kb_method_has_name(startloc_2_5_endloc_4_8_app_slash_controllers_slash_users_controller_dot_rb, index).

% -----------------------------------------------------------------------------
% tornado : app/handlers.py
%
%   class UserHandler( tornado.web.RequestHandler ) :
%       def get( self ) : name = self.get_query_argument( "name" )

kb_class_has_3rd_party_super(startloc_3_1_endloc_6_40_app_slash_handlers_dot_py, 'RequestHandler', 'tornado.web.RequestHandler').
kb_call_method_of_class(startloc_5_16_endloc_5_47_app_slash_handlers_dot_py, 'get_query_argument', startloc_3_1_endloc_6_40_app_slash_handlers_dot_py).

% -----------------------------------------------------------------------------
% express : server/routes.js
%
%   router.route( '/files' ).get( ( req, res ) => { ... } )

kb_call_resolved(startloc_3_1_endloc_6_3_server_slash_routes_dot_js, 'express.Router.route.get').
kb_arg_i_for_call(startloc_3_30_endloc_6_2_server_slash_routes_dot_js, 0, startloc_3_1_endloc_6_3_server_slash_routes_dot_js).
kb_param_i_of_callable(startloc_3_32_endloc_3_35_server_slash_routes_dot_js, 0, startloc_3_30_endloc_6_2_server_slash_routes_dot_js).
kb_param_has_name(startloc_3_32_endloc_3_35_server_slash_routes_dot_js, 'req').

% -----------------------------------------------------------------------------
% echo : api/routes.go
%
%   g.GET( "/users", func( c echo.Context ) error { id := c.QueryParam( "id" ) ... } )

kb_call_resolved(startloc_8_2_endloc_11_4_api_slash_routes_dot_go, 'echo.Group.GET').
kb_arg_i_for_call(startloc_8_8_endloc_8_16_api_slash_routes_dot_go, 0, startloc_8_2_endloc_11_4_api_slash_routes_dot_go).
kb_const_string(startloc_8_8_endloc_8_16_api_slash_routes_dot_go, '/users').
kb_arg_i_for_call(startloc_8_18_endloc_11_3_api_slash_routes_dot_go, 1, startloc_8_2_endloc_11_4_api_slash_routes_dot_go).
kb_param_i_of_callable(startloc_8_24_endloc_8_38_api_slash_routes_dot_go, 0, startloc_8_18_endloc_11_3_api_slash_routes_dot_go).
kb_param_has_resolved_type(startloc_8_24_endloc_8_38_api_slash_routes_dot_go, 'echo.Context').
kb_call_resolved(startloc_9_9_endloc_9_28_api_slash_routes_dot_go, 'echo.Context.QueryParam').
kb_dataflow_edge(startloc_8_24_endloc_8_38_api_slash_routes_dot_go, startloc_9_9_endloc_9_28_api_slash_routes_dot_go).

% -----------------------------------------------------------------------------
% endpoints_http_get / _post / _put : next.js and spring dispatches

must(endpoints_http_get(startloc_5_1_endloc_12_2_app_slash_api_slash_users_slash_route_dot_ts, startloc_5_27_endloc_5_44_app_slash_api_slash_users_slash_route_dot_ts, 'app/api/users')).
must(endpoints_http_get(startloc_6_5_endloc_8_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, startloc_5_5_endloc_5_26_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, '/api/items/{id}')).
must(endpoints_http_post(startloc_14_1_endloc_20_2_app_slash_api_slash_users_slash_route_dot_ts, startloc_14_28_endloc_14_45_app_slash_api_slash_users_slash_route_dot_ts, 'app/api/users')).
% @PostMapping with no path : just the class prefix
must(endpoints_http_post(startloc_11_5_endloc_13_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, startloc_10_5_endloc_10_17_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, '/api/items')).
must(endpoints_http_put(startloc_22_1_endloc_28_2_app_slash_api_slash_users_slash_route_dot_ts, startloc_22_27_endloc_22_44_app_slash_api_slash_users_slash_route_dot_ts, 'app/api/users')).
must(endpoints_http_put(startloc_16_5_endloc_18_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, startloc_15_5_endloc_15_26_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, '/api/items/{id}')).

% -----------------------------------------------------------------------------
% endpoints_user_input : one per framework dispatch

% tornado : self.get_query_argument( "name" )
must(endpoints_user_input(startloc_5_16_endloc_5_47_app_slash_handlers_dot_py)).
% next.js : req : NextRequest
must(endpoints_user_input(startloc_5_27_endloc_5_44_app_slash_api_slash_users_slash_route_dot_ts)).
% express : req of a get route
must(endpoints_user_input(startloc_3_32_endloc_3_35_server_slash_routes_dot_js)).
% echo : c.QueryParam( "id" )
must(endpoints_user_input(startloc_9_9_endloc_9_28_api_slash_routes_dot_go)).
% spring : @PathVariable String id
must(endpoints_user_input(startloc_6_14_endloc_6_37_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java)).
% servlet : request.getParameter( "next" )
must(endpoints_user_input(startloc_11_23_endloc_11_53_src_slash_main_slash_java_slash_com_slash_acme_slash_LoginFilter_dot_java)).

% -----------------------------------------------------------------------------
% endpoints_http/4 : one per clause

must(endpoints_http(startloc_5_1_endloc_12_2_app_slash_api_slash_users_slash_route_dot_ts, get, startloc_5_27_endloc_5_44_app_slash_api_slash_users_slash_route_dot_ts, 'app/api/users')).
must(endpoints_http(startloc_14_1_endloc_20_2_app_slash_api_slash_users_slash_route_dot_ts, post, startloc_14_28_endloc_14_45_app_slash_api_slash_users_slash_route_dot_ts, 'app/api/users')).
must(endpoints_http(startloc_22_1_endloc_28_2_app_slash_api_slash_users_slash_route_dot_ts, put, startloc_22_27_endloc_22_44_app_slash_api_slash_users_slash_route_dot_ts, 'app/api/users')).
must(endpoints_http(startloc_21_5_endloc_23_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, delete, startloc_20_5_endloc_20_29_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, '/api/items/{id}')).
must(endpoints_http(startloc_26_5_endloc_28_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, patch, startloc_25_5_endloc_25_28_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, '/api/items/{id}')).
% django function view : verb unknown, request param
must(endpoints_http(startloc_1_1_endloc_2_20_app_slash_views_dot_py, unknown, startloc_1_12_endloc_1_19_app_slash_views_dot_py, 'health/')).
% rails index action
must(endpoints_http(startloc_2_5_endloc_4_8_app_slash_controllers_slash_users_controller_dot_rb, get, startloc_2_5_endloc_4_8_app_slash_controllers_slash_users_controller_dot_rb, '{?}')).
% servlet : verb unknown, url {?}
must(endpoints_http(startloc_10_5_endloc_14_6_src_slash_main_slash_java_slash_com_slash_acme_slash_LoginFilter_dot_java, unknown, startloc_10_19_endloc_10_45_src_slash_main_slash_java_slash_com_slash_acme_slash_LoginFilter_dot_java, '{?}')).

% endpoints_http_known_verb : the spring GET handler also takes a servlet request
must(endpoints_http_known_verb(startloc_6_5_endloc_8_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java)).
must_not(endpoints_http_known_verb(startloc_10_5_endloc_14_6_src_slash_main_slash_java_slash_com_slash_acme_slash_LoginFilter_dot_java)).
% ... so it is not reported again with verb unknown
must_not(endpoints_http(startloc_6_5_endloc_8_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, unknown, _, _)).

% each verb clause only reports its own verb : the next.js GET is not a POST
must_not(endpoints_http(startloc_5_1_endloc_12_2_app_slash_api_slash_users_slash_route_dot_ts, post, _, _)).
% the guard function itself is not an endpoint
must_not(endpoints_http(startloc_1_1_endloc_4_2_lib_slash_auth_dot_ts, _, _, _)).

% -----------------------------------------------------------------------------
% endpoints_http_auth/3

% GET calls requireUser : 1 bad return + the fall-through
must(endpoints_http_auth(startloc_5_1_endloc_12_2_app_slash_api_slash_users_slash_route_dot_ts, 'requireUser', by_all_but_one_bad_return)).
% @PreAuthorize( "hasRole('ADMIN')" )
must(endpoints_http_auth(startloc_6_5_endloc_8_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, 'PreAuthorize', by_annotations([sec('org.springframework.security.access.prepost.PreAuthorize', startloc_5_28_endloc_5_63_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, ['hasRole(\'ADMIN\')'])]))).

% PUT calls loadSession, which also returns a success value : not a guard
must_not(endpoints_http_auth(startloc_22_1_endloc_28_2_app_slash_api_slash_users_slash_route_dot_ts, _, _)).
% @PreAuthorize( "permitAll()" ) guards nothing
must_not(endpoints_http_auth(startloc_11_5_endloc_13_6_src_slash_main_slash_java_slash_com_slash_acme_slash_ItemController_dot_java, _, _)).
% requireUser has no `headers.get( K )` + `return null` gate
must_not(endpoints_http_auth(startloc_5_1_endloc_12_2_app_slash_api_slash_users_slash_route_dot_ts, _, by_header_null_check(_))).
