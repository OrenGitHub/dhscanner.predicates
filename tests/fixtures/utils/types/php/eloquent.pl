% fixture : utils/types/php/eloquent.pl

% class Post extends Model { .. }
kb_class_def(startloc_8_7_endloc_8_10_app_slash_Models_slash_Post_dot_php, 'Post', 'app/Models/Post.php').
kb_class_has_3rd_party_super(startloc_8_7_endloc_8_10_app_slash_Models_slash_Post_dot_php, 'Model', 'Illuminate.Database.Eloquent.Model').

% Post::select( 'title' )->where( 'id', $id )->first()
kb_call_method_of_1st_party_imported_name(startloc_20_9_endloc_20_30_app_slash_Http_slash_Controllers_slash_PostController_dot_php, 'select', 'Post', 'app/Models/Post.php').
kb_call_method_of_return_value(startloc_20_9_endloc_20_50_app_slash_Http_slash_Controllers_slash_PostController_dot_php, 'where', startloc_20_9_endloc_20_30_app_slash_Http_slash_Controllers_slash_PostController_dot_php).
kb_call_method_of_return_value(startloc_20_9_endloc_20_58_app_slash_Http_slash_Controllers_slash_PostController_dot_php, 'first', startloc_20_9_endloc_20_50_app_slash_Http_slash_Controllers_slash_PostController_dot_php).

must(utils_method_of_class_return_type('where', 'Illuminate.Database.Eloquent.Model', 'Illuminate.Database.Eloquent.Builder')).
must(utils_method_of_class_return_type('where', 'Illuminate.Foundation.Auth.User', 'Illuminate.Database.Eloquent.Builder')).
must(utils_query_of_model_php_eloquent(startloc_20_9_endloc_20_30_app_slash_Http_slash_Controllers_slash_PostController_dot_php, startloc_8_7_endloc_8_10_app_slash_Models_slash_Post_dot_php)).
% one call deep
must(utils_query_of_model_php_eloquent(startloc_20_9_endloc_20_50_app_slash_Http_slash_Controllers_slash_PostController_dot_php, startloc_8_7_endloc_8_10_app_slash_Models_slash_Post_dot_php)).
must(utils_query_call_php_eloquent(startloc_20_9_endloc_20_50_app_slash_Http_slash_Controllers_slash_PostController_dot_php, startloc_20_9_endloc_20_30_app_slash_Http_slash_Controllers_slash_PostController_dot_php, 'select')).

% update runs the query, it returns no Builder
must_not(utils_method_of_class_return_type('update', 'Illuminate.Database.Eloquent.Model', _)).
% first runs the query : its value is a model, not a Builder
must_not(utils_query_of_model_php_eloquent(startloc_20_9_endloc_20_58_app_slash_Http_slash_Controllers_slash_PostController_dot_php, _)).
