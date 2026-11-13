% fixture : dataflow/api.pl

% -----------------------------------------------------------------------------
% intra-procedural edges, app/views.py

% url = request.args.get( 'u' )         ( call -> url )
kb_dataflow_edge(startloc_5_11_endloc_5_34_app_slash_views_dot_py, startloc_5_5_endloc_5_8_app_slash_views_dot_py).
% target = url                          ( url -> target )
kb_dataflow_edge(startloc_5_5_endloc_5_8_app_slash_views_dot_py, startloc_6_5_endloc_6_11_app_slash_views_dot_py).
% requests.get( target )                ( target -> arg )
kb_dataflow_edge(startloc_6_5_endloc_6_11_app_slash_views_dot_py, startloc_7_18_endloc_7_24_app_slash_views_dot_py).
% a shortcut : also requests.get( url ) ( url -> arg directly )
kb_dataflow_edge(startloc_5_5_endloc_5_8_app_slash_views_dot_py, startloc_8_18_endloc_8_21_app_slash_views_dot_py).
kb_dataflow_edge(startloc_6_5_endloc_6_11_app_slash_views_dot_py, startloc_8_18_endloc_8_21_app_slash_views_dot_py).

% a loop : while ...: a = b ; b = a ; then print( b )
kb_dataflow_edge(startloc_10_5_endloc_10_6_app_slash_views_dot_py, startloc_11_5_endloc_11_6_app_slash_views_dot_py).
kb_dataflow_edge(startloc_11_5_endloc_11_6_app_slash_views_dot_py, startloc_10_5_endloc_10_6_app_slash_views_dot_py).
kb_dataflow_edge(startloc_11_5_endloc_11_6_app_slash_views_dot_py, startloc_12_11_endloc_12_12_app_slash_views_dot_py).

% a broken chain : x = input() ... ( nothing ) ... y = 'const' ; f( y )
kb_dataflow_edge(startloc_14_9_endloc_14_16_app_slash_views_dot_py, startloc_14_5_endloc_14_6_app_slash_views_dot_py).
kb_dataflow_edge(startloc_15_5_endloc_15_6_app_slash_views_dot_py, startloc_16_7_endloc_16_8_app_slash_views_dot_py).

% eleven assignments in a row : v0 -> v1 -> ... -> v11 ( past the 10 edge bound )
kb_dataflow_edge(startloc_20_5_endloc_20_7_app_slash_views_dot_py, startloc_21_5_endloc_21_7_app_slash_views_dot_py).
kb_dataflow_edge(startloc_21_5_endloc_21_7_app_slash_views_dot_py, startloc_22_5_endloc_22_7_app_slash_views_dot_py).
kb_dataflow_edge(startloc_22_5_endloc_22_7_app_slash_views_dot_py, startloc_23_5_endloc_23_7_app_slash_views_dot_py).
kb_dataflow_edge(startloc_23_5_endloc_23_7_app_slash_views_dot_py, startloc_24_5_endloc_24_7_app_slash_views_dot_py).
kb_dataflow_edge(startloc_24_5_endloc_24_7_app_slash_views_dot_py, startloc_25_5_endloc_25_7_app_slash_views_dot_py).
kb_dataflow_edge(startloc_25_5_endloc_25_7_app_slash_views_dot_py, startloc_26_5_endloc_26_7_app_slash_views_dot_py).
kb_dataflow_edge(startloc_26_5_endloc_26_7_app_slash_views_dot_py, startloc_27_5_endloc_27_7_app_slash_views_dot_py).
kb_dataflow_edge(startloc_27_5_endloc_27_7_app_slash_views_dot_py, startloc_28_5_endloc_28_7_app_slash_views_dot_py).
kb_dataflow_edge(startloc_28_5_endloc_28_7_app_slash_views_dot_py, startloc_29_5_endloc_29_7_app_slash_views_dot_py).
kb_dataflow_edge(startloc_29_5_endloc_29_7_app_slash_views_dot_py, startloc_30_5_endloc_30_7_app_slash_views_dot_py).
kb_dataflow_edge(startloc_30_5_endloc_30_7_app_slash_views_dot_py, startloc_31_5_endloc_31_8_app_slash_views_dot_py).

