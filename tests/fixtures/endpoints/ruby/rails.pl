% fixture : endpoints/ruby/rails.pl

% ---------------------------------------------------------------------------
% app/controllers/posts_controller.rb
%
% class PostsController < ApplicationController
kb_class_def(startloc_1_1_endloc_80_4_app_slash_controllers_slash_posts_controller_dot_rb, 'PostsController', 'app/controllers/posts_controller.rb').
%   def index ; def show ; def new ; def edit ; def create ; def update ; def destroy
kb_method_of_class(startloc_2_3_endloc_4_6_app_slash_controllers_slash_posts_controller_dot_rb, startloc_1_1_endloc_80_4_app_slash_controllers_slash_posts_controller_dot_rb).
kb_method_has_name(startloc_2_3_endloc_4_6_app_slash_controllers_slash_posts_controller_dot_rb, index).
kb_method_of_class(startloc_5_3_endloc_7_6_app_slash_controllers_slash_posts_controller_dot_rb, startloc_1_1_endloc_80_4_app_slash_controllers_slash_posts_controller_dot_rb).
kb_method_has_name(startloc_5_3_endloc_7_6_app_slash_controllers_slash_posts_controller_dot_rb, show).
kb_method_of_class(startloc_8_3_endloc_10_6_app_slash_controllers_slash_posts_controller_dot_rb, startloc_1_1_endloc_80_4_app_slash_controllers_slash_posts_controller_dot_rb).
kb_method_has_name(startloc_8_3_endloc_10_6_app_slash_controllers_slash_posts_controller_dot_rb, new).
kb_method_of_class(startloc_11_3_endloc_13_6_app_slash_controllers_slash_posts_controller_dot_rb, startloc_1_1_endloc_80_4_app_slash_controllers_slash_posts_controller_dot_rb).
kb_method_has_name(startloc_11_3_endloc_13_6_app_slash_controllers_slash_posts_controller_dot_rb, edit).
kb_method_of_class(startloc_14_3_endloc_16_6_app_slash_controllers_slash_posts_controller_dot_rb, startloc_1_1_endloc_80_4_app_slash_controllers_slash_posts_controller_dot_rb).
kb_method_has_name(startloc_14_3_endloc_16_6_app_slash_controllers_slash_posts_controller_dot_rb, create).
kb_method_of_class(startloc_17_3_endloc_19_6_app_slash_controllers_slash_posts_controller_dot_rb, startloc_1_1_endloc_80_4_app_slash_controllers_slash_posts_controller_dot_rb).
kb_method_has_name(startloc_17_3_endloc_19_6_app_slash_controllers_slash_posts_controller_dot_rb, update).
kb_method_of_class(startloc_20_3_endloc_22_6_app_slash_controllers_slash_posts_controller_dot_rb, startloc_1_1_endloc_80_4_app_slash_controllers_slash_posts_controller_dot_rb).
kb_method_has_name(startloc_20_3_endloc_22_6_app_slash_controllers_slash_posts_controller_dot_rb, destroy).
%   def publish : not resourceful
kb_method_of_class(startloc_23_3_endloc_25_6_app_slash_controllers_slash_posts_controller_dot_rb, startloc_1_1_endloc_80_4_app_slash_controllers_slash_posts_controller_dot_rb).
kb_method_has_name(startloc_23_3_endloc_25_6_app_slash_controllers_slash_posts_controller_dot_rb, publish).
%   def initialize : a ruby hook
kb_method_of_class(startloc_26_3_endloc_28_6_app_slash_controllers_slash_posts_controller_dot_rb, startloc_1_1_endloc_80_4_app_slash_controllers_slash_posts_controller_dot_rb).
kb_method_has_name(startloc_26_3_endloc_28_6_app_slash_controllers_slash_posts_controller_dot_rb, initialize).
%   def _render_post : leading underscore
kb_method_of_class(startloc_29_3_endloc_31_6_app_slash_controllers_slash_posts_controller_dot_rb, startloc_1_1_endloc_80_4_app_slash_controllers_slash_posts_controller_dot_rb).
kb_method_has_name(startloc_29_3_endloc_31_6_app_slash_controllers_slash_posts_controller_dot_rb, '_render_post').
%   protected
%   def ensure_owner
kb_method_of_class(startloc_34_3_endloc_36_6_app_slash_controllers_slash_posts_controller_dot_rb, startloc_1_1_endloc_80_4_app_slash_controllers_slash_posts_controller_dot_rb).
kb_method_has_name(startloc_34_3_endloc_36_6_app_slash_controllers_slash_posts_controller_dot_rb, ensure_owner).
kb_callable_has_annotation(startloc_34_3_endloc_36_6_app_slash_controllers_slash_posts_controller_dot_rb, startloc_33_3_endloc_33_12_app_slash_controllers_slash_posts_controller_dot_rb).
kb_call_resolved(startloc_33_3_endloc_33_12_app_slash_controllers_slash_posts_controller_dot_rb, '<dhscanner-instrumentation>[protected]').
%   public
%   def preview : public again
kb_method_of_class(startloc_39_3_endloc_41_6_app_slash_controllers_slash_posts_controller_dot_rb, startloc_1_1_endloc_80_4_app_slash_controllers_slash_posts_controller_dot_rb).
kb_method_has_name(startloc_39_3_endloc_41_6_app_slash_controllers_slash_posts_controller_dot_rb, preview).
%   private
%   def set_post ; def show : a private action name is still not an action
kb_method_of_class(startloc_44_3_endloc_46_6_app_slash_controllers_slash_posts_controller_dot_rb, startloc_1_1_endloc_80_4_app_slash_controllers_slash_posts_controller_dot_rb).
kb_method_has_name(startloc_44_3_endloc_46_6_app_slash_controllers_slash_posts_controller_dot_rb, set_post).
kb_callable_has_annotation(startloc_44_3_endloc_46_6_app_slash_controllers_slash_posts_controller_dot_rb, startloc_43_3_endloc_43_10_app_slash_controllers_slash_posts_controller_dot_rb).
kb_method_of_class(startloc_47_3_endloc_49_6_app_slash_controllers_slash_posts_controller_dot_rb, startloc_1_1_endloc_80_4_app_slash_controllers_slash_posts_controller_dot_rb).
kb_method_has_name(startloc_47_3_endloc_49_6_app_slash_controllers_slash_posts_controller_dot_rb, show).
kb_callable_has_annotation(startloc_47_3_endloc_49_6_app_slash_controllers_slash_posts_controller_dot_rb, startloc_43_3_endloc_43_10_app_slash_controllers_slash_posts_controller_dot_rb).
kb_call_resolved(startloc_43_3_endloc_43_10_app_slash_controllers_slash_posts_controller_dot_rb, '<dhscanner-instrumentation>[private]').

