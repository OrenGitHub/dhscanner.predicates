% fixture : endpoints/python/django.pl

% ---------------------------------------------------------------------------
% weblate/trans/views/about.py
%
% class StatsView( TemplateView ):
%     def get( self, request ): ...
%     def get_context_data( self, **kwargs ): ...
kb_class_def(startloc_10_1_endloc_30_20_weblate_slash_trans_slash_views_slash_about_dot_py, 'StatsView', 'weblate/trans/views/about.py').
kb_method_of_class(startloc_12_5_endloc_14_20_weblate_slash_trans_slash_views_slash_about_dot_py, startloc_10_1_endloc_30_20_weblate_slash_trans_slash_views_slash_about_dot_py).
kb_method_has_name(startloc_12_5_endloc_14_20_weblate_slash_trans_slash_views_slash_about_dot_py, get).
kb_param_i_of_callable(startloc_12_13_endloc_12_17_weblate_slash_trans_slash_views_slash_about_dot_py, 0, startloc_12_5_endloc_14_20_weblate_slash_trans_slash_views_slash_about_dot_py).
kb_param_has_name(startloc_12_13_endloc_12_17_weblate_slash_trans_slash_views_slash_about_dot_py, self).
kb_param_i_of_callable(startloc_12_19_endloc_12_26_weblate_slash_trans_slash_views_slash_about_dot_py, 1, startloc_12_5_endloc_14_20_weblate_slash_trans_slash_views_slash_about_dot_py).
kb_param_has_name(startloc_12_19_endloc_12_26_weblate_slash_trans_slash_views_slash_about_dot_py, request).
kb_method_of_class(startloc_16_5_endloc_18_20_weblate_slash_trans_slash_views_slash_about_dot_py, startloc_10_1_endloc_30_20_weblate_slash_trans_slash_views_slash_about_dot_py).
kb_method_has_name(startloc_16_5_endloc_18_20_weblate_slash_trans_slash_views_slash_about_dot_py, get_context_data).

% ---------------------------------------------------------------------------
% weblate/api/base.py
%
% class BaseView:
%     def get( self, req ): ...    : request param not named request
%     def post( self, request ): ...
kb_class_def(startloc_5_1_endloc_20_20_weblate_slash_api_slash_base_dot_py, 'BaseView', 'weblate/api/base.py').
kb_method_of_class(startloc_6_5_endloc_8_20_weblate_slash_api_slash_base_dot_py, startloc_5_1_endloc_20_20_weblate_slash_api_slash_base_dot_py).
kb_method_has_name(startloc_6_5_endloc_8_20_weblate_slash_api_slash_base_dot_py, get).
kb_param_i_of_callable(startloc_6_19_endloc_6_22_weblate_slash_api_slash_base_dot_py, 1, startloc_6_5_endloc_8_20_weblate_slash_api_slash_base_dot_py).
kb_param_has_name(startloc_6_19_endloc_6_22_weblate_slash_api_slash_base_dot_py, req).
kb_method_of_class(startloc_10_5_endloc_12_20_weblate_slash_api_slash_base_dot_py, startloc_5_1_endloc_20_20_weblate_slash_api_slash_base_dot_py).
kb_method_has_name(startloc_10_5_endloc_12_20_weblate_slash_api_slash_base_dot_py, post).

% ---------------------------------------------------------------------------
% weblate/api/views.py
%
% class Metrics( BaseView ):
%     def post( self, request ): ...   : overrides BaseView.post
kb_class_def(startloc_20_1_endloc_40_20_weblate_slash_api_slash_views_dot_py, 'Metrics', 'weblate/api/views.py').
kb_class_has_1st_party_super(startloc_20_1_endloc_40_20_weblate_slash_api_slash_views_dot_py, 'BaseView', 'weblate/api/base.py').
kb_method_of_class(startloc_22_5_endloc_24_20_weblate_slash_api_slash_views_dot_py, startloc_20_1_endloc_40_20_weblate_slash_api_slash_views_dot_py).
kb_method_has_name(startloc_22_5_endloc_24_20_weblate_slash_api_slash_views_dot_py, post).
kb_param_i_of_callable(startloc_22_20_endloc_22_27_weblate_slash_api_slash_views_dot_py, 1, startloc_22_5_endloc_24_20_weblate_slash_api_slash_views_dot_py).
kb_param_has_name(startloc_22_20_endloc_22_27_weblate_slash_api_slash_views_dot_py, request).

