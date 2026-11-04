% fixture : sanitizers/api.pl

% -----------------------------------------------------------------------------
% org/dspace/app/rest/OidcRestController.java
%
% public void oidc( HttpServletResponse response, HttpServletRequest request ) {
%     String redirectUrl = request.getParameter( "redirectUrl" );
%     String referer = request.getHeader( "Referer" );
%     if ( isValidRedirect( redirectUrl ) ) {
%         response.sendRedirect( redirectUrl );
%     } else {
%         response.sendError( HttpServletResponse.SC_BAD_REQUEST, "Invalid redirectURL! ..." );
%     }
% }

kb_call_resolved(startloc_75_30_endloc_75_66_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, 'jakarta.servlet.http.HttpServletRequest.getParameter').
kb_dataflow_edge(startloc_75_30_endloc_75_66_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, startloc_75_16_endloc_75_27_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java).
kb_call_resolved(startloc_76_26_endloc_76_55_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, 'jakarta.servlet.http.HttpServletRequest.getHeader').
kb_dataflow_edge(startloc_76_26_endloc_76_55_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, startloc_76_16_endloc_76_23_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java).

% the condition is the call itself
kb_call_resolved(startloc_80_14_endloc_80_43_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, 'Unknown.isValidRedirect').
kb_arg_i_for_call(startloc_80_30_endloc_80_41_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, 0, startloc_80_14_endloc_80_43_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java).
kb_dataflow_edge(startloc_75_16_endloc_75_27_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, startloc_80_30_endloc_80_41_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java).

kb_top_level_if_then_else_gadget(startloc_70_5_endloc_100_6_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
    startloc_80_14_endloc_80_43_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
    then_part_startloc_80_46_endloc_83_10_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
    else_part_startloc_83_16_endloc_86_10_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java).
% response.sendRedirect( redirectUrl )   then part
kb_call_resolved(startloc_81_13_endloc_81_49_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, 'jakarta.servlet.http.HttpServletResponse.sendRedirect').
kb_call_guarded_by_cond_in_then_part(startloc_81_13_endloc_81_49_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
    startloc_80_14_endloc_80_43_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
    then_part_startloc_80_46_endloc_83_10_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java).
% response.sendError( ... )              else part
kb_call_resolved(startloc_84_13_endloc_85_80_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, 'jakarta.servlet.http.HttpServletResponse.sendError').
kb_call_guarded_by_cond_in_else_part(startloc_84_13_endloc_85_80_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
    startloc_80_14_endloc_80_43_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
    else_part_startloc_83_16_endloc_86_10_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java).

% -----------------------------------------------------------------------------
% public void login( String target ) {
%     boolean ok = isValidRedirect( target );          the condition is one dataflow edge from the call
%     if ( ok ) { ... } else { throw new ResponseStatusException( HttpStatus.BAD_REQUEST ); }
%     if ( debug ) { log.info( target ); }             an if without an else : no gadget
% }

kb_call_resolved(startloc_112_22_endloc_112_46_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, 'Unknown.isValidRedirect').
kb_arg_i_for_call(startloc_112_38_endloc_112_44_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, 0, startloc_112_22_endloc_112_46_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java).
kb_dataflow_edge(startloc_110_30_endloc_110_36_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, startloc_112_38_endloc_112_44_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java).
kb_dataflow_edge(startloc_112_22_endloc_112_46_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, startloc_113_14_endloc_113_16_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java).

kb_top_level_if_then_else_gadget(startloc_110_5_endloc_130_6_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
    startloc_113_14_endloc_113_16_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
    then_part_startloc_113_19_endloc_115_10_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
    else_part_startloc_115_16_endloc_117_10_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java).
kb_call_resolved(startloc_116_19_endloc_116_75_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, 'org.springframework.web.server.ResponseStatusException').
kb_call_guarded_by_cond_in_else_part(startloc_116_19_endloc_116_75_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
    startloc_113_14_endloc_113_16_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
    else_part_startloc_115_16_endloc_117_10_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java).

% if ( debug ) : debug is a field read, no call behind it
kb_dataflow_edge(startloc_100_20_endloc_100_25_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, startloc_118_14_endloc_118_19_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java).
kb_call_resolved(startloc_118_24_endloc_118_42_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, 'org.slf4j.Logger.info').
kb_call_guarded_by_cond_in_then_part(startloc_118_24_endloc_118_42_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
    startloc_118_14_endloc_118_19_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
    then_part_startloc_118_22_endloc_118_45_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java).

% -----------------------------------------------------------------------------
% expectations

% error calls from both per-framework catalogs
must(sanitizers_error_call(startloc_84_13_endloc_85_80_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java)).
must(sanitizers_error_call(startloc_116_19_endloc_116_75_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java)).
must_not(sanitizers_error_call(startloc_81_13_endloc_81_49_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java)).

% then part / else part of a top level if-then-else ( pins Cond, ThenPart, ElsePart )
must(sanitizers_top_level_if_then_else(startloc_81_13_endloc_81_49_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
     startloc_80_14_endloc_80_43_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
     then_part_startloc_80_46_endloc_83_10_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
     else_part_startloc_83_16_endloc_86_10_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java)).
must(sanitizers_top_level_if_then_else(startloc_84_13_endloc_85_80_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
     startloc_80_14_endloc_80_43_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
     then_part_startloc_80_46_endloc_83_10_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
     else_part_startloc_83_16_endloc_86_10_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java)).
% the error call and the redirect hang off the same top level condition
must(( sanitizers_top_level_if_then_else(Redirect, Cond, _, _),
       kb_call_resolved(Redirect, 'jakarta.servlet.http.HttpServletResponse.sendRedirect'),
       sanitizers_top_level_if_then_else(Error, Cond, _, _),
       sanitizers_error_call(Error) )).
% if without an else
must_not(sanitizers_top_level_if_then_else(startloc_118_24_endloc_118_42_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, _, _, _)).

% condition is the call : redirectUrl -> arg 0 of isValidRedirect ( pins the path )
must(sanitizers_condition_checks_input(startloc_80_14_endloc_80_43_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
     startloc_75_30_endloc_75_66_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
     startloc_80_14_endloc_80_43_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
     'Unknown.isValidRedirect', 0,
     [ startloc_75_30_endloc_75_66_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
       startloc_75_16_endloc_75_27_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
       startloc_80_30_endloc_80_41_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java ])).
% condition is one edge from the call : ok = isValidRedirect( target ) ; if ( ok )
must(sanitizers_condition_checks_input(startloc_113_14_endloc_113_16_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
     startloc_110_30_endloc_110_36_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
     startloc_112_22_endloc_112_46_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
     'Unknown.isValidRedirect', 0,
     [ startloc_110_30_endloc_110_36_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
       startloc_112_38_endloc_112_44_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java ])).
% the input is the arg itself
must(sanitizers_condition_checks_input(startloc_80_14_endloc_80_43_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
     startloc_80_30_endloc_80_41_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, _, _, 0,
     [ startloc_80_30_endloc_80_41_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java ])).
% the Referer header never reaches the condition
must_not(sanitizers_condition_checks_input(startloc_80_14_endloc_80_43_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java,
     startloc_76_26_endloc_76_55_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, _, _, _, _)).
% if ( debug ) : no call behind the condition
must_not(sanitizers_condition_call(startloc_118_14_endloc_118_19_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, _)).
must_not(sanitizers_condition_checks_input(startloc_118_14_endloc_118_19_org_slash_dspace_slash_app_slash_rest_slash_OidcRestController_dot_java, _, _, _, _, _)).