% ---------------------------------------------------------------------------
% plugins/chat/app/controllers/chat/api_controller.rb   : a plugin controller, nested dir
%
% class Chat::ApiController < ::ApplicationController
%   def index
kb_class_def(startloc_3_1_endloc_20_4_plugins_slash_chat_slash_app_slash_controllers_slash_chat_slash_api_controller_dot_rb, 'Chat::ApiController', 'plugins/chat/app/controllers/chat/api_controller.rb').
kb_method_of_class(startloc_4_3_endloc_6_6_plugins_slash_chat_slash_app_slash_controllers_slash_chat_slash_api_controller_dot_rb, startloc_3_1_endloc_20_4_plugins_slash_chat_slash_app_slash_controllers_slash_chat_slash_api_controller_dot_rb).
kb_method_has_name(startloc_4_3_endloc_6_6_plugins_slash_chat_slash_app_slash_controllers_slash_chat_slash_api_controller_dot_rb, index).

% ---------------------------------------------------------------------------
% controllers/home_controller.rb   : scan rooted at app/
%
% class HomeController
%   def destroy
kb_class_def(startloc_1_1_endloc_9_4_controllers_slash_home_controller_dot_rb, 'HomeController', 'controllers/home_controller.rb').
kb_method_of_class(startloc_2_3_endloc_4_6_controllers_slash_home_controller_dot_rb, startloc_1_1_endloc_9_4_controllers_slash_home_controller_dot_rb).
kb_method_has_name(startloc_2_3_endloc_4_6_controllers_slash_home_controller_dot_rb, destroy).

