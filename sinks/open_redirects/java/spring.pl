:- style_check(-singleton).

% -----------------------------------------------------------------------------
% sinks_open_redirect_java_spring( Call )
%
% A spring `ResponseEntity` answering with a `Location` header points the
% client at that url : `ResponseEntity.status( SEE_OTHER ).location( uri )`
% is spring's redirect idiom, and `HttpHeaders.setLocation( uri )` sets the
% same header on a response it builds ( CWE-601 when `uri` is user
% controlled ).
%
% kbgen names a chained builder call by the whole chain, so the sink is the
% exact Fqn of the `.location( .. )` link, not the `.build()` after it.
% ThingsBoard `BaseController#redirectTo` ( reached from the pre auth
% `AuthController#checkActivateToken` / `#checkResetToken` ) and
% `SignUpController#mobileLogin` ( OrenGitHub/dhscanner.runner#161 ).
%
% Same convention as the other open-redirect sinks : no taint check
% here, dataflow is composed on top.

sinks_open_redirect_java_spring(Call) :-
    kb_call_resolved(Call, 'org.springframework.http.ResponseEntity.status.location').
sinks_open_redirect_java_spring(Call) :-
    kb_call_resolved(Call, 'org.springframework.http.HttpHeaders.setLocation').