% -----------------------------------------------------------------------------
% inter-procedural : app/views.py calls 1st party helpers in app/utils.py

% name = request.args.get( 'n' ) ; run_user( name )      run_user imported from app/utils.py
kb_dataflow_edge(startloc_40_12_endloc_40_35_app_slash_views_dot_py, startloc_40_5_endloc_40_9_app_slash_views_dot_py).
kb_dataflow_edge(startloc_40_5_endloc_40_9_app_slash_views_dot_py, startloc_41_14_endloc_41_18_app_slash_views_dot_py).
kb_arg_i_for_call(startloc_41_14_endloc_41_18_app_slash_views_dot_py, 0, startloc_41_5_endloc_41_19_app_slash_views_dot_py).
kb_call_1st_party_func_defined_in_file(startloc_41_5_endloc_41_19_app_slash_views_dot_py, 'run_user', 'app/utils.py').
% def run_user( cmd ): os.system( cmd )
kb_func_def(startloc_3_1_endloc_4_23_app_slash_utils_dot_py, 'run_user', 'app/utils.py', 'app').
kb_param_i_of_callable(startloc_3_14_endloc_3_17_app_slash_utils_dot_py, 0, startloc_3_1_endloc_4_23_app_slash_utils_dot_py).
kb_dataflow_edge(startloc_3_14_endloc_3_17_app_slash_utils_dot_py, startloc_4_15_endloc_4_18_app_slash_utils_dot_py).

% path = request.args.get( 'p' ) ; read_file( path )     read_file resolved through its dir
kb_dataflow_edge(startloc_44_12_endloc_44_35_app_slash_views_dot_py, startloc_44_5_endloc_44_9_app_slash_views_dot_py).
kb_dataflow_edge(startloc_44_5_endloc_44_9_app_slash_views_dot_py, startloc_45_15_endloc_45_19_app_slash_views_dot_py).
kb_arg_i_for_call(startloc_45_15_endloc_45_19_app_slash_views_dot_py, 0, startloc_45_5_endloc_45_20_app_slash_views_dot_py).
kb_call_1st_party_func_defined_in_dir(startloc_45_5_endloc_45_20_app_slash_views_dot_py, 'read_file', 'app').
% def read_file( p ): return open( p ).read()
kb_func_def(startloc_7_1_endloc_8_30_app_slash_utils_dot_py, 'read_file', 'app/utils.py', 'app').
kb_param_i_of_callable(startloc_7_15_endloc_7_16_app_slash_utils_dot_py, 0, startloc_7_1_endloc_8_30_app_slash_utils_dot_py).
kb_dataflow_edge(startloc_7_15_endloc_7_16_app_slash_utils_dot_py, startloc_8_17_endloc_8_18_app_slash_utils_dot_py).

% tag = request.args.get( 't' ) ; log_it( 'info', tag )  tag is arg 1, log_it has a single param
kb_dataflow_edge(startloc_48_11_endloc_48_34_app_slash_views_dot_py, startloc_48_5_endloc_48_8_app_slash_views_dot_py).
kb_dataflow_edge(startloc_48_5_endloc_48_8_app_slash_views_dot_py, startloc_49_20_endloc_49_23_app_slash_views_dot_py).
kb_arg_i_for_call(startloc_49_12_endloc_49_18_app_slash_views_dot_py, 0, startloc_49_5_endloc_49_24_app_slash_views_dot_py).
kb_arg_i_for_call(startloc_49_20_endloc_49_23_app_slash_views_dot_py, 1, startloc_49_5_endloc_49_24_app_slash_views_dot_py).
kb_call_1st_party_func_defined_in_file(startloc_49_5_endloc_49_24_app_slash_views_dot_py, 'log_it', 'app/utils.py').
% def log_it( level ): logger.log( level )
kb_func_def(startloc_11_1_endloc_12_25_app_slash_utils_dot_py, 'log_it', 'app/utils.py', 'app').
kb_param_i_of_callable(startloc_11_12_endloc_11_17_app_slash_utils_dot_py, 0, startloc_11_1_endloc_12_25_app_slash_utils_dot_py).
kb_dataflow_edge(startloc_11_12_endloc_11_17_app_slash_utils_dot_py, startloc_12_19_endloc_12_24_app_slash_utils_dot_py).