% ---------------------------------------------------------------------------
% weblate/trans/views/__init__.py
%
% class AboutView( View ):
%     def delete( self, request ): ...
kb_class_def(startloc_3_1_endloc_9_20_weblate_slash_trans_slash_views_slash___init___dot_py, 'AboutView', 'weblate/trans/views/__init__.py').
kb_method_of_class(startloc_4_5_endloc_6_20_weblate_slash_trans_slash_views_slash___init___dot_py, startloc_3_1_endloc_9_20_weblate_slash_trans_slash_views_slash___init___dot_py).
kb_method_has_name(startloc_4_5_endloc_6_20_weblate_slash_trans_slash_views_slash___init___dot_py, delete).

% ---------------------------------------------------------------------------
% weblate/accounts/views.py
%
% def hosting( request ): ...
kb_func_def(startloc_50_1_endloc_60_20_weblate_slash_accounts_slash_views_dot_py, hosting, 'weblate/accounts/views.py', 'weblate/accounts').
kb_param_i_of_callable(startloc_50_13_endloc_50_20_weblate_slash_accounts_slash_views_dot_py, 0, startloc_50_1_endloc_60_20_weblate_slash_accounts_slash_views_dot_py).
kb_param_has_name(startloc_50_13_endloc_50_20_weblate_slash_accounts_slash_views_dot_py, request).
% def unrouted( request ): ...   : never passed to path()
kb_func_def(startloc_70_1_endloc_72_20_weblate_slash_accounts_slash_views_dot_py, unrouted, 'weblate/accounts/views.py', 'weblate/accounts').

% ---------------------------------------------------------------------------
% weblate/wladmin/views.py
%
% def alerts( req ): ...
kb_func_def(startloc_8_1_endloc_12_20_weblate_slash_wladmin_slash_views_dot_py, alerts, 'weblate/wladmin/views.py', 'weblate/wladmin').
kb_param_i_of_callable(startloc_8_12_endloc_8_15_weblate_slash_wladmin_slash_views_dot_py, 0, startloc_8_1_endloc_12_20_weblate_slash_wladmin_slash_views_dot_py).
kb_param_has_name(startloc_8_12_endloc_8_15_weblate_slash_wladmin_slash_views_dot_py, req).

% ---------------------------------------------------------------------------
% weblate/urls.py
%
% import weblate.api.views, weblate.trans.views, weblate.wladmin.views
% from weblate.trans.views.about import StatsView as <alias>
% class <alias>_Subclass( <alias> ): ...      ( python front rewrite )
kb_class_def(startloc_3_1_endloc_3_40_weblate_slash_urls_dot_py, 'StatsView_Subclass', 'weblate/urls.py').
kb_class_has_1st_party_super(startloc_3_1_endloc_3_40_weblate_slash_urls_dot_py, 'StatsView', 'weblate/trans/views/about.py').

% def home( request ): ...
kb_func_def(startloc_5_1_endloc_7_20_weblate_slash_urls_dot_py, home, 'weblate/urls.py', weblate).
kb_param_i_of_callable(startloc_5_10_endloc_5_17_weblate_slash_urls_dot_py, 0, startloc_5_1_endloc_7_20_weblate_slash_urls_dot_py).
kb_param_has_name(startloc_5_10_endloc_5_17_weblate_slash_urls_dot_py, request).
% def legacy( request ): ...
kb_func_def(startloc_8_1_endloc_9_20_weblate_slash_urls_dot_py, legacy, 'weblate/urls.py', weblate).
% def api_root( request ): ...
kb_func_def(startloc_9_1_endloc_9_30_weblate_slash_urls_dot_py, api_root, 'weblate/urls.py', weblate).

