% fixture : sinks/open_redirects/python/tornado.pl

% class BaseHandler( tornado.web.RequestHandler ) :      ( app/base.py )
kb_class_def(startloc_5_1_endloc_20_1_app_slash_base_dot_py, 'BaseHandler', app_slash_base_dot_py).
kb_class_has_3rd_party_super(startloc_5_1_endloc_20_1_app_slash_base_dot_py, 'RequestHandler', 'tornado.web.RequestHandler').
%     def get( self ) : self.redirect( url )             ( directly in the tornado handler )
kb_call_method_of_class(startloc_10_9_endloc_10_27_app_slash_base_dot_py, 'redirect', startloc_5_1_endloc_20_1_app_slash_base_dot_py).

% class LoginHandler( BaseHandler ) :                     ( app/login.py )
kb_class_def(startloc_8_1_endloc_30_1_app_slash_login_dot_py, 'LoginHandler', app_slash_login_dot_py).
kb_class_has_1st_party_super(startloc_8_1_endloc_30_1_app_slash_login_dot_py, 'BaseHandler', app_slash_base_dot_py).
%     def get( self ) : self.redirect( next_url )        ( in a 1st party subclass )
kb_call_method_of_class(startloc_15_9_endloc_15_32_app_slash_login_dot_py, 'redirect', startloc_8_1_endloc_30_1_app_slash_login_dot_py).
%     self.render( "login.html" ) : not a redirect
kb_call_method_of_class(startloc_16_9_endloc_16_35_app_slash_login_dot_py, 'render', startloc_8_1_endloc_30_1_app_slash_login_dot_py).

% class Helper : no tornado super at all                  ( app/util.py )
%     self.redirect( url )
kb_class_def(startloc_3_1_endloc_12_1_app_slash_util_dot_py, 'Helper', app_slash_util_dot_py).
kb_call_method_of_class(startloc_6_9_endloc_6_27_app_slash_util_dot_py, 'redirect', startloc_3_1_endloc_12_1_app_slash_util_dot_py).

% class Other( BaseHandler ) whose BaseHandler is a same-named class from
% app/other_base.py, which is not the tornado handler   ( app/other.py )
%     self.redirect( url )
kb_class_def(startloc_2_1_endloc_9_1_app_slash_other_dot_py, 'Other', app_slash_other_dot_py).
kb_class_has_1st_party_super(startloc_2_1_endloc_9_1_app_slash_other_dot_py, 'BaseHandler', app_slash_other_base_dot_py).
kb_call_method_of_class(startloc_5_9_endloc_5_27_app_slash_other_dot_py, 'redirect', startloc_2_1_endloc_9_1_app_slash_other_dot_py).

% clause 1 : redirect in the tornado handler itself
must(sinks_open_redirect_python_tornado(startloc_10_9_endloc_10_27_app_slash_base_dot_py)).
% clause 2 : redirect in a 1st party subclass of the tornado handler
must(sinks_open_redirect_python_tornado(startloc_15_9_endloc_15_32_app_slash_login_dot_py)).
% wired into the family api
must(sinks_open_redirect(startloc_15_9_endloc_15_32_app_slash_login_dot_py)).

must_not(sinks_open_redirect_python_tornado(startloc_16_9_endloc_16_35_app_slash_login_dot_py)).
must_not(sinks_open_redirect_python_tornado(startloc_6_9_endloc_6_27_app_slash_util_dot_py)).
must_not(sinks_open_redirect_python_tornado(startloc_5_9_endloc_5_27_app_slash_other_dot_py)).
must_not(sinks_open_redirect(startloc_6_9_endloc_6_27_app_slash_util_dot_py)).
