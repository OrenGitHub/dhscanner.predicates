:- style_check(-singleton).

% -----------------------------------------------------------------------------
% Laravel HTTP endpoint recognizers.
%
% A Laravel route is a call to the `Route` facade, usually in routes/*.php :
%
%   use Illuminate\Support\Facades\Route;
%   use App\Http\Controllers\ProfileController;
%
%   Route::get( '/profile/{id}', [ ProfileController::class, 'show' ] );
%   Route::post( '/profile', ProfileController::class );         // __invoke
%   Route::get( '/ping', function () { .. } );                   // closure
%
% The facade method resolves to an exact atom
% ( `'Illuminate.Support.Facades.Route.get'` ). The handler pair is an array
% literal ( `'<dhscanner-instrumentation>[arrayify]'` in the kb, parsers >= 1.1.69 ) : its element 0 is the read of
% `ProfileController::class`, a field `'class'` of a 1st party imported name
% ( `kb_field_read_of_1st_party_imported_name/4`, kbgen >= 2.7.0 ), its
% element 1 the method name as a constant string. The class is the one that
% name and file define ( `kb_class_def/3` ), the handler its method of that
% name. Whole atoms only, no kb atom is taken apart.
%
% Not covered : route groups ( `Route::middleware([ 'auth' ])->group( .. )`,
% `Route::prefix( 'x' )->group( .. )` ) : the kb has no fact linking a call
% to the call it is chained on, so neither the group's middleware ( auth )
% nor its url prefix reach the routes inside. Also `Route::resource( .. )`,
% `Route::match( .. )`, the `'Controller@method'` string form, and a facade
% call with no `use Illuminate\Support\Facades\Route;`.
% -----------------------------------------------------------------------------

:- dynamic kb_field_read_of_1st_party_imported_name/4.
:- dynamic kb_class_def/3.
:- dynamic kb_method_of_class/2.
:- dynamic kb_method_has_name/2.
:- dynamic kb_param_has_name/2.
:- dynamic kb_callable_source_body_length/2.

% -----------------------------------------------------------------------------
% endpoints_http_laravel( Handler, Verb, Url, Route )
%
% `Handler` serves `Verb` `Url`, registered by the facade call `Route` :
%
%   Route::get( '/profile/{id}', [ ProfileController::class, 'show' ] )
%       --> ProfileController.show, get, /profile/{id}
%   Route::post( 'profile', ProfileController::class )
%       --> ProfileController.__invoke, post, /profile
%   Route::any( $prefix, fn () => .. )
%       --> the closure, unknown, {?}
%
% `Verb` is get / post / put / delete / patch, or `unknown` ( `any`, and
% `options` that the kbapi has no name for ). The request object slot
% carries the facade call, like the aspnet routing attribute : user input
% arrives through the handler's params ( `endpoints_user_input_kind_laravel/2` ).

endpoints_http_laravel(Handler, Verb, Url, Route) :-
    endpoints_verb_laravel(Fqn, Verb),
    kb_call_resolved(Route, Fqn),
    kb_arg_i_for_call(Action, 1, Route),
    endpoints_action_handler_laravel(Action, Handler),
    endpoints_url_laravel(Route, Url).

endpoints_verb_laravel('Illuminate.Support.Facades.Route.get', get).
endpoints_verb_laravel('Illuminate.Support.Facades.Route.post', post).
endpoints_verb_laravel('Illuminate.Support.Facades.Route.put', put).
endpoints_verb_laravel('Illuminate.Support.Facades.Route.delete', delete).
endpoints_verb_laravel('Illuminate.Support.Facades.Route.patch', patch).
endpoints_verb_laravel('Illuminate.Support.Facades.Route.options', unknown).
endpoints_verb_laravel('Illuminate.Support.Facades.Route.any', unknown).

% -----------------------------------------------------------------------------
% endpoints_action_handler_laravel( Action, Handler )
%
% The route action, arg 1 of the facade call :
%
%   [ ProfileController::class, 'show' ]   --> ProfileController.show
%   ProfileController::class               --> ProfileController.__invoke
%   function () { .. }                     --> the closure itself

endpoints_action_handler_laravel(Action, Handler) :-
    kb_call_resolved(Action, '<dhscanner-instrumentation>[arrayify]'),
    kb_arg_i_for_call(ClassRead, 0, Action),
    kb_arg_i_for_call(MethodArg, 1, Action),
    kb_const_string(MethodArg, MethodName),
    endpoints_controller_method_laravel(ClassRead, MethodName, Handler).
endpoints_action_handler_laravel(Action, Handler) :-
    endpoints_controller_method_laravel(Action, '__invoke', Handler).
endpoints_action_handler_laravel(Action, Action) :-
    kb_callable_source_body_length(Action, _).

endpoints_controller_method_laravel(ClassRead, MethodName, Handler) :-
    kb_field_read_of_1st_party_imported_name(ClassRead, 'class', Name, File),
    kb_class_def(Class, Name, File),
    kb_method_of_class(Handler, Class),
    kb_method_has_name(Handler, MethodName).

% -----------------------------------------------------------------------------
% endpoints_url_laravel( Route, Url )
%
% The uri, arg 0 of the facade call, with the leading `/` Laravel adds
% ( on the constant string from the source, not on a kb atom ) :
%
%   '/profile/{id}'  --> /profile/{id}
%   'profile'        --> /profile
%   $prefix          --> {?}

endpoints_url_laravel(Route, Url) :-
    kb_arg_i_for_call(UriArg, 0, Route),
    kb_const_string(UriArg, Uri),
    !,
    (   sub_atom(Uri, 0, 1, _, '/') -> Url = Uri ; atom_concat('/', Uri, Url) ).
endpoints_url_laravel(_, '{?}').

% -----------------------------------------------------------------------------
% endpoints_user_input_kind_laravel( Param, Kind )
%
% Every param of a route handler comes from the request :
%
%   Route::get( '/profile/{id}', [ ProfileController::class, 'show' ] );
%   public function show( Request $request, $id )
%
% A param named by a `{..}` segment of the url ( `{id}`, or `{id?}` when
% optional ) is a `PathVariable`, any other param is the `RequestObject`
% ( the `Request` itself, whose `$request->x` reads are the input ). The kb
% does not tell a service Laravel injects from the request ( a param typed
% by a class ), so such a param is reported too.

endpoints_user_input_kind_laravel(Param, Kind) :-
    kb_param_i_of_callable(Param, _, Handler),
    once(endpoints_http_laravel(Handler, _, _, _)),
    endpoints_param_kind_laravel(Param, Handler, Kind).

endpoints_user_input_laravel(Param) :-
    endpoints_user_input_kind_laravel(Param, _).

endpoints_param_kind_laravel(Param, Handler, 'PathVariable') :-
    kb_param_has_name(Param, Name),
    endpoints_http_laravel(Handler, _, Url, _),
    endpoints_url_segment_laravel(Url, Name),
    !.
endpoints_param_kind_laravel(_, _, 'RequestObject').

endpoints_url_segment_laravel(Url, Name) :-
    atomic_list_concat(['{', Name, '}'], Segment),
    sub_atom(Url, _, _, _, Segment),
    !.
endpoints_url_segment_laravel(Url, Name) :-
    atomic_list_concat(['{', Name, '?}'], Segment),
    sub_atom(Url, _, _, _, Segment).
