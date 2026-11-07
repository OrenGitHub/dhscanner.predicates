% fixture : callgraph/class_method.pl
%
% Discourse shaped ( OrenGitHub/dhscanner.runner#152 ), atoms as kbgen emits them.

% -----------------------------------------------------------------------------
% app/models/category_user.rb
%
%   class CategoryUser < ActiveRecord::Base
%     def self.set_notification_level_for_category(user, level, category_id) ... end      :67
%   end

kb_class_def(startloc_3_39_endloc_3_51_app_slash_models_slash_category_user_dot_rb, 'CategoryUser', 'app/models/category_user.rb').
kb_method_of_class(startloc_67_1834_endloc_85_2382_app_slash_models_slash_category_user_dot_rb, startloc_3_39_endloc_3_51_app_slash_models_slash_category_user_dot_rb).
kb_method_has_name(startloc_67_1834_endloc_85_2382_app_slash_models_slash_category_user_dot_rb, 'set_notification_level_for_category').

% app/models/user_api_key.rb
%
%   class UserApiKey < ActiveRecord::Base
%     def initialize(attrs) ... end                       :10
%   end
%   class UserApiKeyScope < ActiveRecord::Base           ( no initialize )
%   end

kb_class_def(startloc_3_7_endloc_3_17_app_slash_models_slash_user_api_key_dot_rb, 'UserApiKey', 'app/models/user_api_key.rb').
kb_method_of_class(startloc_10_3_endloc_12_6_app_slash_models_slash_user_api_key_dot_rb, startloc_3_7_endloc_3_17_app_slash_models_slash_user_api_key_dot_rb).
kb_method_has_name(startloc_10_3_endloc_12_6_app_slash_models_slash_user_api_key_dot_rb, 'initialize').
kb_class_def(startloc_3_7_endloc_3_22_app_slash_models_slash_user_api_key_scope_dot_rb, 'UserApiKeyScope', 'app/models/user_api_key_scope.rb').

% app/models/topic_user.rb + app/models/base_user.rb
%
%   class BaseUser ; def self.auto_watch(opts = {}) ... end ; end          :5
%   class TopicUser < BaseUser ; end                                         ( inherits auto_watch )

kb_class_def(startloc_1_7_endloc_1_15_app_slash_models_slash_base_user_dot_rb, 'BaseUser', 'app/models/base_user.rb').
kb_method_of_class(startloc_5_3_endloc_9_6_app_slash_models_slash_base_user_dot_rb, startloc_1_7_endloc_1_15_app_slash_models_slash_base_user_dot_rb).
kb_method_has_name(startloc_5_3_endloc_9_6_app_slash_models_slash_base_user_dot_rb, 'auto_watch').
kb_class_def(startloc_1_7_endloc_1_16_app_slash_models_slash_topic_user_dot_rb, 'TopicUser', 'app/models/topic_user.rb').
kb_class_has_1st_party_super(startloc_1_7_endloc_1_16_app_slash_models_slash_topic_user_dot_rb, 'BaseUser', 'app/models/base_user.rb').

% -----------------------------------------------------------------------------
% app/controllers/categories_controller.rb
%
%   def set_notifications                                                                      :356
%     CategoryUser.set_notification_level_for_category(current_user, notification_level, category_id)   :360
%     UserApiKey.new(user_id: 1)                                                               :361
%     UserApiKeyScope.new(scope: 'read')                                                       :362
%     TopicUser.auto_watch(user_id: 1)                                                         :363
%     CategoryUser.find_by(id: 1)                                                              :364  ( ActiveRecord, not 1st party )
%   end

kb_called_from(startloc_360_11808_endloc_360_11903_app_slash_controllers_slash_categories_controller_dot_rb, startloc_356_11675_endloc_368_12142_app_slash_controllers_slash_categories_controller_dot_rb).
kb_call_method_of_class(startloc_360_11808_endloc_360_11903_app_slash_controllers_slash_categories_controller_dot_rb, 'set_notification_level_for_category', startloc_3_39_endloc_3_51_app_slash_models_slash_category_user_dot_rb).

kb_called_from(startloc_361_5_endloc_361_31_app_slash_controllers_slash_categories_controller_dot_rb, startloc_356_11675_endloc_368_12142_app_slash_controllers_slash_categories_controller_dot_rb).
kb_call_method_of_class(startloc_361_5_endloc_361_31_app_slash_controllers_slash_categories_controller_dot_rb, 'new', startloc_3_7_endloc_3_17_app_slash_models_slash_user_api_key_dot_rb).

kb_called_from(startloc_362_5_endloc_362_39_app_slash_controllers_slash_categories_controller_dot_rb, startloc_356_11675_endloc_368_12142_app_slash_controllers_slash_categories_controller_dot_rb).
kb_call_method_of_class(startloc_362_5_endloc_362_39_app_slash_controllers_slash_categories_controller_dot_rb, 'new', startloc_3_7_endloc_3_22_app_slash_models_slash_user_api_key_scope_dot_rb).

kb_called_from(startloc_363_5_endloc_363_37_app_slash_controllers_slash_categories_controller_dot_rb, startloc_356_11675_endloc_368_12142_app_slash_controllers_slash_categories_controller_dot_rb).
kb_call_method_of_class(startloc_363_5_endloc_363_37_app_slash_controllers_slash_categories_controller_dot_rb, 'auto_watch', startloc_1_7_endloc_1_16_app_slash_models_slash_topic_user_dot_rb).

kb_called_from(startloc_364_5_endloc_364_32_app_slash_controllers_slash_categories_controller_dot_rb, startloc_356_11675_endloc_368_12142_app_slash_controllers_slash_categories_controller_dot_rb).
kb_call_method_of_class(startloc_364_5_endloc_364_32_app_slash_controllers_slash_categories_controller_dot_rb, 'find_by', startloc_3_39_endloc_3_51_app_slash_models_slash_category_user_dot_rb).

% -----------------------------------------------------------------------------
% implicit self, app/models/category_user.rb
%
%   def self.set_notification_level_for_category(user, level, category_id)    :67
%     auto_watch(user_id: user.id)                                             :83   receiverless
%     transaction do                                                           :86
%       auto_track(user_id: user.id)                                           :87   receiverless, in a block
%     end
%     raise Discourse::InvalidAccess                                           :89   Kernel
%     opts.auto_watch                                                          :90   a receiver kbgen could not type
%   end
%   def self.auto_watch(opts = {}) ... end                                     :124
%   def self.auto_track(opts = {}) ... end                                     :87 ( defined at :140 here )

kb_method_of_class(startloc_124_3589_endloc_177_5782_app_slash_models_slash_category_user_dot_rb, startloc_3_39_endloc_3_51_app_slash_models_slash_category_user_dot_rb).
kb_method_has_name(startloc_124_3589_endloc_177_5782_app_slash_models_slash_category_user_dot_rb, 'auto_watch').
kb_method_of_class(startloc_140_3_endloc_150_6_app_slash_models_slash_category_user_dot_rb, startloc_3_39_endloc_3_51_app_slash_models_slash_category_user_dot_rb).
kb_method_has_name(startloc_140_3_endloc_150_6_app_slash_models_slash_category_user_dot_rb, 'auto_track').

kb_called_from(startloc_83_2313_endloc_83_2341_app_slash_models_slash_category_user_dot_rb, startloc_67_1834_endloc_85_2382_app_slash_models_slash_category_user_dot_rb).
kb_call_resolved(startloc_83_2313_endloc_83_2341_app_slash_models_slash_category_user_dot_rb, 'auto_watch').

% transaction do ... end : the block is the lambda arg of the `transaction` call
kb_called_from(startloc_86_5_endloc_88_8_app_slash_models_slash_category_user_dot_rb, startloc_67_1834_endloc_85_2382_app_slash_models_slash_category_user_dot_rb).
kb_call_resolved(startloc_86_5_endloc_88_8_app_slash_models_slash_category_user_dot_rb, 'transaction').
kb_arg_i_for_call(startloc_86_17_endloc_88_8_app_slash_models_slash_category_user_dot_rb, 0, startloc_86_5_endloc_88_8_app_slash_models_slash_category_user_dot_rb).
kb_callable_source_body_length(startloc_86_17_endloc_88_8_app_slash_models_slash_category_user_dot_rb, 1).
kb_called_from(startloc_87_7_endloc_87_35_app_slash_models_slash_category_user_dot_rb, startloc_86_17_endloc_88_8_app_slash_models_slash_category_user_dot_rb).
kb_call_resolved(startloc_87_7_endloc_87_35_app_slash_models_slash_category_user_dot_rb, 'auto_track').

kb_called_from(startloc_89_5_endloc_89_35_app_slash_models_slash_category_user_dot_rb, startloc_67_1834_endloc_85_2382_app_slash_models_slash_category_user_dot_rb).
kb_call_resolved(startloc_89_5_endloc_89_35_app_slash_models_slash_category_user_dot_rb, 'raise').

kb_called_from(startloc_90_5_endloc_90_20_app_slash_models_slash_category_user_dot_rb, startloc_67_1834_endloc_85_2382_app_slash_models_slash_category_user_dot_rb).
kb_call_resolved(startloc_90_5_endloc_90_20_app_slash_models_slash_category_user_dot_rb, 'Unknown.auto_watch').

% -----------------------------------------------------------------------------
% expectations

% a class method of a 1st party class
must(callgraph_class_method_callee(startloc_360_11808_endloc_360_11903_app_slash_controllers_slash_categories_controller_dot_rb,
     startloc_67_1834_endloc_85_2382_app_slash_models_slash_category_user_dot_rb)).
% `Foo.new` -> `initialize`
must(callgraph_class_method_callee(startloc_361_5_endloc_361_31_app_slash_controllers_slash_categories_controller_dot_rb,
     startloc_10_3_endloc_12_6_app_slash_models_slash_user_api_key_dot_rb)).
% inherited from a 1st party super
must(callgraph_class_method_callee(startloc_363_5_endloc_363_37_app_slash_controllers_slash_categories_controller_dot_rb,
     startloc_5_3_endloc_9_6_app_slash_models_slash_base_user_dot_rb)).
% the caller -> callee edge, and its wiring into the family entry point and reach
must(callgraph_class_method(startloc_356_11675_endloc_368_12142_app_slash_controllers_slash_categories_controller_dot_rb,
     startloc_67_1834_endloc_85_2382_app_slash_models_slash_category_user_dot_rb)).
must(callgraph_callable_calls_callable(startloc_356_11675_endloc_368_12142_app_slash_controllers_slash_categories_controller_dot_rb,
     startloc_67_1834_endloc_85_2382_app_slash_models_slash_category_user_dot_rb)).

% implicit self : a receiverless call -> the method of the enclosing class
must(callgraph_class_method_callee(startloc_83_2313_endloc_83_2341_app_slash_models_slash_category_user_dot_rb,
     startloc_124_3589_endloc_177_5782_app_slash_models_slash_category_user_dot_rb)).
% implicit self inside a block : climb from the lambda to its method
must(callgraph_class_method_callee(startloc_87_7_endloc_87_35_app_slash_models_slash_category_user_dot_rb,
     startloc_140_3_endloc_150_6_app_slash_models_slash_category_user_dot_rb)).
must(callgraph_enclosing_method(startloc_86_17_endloc_88_8_app_slash_models_slash_category_user_dot_rb,
     startloc_67_1834_endloc_85_2382_app_slash_models_slash_category_user_dot_rb)).
% and the edge from the method, through reach, to auto_watch
must(callgraph_reaches_call_bounded(startloc_356_11675_endloc_368_12142_app_slash_controllers_slash_categories_controller_dot_rb,
     startloc_83_2313_endloc_83_2341_app_slash_models_slash_category_user_dot_rb, 2)).

% Kernel `raise` : no 1st party method of that name
must_not(callgraph_class_method_callee(startloc_89_5_endloc_89_35_app_slash_models_slash_category_user_dot_rb, _)).
% ruby `'Unknown.<m>'` is a call on an untyped receiver, not implicit self
must_not(callgraph_class_method_callee(startloc_90_5_endloc_90_20_app_slash_models_slash_category_user_dot_rb, _)).
% `new` of a class with no `initialize` : no edge
must_not(callgraph_class_method_callee(startloc_362_5_endloc_362_39_app_slash_controllers_slash_categories_controller_dot_rb, _)).
% a method the 1st party class does not define ( an ActiveRecord finder ) : no edge
must_not(callgraph_class_method_callee(startloc_364_5_endloc_364_32_app_slash_controllers_slash_categories_controller_dot_rb, _)).
% edges are caller -> callee only ( auto_watch calls nothing here )
must_not(callgraph_class_method(startloc_124_3589_endloc_177_5782_app_slash_models_slash_category_user_dot_rb, _)).
