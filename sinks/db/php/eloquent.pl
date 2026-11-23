:- style_check(-singleton).

% -----------------------------------------------------------------------------
% Laravel Eloquent DB writes and reads.
%
% A query starts at a method of a 1st party model ( `Post::where( .. )` ) and
% goes on through the values each call returns ( `kb_call_method_of_return_value/3`,
% kbgen >= 2.9.0 ), typed by `utils_method_of_class_return_type/3` : the
% receiver of the next call, never an argument of it
% ( `utils_query_of_model_php_eloquent/2` ).
%
% Not covered : a Builder kept in a variable, `Post::find( $id )->update( .. )`,
% `$post->save()`, `DB::table( .. )`, a column that is not a constant.
% -----------------------------------------------------------------------------

:- dynamic kb_call_method_of_return_value/3.
:- dynamic kb_keyword_arg_for_call/3.
:- dynamic kb_arg_i_for_call/3.
:- dynamic kb_const_string/2.

% -----------------------------------------------------------------------------
% sinks_db_write_php_eloquent_model( Update, Model )
%
% `Update` writes rows of the 1st party `Model` :
%
%   class Post extends Model { .. }
%   Post::where( 'id', $id )->update( [ 'title' => $title ] );

sinks_db_write_php_eloquent_model(Update, Model) :-
    kb_call_method_of_return_value(Update, 'update', Query),
    utils_query_of_model_php_eloquent(Query, Model).

sinks_db_write_php_eloquent(Update) :-
    sinks_db_write_php_eloquent_model(Update, _).

% -----------------------------------------------------------------------------
% sinks_db_write_php_eloquent_column( Update, Model, Column, Value )
%
% `Update` writes `Value` to the `Column` of `Model` : a constant key of the
% update array ( `[ 'title' => $title ]`, a keyword arg of the array in the
% kb ).

sinks_db_write_php_eloquent_column(Update, Model, Column, Value) :-
    sinks_db_write_php_eloquent_model(Update, Model),
    kb_arg_i_for_call(Array, 0, Update),
    kb_keyword_arg_for_call(Column, Value, Array).

% -----------------------------------------------------------------------------
% sinks_db_read_php_eloquent_column( Read, Model, Column )
%
% `Read` returns the `Column` of rows of the 1st party `Model` : a model
% ( `first` ) or a collection of them ( `get` ). The columns are the
% constant args of the query's `select` calls, or `'*'` ( every column )
% when it has none :
%
%   Post::select( 'title' )->where( 'id', $id )->get()   --> Post, title
%   Post::where( 'id', $id )->first()                    --> Post, *

sinks_db_read_php_eloquent_column(Read, Model, Column) :-
    kb_call_method_of_return_value(Read, Method, Query),
    utils_method_of_class_return_type(Method, 'Illuminate.Database.Eloquent.Builder', Rows),
    Rows \== 'Illuminate.Database.Eloquent.Builder',
    utils_query_of_model_php_eloquent(Query, Model),
    sinks_db_read_column_php_eloquent(Query, Column).

sinks_db_read_column_php_eloquent(Query, Column) :-
    utils_query_call_php_eloquent(Query, _, 'select'),
    !,
    utils_query_call_php_eloquent(Query, Select, 'select'),
    kb_arg_i_for_call(Arg, _, Select),
    kb_const_string(Arg, Column).
sinks_db_read_column_php_eloquent(_, '*').
