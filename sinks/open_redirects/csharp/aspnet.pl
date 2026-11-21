:- style_check(-singleton).

% -----------------------------------------------------------------------------
% sinks_open_redirect_csharp_aspnet( Call )
%
% ASP.NET Core redirects ( CWE-601 ). The kb does not type C# receivers, so
% each sink is the exact spelling the kb gives the call :
%
%   return Redirect( returnUrl );              'Redirect'        ( implicit this )
%   return RedirectPermanent( url );           'RedirectPermanent'
%   context.Response.Redirect( url );          'Unknown.Response.Redirect'
%   Response.Redirect( url );                  'Unknown.Redirect'
%   return Results.Redirect( url );            'Unknown.Redirect'
%   return new RedirectResult( url );          'RedirectResult'  ( a constructor )
%
% `Redirect( .. )` with no receiver is the `ControllerBase` method inherited
% by every controller. A class that defines a method of that name itself
% ( or up its 1st party supers ) is not calling the framework's, so that
% call is left to the callgraph ( `callgraph/class_method.pl` ).
%
% A receiver the kb cannot type loses its root name : `Response.Redirect`
% and `Results.Redirect` both read 'Unknown.Redirect', a redirect either way.
%
% Not sinks : `LocalRedirect*` ( throws on a non-local url ),
% `RedirectToAction` / `RedirectToRoute` / `RedirectToPage` ( the target is
% an app route, not a url ).
%
% No taint check here, dataflow is composed on top.
% -----------------------------------------------------------------------------

sinks_open_redirect_csharp_aspnet(Call) :-
    kb_call_resolved(Call, Fqn),
    csharp_redirect_fqn(Fqn).

sinks_open_redirect_csharp_aspnet(Call) :-
    kb_call_resolved(Call, Method),
    csharp_controller_redirect_method(Method),
    kb_called_from(Call, Caller),
    callgraph_enclosing_method(Caller, Enclosing),
    kb_method_of_class(Enclosing, Class),
    \+ callgraph_java_lookup(Class, Method, _).

csharp_redirect_fqn('Unknown.Response.Redirect').
csharp_redirect_fqn('Unknown.Redirect').
csharp_redirect_fqn('Unknown.RedirectPermanent').
csharp_redirect_fqn('RedirectResult').

% ControllerBase methods that answer with a redirect to their url arg
csharp_controller_redirect_method('Redirect').
csharp_controller_redirect_method('RedirectPermanent').
csharp_controller_redirect_method('RedirectPreserveMethod').
csharp_controller_redirect_method('RedirectPermanentPreserveMethod').
