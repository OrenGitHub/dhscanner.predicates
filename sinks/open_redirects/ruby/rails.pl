:- style_check(-singleton).

% -----------------------------------------------------------------------------
% sinks_open_redirect_ruby_rails( Call )
%
% `redirect_to` in a Rails controller ( runner #154 ). It is a method of
% ActionController ( ActionController::Redirecting ), inherited by every
% controller and called on the implicit self, so it reaches the kb as a
% receiverless call :
%
%   # enterprise/app/controllers/api/v1/auth_controller.rb ( Chatwoot )
%   class Api::V1::AuthController < Api::BaseController   # < ApplicationController < ActionController::Base
%     def saml_login
%       ...
%       redirect_to saml_initiation_url, status: :temporary_redirect
%
%   kb_call_resolved( Call, redirect_to )
%
% Structural, like the Rails user input ( endpoints/ruby/rails.pl ) : the
% call is in a method ( or a block of one ) of a class whose super chain
% reaches `ActionController.Base`. A `redirect_to` a class defines itself is
% no controller's. Rails 7 refuses another host unless `allow_other_host: true`
% ; that is the sanitizer's business, not the sink's.
%
% No taint check here, dataflow is composed on top.
% -----------------------------------------------------------------------------

sinks_open_redirect_ruby_rails(Call) :-
    kb_call_resolved(Call, Method),
    rails_redirect_method(Method),
    kb_called_from(Call, Caller),
    callgraph_enclosing_method(Caller, Enclosing),
    kb_method_of_class(Enclosing, Class),
    endpoints_action_controller_rails(Class).

rails_redirect_method(redirect_to).