% path( "stats/", <alias>_Subclass.as_view() )
kb_call_resolved(startloc_20_5_endloc_20_60_weblate_slash_urls_dot_py, 'django.urls.path').
kb_arg_i_for_call(startloc_20_10_endloc_20_18_weblate_slash_urls_dot_py, 0, startloc_20_5_endloc_20_60_weblate_slash_urls_dot_py).
kb_const_string(startloc_20_10_endloc_20_18_weblate_slash_urls_dot_py, 'stats/').
kb_arg_i_for_call(startloc_20_20_endloc_20_59_weblate_slash_urls_dot_py, 1, startloc_20_5_endloc_20_60_weblate_slash_urls_dot_py).
kb_call_method_of_class(startloc_20_20_endloc_20_59_weblate_slash_urls_dot_py, as_view, startloc_3_1_endloc_3_40_weblate_slash_urls_dot_py).

% path( "metrics/", weblate.api.views.Metrics.as_view() )
kb_call_resolved(startloc_21_5_endloc_21_60_weblate_slash_urls_dot_py, 'django.urls.path').
kb_arg_i_for_call(startloc_21_10_endloc_21_20_weblate_slash_urls_dot_py, 0, startloc_21_5_endloc_21_60_weblate_slash_urls_dot_py).
kb_const_string(startloc_21_10_endloc_21_20_weblate_slash_urls_dot_py, 'metrics/').
kb_arg_i_for_call(startloc_21_22_endloc_21_59_weblate_slash_urls_dot_py, 1, startloc_21_5_endloc_21_60_weblate_slash_urls_dot_py).
kb_call_resolved(startloc_21_22_endloc_21_59_weblate_slash_urls_dot_py, 'weblate.api.views.Metrics.as_view').

% re_path( "^about/$", weblate.trans.views.AboutView.as_view() )   : a package __init__.py
kb_call_resolved(startloc_22_5_endloc_22_70_weblate_slash_urls_dot_py, 'django.urls.re_path').
kb_arg_i_for_call(startloc_22_13_endloc_22_23_weblate_slash_urls_dot_py, 0, startloc_22_5_endloc_22_70_weblate_slash_urls_dot_py).
kb_const_string(startloc_22_13_endloc_22_23_weblate_slash_urls_dot_py, '^about/$').
kb_arg_i_for_call(startloc_22_25_endloc_22_69_weblate_slash_urls_dot_py, 1, startloc_22_5_endloc_22_70_weblate_slash_urls_dot_py).
kb_call_resolved(startloc_22_25_endloc_22_69_weblate_slash_urls_dot_py, 'weblate.trans.views.AboutView.as_view').

% path( "hosting/", weblate.accounts.views.hosting )  -->  <alias>()   ( python front rewrite )
kb_call_resolved(startloc_23_5_endloc_23_50_weblate_slash_urls_dot_py, 'django.urls.path').
kb_arg_i_for_call(startloc_23_10_endloc_23_20_weblate_slash_urls_dot_py, 0, startloc_23_5_endloc_23_50_weblate_slash_urls_dot_py).
kb_const_string(startloc_23_10_endloc_23_20_weblate_slash_urls_dot_py, 'hosting/').
kb_arg_i_for_call(startloc_23_22_endloc_23_49_weblate_slash_urls_dot_py, 1, startloc_23_5_endloc_23_50_weblate_slash_urls_dot_py).
kb_call_1st_party_func_defined_in_file(startloc_23_22_endloc_23_49_weblate_slash_urls_dot_py, hosting, 'weblate/accounts/views.py').

% path( "alerts/", weblate.wladmin.views.alerts )   : a dotted field read
kb_call_resolved(startloc_24_5_endloc_24_50_weblate_slash_urls_dot_py, 'django.urls.path').
kb_arg_i_for_call(startloc_24_10_endloc_24_19_weblate_slash_urls_dot_py, 0, startloc_24_5_endloc_24_50_weblate_slash_urls_dot_py).
kb_const_string(startloc_24_10_endloc_24_19_weblate_slash_urls_dot_py, 'alerts/').
kb_arg_i_for_call(startloc_24_21_endloc_24_49_weblate_slash_urls_dot_py, 1, startloc_24_5_endloc_24_50_weblate_slash_urls_dot_py).
kb_field_read_resolved(startloc_24_21_endloc_24_49_weblate_slash_urls_dot_py, 'weblate.wladmin.views.alerts').

