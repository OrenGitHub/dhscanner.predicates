:- style_check(-singleton).

% -----------------------------------------------------------------------------
% sinks_ssrf_csharp( Call )
%
% Outgoing http requests from C# ( System.Net.Http, WebClient, RestSharp ).
% The kb does not type C# receivers, so each sink is the exact spelling the
% kb gives the call :
%
%   new HttpRequestMessage( HttpMethod.Get, url )      'HttpRequestMessage'
%   var http = httpClientFactory.CreateClient() ;
%   await http.GetStringAsync( url, ct )               'Unknown.CreateClient.GetStringAsync'
%   new HttpClient().GetAsync( url )                   'HttpClient.GetAsync'
%   new WebClient().DownloadString( url )              'WebClient.DownloadString'
%   new RestClient( url )                              'RestClient'
%
% For `HttpRequestMessage` the constructor is where the url enters, so it is
% the sink ( the `SendAsync` that sends it may sit on any receiver ). An
% `HttpClient` the kb cannot type ( a field, an injected param ) reads
% 'Unknown.GetAsync', too generic to match on the method alone
% ( `IDistributedCache.GetStringAsync`, repositories' `GetAsync` ) : not
% covered yet, nor `WebRequest.Create( url )` ( 'Unknown.Create' ).
%
% No taint check here, dataflow is composed on top.
% -----------------------------------------------------------------------------

sinks_ssrf_csharp(Call) :-
    kb_call_resolved(Call, Fqn),
    csharp_ssrf_fqn(Fqn).

csharp_ssrf_fqn('HttpRequestMessage').
csharp_ssrf_fqn('RestClient').
csharp_ssrf_fqn(Fqn) :-
    csharp_http_client_receiver(Receiver),
    csharp_http_client_method(Method),
    atomic_list_concat([Receiver, Method], '.', Fqn).
csharp_ssrf_fqn(Fqn) :-
    csharp_web_client_method(Method),
    atomic_list_concat(['WebClient', Method], '.', Fqn).

% how the kb spells an HttpClient receiver it can tell apart
csharp_http_client_receiver('Unknown.CreateClient').   % IHttpClientFactory.CreateClient( .. )
csharp_http_client_receiver('HttpClient').             % new HttpClient( .. )

% HttpClient methods ( and System.Net.Http.Json extensions ) taking a url
csharp_http_client_method('GetAsync').
csharp_http_client_method('GetStringAsync').
csharp_http_client_method('GetStreamAsync').
csharp_http_client_method('GetByteArrayAsync').
csharp_http_client_method('PostAsync').
csharp_http_client_method('PutAsync').
csharp_http_client_method('PatchAsync').
csharp_http_client_method('DeleteAsync').
csharp_http_client_method('SendAsync').
csharp_http_client_method('Send').
csharp_http_client_method('GetFromJsonAsync').
csharp_http_client_method('PostAsJsonAsync').
csharp_http_client_method('PutAsJsonAsync').
csharp_http_client_method('PatchAsJsonAsync').
csharp_http_client_method('DeleteFromJsonAsync').

% System.Net.WebClient methods taking a url
csharp_web_client_method('DownloadString').
csharp_web_client_method('DownloadStringTaskAsync').
csharp_web_client_method('DownloadData').
csharp_web_client_method('DownloadDataTaskAsync').
csharp_web_client_method('DownloadFile').
csharp_web_client_method('DownloadFileTaskAsync').
csharp_web_client_method('OpenRead').
csharp_web_client_method('OpenReadTaskAsync').
csharp_web_client_method('UploadString').
csharp_web_client_method('UploadData').
csharp_web_client_method('UploadFile').
