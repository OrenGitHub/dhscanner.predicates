:- style_check(-singleton).

% -----------------------------------------------------------------------------
% Rails ( action pack ) HTTP endpoint recognizers ( runner #138 ).
%
% A Rails endpoint is an action : a method of a controller class. Rails
% finds controllers by convention, not by imports ( zeitwerk autoload ) :
% `Admin::UsersController` lives in `app/controllers/admin/users_controller.rb`,
% and a plugin's in `plugins/<name>/app/controllers/...`. The super chain
% ( `< ApplicationController < ActionController::Base` ) names constants
% that are never imported, so the KB has no resolved supers for them :
% the recognizer goes by the same convention Rails does. A controller is
% a class whose name ends with `Controller`, defined in a file under a
% `controllers/` directory.
%
% Verb : the resourceful actions ( `resources :posts` ) have a fixed verb,
% every other action is `unknown`. Url : `{?}`, routes ( `config/routes.rb` )
% are not read yet.
%
% Private / protected methods are not actions : the parser gives every
% `def` after a bare `private` / `protected` the annotation
% `<dhscanner-instrumentation>[private]` ( `[protected]` ). Ruby has no
% other method annotations, so any annotation means not routable.
%
% Not covered yet : `private def x` ( inline form ), actions inherited from
% a 1st party super controller, and routes.
%
% Not every KB carries these facts, so declare them here to keep calls to
% them failing quietly rather than raising.

:- dynamic kb_class_def/3.
:- dynamic kb_method_of_class/2.
:- dynamic kb_method_has_name/2.
:- dynamic kb_callable_has_annotation/2.

% -----------------------------------------------------------------------------
% endpoints_http_rails( Handler, Verb, Request, Url )
%
% Rails actions have no request param ( `params` / `request` are methods
% of the controller ), so the request slot carries the handler itself.

endpoints_http_rails(Handler, Verb, Handler, '{?}') :-
    endpoints_controller_rails(Class),
    kb_method_of_class(Handler, Class),
    kb_method_has_name(Handler, Name),
    \+ endpoints_non_action_rails(Name),
    \+ kb_callable_has_annotation(Handler, _),
    endpoints_action_verb_rails(Name, Verb).

% -----------------------------------------------------------------------------
% endpoints_controller_rails( Class )

endpoints_controller_rails(Class) :-
    kb_class_def(Class, Name, File),
    atom_concat(_, 'Controller', Name),
    endpoints_controller_file_rails(File).

endpoints_controller_file_rails(File) :- sub_atom(File, 0, _, _, 'controllers/'), !.
endpoints_controller_file_rails(File) :- sub_atom(File, _, _, _, '/controllers/'), !.

% -----------------------------------------------------------------------------
% endpoints_action_verb_rails( Action, Verb )
%
% The verbs of `resources :x` : `update` answers both PATCH and PUT,
% PATCH is the one Rails generates links / forms for.

endpoints_action_verb_rails(index, get) :- !.
endpoints_action_verb_rails(show, get) :- !.
endpoints_action_verb_rails(new, get) :- !.
endpoints_action_verb_rails(edit, get) :- !.
endpoints_action_verb_rails(create, post) :- !.
endpoints_action_verb_rails(update, patch) :- !.
endpoints_action_verb_rails(destroy, delete) :- !.
endpoints_action_verb_rails(_, unknown).

% methods Rails never routes to : ruby hooks / operators.
endpoints_non_action_rails(initialize).
endpoints_non_action_rails(Name) :- sub_atom(Name, 0, 1, _, '_').

% -----------------------------------------------------------------------------
% Rails user input ( runner #152 ).
%
% `params` is a method of ActionController ( StrongParameters ), inherited
% by every controller : the query string, the form body and the route
% segments, in one hash. So a `params` call in a method of a class whose
% super chain reaches `ActionController::Base` is user input, and so is
% everything that flows out of it ( `params[:user_id]`, `.require(..)`,
% `.permit(..)`, `.to_i` ) :
%
%   class Admin::UsersController < Admin::StaffController   # < ApplicationController < ActionController::Base
%     def penalty_history
%       ...
%         user_id: params[:user_id].to_i,
%
% Structural, no names or paths : the super chain is 1st party supers
% ( `callgraph_java_super/2` ) ending at the 3rd party super
% `ActionController.Base`, and a call inside a block ( `do .. end` ) belongs
% to the method around it ( `callgraph_enclosing_method/2` ). A `params`
% method a class defines itself ( Discourse `StaffActionLogger#params` ) is
% no controller's : that class does not reach ActionController.

:- dynamic kb_call_resolved/2.
:- dynamic kb_called_from/2.
:- dynamic kb_class_has_3rd_party_super/3.

% endpoints_user_input_rails( Call ) : a `params` call of a controller method
endpoints_user_input_rails(Call) :-
    endpoints_user_input_of_method_rails(_, Call).

% endpoints_user_input_of_method_rails( Method, Call ) : the `params` calls
% of `Method`, its blocks included
endpoints_user_input_of_method_rails(Method, Call) :-
    kb_call_resolved(Call, params),
    kb_called_from(Call, Caller),
    callgraph_enclosing_method(Caller, Method),
    kb_method_of_class(Method, Class),
    endpoints_action_controller_rails(Class).

% endpoints_user_input_of_handler_rails( Handler, Call ) : the `params` calls
% of `Handler`, and of the methods it calls ( runner #154 ). An action often
% reads `params` in a private helper, not in its own body :
%
%   def preview
%     render json: validation_service.perform   # -> connection_params
%   ...
%   def connection_params
%     params.permit(:waba_id, :phone_number_id, :access_token)
%
% Within the hops of the reach bound, so the same calls a sink query from
% the handler sees. Only `params` of controller methods, as above.
endpoints_user_input_of_handler_rails(Handler, Call) :-
    endpoints_user_input_hops_rails(N),
    callgraph_callables_within(Handler, N, Callables),
    member(Method, Callables),
    endpoints_user_input_of_method_rails(Method, Call).

endpoints_user_input_hops_rails(10).

:- table endpoints_action_controller_rails/1.
endpoints_action_controller_rails(Class) :-
    kb_class_has_3rd_party_super(Class, 'ActionController.Base', _).
endpoints_action_controller_rails(Class) :-
    callgraph_java_super(Class, Super),
    endpoints_action_controller_rails(Super).