% -----------------------------------------------------------------------------
% inter-procedural : a ruby method of a 1st party class ( OrenGitHub/dhscanner.runner#152 )
%
% app/controllers/categories_controller.rb
%   category_id = params[:category_id].to_i                                                     :357
%   CategoryUser.set_notification_level_for_category(current_user, notification_level, category_id)   :360
% app/models/category_user.rb
%   def self.set_notification_level_for_category(user, level, category_id)                     :67
%     CategoryUser.find(category_id)                                                            :68
%
% ( :68 is made positional here : the real line is `where(user:, category_id:)`, a `key:` arg,
% which kbgen gets as a 9999 placeholder, no edge until OrenGitHub/dhscanner.runner#152 step 5 )

kb_class_def(startloc_3_39_endloc_3_51_app_slash_models_slash_category_user_dot_rb, 'CategoryUser', 'app/models/category_user.rb').
kb_method_of_class(startloc_67_1834_endloc_85_2382_app_slash_models_slash_category_user_dot_rb, startloc_3_39_endloc_3_51_app_slash_models_slash_category_user_dot_rb).
kb_method_has_name(startloc_67_1834_endloc_85_2382_app_slash_models_slash_category_user_dot_rb, 'set_notification_level_for_category').
kb_param_i_of_callable(startloc_67_1879_endloc_67_1883_app_slash_models_slash_category_user_dot_rb, 0, startloc_67_1834_endloc_85_2382_app_slash_models_slash_category_user_dot_rb).
kb_param_i_of_callable(startloc_67_1885_endloc_67_1890_app_slash_models_slash_category_user_dot_rb, 1, startloc_67_1834_endloc_85_2382_app_slash_models_slash_category_user_dot_rb).
kb_param_i_of_callable(startloc_67_1892_endloc_67_1903_app_slash_models_slash_category_user_dot_rb, 2, startloc_67_1834_endloc_85_2382_app_slash_models_slash_category_user_dot_rb).
kb_dataflow_edge(startloc_67_1892_endloc_67_1903_app_slash_models_slash_category_user_dot_rb, startloc_68_1915_endloc_68_1960_app_slash_models_slash_category_user_dot_rb).

% params[:category_id].to_i -> category_id ( the local, by its definition site ) -> arg 2
kb_dataflow_edge(startloc_357_11716_endloc_357_11741_app_slash_controllers_slash_categories_controller_dot_rb, startloc_357_11702_endloc_357_11713_app_slash_controllers_slash_categories_controller_dot_rb).
kb_arg_i_for_call(startloc_357_11702_endloc_357_11713_app_slash_controllers_slash_categories_controller_dot_rb, 2, startloc_360_11808_endloc_360_11903_app_slash_controllers_slash_categories_controller_dot_rb).
kb_arg_i_for_call(startloc_358_11747_endloc_358_11765_app_slash_controllers_slash_categories_controller_dot_rb, 1, startloc_360_11808_endloc_360_11903_app_slash_controllers_slash_categories_controller_dot_rb).
kb_call_method_of_class(startloc_360_11808_endloc_360_11903_app_slash_controllers_slash_categories_controller_dot_rb, 'set_notification_level_for_category', startloc_3_39_endloc_3_51_app_slash_models_slash_category_user_dot_rb).

% CategoryUser.find_by(id: x) : an ActiveRecord finder, no 1st party method
kb_arg_i_for_call(startloc_370_25_endloc_370_30_app_slash_controllers_slash_categories_controller_dot_rb, 0, startloc_370_5_endloc_370_31_app_slash_controllers_slash_categories_controller_dot_rb).
kb_call_method_of_class(startloc_370_5_endloc_370_31_app_slash_controllers_slash_categories_controller_dot_rb, 'find_by', startloc_3_39_endloc_3_51_app_slash_models_slash_category_user_dot_rb).

% -----------------------------------------------------------------------------
% inter-procedural : a value returned by a ruby method flows to its call ( OrenGitHub/dhscanner.runner#158 )
%
% app/controllers/slack_uploads_controller.rb ( Chatwoot, the real kb facts )
%   class SlackUploadsController < ApplicationController                         :1
%     def show                                                                  :5
%       redirect_to blob_url                                                     :7
%       redirect_to avatar_url                                                   :9
%     def avatar_url                                                            :28
%       "#{base_url}/integrations/slack/#{params[:sender_type]}.png"             :30

kb_class_def(startloc_1_6_endloc_1_28_app_slash_controllers_slash_slack_uploads_controller_dot_rb, 'SlackUploadsController', 'app/controllers/slack_uploads_controller.rb').
kb_method_of_class(startloc_5_148_endloc_11_254_app_slash_controllers_slash_slack_uploads_controller_dot_rb, startloc_1_6_endloc_1_28_app_slash_controllers_slash_slack_uploads_controller_dot_rb).
kb_method_has_name(startloc_5_148_endloc_11_254_app_slash_controllers_slash_slack_uploads_controller_dot_rb, 'show').
kb_method_of_class(startloc_28_591_endloc_31_725_app_slash_controllers_slash_slack_uploads_controller_dot_rb, startloc_1_6_endloc_1_28_app_slash_controllers_slash_slack_uploads_controller_dot_rb).
kb_method_has_name(startloc_28_591_endloc_31_725_app_slash_controllers_slash_slack_uploads_controller_dot_rb, 'avatar_url').

% params -> params[:sender_type] -> the fstring, which avatar_url returns
kb_dataflow_edge(startloc_30_692_endloc_30_698_app_slash_controllers_slash_slack_uploads_controller_dot_rb, startloc_30_692_endloc_30_712_app_slash_controllers_slash_slack_uploads_controller_dot_rb).
kb_dataflow_edge(startloc_30_692_endloc_30_712_app_slash_controllers_slash_slack_uploads_controller_dot_rb, startloc_30_658_endloc_30_718_app_slash_controllers_slash_slack_uploads_controller_dot_rb).
kb_callable_returns_value(startloc_28_591_endloc_31_725_app_slash_controllers_slash_slack_uploads_controller_dot_rb, startloc_30_658_endloc_30_718_app_slash_controllers_slash_slack_uploads_controller_dot_rb).

% redirect_to avatar_url : the call of avatar_url -> redirect_to
kb_call_method_of_class(startloc_9_228_endloc_9_238_app_slash_controllers_slash_slack_uploads_controller_dot_rb, 'avatar_url', startloc_1_6_endloc_1_28_app_slash_controllers_slash_slack_uploads_controller_dot_rb).
kb_dataflow_edge(startloc_9_228_endloc_9_238_app_slash_controllers_slash_slack_uploads_controller_dot_rb, startloc_9_216_endloc_9_238_app_slash_controllers_slash_slack_uploads_controller_dot_rb).

% redirect_to blob_url : blob_url is not defined in the class, so no callee
kb_call_method_of_class(startloc_7_190_endloc_7_198_app_slash_controllers_slash_slack_uploads_controller_dot_rb, 'blob_url', startloc_1_6_endloc_1_28_app_slash_controllers_slash_slack_uploads_controller_dot_rb).
kb_dataflow_edge(startloc_7_190_endloc_7_198_app_slash_controllers_slash_slack_uploads_controller_dot_rb, startloc_7_178_endloc_7_198_app_slash_controllers_slash_slack_uploads_controller_dot_rb).

% -----------------------------------------------------------------------------
% expectations

% one edge
must(dataflow_intra_path(startloc_5_11_endloc_5_34_app_slash_views_dot_py, startloc_5_5_endloc_5_8_app_slash_views_dot_py,
     [(startloc_5_11_endloc_5_34_app_slash_views_dot_py, startloc_5_5_endloc_5_8_app_slash_views_dot_py)])).
% three edges
must(dataflow_intra_path(startloc_5_11_endloc_5_34_app_slash_views_dot_py, startloc_7_18_endloc_7_24_app_slash_views_dot_py,
     [(startloc_5_11_endloc_5_34_app_slash_views_dot_py, startloc_5_5_endloc_5_8_app_slash_views_dot_py),
      (startloc_5_5_endloc_5_8_app_slash_views_dot_py, startloc_6_5_endloc_6_11_app_slash_views_dot_py),
      (startloc_6_5_endloc_6_11_app_slash_views_dot_py, startloc_7_18_endloc_7_24_app_slash_views_dot_py)])).
% the shortest path wins ( url -> arg, not url -> target -> arg ), and only one answer
must(findall(P, dataflow_intra_path(startloc_5_5_endloc_5_8_app_slash_views_dot_py, startloc_8_18_endloc_8_21_app_slash_views_dot_py, P),
     [[(startloc_5_5_endloc_5_8_app_slash_views_dot_py, startloc_8_18_endloc_8_21_app_slash_views_dot_py)]])).
% through a loop, without going round it
must(dataflow_intra_path(startloc_10_5_endloc_10_6_app_slash_views_dot_py, startloc_12_11_endloc_12_12_app_slash_views_dot_py,
     [(startloc_10_5_endloc_10_6_app_slash_views_dot_py, startloc_11_5_endloc_11_6_app_slash_views_dot_py),
      (startloc_11_5_endloc_11_6_app_slash_views_dot_py, startloc_12_11_endloc_12_12_app_slash_views_dot_py)])).
% ten edges : exactly at the bound
must(( dataflow_intra_path(startloc_21_5_endloc_21_7_app_slash_views_dot_py, startloc_31_5_endloc_31_8_app_slash_views_dot_py, P), length(P, 10) )).
% the bounded walker honours its budget
must(dataflow_bounded_intra_path(startloc_5_11_endloc_5_34_app_slash_views_dot_py, startloc_7_18_endloc_7_24_app_slash_views_dot_py, 3,
     [startloc_5_11_endloc_5_34_app_slash_views_dot_py], _)).
must_not(dataflow_bounded_intra_path(startloc_5_11_endloc_5_34_app_slash_views_dot_py, startloc_7_18_endloc_7_24_app_slash_views_dot_py, 2,
     [startloc_5_11_endloc_5_34_app_slash_views_dot_py], _)).

% broken chain : x never reaches f( y )
must_not(dataflow_intra_path(startloc_14_9_endloc_14_16_app_slash_views_dot_py, startloc_16_7_endloc_16_8_app_slash_views_dot_py, _)).
% eleven edges : past the bound
must_not(dataflow_intra_path(startloc_20_5_endloc_20_7_app_slash_views_dot_py, startloc_31_5_endloc_31_8_app_slash_views_dot_py, _)).
% edges are directed
must_not(dataflow_intra_path(startloc_7_18_endloc_7_24_app_slash_views_dot_py, startloc_5_11_endloc_5_34_app_slash_views_dot_py, _)).

% arg -> param edges : defined-in-file and defined-in-dir resolution
must(dataflow_inter_edge(startloc_41_14_endloc_41_18_app_slash_views_dot_py, startloc_3_14_endloc_3_17_app_slash_utils_dot_py)).
must(dataflow_inter_edge_from_arg_to_param(startloc_45_15_endloc_45_19_app_slash_views_dot_py, startloc_7_15_endloc_7_16_app_slash_utils_dot_py)).
% arg 1 has no matching param ( log_it has only param 0 )
must_not(dataflow_inter_edge(startloc_49_20_endloc_49_23_app_slash_views_dot_py, _)).

% request.args.get -> name -> run_user( name ) -> cmd -> os.system( cmd )
must(dataflow_inter_path(startloc_40_12_endloc_40_35_app_slash_views_dot_py, startloc_4_15_endloc_4_18_app_slash_utils_dot_py,
     [(startloc_40_12_endloc_40_35_app_slash_views_dot_py, startloc_40_5_endloc_40_9_app_slash_views_dot_py),
      (startloc_40_5_endloc_40_9_app_slash_views_dot_py, startloc_41_14_endloc_41_18_app_slash_views_dot_py),
      (startloc_41_14_endloc_41_18_app_slash_views_dot_py, startloc_3_14_endloc_3_17_app_slash_utils_dot_py),
      (startloc_3_14_endloc_3_17_app_slash_utils_dot_py, startloc_4_15_endloc_4_18_app_slash_utils_dot_py)])).
% request.args.get -> path -> read_file( path ) -> p -> open( p )
must(dataflow_inter_path(startloc_44_12_endloc_44_35_app_slash_views_dot_py, startloc_8_17_endloc_8_18_app_slash_utils_dot_py, _)).
% tag lands in arg 1, which no param receives
must_not(dataflow_inter_path(startloc_48_11_endloc_48_34_app_slash_views_dot_py, startloc_12_19_endloc_12_24_app_slash_utils_dot_py, _)).
% name never flows into read_file
must_not(dataflow_inter_path(startloc_40_12_endloc_40_35_app_slash_views_dot_py, startloc_8_17_endloc_8_18_app_slash_utils_dot_py, _)).

% ruby method : arg i -> param i, by index
must(dataflow_inter_edge(startloc_357_11702_endloc_357_11713_app_slash_controllers_slash_categories_controller_dot_rb,
     startloc_67_1892_endloc_67_1903_app_slash_models_slash_category_user_dot_rb)).
must(dataflow_inter_edge(startloc_358_11747_endloc_358_11765_app_slash_controllers_slash_categories_controller_dot_rb,
     startloc_67_1885_endloc_67_1890_app_slash_models_slash_category_user_dot_rb)).
% params[:category_id].to_i -> category_id -> set_notification_level_for_category( .., category_id ) -> CategoryUser.find( category_id )
must(dataflow_inter_path(startloc_357_11716_endloc_357_11741_app_slash_controllers_slash_categories_controller_dot_rb,
     startloc_68_1915_endloc_68_1960_app_slash_models_slash_category_user_dot_rb, _)).
% arg 2 is not param 1
must_not(dataflow_inter_edge(startloc_357_11702_endloc_357_11713_app_slash_controllers_slash_categories_controller_dot_rb,
     startloc_67_1885_endloc_67_1890_app_slash_models_slash_category_user_dot_rb)).
% an ActiveRecord finder has no 1st party params
must_not(dataflow_inter_edge(startloc_370_25_endloc_370_30_app_slash_controllers_slash_categories_controller_dot_rb, _)).

% ruby : the value avatar_url returns -> the call avatar_url
must(dataflow_inter_edge(startloc_30_658_endloc_30_718_app_slash_controllers_slash_slack_uploads_controller_dot_rb, startloc_9_228_endloc_9_238_app_slash_controllers_slash_slack_uploads_controller_dot_rb)).
% params[:sender_type] -> "#{..}/integrations/slack/#{..}.png" -> ( returned ) -> avatar_url -> redirect_to
must(dataflow_inter_path(startloc_30_692_endloc_30_698_app_slash_controllers_slash_slack_uploads_controller_dot_rb, startloc_9_216_endloc_9_238_app_slash_controllers_slash_slack_uploads_controller_dot_rb,
     [(startloc_30_692_endloc_30_698_app_slash_controllers_slash_slack_uploads_controller_dot_rb, startloc_30_692_endloc_30_712_app_slash_controllers_slash_slack_uploads_controller_dot_rb),
      (startloc_30_692_endloc_30_712_app_slash_controllers_slash_slack_uploads_controller_dot_rb, startloc_30_658_endloc_30_718_app_slash_controllers_slash_slack_uploads_controller_dot_rb),
      (startloc_30_658_endloc_30_718_app_slash_controllers_slash_slack_uploads_controller_dot_rb, startloc_9_228_endloc_9_238_app_slash_controllers_slash_slack_uploads_controller_dot_rb),
      (startloc_9_228_endloc_9_238_app_slash_controllers_slash_slack_uploads_controller_dot_rb, startloc_9_216_endloc_9_238_app_slash_controllers_slash_slack_uploads_controller_dot_rb)])).
% a call of a method the class does not define gets nothing back
must_not(dataflow_inter_edge(_, startloc_7_190_endloc_7_198_app_slash_controllers_slash_slack_uploads_controller_dot_rb)).
must_not(dataflow_inter_path(startloc_30_692_endloc_30_698_app_slash_controllers_slash_slack_uploads_controller_dot_rb, startloc_7_178_endloc_7_198_app_slash_controllers_slash_slack_uploads_controller_dot_rb, _)).
% a return flows to the call, never the other way
must_not(dataflow_inter_edge(startloc_9_228_endloc_9_238_app_slash_controllers_slash_slack_uploads_controller_dot_rb, startloc_30_658_endloc_30_718_app_slash_controllers_slash_slack_uploads_controller_dot_rb)).
