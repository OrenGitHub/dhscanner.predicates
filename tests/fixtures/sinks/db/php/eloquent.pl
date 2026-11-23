% fixture : sinks/db/php/eloquent.pl

% class Post extends Model { .. }
kb_class_def(startloc_8_7_endloc_8_10_app_slash_Models_slash_Post_dot_php, 'Post', 'app/Models/Post.php').
kb_class_has_3rd_party_super(startloc_8_7_endloc_8_10_app_slash_Models_slash_Post_dot_php, 'Model', 'Illuminate.Database.Eloquent.Model').
% class Member extends Authenticatable { .. }
kb_class_def(startloc_9_7_endloc_9_12_app_slash_Models_slash_Member_dot_php, 'Member', 'app/Models/Member.php').
kb_class_has_3rd_party_super(startloc_9_7_endloc_9_12_app_slash_Models_slash_Member_dot_php, 'Authenticatable', 'Illuminate.Foundation.Auth.User').
% class Cache extends Store { .. } : not a model
kb_class_def(startloc_7_7_endloc_7_11_app_slash_Support_slash_Cache_dot_php, 'Cache', 'app/Support/Cache.php').
kb_class_has_3rd_party_super(startloc_7_7_endloc_7_11_app_slash_Support_slash_Cache_dot_php, 'Store', 'Illuminate.Cache.Store').

% Post::where( 'id', $id )->update( [ 'title' => $title ] )
kb_call_method_of_1st_party_imported_name(startloc_20_9_endloc_20_34_app_slash_Http_slash_Controllers_slash_PostController_dot_php, 'where', 'Post', 'app/Models/Post.php').
kb_call_method_of_return_value(startloc_20_9_endloc_20_70_app_slash_Http_slash_Controllers_slash_PostController_dot_php, 'update', startloc_20_9_endloc_20_34_app_slash_Http_slash_Controllers_slash_PostController_dot_php).
% Member::where( 'id', $id )->update( [ 'name' => $name ] )
kb_call_method_of_1st_party_imported_name(startloc_30_9_endloc_30_36_app_slash_Http_slash_Controllers_slash_MemberController_dot_php, 'where', 'Member', 'app/Models/Member.php').
kb_call_method_of_return_value(startloc_30_9_endloc_30_70_app_slash_Http_slash_Controllers_slash_MemberController_dot_php, 'update', startloc_30_9_endloc_30_36_app_slash_Http_slash_Controllers_slash_MemberController_dot_php).

% near misses
% Post::where( 'id', $id )->get() : a read
kb_call_method_of_1st_party_imported_name(startloc_40_9_endloc_40_34_app_slash_Http_slash_Controllers_slash_PostController_dot_php, 'where', 'Post', 'app/Models/Post.php').
kb_call_method_of_return_value(startloc_40_9_endloc_40_40_app_slash_Http_slash_Controllers_slash_PostController_dot_php, 'get', startloc_40_9_endloc_40_34_app_slash_Http_slash_Controllers_slash_PostController_dot_php).
% Cache::where( $key )->update( $value ) : where of a class that is not a model
kb_call_method_of_1st_party_imported_name(startloc_50_9_endloc_50_30_app_slash_Http_slash_Controllers_slash_PostController_dot_php, 'where', 'Cache', 'app/Support/Cache.php').
kb_call_method_of_return_value(startloc_50_9_endloc_50_50_app_slash_Http_slash_Controllers_slash_PostController_dot_php, 'update', startloc_50_9_endloc_50_30_app_slash_Http_slash_Controllers_slash_PostController_dot_php).
% $audit->update( Post::where( 'id', $id ) ) : the where result is an argument, not the receiver
kb_call_method_of_1st_party_imported_name(startloc_60_25_endloc_60_50_app_slash_Http_slash_Controllers_slash_PostController_dot_php, 'where', 'Post', 'app/Models/Post.php').
kb_arg_i_for_call(startloc_60_25_endloc_60_50_app_slash_Http_slash_Controllers_slash_PostController_dot_php, 0, startloc_60_9_endloc_60_51_app_slash_Http_slash_Controllers_slash_PostController_dot_php).
kb_dataflow_edge(startloc_60_25_endloc_60_50_app_slash_Http_slash_Controllers_slash_PostController_dot_php, startloc_60_9_endloc_60_51_app_slash_Http_slash_Controllers_slash_PostController_dot_php).

must(sinks_db_write_php_eloquent_model(startloc_20_9_endloc_20_70_app_slash_Http_slash_Controllers_slash_PostController_dot_php, startloc_8_7_endloc_8_10_app_slash_Models_slash_Post_dot_php)).
must(sinks_db_write_php_eloquent(startloc_30_9_endloc_30_70_app_slash_Http_slash_Controllers_slash_MemberController_dot_php)).
% wired into the family api
must(sinks_db_write(startloc_20_9_endloc_20_70_app_slash_Http_slash_Controllers_slash_PostController_dot_php)).

must_not(sinks_db_write_php_eloquent(startloc_40_9_endloc_40_40_app_slash_Http_slash_Controllers_slash_PostController_dot_php)).
must_not(sinks_db_write_php_eloquent(startloc_50_9_endloc_50_50_app_slash_Http_slash_Controllers_slash_PostController_dot_php)).
must_not(sinks_db_write_php_eloquent(startloc_60_9_endloc_60_51_app_slash_Http_slash_Controllers_slash_PostController_dot_php)).
