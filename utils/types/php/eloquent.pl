:- style_check(-singleton).

% -----------------------------------------------------------------------------
% Laravel Eloquent return types.
%
% utils_method_of_class_return_type( Method, Class, ReturnType )
%
% `Method` of the 3rd party `Class` returns a `ReturnType` :
%
%   class Post extends Model { .. }
%   Post::where( 'id', $id )            --> Illuminate.Database.Eloquent.Builder
%
% A model extends `Illuminate\Database\Eloquent\Model`, or
% `Illuminate\Foundation\Auth\User` ( which extends it ) for a user model.
% `where` builds a query, it runs nothing : the Builder runs it ( `update`,
% `get`, `first`, .. ).
% -----------------------------------------------------------------------------

utils_method_of_class_return_type('where', 'Illuminate.Database.Eloquent.Model', 'Illuminate.Database.Eloquent.Builder').
utils_method_of_class_return_type('where', 'Illuminate.Foundation.Auth.User', 'Illuminate.Database.Eloquent.Builder').