% path( "", home )   : a function of the same file, the arg location is its def
kb_call_resolved(startloc_25_5_endloc_25_20_weblate_slash_urls_dot_py, 'django.urls.path').
kb_arg_i_for_call(startloc_25_10_endloc_25_12_weblate_slash_urls_dot_py, 0, startloc_25_5_endloc_25_20_weblate_slash_urls_dot_py).
kb_const_string(startloc_25_10_endloc_25_12_weblate_slash_urls_dot_py, '').
kb_arg_i_for_call(startloc_5_1_endloc_7_20_weblate_slash_urls_dot_py, 1, startloc_25_5_endloc_25_20_weblate_slash_urls_dot_py).

% path( LEGACY_URL, legacy )   : url not a const string
kb_call_resolved(startloc_26_5_endloc_26_30_weblate_slash_urls_dot_py, 'django.urls.path').
kb_arg_i_for_call(startloc_26_10_endloc_26_20_weblate_slash_urls_dot_py, 0, startloc_26_5_endloc_26_30_weblate_slash_urls_dot_py).
kb_arg_i_for_call(startloc_8_1_endloc_9_20_weblate_slash_urls_dot_py, 1, startloc_26_5_endloc_26_30_weblate_slash_urls_dot_py).

% include( "api/", api_root )   : not a route
kb_call_resolved(startloc_27_5_endloc_27_30_weblate_slash_urls_dot_py, 'django.urls.include').
kb_arg_i_for_call(startloc_27_13_endloc_27_19_weblate_slash_urls_dot_py, 0, startloc_27_5_endloc_27_30_weblate_slash_urls_dot_py).
kb_const_string(startloc_27_13_endloc_27_19_weblate_slash_urls_dot_py, 'api/').
kb_arg_i_for_call(startloc_9_1_endloc_9_30_weblate_slash_urls_dot_py, 1, startloc_27_5_endloc_27_30_weblate_slash_urls_dot_py).

% path( "login/", django.contrib.auth.views.LoginView.as_view() )   : 3rd party view
kb_call_resolved(startloc_28_5_endloc_28_70_weblate_slash_urls_dot_py, 'django.urls.path').
kb_arg_i_for_call(startloc_28_10_endloc_28_18_weblate_slash_urls_dot_py, 0, startloc_28_5_endloc_28_70_weblate_slash_urls_dot_py).
kb_const_string(startloc_28_10_endloc_28_18_weblate_slash_urls_dot_py, 'login/').
kb_arg_i_for_call(startloc_28_20_endloc_28_69_weblate_slash_urls_dot_py, 1, startloc_28_5_endloc_28_70_weblate_slash_urls_dot_py).
kb_call_resolved(startloc_28_20_endloc_28_69_weblate_slash_urls_dot_py, 'django.contrib.auth.views.LoginView.as_view').

