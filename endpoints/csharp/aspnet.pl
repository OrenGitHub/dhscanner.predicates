:- style_check(-singleton).

% -----------------------------------------------------------------------------
% ASP.NET Core ( MVC / Web API controllers ) HTTP endpoint recognizers.
%
% Attribute routing lives in C# attributes. Like java annotations, the kb
% carries an attribute as a location : `kb_callable_has_annotation/2`,
% `kb_class_has_annotation/2` and `kb_param_has_annotation/2` point at it,
% and the attribute itself is lowered as a call at that same location, its
% name in `kb_call_resolved/2` and its arguments in `kb_arg_i_for_call/3` /
% `kb_keyword_arg_for_call/3`.
%
% C# names an attribute without its namespace ( `using Microsoft.AspNetCore.Mvc;`
% brings `HttpGetAttribute` in as `[HttpGet]` ) and the kb does not resolve
% `using` namespaces, so an attribute resolves to the name as written :
%
%   [HttpPost]                    kb_call_resolved( A, 'HttpPost' )
%   [Route("account/login/")]     kb_call_resolved( R, 'Route' ),
%                                 kb_const_string( Arg0, 'account/login/' )
%
% Both spellings C# accepts are listed ( `HttpGet` and `HttpGetAttribute` ).
%
% Not covered : conventional routing ( `MapControllerRoute`, actions with no
% routing attribute ), minimal APIs ( `app.MapGet( "/x", handler )` ), and a
% `[Route]` inherited from a base controller ( the kb has no C# super facts
% yet ). Not every KB carries these facts ( non C# KBs ), so declare them
% here to keep calls to them failing quietly rather than raising.
% -----------------------------------------------------------------------------

:- dynamic kb_callable_has_annotation/2.
:- dynamic kb_class_has_annotation/2.
:- dynamic kb_method_of_class/2.
:- dynamic kb_keyword_arg_for_call/3.
:- dynamic kb_param_has_annotation/2.
:- dynamic kb_param_has_name/2.

% -----------------------------------------------------------------------------
% endpoints_http_aspnet( Handler, Verb, Url, Mapping )
%
% `Handler` is an action with a routing attribute `Mapping` :
%
%   [HttpGet("users/{id}")]                    --> get, /users/{id}
%   [HttpPost] [Route("account/login/")]       --> post, /account/login/
%   [AcceptVerbs("GET", "POST")] [Route("x")]  --> get, /x and post, /x
%   [Route("x")]                               --> unknown, /x
%
% `Verb` is get / post / put / delete / patch, or `unknown` : a `[Route]`
% with no verb attribute matches every verb, and HEAD / OPTIONS are verbs
% the kbapi has no name for. `Url` is the class `[Route]` prefix joined
% with the action template ( `endpoints_join_aspnet/3` ). The request
% object slot carries the routing attribute, like spring : user input
% arrives through the action's params.

endpoints_http_aspnet(Handler, Verb, Url, Mapping) :-
    kb_callable_has_annotation(Handler, Mapping),
    kb_call_resolved(Mapping, Name),
    endpoints_verb_attribute_aspnet(Name, Mapping, Verb),
    endpoints_action_template_aspnet(Handler, Mapping, Template),
    endpoints_class_prefix_aspnet(Handler, Prefix),
    endpoints_join_aspnet(Prefix, Template, Url).

endpoints_http_aspnet(Handler, unknown, Url, Mapping) :-
    kb_callable_has_annotation(Handler, Mapping),
    kb_call_resolved(Mapping, Name),
    endpoints_route_attribute_aspnet(Name),
    \+ endpoints_has_verb_attribute_aspnet(Handler),
    endpoints_template_aspnet(Mapping, Template),
    endpoints_class_prefix_aspnet(Handler, Prefix),
    endpoints_join_aspnet(Prefix, Template, Url).

endpoints_has_verb_attribute_aspnet(Handler) :-
    kb_callable_has_annotation(Handler, Mapping),
    kb_call_resolved(Mapping, Name),
    endpoints_verb_attribute_aspnet(Name, Mapping, _),
    !.

% -----------------------------------------------------------------------------
% endpoints_verb_attribute_aspnet( Name, Mapping, Verb )
%
% The `[HttpXxx]` attributes fix the verb by name. `[AcceptVerbs( .. )]`
% lists them as constant strings, one endpoint per verb.

endpoints_verb_attribute_aspnet(Name, _, Verb) :-
    endpoints_http_verb_attribute_aspnet(Name, Verb).
endpoints_verb_attribute_aspnet(Name, Mapping, Verb) :-
    endpoints_accept_verbs_attribute_aspnet(Name),
    kb_arg_i_for_call(Arg, _, Mapping),
    kb_const_string(Arg, Method),
    upcase_atom(Method, Upper),
    endpoints_accept_verb_aspnet(Upper, Verb).

endpoints_http_verb_attribute_aspnet('HttpGet', get).
endpoints_http_verb_attribute_aspnet('HttpGetAttribute', get).
endpoints_http_verb_attribute_aspnet('HttpPost', post).
endpoints_http_verb_attribute_aspnet('HttpPostAttribute', post).
endpoints_http_verb_attribute_aspnet('HttpPut', put).
endpoints_http_verb_attribute_aspnet('HttpPutAttribute', put).
endpoints_http_verb_attribute_aspnet('HttpDelete', delete).
endpoints_http_verb_attribute_aspnet('HttpDeleteAttribute', delete).
endpoints_http_verb_attribute_aspnet('HttpPatch', patch).
endpoints_http_verb_attribute_aspnet('HttpPatchAttribute', patch).
endpoints_http_verb_attribute_aspnet('HttpHead', unknown).
endpoints_http_verb_attribute_aspnet('HttpHeadAttribute', unknown).
endpoints_http_verb_attribute_aspnet('HttpOptions', unknown).
endpoints_http_verb_attribute_aspnet('HttpOptionsAttribute', unknown).

endpoints_accept_verbs_attribute_aspnet('AcceptVerbs').
endpoints_accept_verbs_attribute_aspnet('AcceptVerbsAttribute').

endpoints_accept_verb_aspnet('GET', get).
endpoints_accept_verb_aspnet('POST', post).
endpoints_accept_verb_aspnet('PUT', put).
endpoints_accept_verb_aspnet('DELETE', delete).
endpoints_accept_verb_aspnet('PATCH', patch).
endpoints_accept_verb_aspnet('HEAD', unknown).
endpoints_accept_verb_aspnet('OPTIONS', unknown).

endpoints_route_attribute_aspnet('Route').
endpoints_route_attribute_aspnet('RouteAttribute').

% -----------------------------------------------------------------------------
% endpoints_action_template_aspnet( Handler, Mapping, Template )
%
% The verb attribute's own template, else every `[Route]` template of the
% action, else '' ( the class prefix alone ) :
%
%   [HttpGet("x")]                --> 'x'
%   [HttpGet] [Route("y")]        --> 'y'
%   [HttpGet]                     --> ''

endpoints_action_template_aspnet(_, Mapping, Template) :-
    endpoints_template_arg_aspnet(Mapping, _),
    !,
    endpoints_template_aspnet(Mapping, Template).
endpoints_action_template_aspnet(Handler, _, Template) :-
    endpoints_action_route_aspnet(Handler, _),
    !,
    endpoints_action_route_aspnet(Handler, Route),
    endpoints_template_aspnet(Route, Template).
endpoints_action_template_aspnet(_, _, '').

endpoints_action_route_aspnet(Handler, Route) :-
    kb_callable_has_annotation(Handler, Route),
    kb_call_resolved(Route, Name),
    endpoints_route_attribute_aspnet(Name).

% -----------------------------------------------------------------------------
% endpoints_class_prefix_aspnet( Handler, Prefix )
%
% Template of the `[Route]` on the action's class, or '' when there is none.

endpoints_class_prefix_aspnet(Handler, Prefix) :-
    kb_method_of_class(Handler, Class),
    kb_class_has_annotation(Class, Route),
    kb_call_resolved(Route, Name),
    endpoints_route_attribute_aspnet(Name),
    endpoints_template_aspnet(Route, Prefix),
    !.
endpoints_class_prefix_aspnet(_, '').

% -----------------------------------------------------------------------------
% endpoints_template_aspnet( Attribute, Template )
%
% The route template an attribute declares :
%
%   [Route("x")]  [HttpGet("x")]  [HttpGet(Template = "x")]  --> 'x'
%   [HttpGet]  [HttpGet(Name = "n")]                         --> ''
%   [Route(Constants.Prefix)]                                --> '{?}'
%
% '{?}' keeps the endpoint visible while flagging the part of the url that
% is not a constant string. Keyword args keep their positional index too,
% so the positional clause skips them : `Name = "n"` in slot 0 is no
% template. `[AcceptVerbs( "GET", .. )]` args are verbs : their template
% is the keyword `Route = "x"` only.

endpoints_template_aspnet(Attribute, Template) :-
    endpoints_template_arg_aspnet(Attribute, Arg),
    kb_const_string(Arg, Template),
    !.
endpoints_template_aspnet(Attribute, '') :-
    \+ endpoints_template_arg_aspnet(Attribute, _),
    !.
endpoints_template_aspnet(_, '{?}').

endpoints_template_arg_aspnet(Attribute, Arg) :-
    kb_keyword_arg_for_call('Template', Arg, Attribute).
endpoints_template_arg_aspnet(Attribute, Arg) :-
    kb_call_resolved(Attribute, Name),
    endpoints_accept_verbs_attribute_aspnet(Name),
    !,
    kb_keyword_arg_for_call('Route', Arg, Attribute).
endpoints_template_arg_aspnet(Attribute, Arg) :-
    kb_arg_i_for_call(Arg, 0, Attribute),
    \+ kb_keyword_arg_for_call(_, Arg, Attribute).

% -----------------------------------------------------------------------------
% endpoints_join_aspnet( Prefix, Template, Url )
%
% How ASP.NET Core combines a class and an action template ( on constant
% strings from the source, not on kb atoms ) :
%
%   "api/users" + "{id}"          --> /api/users/{id}
%   "api/users" + ""              --> /api/users
%   "api/users" + "/health"       --> /health        ( absolute action )
%   "api/users" + "~/health"      --> /health        ( absolute action )
%   ""          + "account/login/" --> /account/login/

endpoints_join_aspnet(_, Template, Url) :-
    sub_atom(Template, 0, 2, _, '~/'),
    !,
    sub_atom(Template, 1, _, 0, Url).
endpoints_join_aspnet(_, Template, Template) :-
    sub_atom(Template, 0, 1, _, '/'),
    !.
endpoints_join_aspnet(Prefix0, Template, Url) :-
    endpoints_trim_slashes_aspnet(Prefix0, Prefix),
    (   Prefix == '' -> atom_concat('/', Template, Url)
    ;   Template == '' -> atom_concat('/', Prefix, Url)
    ;   atomic_list_concat(['/', Prefix, '/', Template], Url)
    ).

endpoints_trim_slashes_aspnet(Atom, Trimmed) :-
    (   sub_atom(Atom, 0, 1, _, '~') -> sub_atom(Atom, 1, _, 0, A1) ; A1 = Atom ),
    (   sub_atom(A1, 0, 1, _, '/') -> sub_atom(A1, 1, _, 0, A2) ; A2 = A1 ),
    (   sub_atom(A2, _, 1, 0, '/') -> sub_atom(A2, 0, _, 1, Trimmed) ; Trimmed = A2 ).

% -----------------------------------------------------------------------------
% endpoints_user_input_kind_aspnet( Param, Kind )
%
% A param of an action is filled by the model binder from the request :
%
%   [HttpPost] [Route("account/login/")]
%   public async Task<IActionResult> Login(LoginModel model, string? returnUrl)
%
% Both `model` ( its fields bound from the form ) and `returnUrl` ( from
% the query string ) are user input. A binding source attribute names
% where the value comes from ; `Kind` is the kbapi user input kind :
%
%   [FromQuery] / none   RequestParam     [FromRoute]   PathVariable
%   [FromBody]           RequestBody      [FromHeader]  RequestHeader
%   [FromForm]           RequestPart
%
% `[FromServices]` / `[FromKeyedServices]` params come from dependency
% injection, not from the request. A `CancellationToken` param is bound
% from the request too ( `RequestAborted` ) ; the kb has no C# param types,
% so it is reported like any other param.

endpoints_user_input_kind_aspnet(Param, Kind) :-
    kb_param_i_of_callable(Param, _, Handler),
    once(endpoints_http_aspnet(Handler, _, _, _)),
    \+ endpoints_injected_param_aspnet(Param),
    endpoints_param_kind_aspnet(Param, Kind).

endpoints_user_input_aspnet(Param) :-
    endpoints_user_input_kind_aspnet(Param, _).

endpoints_injected_param_aspnet(Param) :-
    endpoints_param_attribute_aspnet(Param, Name),
    endpoints_injected_attribute_aspnet(Name),
    !.

endpoints_param_kind_aspnet(Param, Kind) :-
    endpoints_param_attribute_aspnet(Param, Name),
    endpoints_binding_source_aspnet(Name, Kind),
    !.
endpoints_param_kind_aspnet(_, 'RequestParam').

endpoints_param_attribute_aspnet(Param, Name) :-
    kb_param_has_annotation(Param, Attribute),
    kb_call_resolved(Attribute, Name).

endpoints_injected_attribute_aspnet('FromServices').
endpoints_injected_attribute_aspnet('FromServicesAttribute').
endpoints_injected_attribute_aspnet('FromKeyedServices').
endpoints_injected_attribute_aspnet('FromKeyedServicesAttribute').

endpoints_binding_source_aspnet('FromQuery', 'RequestParam').
endpoints_binding_source_aspnet('FromQueryAttribute', 'RequestParam').
endpoints_binding_source_aspnet('FromRoute', 'PathVariable').
endpoints_binding_source_aspnet('FromRouteAttribute', 'PathVariable').
endpoints_binding_source_aspnet('FromBody', 'RequestBody').
endpoints_binding_source_aspnet('FromBodyAttribute', 'RequestBody').
endpoints_binding_source_aspnet('FromHeader', 'RequestHeader').
endpoints_binding_source_aspnet('FromHeaderAttribute', 'RequestHeader').
endpoints_binding_source_aspnet('FromForm', 'RequestPart').
endpoints_binding_source_aspnet('FromFormAttribute', 'RequestPart').

% -----------------------------------------------------------------------------
% endpoints_http_auth_aspnet( Handler, Name, Annotations )
%
% `Handler` is guarded by `[Authorize]` on itself or on its class :
%
%   [Authorize(Roles = "Admin")]   --> [ sec( 'Authorize', A, [ 'Admin' ] ) ]
%
% `[AllowAnonymous]` on either one bypasses every `[Authorize]` ( ASP.NET
% Core ignores the `[Authorize]` attributes when both are present ), so
% such a handler stays unauthenticated. `Name` is 'Authorize'.
%
% Not covered : custom attributes deriving from `AuthorizeAttribute`
% ( needs the C# super facts ), policies set globally
% ( `RequireAuthorization()`, an `AuthorizeFilter` ).

endpoints_http_auth_aspnet(Handler, 'Authorize', Annotations) :-
    once(endpoints_http_aspnet(Handler, _, _, _)),
    \+ ( endpoints_effective_attribute_aspnet(Handler, _, Name),
         endpoints_allow_anonymous_attribute_aspnet(Name) ),
    findall(sec(Name, Attribute, ConstStrArgs),
            ( endpoints_effective_attribute_aspnet(Handler, Attribute, Name),
              endpoints_authorize_attribute_aspnet(Name),
              endpoints_const_str_args_aspnet(Attribute, ConstStrArgs) ),
            Annotations),
    Annotations \== [].

endpoints_effective_attribute_aspnet(Handler, Attribute, Name) :-
    kb_callable_has_annotation(Handler, Attribute),
    kb_call_resolved(Attribute, Name).
endpoints_effective_attribute_aspnet(Handler, Attribute, Name) :-
    kb_method_of_class(Handler, Class),
    kb_class_has_annotation(Class, Attribute),
    kb_call_resolved(Attribute, Name).

endpoints_authorize_attribute_aspnet('Authorize').
endpoints_authorize_attribute_aspnet('AuthorizeAttribute').

endpoints_allow_anonymous_attribute_aspnet('AllowAnonymous').
endpoints_allow_anonymous_attribute_aspnet('AllowAnonymousAttribute').

endpoints_const_str_args_aspnet(Attribute, ConstStrArgs) :-
    findall(Index-Str, ( kb_arg_i_for_call(Arg, Index, Attribute), kb_const_string(Arg, Str) ), Pairs),
    keysort(Pairs, Sorted),
    pairs_values(Sorted, ConstStrArgs).
