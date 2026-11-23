:- style_check(-singleton).

% -----------------------------------------------------------------------------
% Laravel Eloquent DB writes.
%
% sinks_db_write_php_eloquent_model( Update, Model )
%
% `Update` writes rows of the 1st party `Model` :
%
%   class Post extends Model { .. }
%   Post::where( 'id', $id )->update( [ 'title' => $title ] );
%
% `Post::where( .. )` is a method of a 1st party imported name
% ( `kb_call_method_of_1st_party_imported_name/4` ), whose class has a 3rd
% party super with that method returning a Builder
% ( `utils_method_of_class_return_type/3` ). `update` is called on the value
% it returns ( `kb_call_method_of_return_value/3`, kbgen >= 2.9.0 ), not on
% an argument.
%
% sinks_db_write_php_eloquent_column( Update, Model, Column, Value )
%
% `Update` writes `Value` to the `Column` of `Model` : a constant key of the
% update array ( `[ 'title' => $title ]`, a keyword arg of the array in the
% kb ).
%
% Not covered : a Builder kept in a variable, more than one call between
% the model and `update` ( `Post::where( .. )->where( .. )->update( .. )` ),
% `Post::find( $id )->update( .. )`, `$post->save()`.
% -----------------------------------------------------------------------------

:- dynamic kb_call_method_of_return_value/3.
:- dynamic kb_call_method_of_1st_party_imported_name/4.
:- dynamic kb_class_def/3.
:- dynamic kb_class_has_3rd_party_super/3.
:- dynamic kb_keyword_arg_for_call/3.
:- dynamic kb_arg_i_for_call/3.

sinks_db_write_php_eloquent_model(Update, Model) :-
    kb_call_method_of_return_value(Update, 'update', ReturnValue),
    kb_call_method_of_1st_party_imported_name(ReturnValue, Method, Name, File),
    kb_class_def(Model, Name, File),
    kb_class_has_3rd_party_super(Model, _, Super),
    utils_method_of_class_return_type(Method, Super, 'Illuminate.Database.Eloquent.Builder').

sinks_db_write_php_eloquent(Update) :-
    sinks_db_write_php_eloquent_model(Update, _).

sinks_db_write_php_eloquent_column(Update, Model, Column, Value) :-
    sinks_db_write_php_eloquent_model(Update, Model),
    kb_arg_i_for_call(Array, 0, Update),
    kb_keyword_arg_for_call(Column, Value, Array).
