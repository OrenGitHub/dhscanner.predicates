:- style_check(-singleton).

% -----------------------------------------------------------------------------
% Laravel Eloquent return types.
%
% utils_method_of_class_return_type( Method, Class, ReturnType )
%
% `Method` of the 3rd party `Class` returns a `ReturnType` :
%
%   class Post extends Model { .. }
%   Post::where( 'id', $id )                    --> Illuminate.Database.Eloquent.Builder
%   Post::where( 'id', $id )->select( 'title' ) --> Illuminate.Database.Eloquent.Builder
%   Post::where( 'id', $id )->get()             --> Illuminate.Database.Eloquent.Collection
%   Post::where( 'id', $id )->first()           --> Illuminate.Database.Eloquent.Model
%
% A model extends `Illuminate\Database\Eloquent\Model`, or
% `Illuminate\Foundation\Auth\User` ( which extends it ) for a user model.
% `where` and `select` build a query, they run nothing : the Builder runs it
% ( `get`, `first` read, `update` writes ).
% -----------------------------------------------------------------------------

:- dynamic kb_call_method_of_1st_party_imported_name/4.
:- dynamic kb_call_method_of_return_value/3.
:- dynamic kb_class_def/3.
:- dynamic kb_class_has_3rd_party_super/3.

utils_method_of_class_return_type('where', 'Illuminate.Database.Eloquent.Model', 'Illuminate.Database.Eloquent.Builder').
utils_method_of_class_return_type('where', 'Illuminate.Foundation.Auth.User', 'Illuminate.Database.Eloquent.Builder').
utils_method_of_class_return_type('select', 'Illuminate.Database.Eloquent.Model', 'Illuminate.Database.Eloquent.Builder').
utils_method_of_class_return_type('select', 'Illuminate.Foundation.Auth.User', 'Illuminate.Database.Eloquent.Builder').
utils_method_of_class_return_type('where', 'Illuminate.Database.Eloquent.Builder', 'Illuminate.Database.Eloquent.Builder').
utils_method_of_class_return_type('select', 'Illuminate.Database.Eloquent.Builder', 'Illuminate.Database.Eloquent.Builder').
utils_method_of_class_return_type('get', 'Illuminate.Database.Eloquent.Builder', 'Illuminate.Database.Eloquent.Collection').
utils_method_of_class_return_type('first', 'Illuminate.Database.Eloquent.Builder', 'Illuminate.Database.Eloquent.Model').

% -----------------------------------------------------------------------------
% utils_query_of_model_php_eloquent( Query, Model )
%
% `Query` is a Builder over the rows of the 1st party `Model` : the value a
% model method returns, or a Builder method on such a value, any number of
% calls deep ( one `kb_call_method_of_return_value/3` per call ) :
%
%   Post::where( 'id', $id )                    --> Post
%   Post::select( 'title' )->where( 'id', $id ) --> Post

utils_query_of_model_php_eloquent(Query, Model) :-
    kb_call_method_of_1st_party_imported_name(Query, Method, Name, File),
    kb_class_def(Model, Name, File),
    kb_class_has_3rd_party_super(Model, _, Super),
    utils_method_of_class_return_type(Method, Super, 'Illuminate.Database.Eloquent.Builder').
utils_query_of_model_php_eloquent(Query, Model) :-
    kb_call_method_of_return_value(Query, Method, Previous),
    utils_method_of_class_return_type(Method, 'Illuminate.Database.Eloquent.Builder', 'Illuminate.Database.Eloquent.Builder'),
    utils_query_of_model_php_eloquent(Previous, Model).

% -----------------------------------------------------------------------------
% utils_query_call_php_eloquent( Query, Call, Method )
%
% `Call` is one of the calls that build `Query` ( `Query` itself included ),
% a call of `Method`.

utils_query_call_php_eloquent(Query, Query, Method) :-
    kb_call_method_of_1st_party_imported_name(Query, Method, _, _).
utils_query_call_php_eloquent(Query, Query, Method) :-
    kb_call_method_of_return_value(Query, Method, _).
utils_query_call_php_eloquent(Query, Call, Method) :-
    kb_call_method_of_return_value(Query, _, Previous),
    utils_query_call_php_eloquent(Previous, Call, Method).
