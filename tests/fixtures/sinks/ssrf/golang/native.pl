% fixture : sinks/ssrf/golang/native.pl

% http.Get( url )
kb_call_resolved(startloc_25_14_endloc_25_28_internal_slash_fetch_slash_client_dot_go, 'net/http.Get').

% http.NewRequest( "GET", url, nil ) : building a request is not sending it
kb_call_resolved(startloc_26_14_endloc_26_45_internal_slash_fetch_slash_client_dot_go, 'net/http.NewRequest').
% http.Post( url, contentType, body ) : not in the catalog
kb_call_resolved(startloc_27_14_endloc_27_50_internal_slash_fetch_slash_client_dot_go, 'net/http.Post').

must(sinks_http_request_golang(startloc_25_14_endloc_25_28_internal_slash_fetch_slash_client_dot_go)).
% wired into the family api ( sinks_http_request/1, not sinks_ssrf/1 )
must(sinks_http_request(startloc_25_14_endloc_25_28_internal_slash_fetch_slash_client_dot_go)).

must_not(sinks_http_request_golang(startloc_26_14_endloc_26_45_internal_slash_fetch_slash_client_dot_go)).
must_not(sinks_http_request_golang(startloc_27_14_endloc_27_50_internal_slash_fetch_slash_client_dot_go)).
must_not(sinks_http_request(startloc_26_14_endloc_26_45_internal_slash_fetch_slash_client_dot_go)).
