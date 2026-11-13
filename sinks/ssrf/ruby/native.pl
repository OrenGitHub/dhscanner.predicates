:- style_check(-singleton).

% -----------------------------------------------------------------------------
% sinks_ssrf_ruby( Call )
%
% Outgoing http requests from Ruby ( runner #154 ), the module level calls of
% the common clients, as the kb spells them ( `::` is `.` ) :
%
%   HTTParty.get( url ) ...         'HTTParty.get'
%   RestClient.post( url, body )    'RestClient.post'
%   Net::HTTP.get( uri )            'Net.HTTP.get'
%   Faraday.get( url )              'Faraday.get'
%   OAuth2::Client.new( .. ).auth_code.get_token( code )
%                                   'OAuth2.Client.new.auth_code.get_token'
%
% Chatwoot `app/services/whatsapp/facebook_api_client.rb:38` :
%
%   response = HTTParty.get(
%     "#{BASE_URI}/#{@api_version}/#{waba_id}/phone_numbers", ...
%
% A connection object kept in a variable ( `conn = Faraday.new(..) ;
% conn.get(..)`, `http = Net::HTTP.new(..) ; http.request(..)` ) resolves
% to `Unknown.get` / `Unknown.request`, too generic to match on the method
% alone : not covered yet. Chatwoot : `HTTParty.<verb>` 90, `RestClient` 4.
%
% No taint check here, dataflow is composed on top.
% -----------------------------------------------------------------------------

sinks_ssrf_ruby(Call) :-
    kb_call_resolved(Call, Fqn),
    ruby_ssrf_fqn(Fqn).

ruby_ssrf_fqn(Fqn) :-
    ruby_http_module(Module, Verb),
    atomic_list_concat([Module, Verb], '.', Fqn).
ruby_ssrf_fqn('OAuth2.Client.new.auth_code.get_token').

% ruby_http_module( Module, Verb ) : `Module.Verb( url, .. )` sends a request
ruby_http_module(Module, Verb) :- ruby_http_verb_module(Module), ruby_http_verb(Verb).
ruby_http_module('Net.HTTP', get).
ruby_http_module('Net.HTTP', get_response).
ruby_http_module('Net.HTTP', post).
ruby_http_module('Net.HTTP', post_form).
ruby_http_module('Net.HTTP', start).

% modules with one class method per http verb
ruby_http_verb_module('HTTParty').
ruby_http_verb_module('RestClient').
ruby_http_verb_module('Faraday').

ruby_http_verb(get).
ruby_http_verb(post).
ruby_http_verb(put).
ruby_http_verb(patch).
ruby_http_verb(delete).
ruby_http_verb(head).
ruby_http_verb(options).