% ---------------------------------------------------------------------------
% routes : path and re_path, const string url
must(endpoints_route_django('stats/', startloc_20_20_endloc_20_59_weblate_slash_urls_dot_py)).
must(endpoints_route_django('^about/$', startloc_22_25_endloc_22_69_weblate_slash_urls_dot_py)).
% class view, rewritten <alias>_Subclass.as_view() : get climbs to the 1st party super StatsView
must(endpoints_http_django(startloc_12_5_endloc_14_20_weblate_slash_trans_slash_views_slash_about_dot_py, get, startloc_12_19_endloc_12_26_weblate_slash_trans_slash_views_slash_about_dot_py, 'stats/')).
% class view by fqn : post is Metrics' own ( request param ), get is inherited from BaseView ( no request param -> handler )
must(endpoints_http_django(startloc_22_5_endloc_24_20_weblate_slash_api_slash_views_dot_py, post, startloc_22_20_endloc_22_27_weblate_slash_api_slash_views_dot_py, 'metrics/')).
must(endpoints_http_django(startloc_6_5_endloc_8_20_weblate_slash_api_slash_base_dot_py, get, startloc_6_5_endloc_8_20_weblate_slash_api_slash_base_dot_py, 'metrics/')).
% class view by fqn in a package __init__.py, re_path
must(endpoints_http_django(startloc_4_5_endloc_6_20_weblate_slash_trans_slash_views_slash___init___dot_py, delete, startloc_4_5_endloc_6_20_weblate_slash_trans_slash_views_slash___init___dot_py, '^about/$')).
% function view, 1st party call rewrite : verb unknown, request is param 0
must(endpoints_http_django(startloc_50_1_endloc_60_20_weblate_slash_accounts_slash_views_dot_py, unknown, startloc_50_13_endloc_50_20_weblate_slash_accounts_slash_views_dot_py, 'hosting/')).
% function view, dotted field read : param 0 not named request -> handler
must(endpoints_http_django(startloc_8_1_endloc_12_20_weblate_slash_wladmin_slash_views_dot_py, unknown, startloc_8_1_endloc_12_20_weblate_slash_wladmin_slash_views_dot_py, 'alerts/')).
% function view of the same file
must(endpoints_http_django(startloc_5_1_endloc_7_20_weblate_slash_urls_dot_py, unknown, startloc_5_10_endloc_5_17_weblate_slash_urls_dot_py, '')).
% name resolution helpers
must(python_class_by_fqn('weblate.api.views.Metrics', startloc_20_1_endloc_40_20_weblate_slash_api_slash_views_dot_py)).
must(python_class_by_fqn('weblate.trans.views.AboutView', startloc_3_1_endloc_9_20_weblate_slash_trans_slash_views_slash___init___dot_py)).
must(python_func_by_fqn('weblate.wladmin.views.alerts', startloc_8_1_endloc_12_20_weblate_slash_wladmin_slash_views_dot_py)).
must(python_method_resolved(startloc_20_1_endloc_40_20_weblate_slash_api_slash_views_dot_py, post, startloc_22_5_endloc_24_20_weblate_slash_api_slash_views_dot_py)).
must(python_class_or_1st_party_super(startloc_20_1_endloc_40_20_weblate_slash_api_slash_views_dot_py, startloc_5_1_endloc_20_20_weblate_slash_api_slash_base_dot_py)).
% wired into the family api
must(endpoints_http(startloc_12_5_endloc_14_20_weblate_slash_trans_slash_views_slash_about_dot_py, get, startloc_12_19_endloc_12_26_weblate_slash_trans_slash_views_slash_about_dot_py, 'stats/')).
must(endpoints_http(startloc_50_1_endloc_60_20_weblate_slash_accounts_slash_views_dot_py, unknown, startloc_50_13_endloc_50_20_weblate_slash_accounts_slash_views_dot_py, 'hosting/')).

% not a verb method
must_not(endpoints_http_django(startloc_16_5_endloc_18_20_weblate_slash_trans_slash_views_slash_about_dot_py, _, _, _)).
% a class view gives no unknown-verb handler
must_not(endpoints_http_django(_, unknown, _, 'stats/')).
% a function never routed
must_not(endpoints_http_django(startloc_70_1_endloc_72_20_weblate_slash_accounts_slash_views_dot_py, _, _, _)).
% url is not a const string
must_not(endpoints_http_django(startloc_8_1_endloc_9_20_weblate_slash_urls_dot_py, _, _, _)).
% include() is not a route
must_not(endpoints_http_django(startloc_9_1_endloc_9_30_weblate_slash_urls_dot_py, _, _, _)).
must_not(endpoints_route_django('api/', _)).
% a 3rd party class view has no 1st party class to resolve
must_not(endpoints_http_django(_, _, _, 'login/')).
must_not(python_class_by_fqn('django.contrib.auth.views.LoginView', _)).
% a bare name has no module
must_not(python_func_by_fqn(alerts, _)).
% api : the unrouted function is no endpoint
must_not(endpoints_http(startloc_70_1_endloc_72_20_weblate_slash_accounts_slash_views_dot_py, _, _, _)).
