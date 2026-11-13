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

% ---------------------------------------------------------------------------
% user input ( runner #152 ) : Discourse app/controllers/admin/users_controller.rb
%
% class Admin::UsersController < Admin::StaffController
%   def penalty_history                                 # :107
%     ...
%         user_id: params[:user_id].to_i,               # :142
% class Admin::StaffController < ApplicationController  # no def
% class ApplicationController < ActionController::Base
kb_class_def(startloc_3_46_endloc_3_61_app_slash_controllers_slash_admin_slash_users_controller_dot_rb, 'Admin.UsersController', 'app/controllers/admin/users_controller.rb').
kb_class_def(startloc_3_46_endloc_3_61_app_slash_controllers_slash_admin_slash_staff_controller_dot_rb, 'Admin.StaffController', 'app/controllers/admin/staff_controller.rb').
kb_class_def(startloc_5_65_endloc_5_86_app_slash_controllers_slash_application_controller_dot_rb, 'ApplicationController', 'app/controllers/application_controller.rb').
kb_class_has_1st_party_super(startloc_3_46_endloc_3_61_app_slash_controllers_slash_admin_slash_users_controller_dot_rb, 'Admin.StaffController', 'app/controllers/admin/staff_controller.rb').
kb_class_has_1st_party_super(startloc_3_46_endloc_3_61_app_slash_controllers_slash_admin_slash_staff_controller_dot_rb, 'ApplicationController', 'app/controllers/application_controller.rb').
kb_class_has_3rd_party_super(startloc_5_65_endloc_5_86_app_slash_controllers_slash_application_controller_dot_rb, 'ActionController.Base', 'ActionController.Base').
kb_method_of_class(startloc_107_3284_endloc_146_4453_app_slash_controllers_slash_admin_slash_users_controller_dot_rb, startloc_3_46_endloc_3_61_app_slash_controllers_slash_admin_slash_users_controller_dot_rb).
kb_method_has_name(startloc_107_3284_endloc_146_4453_app_slash_controllers_slash_admin_slash_users_controller_dot_rb, penalty_history).
kb_call_resolved(startloc_142_4383_endloc_142_4389_app_slash_controllers_slash_admin_slash_users_controller_dot_rb, params).
kb_called_from(startloc_142_4383_endloc_142_4389_app_slash_controllers_slash_admin_slash_users_controller_dot_rb, startloc_107_3284_endloc_146_4453_app_slash_controllers_slash_admin_slash_users_controller_dot_rb).
% hypothetical : `params` inside a block of the same action
%     json_result do |x| ; params[:id] ; end            # :120
kb_call_resolved(startloc_120_3500_endloc_120_3530_app_slash_controllers_slash_admin_slash_users_controller_dot_rb, json_result).
kb_called_from(startloc_120_3500_endloc_120_3530_app_slash_controllers_slash_admin_slash_users_controller_dot_rb, startloc_107_3284_endloc_146_4453_app_slash_controllers_slash_admin_slash_users_controller_dot_rb).
kb_arg_i_for_call(startloc_120_3512_endloc_122_3530_app_slash_controllers_slash_admin_slash_users_controller_dot_rb, 0, startloc_120_3500_endloc_120_3530_app_slash_controllers_slash_admin_slash_users_controller_dot_rb).
kb_call_resolved(startloc_121_3515_endloc_121_3521_app_slash_controllers_slash_admin_slash_users_controller_dot_rb, params).
kb_called_from(startloc_121_3515_endloc_121_3521_app_slash_controllers_slash_admin_slash_users_controller_dot_rb, startloc_120_3512_endloc_122_3530_app_slash_controllers_slash_admin_slash_users_controller_dot_rb).
% hypothetical : a class of its own with a `params` method, no controller
% class StaffActionLogger ; def log ; params ; end ; def params ; end
kb_class_def(startloc_3_7_endloc_3_24_app_slash_services_slash_staff_action_logger_dot_rb, 'StaffActionLogger', 'app/services/staff_action_logger.rb').
kb_method_of_class(startloc_10_3_endloc_12_6_app_slash_services_slash_staff_action_logger_dot_rb, startloc_3_7_endloc_3_24_app_slash_services_slash_staff_action_logger_dot_rb).
kb_method_has_name(startloc_10_3_endloc_12_6_app_slash_services_slash_staff_action_logger_dot_rb, log).
kb_call_resolved(startloc_11_5_endloc_11_11_app_slash_services_slash_staff_action_logger_dot_rb, params).
kb_called_from(startloc_11_5_endloc_11_11_app_slash_services_slash_staff_action_logger_dot_rb, startloc_10_3_endloc_12_6_app_slash_services_slash_staff_action_logger_dot_rb).

% the action's own `params` call, and one in its block
must(endpoints_user_input_of_method_rails(startloc_107_3284_endloc_146_4453_app_slash_controllers_slash_admin_slash_users_controller_dot_rb, startloc_142_4383_endloc_142_4389_app_slash_controllers_slash_admin_slash_users_controller_dot_rb)).
must(endpoints_user_input_of_method_rails(startloc_107_3284_endloc_146_4453_app_slash_controllers_slash_admin_slash_users_controller_dot_rb, startloc_121_3515_endloc_121_3521_app_slash_controllers_slash_admin_slash_users_controller_dot_rb)).
% the super chain, through a def-less controller
must(endpoints_action_controller_rails(startloc_3_46_endloc_3_61_app_slash_controllers_slash_admin_slash_users_controller_dot_rb)).
% wired into the family api
must(endpoints_user_input(startloc_142_4383_endloc_142_4389_app_slash_controllers_slash_admin_slash_users_controller_dot_rb)).
% not a controller : its own `params`
must_not(endpoints_user_input_rails(startloc_11_5_endloc_11_11_app_slash_services_slash_staff_action_logger_dot_rb)).
must_not(endpoints_action_controller_rails(startloc_3_7_endloc_3_24_app_slash_services_slash_staff_action_logger_dot_rb)).
% a call that is not `params`
must_not(endpoints_user_input_rails(startloc_120_3500_endloc_120_3530_app_slash_controllers_slash_admin_slash_users_controller_dot_rb)).

% ---------------------------------------------------------------------------
% handler user input through a helper ( runner #154 ) : Chatwoot
% app/controllers/api/v1/accounts/whatsapp/manual_setup_controller.rb
%
% class Api::V1::Accounts::Whatsapp::ManualSetupController < ApplicationController
%   def preview                                          # :5
%     render json: validation_service.perform
%   def validation_service                               # :52  ( private )
%     Whatsapp::ManualSetupValidationService.new(**connection_params.to_h.symbolize_keys)
%   def connection_params                                # :56  ( private )
%     params.permit(:waba_id, :phone_number_id, :access_token)   # :57
%   def webhook_status                                   # :20 , calls no helper
kb_class_def(startloc_1_1_endloc_80_4_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb, 'Api.V1.Accounts.Whatsapp.ManualSetupController', 'app/controllers/whatsapp/manual_setup_controller.rb').
kb_class_has_1st_party_super(startloc_1_1_endloc_80_4_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb, 'ApplicationController', 'app/controllers/application_controller.rb').
kb_method_of_class(startloc_5_232_endloc_9_351_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb, startloc_1_1_endloc_80_4_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb).
kb_method_has_name(startloc_5_232_endloc_9_351_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb, preview).
kb_method_of_class(startloc_52_1600_endloc_54_1700_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb, startloc_1_1_endloc_80_4_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb).
kb_method_has_name(startloc_52_1600_endloc_54_1700_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb, validation_service).
kb_method_of_class(startloc_56_1750_endloc_58_1800_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb, startloc_1_1_endloc_80_4_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb).
kb_method_has_name(startloc_56_1750_endloc_58_1800_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb, connection_params).
kb_method_of_class(startloc_20_700_endloc_24_866_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb, startloc_1_1_endloc_80_4_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb).
kb_method_has_name(startloc_20_700_endloc_24_866_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb, webhook_status).
% preview -> validation_service ( receiverless, implicit self )
kb_call_resolved(startloc_6_262_endloc_6_280_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb, validation_service).
kb_called_from(startloc_6_262_endloc_6_280_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb, startloc_5_232_endloc_9_351_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb).
% validation_service -> connection_params
kb_call_resolved(startloc_53_1650_endloc_53_1667_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb, connection_params).
kb_called_from(startloc_53_1650_endloc_53_1667_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb, startloc_52_1600_endloc_54_1700_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb).
% connection_params : params
kb_call_resolved(startloc_57_1774_endloc_57_1780_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb, params).
kb_called_from(startloc_57_1774_endloc_57_1780_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb, startloc_56_1750_endloc_58_1800_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb).

% two helpers down
must(endpoints_user_input_of_handler_rails(startloc_5_232_endloc_9_351_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb, startloc_57_1774_endloc_57_1780_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb)).
% the handler's own params still count ( 0 hops )
must(endpoints_user_input_of_handler_rails(startloc_107_3284_endloc_146_4453_app_slash_controllers_slash_admin_slash_users_controller_dot_rb, startloc_142_4383_endloc_142_4389_app_slash_controllers_slash_admin_slash_users_controller_dot_rb)).
% not in preview's own body
must_not(endpoints_user_input_of_method_rails(startloc_5_232_endloc_9_351_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb, _)).
% an action that calls no helper reading params
must_not(endpoints_user_input_of_handler_rails(startloc_20_700_endloc_24_866_app_slash_controllers_slash_whatsapp_slash_manual_setup_controller_dot_rb, _)).
