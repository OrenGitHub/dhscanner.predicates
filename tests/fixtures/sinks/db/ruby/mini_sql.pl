% fixture : sinks/db/ruby/mini_sql.pl

% lib/mini_sql_multisite_connection.rb
% class MiniSqlMultisiteConnection < MiniSql::ActiveRecordPostgres::Connection
kb_class_def(startloc_3_39_endloc_3_65_lib_slash_mini_sql_multisite_connection_dot_rb, 'MiniSqlMultisiteConnection', 'lib/mini_sql_multisite_connection.rb').
kb_class_has_3rd_party_super(startloc_3_39_endloc_3_65_lib_slash_mini_sql_multisite_connection_dot_rb, 'MiniSql.ActiveRecordPostgres.Connection', 'MiniSql.ActiveRecordPostgres.Connection').

% config/initializers/000-mini_sql.rb
% ::DB = MiniSqlMultisiteConnection.instance
kb_assign_value_to_toplevel_varname(startloc_4_81_endloc_4_116_config_slash_initializers_slash_000_dash_mini_sql_dot_rb, 'DB', 'config/initializers/000-mini_sql.rb', 'config/initializers').
kb_call_method_of_class(startloc_4_81_endloc_4_116_config_slash_initializers_slash_000_dash_mini_sql_dot_rb, instance, startloc_3_39_endloc_3_65_lib_slash_mini_sql_multisite_connection_dot_rb).

% app/jobs/onceoff/clean_up_post_timings.rb
% DB.exec <<~SQL ...
kb_call_resolved(startloc_8_275_endloc_17_548_app_slash_jobs_slash_onceoff_slash_clean_up_post_timings_dot_rb, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "config/initializers/000-mini_sql.rb", firstPartyImportedName = Just "DB"}).exec').
% DB.transaction_open? : sends no sql
kb_call_resolved(startloc_20_600_endloc_20_620_app_slash_jobs_slash_onceoff_slash_clean_up_post_timings_dot_rb, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "config/initializers/000-mini_sql.rb", firstPartyImportedName = Just "DB"}).transaction_open?').

% lib/raw.rb
% RAW = MiniSql::Connection.get( pg )
kb_assign_value_to_toplevel_varname(startloc_2_6_endloc_2_35_lib_slash_raw_dot_rb, 'RAW', 'lib/raw.rb', lib).
kb_call_resolved(startloc_2_6_endloc_2_35_lib_slash_raw_dot_rb, 'MiniSql.Connection.get').
% RAW.query( sql )
kb_call_resolved(startloc_9_4_endloc_9_18_app_slash_models_slash_report_dot_rb, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "lib/raw.rb", firstPartyImportedName = Just "RAW"}).query').

% lib/cache.rb
% class Cache < Redis ; CACHE = Cache.new
kb_class_def(startloc_1_6_endloc_1_11_lib_slash_cache_dot_rb, 'Cache', 'lib/cache.rb').
kb_class_has_3rd_party_super(startloc_1_6_endloc_1_11_lib_slash_cache_dot_rb, 'Redis', 'Redis').
kb_assign_value_to_toplevel_varname(startloc_5_8_endloc_5_17_lib_slash_cache_dot_rb, 'CACHE', 'lib/cache.rb', lib).
kb_call_method_of_class(startloc_5_8_endloc_5_17_lib_slash_cache_dot_rb, new, startloc_1_6_endloc_1_11_lib_slash_cache_dot_rb).
% CACHE.exec( "..." ) : an exec, not of a mini_sql connection
kb_call_resolved(startloc_7_4_endloc_7_20_app_slash_models_slash_report_dot_rb, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "lib/cache.rb", firstPartyImportedName = Just "CACHE"}).exec').

% conn.exec( sql ) on an unresolved receiver
kb_call_resolved(startloc_11_4_endloc_11_18_app_slash_models_slash_report_dot_rb, 'Unknown.exec').

must(sinks_sqli_ruby_mini_sql(startloc_8_275_endloc_17_548_app_slash_jobs_slash_onceoff_slash_clean_up_post_timings_dot_rb)).
must(sinks_sqli_ruby_mini_sql(startloc_9_4_endloc_9_18_app_slash_models_slash_report_dot_rb)).
% wired into the family api
must(sinks_sqli(startloc_8_275_endloc_17_548_app_slash_jobs_slash_onceoff_slash_clean_up_post_timings_dot_rb)).

must_not(sinks_sqli_ruby_mini_sql(startloc_20_600_endloc_20_620_app_slash_jobs_slash_onceoff_slash_clean_up_post_timings_dot_rb)).
must_not(sinks_sqli_ruby_mini_sql(startloc_7_4_endloc_7_20_app_slash_models_slash_report_dot_rb)).
must_not(sinks_sqli_ruby_mini_sql(startloc_11_4_endloc_11_18_app_slash_models_slash_report_dot_rb)).
