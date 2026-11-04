% fixture : endpoints/python/tornado.pl

% app/handlers.py
%   class UserHandler( tornado.web.RequestHandler ) :
%       def get( self ) :
%           name = self.get_query_argument( "name" )
%           page = self.get_argument( "page" )
kb_class_def(startloc_3_1_endloc_7_40_app_slash_handlers_dot_py, 'UserHandler', 'app/handlers.py').
kb_class_has_3rd_party_super(startloc_3_1_endloc_7_40_app_slash_handlers_dot_py, 'RequestHandler', 'tornado.web.RequestHandler').
kb_call_method_of_class(startloc_5_16_endloc_5_47_app_slash_handlers_dot_py, 'get_query_argument', startloc_3_1_endloc_7_40_app_slash_handlers_dot_py).
kb_call_method_of_class(startloc_6_16_endloc_6_41_app_slash_handlers_dot_py, 'get_argument', startloc_3_1_endloc_7_40_app_slash_handlers_dot_py).

% app/base.py
%   class BaseHandler( tornado.web.RequestHandler ) : ...
kb_class_def(startloc_3_1_endloc_5_20_app_slash_base_dot_py, 'BaseHandler', 'app/base.py').
kb_class_has_3rd_party_super(startloc_3_1_endloc_5_20_app_slash_base_dot_py, 'RequestHandler', 'tornado.web.RequestHandler').

% app/items.py
%   class ItemHandler( BaseHandler ) :                     <-- 1 hop
%       def get( self ) : q = self.get_query_argument( "q" )
kb_class_def(startloc_3_1_endloc_5_50_app_slash_items_dot_py, 'ItemHandler', 'app/items.py').
kb_class_has_1st_party_super(startloc_3_1_endloc_5_50_app_slash_items_dot_py, 'BaseHandler', 'app/base.py').
kb_call_method_of_class(startloc_5_13_endloc_5_41_app_slash_items_dot_py, 'get_query_argument', startloc_3_1_endloc_5_50_app_slash_items_dot_py).

% app/deep.py
%   class DeepHandler( ItemHandler ) :                     <-- 2 hops : out of scope
%       def get( self ) : q = self.get_query_argument( "q" )
kb_class_def(startloc_3_1_endloc_5_50_app_slash_deep_dot_py, 'DeepHandler', 'app/deep.py').
kb_class_has_1st_party_super(startloc_3_1_endloc_5_50_app_slash_deep_dot_py, 'ItemHandler', 'app/items.py').
kb_call_method_of_class(startloc_5_13_endloc_5_41_app_slash_deep_dot_py, 'get_query_argument', startloc_3_1_endloc_5_50_app_slash_deep_dot_py).

% app/other.py
%   class BaseHandler : ...                                <-- same name, not a RequestHandler
%   class FormHandler( BaseHandler ) :
%       def get( self ) : q = self.get_query_argument( "q" )
kb_class_def(startloc_1_1_endloc_2_9_app_slash_other_dot_py, 'BaseHandler', 'app/other.py').
kb_class_def(startloc_4_1_endloc_6_50_app_slash_other_dot_py, 'FormHandler', 'app/other.py').
kb_class_has_1st_party_super(startloc_4_1_endloc_6_50_app_slash_other_dot_py, 'BaseHandler', 'app/other.py').
kb_call_method_of_class(startloc_6_13_endloc_6_41_app_slash_other_dot_py, 'get_query_argument', startloc_4_1_endloc_6_50_app_slash_other_dot_py).

% app/views.py
%   class ApiView( django.views.View ) :
%       def get( self ) : q = self.get_query_argument( "q" )
kb_class_def(startloc_3_1_endloc_5_50_app_slash_views_dot_py, 'ApiView', 'app/views.py').
kb_class_has_3rd_party_super(startloc_3_1_endloc_5_50_app_slash_views_dot_py, 'View', 'django.views.View').
kb_call_method_of_class(startloc_5_13_endloc_5_41_app_slash_views_dot_py, 'get_query_argument', startloc_3_1_endloc_5_50_app_slash_views_dot_py).

% clause 1 : direct RequestHandler subclass
must(endpoints_user_input_tornado(startloc_5_16_endloc_5_47_app_slash_handlers_dot_py)).
% clause 2 : 1-hop 1st-party intermediate ( BaseHandler in app/base.py )
must(endpoints_user_input_tornado(startloc_5_13_endloc_5_41_app_slash_items_dot_py)).

% get_argument is not get_query_argument
must_not(endpoints_user_input_tornado(startloc_6_16_endloc_6_41_app_slash_handlers_dot_py)).
% 2 hops from RequestHandler
must_not(endpoints_user_input_tornado(startloc_5_13_endloc_5_41_app_slash_deep_dot_py)).
% super named BaseHandler, but the one in app/other.py
must_not(endpoints_user_input_tornado(startloc_6_13_endloc_6_41_app_slash_other_dot_py)).
% not a tornado class
must_not(endpoints_user_input_tornado(startloc_5_13_endloc_5_41_app_slash_views_dot_py)).

% wired into the family api
must(endpoints_user_input(startloc_5_16_endloc_5_47_app_slash_handlers_dot_py)).
must(endpoints_user_input(startloc_5_13_endloc_5_41_app_slash_items_dot_py)).
must_not(endpoints_user_input(startloc_5_13_endloc_5_41_app_slash_views_dot_py)).
