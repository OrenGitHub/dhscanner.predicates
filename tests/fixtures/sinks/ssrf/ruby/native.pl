% fixture : sinks/ssrf/ruby/native.pl

% HTTParty.get( "#{BASE_URI}/#{@api_version}/#{waba_id}/phone_numbers" )   Chatwoot facebook_api_client.rb:38
kb_call_resolved(startloc_38_1221_endloc_42_1412_app_slash_services_slash_whatsapp_slash_facebook_api_client_dot_rb, 'HTTParty.get').
% RestClient.post( url, body )
kb_call_resolved(startloc_10_5_endloc_10_40_app_slash_services_slash_hook_dot_rb, 'RestClient.post').
% Net::HTTP.get_response( uri )
kb_call_resolved(startloc_11_5_endloc_11_40_app_slash_services_slash_hook_dot_rb, 'Net.HTTP.get_response').
% Faraday.get( url )
kb_call_resolved(startloc_12_5_endloc_12_30_app_slash_services_slash_hook_dot_rb, 'Faraday.get').
% OAuth2::Client.new( .. ).auth_code.get_token( code )
kb_call_resolved(startloc_13_5_endloc_13_70_app_slash_services_slash_hook_dot_rb, 'OAuth2.Client.new.auth_code.get_token').

% building a connection is not a request
kb_call_resolved(startloc_20_5_endloc_20_30_app_slash_services_slash_hook_dot_rb, 'Faraday.new').
kb_call_resolved(startloc_21_5_endloc_21_30_app_slash_services_slash_hook_dot_rb, 'Net.HTTP.new').
% a method of the response, not a request
kb_call_resolved(startloc_22_5_endloc_22_30_app_slash_services_slash_hook_dot_rb, 'HTTParty.get.success?').
% a client of unknown type : too generic
kb_call_resolved(startloc_23_5_endloc_23_30_app_slash_services_slash_hook_dot_rb, 'Unknown.get').
kb_call_resolved(startloc_24_5_endloc_24_30_app_slash_services_slash_hook_dot_rb, 'Unknown.auth_code.get_token').
% not an http verb
kb_call_resolved(startloc_25_5_endloc_25_30_app_slash_services_slash_hook_dot_rb, 'HTTParty.parse').

must(sinks_ssrf_ruby(startloc_38_1221_endloc_42_1412_app_slash_services_slash_whatsapp_slash_facebook_api_client_dot_rb)).
must(sinks_ssrf_ruby(startloc_10_5_endloc_10_40_app_slash_services_slash_hook_dot_rb)).
must(sinks_ssrf_ruby(startloc_11_5_endloc_11_40_app_slash_services_slash_hook_dot_rb)).
must(sinks_ssrf_ruby(startloc_12_5_endloc_12_30_app_slash_services_slash_hook_dot_rb)).
must(sinks_ssrf_ruby(startloc_13_5_endloc_13_70_app_slash_services_slash_hook_dot_rb)).
% wired into the family api
must(sinks_ssrf(startloc_38_1221_endloc_42_1412_app_slash_services_slash_whatsapp_slash_facebook_api_client_dot_rb)).

must_not(sinks_ssrf_ruby(startloc_20_5_endloc_20_30_app_slash_services_slash_hook_dot_rb)).
must_not(sinks_ssrf_ruby(startloc_21_5_endloc_21_30_app_slash_services_slash_hook_dot_rb)).
must_not(sinks_ssrf_ruby(startloc_22_5_endloc_22_30_app_slash_services_slash_hook_dot_rb)).
must_not(sinks_ssrf_ruby(startloc_23_5_endloc_23_30_app_slash_services_slash_hook_dot_rb)).
must_not(sinks_ssrf_ruby(startloc_24_5_endloc_24_30_app_slash_services_slash_hook_dot_rb)).
must_not(sinks_ssrf_ruby(startloc_25_5_endloc_25_30_app_slash_services_slash_hook_dot_rb)).