% ---------------------------------------------------------------------------
% app/controllers/concerns/post_serializer.rb   : name not *Controller
%
% class PostSerializer
%   def show
kb_class_def(startloc_1_1_endloc_9_4_app_slash_controllers_slash_concerns_slash_post_serializer_dot_rb, 'PostSerializer', 'app/controllers/concerns/post_serializer.rb').
kb_method_of_class(startloc_2_3_endloc_4_6_app_slash_controllers_slash_concerns_slash_post_serializer_dot_rb, startloc_1_1_endloc_9_4_app_slash_controllers_slash_concerns_slash_post_serializer_dot_rb).
kb_method_has_name(startloc_2_3_endloc_4_6_app_slash_controllers_slash_concerns_slash_post_serializer_dot_rb, show).

% ---------------------------------------------------------------------------
% app/models/legacy_controller.rb   : not under controllers/
%
% class LegacyController
%   def index
kb_class_def(startloc_1_1_endloc_9_4_app_slash_models_slash_legacy_controller_dot_rb, 'LegacyController', 'app/models/legacy_controller.rb').
kb_method_of_class(startloc_2_3_endloc_4_6_app_slash_models_slash_legacy_controller_dot_rb, startloc_1_1_endloc_9_4_app_slash_models_slash_legacy_controller_dot_rb).
kb_method_has_name(startloc_2_3_endloc_4_6_app_slash_models_slash_legacy_controller_dot_rb, index).

% ---------------------------------------------------------------------------
% app/mycontrollers/admin_controller.rb   : the dir is not exactly controllers/
%
% class AdminController
%   def index
kb_class_def(startloc_1_1_endloc_9_4_app_slash_mycontrollers_slash_admin_controller_dot_rb, 'AdminController', 'app/mycontrollers/admin_controller.rb').
kb_method_of_class(startloc_2_3_endloc_4_6_app_slash_mycontrollers_slash_admin_controller_dot_rb, startloc_1_1_endloc_9_4_app_slash_mycontrollers_slash_admin_controller_dot_rb).
kb_method_has_name(startloc_2_3_endloc_4_6_app_slash_mycontrollers_slash_admin_controller_dot_rb, index).

