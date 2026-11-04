% fixture : sinks/ssrf/python/native.pl

% requests.get( url )
kb_call_resolved(startloc_10_5_endloc_10_25_app_slash_views_dot_py, 'requests.get').
% httpx2.post( url )
kb_call_resolved(startloc_11_5_endloc_11_25_app_slash_views_dot_py, 'httpx2.post').
% requests.Session().get( url )
kb_call_resolved(startloc_12_5_endloc_12_35_app_slash_views_dot_py, 'requests.Session.get').
% httpx.Client().send( request )
kb_call_resolved(startloc_13_5_endloc_13_35_app_slash_views_dot_py, 'httpx.Client.send').
% urllib.request.urlopen( url )
kb_call_resolved(startloc_14_5_endloc_14_35_app_slash_views_dot_py, 'urllib.request.urlopen').

% urllib.request.Request( url ) : building a request is not sending it
kb_call_resolved(startloc_20_5_endloc_20_35_app_slash_views_dot_py, 'urllib.request.Request').
% a client kept in a variable : too generic
kb_call_resolved(startloc_21_5_endloc_21_25_app_slash_views_dot_py, 'Unknown.get').
% requests.send is not a module-level verb
kb_call_resolved(startloc_22_5_endloc_22_25_app_slash_views_dot_py, 'requests.send').

must(sinks_ssrf_python(startloc_10_5_endloc_10_25_app_slash_views_dot_py)).
must(sinks_ssrf_python(startloc_11_5_endloc_11_25_app_slash_views_dot_py)).
must(sinks_ssrf_python(startloc_12_5_endloc_12_35_app_slash_views_dot_py)).
must(sinks_ssrf_python(startloc_13_5_endloc_13_35_app_slash_views_dot_py)).
must(sinks_ssrf_python(startloc_14_5_endloc_14_35_app_slash_views_dot_py)).
% wired into the family api
must(sinks_ssrf(startloc_10_5_endloc_10_25_app_slash_views_dot_py)).

must_not(sinks_ssrf_python(startloc_20_5_endloc_20_35_app_slash_views_dot_py)).
must_not(sinks_ssrf_python(startloc_21_5_endloc_21_25_app_slash_views_dot_py)).
must_not(sinks_ssrf_python(startloc_22_5_endloc_22_25_app_slash_views_dot_py)).
must_not(sinks_ssrf(startloc_20_5_endloc_20_35_app_slash_views_dot_py)).