% ---------------------------------------------------------------------------
% resourceful actions : fixed verb, url {?}, request slot = handler
must(endpoints_http_rails(startloc_2_3_endloc_4_6_app_slash_controllers_slash_posts_controller_dot_rb, get, startloc_2_3_endloc_4_6_app_slash_controllers_slash_posts_controller_dot_rb, '{?}')).
must(endpoints_http_rails(startloc_5_3_endloc_7_6_app_slash_controllers_slash_posts_controller_dot_rb, get, startloc_5_3_endloc_7_6_app_slash_controllers_slash_posts_controller_dot_rb, '{?}')).
must(endpoints_http_rails(startloc_8_3_endloc_10_6_app_slash_controllers_slash_posts_controller_dot_rb, get, startloc_8_3_endloc_10_6_app_slash_controllers_slash_posts_controller_dot_rb, '{?}')).
must(endpoints_http_rails(startloc_11_3_endloc_13_6_app_slash_controllers_slash_posts_controller_dot_rb, get, startloc_11_3_endloc_13_6_app_slash_controllers_slash_posts_controller_dot_rb, '{?}')).
must(endpoints_http_rails(startloc_14_3_endloc_16_6_app_slash_controllers_slash_posts_controller_dot_rb, post, startloc_14_3_endloc_16_6_app_slash_controllers_slash_posts_controller_dot_rb, '{?}')).
must(endpoints_http_rails(startloc_17_3_endloc_19_6_app_slash_controllers_slash_posts_controller_dot_rb, patch, startloc_17_3_endloc_19_6_app_slash_controllers_slash_posts_controller_dot_rb, '{?}')).
must(endpoints_http_rails(startloc_20_3_endloc_22_6_app_slash_controllers_slash_posts_controller_dot_rb, delete, startloc_20_3_endloc_22_6_app_slash_controllers_slash_posts_controller_dot_rb, '{?}')).
% the verb an unbound query finds first is the resourceful one
must(( endpoints_http_rails(startloc_17_3_endloc_19_6_app_slash_controllers_slash_posts_controller_dot_rb, V, _, _), V == patch )).
% any other action : unknown
must(endpoints_http_rails(startloc_23_3_endloc_25_6_app_slash_controllers_slash_posts_controller_dot_rb, unknown, startloc_23_3_endloc_25_6_app_slash_controllers_slash_posts_controller_dot_rb, '{?}')).
% a def after a bare public is an action again
must(endpoints_http_rails(startloc_39_3_endloc_41_6_app_slash_controllers_slash_posts_controller_dot_rb, unknown, _, '{?}')).
% a plugin controller ( /controllers/ inside the path )
must(endpoints_http_rails(startloc_4_3_endloc_6_6_plugins_slash_chat_slash_app_slash_controllers_slash_chat_slash_api_controller_dot_rb, get, _, '{?}')).
% a controllers/ dir at the start of the path
must(endpoints_http_rails(startloc_2_3_endloc_4_6_controllers_slash_home_controller_dot_rb, delete, _, '{?}')).
% controller recognizer
must(endpoints_controller_rails(startloc_1_1_endloc_80_4_app_slash_controllers_slash_posts_controller_dot_rb)).
must(endpoints_controller_rails(startloc_3_1_endloc_20_4_plugins_slash_chat_slash_app_slash_controllers_slash_chat_slash_api_controller_dot_rb)).
% wired into the family api
must(endpoints_http(startloc_14_3_endloc_16_6_app_slash_controllers_slash_posts_controller_dot_rb, post, startloc_14_3_endloc_16_6_app_slash_controllers_slash_posts_controller_dot_rb, '{?}')).
must(endpoints_http(startloc_23_3_endloc_25_6_app_slash_controllers_slash_posts_controller_dot_rb, unknown, startloc_23_3_endloc_25_6_app_slash_controllers_slash_posts_controller_dot_rb, '{?}')).

% ruby hooks / underscore helpers are not actions
must_not(endpoints_http_rails(startloc_26_3_endloc_28_6_app_slash_controllers_slash_posts_controller_dot_rb, _, _, _)).
must_not(endpoints_http_rails(startloc_29_3_endloc_31_6_app_slash_controllers_slash_posts_controller_dot_rb, _, _, _)).
% after a bare protected / private : not an action, even when named show
must_not(endpoints_http_rails(startloc_34_3_endloc_36_6_app_slash_controllers_slash_posts_controller_dot_rb, _, _, _)).
must_not(endpoints_http_rails(startloc_44_3_endloc_46_6_app_slash_controllers_slash_posts_controller_dot_rb, _, _, _)).
must_not(endpoints_http_rails(startloc_47_3_endloc_49_6_app_slash_controllers_slash_posts_controller_dot_rb, _, _, _)).
% update is patch, not put
must_not(endpoints_http_rails(startloc_17_3_endloc_19_6_app_slash_controllers_slash_posts_controller_dot_rb, put, _, _)).
% a class not named *Controller, under controllers/
must_not(endpoints_http_rails(startloc_2_3_endloc_4_6_app_slash_controllers_slash_concerns_slash_post_serializer_dot_rb, _, _, _)).
% a *Controller class not under a controllers/ dir
must_not(endpoints_http_rails(startloc_2_3_endloc_4_6_app_slash_models_slash_legacy_controller_dot_rb, _, _, _)).
must_not(endpoints_controller_rails(startloc_1_1_endloc_9_4_app_slash_models_slash_legacy_controller_dot_rb)).
% mycontrollers/ is not controllers/
must_not(endpoints_controller_rails(startloc_1_1_endloc_9_4_app_slash_mycontrollers_slash_admin_controller_dot_rb)).
% api : a private method is no endpoint
must_not(endpoints_http(startloc_44_3_endloc_46_6_app_slash_controllers_slash_posts_controller_dot_rb, _, _, _)).
