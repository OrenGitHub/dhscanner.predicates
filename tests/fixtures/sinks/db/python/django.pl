% fixture : sinks/db/python/django.pl

% connection.cursor().execute( sql, params )
kb_call_resolved(startloc_40_9_endloc_40_50_weblate_slash_trans_slash_models_slash_unit_dot_py, 'django.db.connection.cursor.execute').
% connections[ alias ].cursor().executemany( sql, rows )
kb_call_resolved(startloc_41_9_endloc_41_55_weblate_slash_trans_slash_models_slash_unit_dot_py, 'django.db.connections.cursor.executemany').
% RawSQL( "SELECT ...", params )
kb_call_resolved(startloc_42_20_endloc_42_60_weblate_slash_trans_slash_models_slash_unit_dot_py, 'django.db.models.expressions.RawSQL').
% Unit.objects.raw( sql )
kb_call_resolved(startloc_43_9_endloc_43_40_weblate_slash_trans_slash_models_slash_unit_dot_py, 'weblate.trans.models.Unit.objects.raw').
% Unit.objects.filter( ... ).extra( where = [ ... ] )
kb_call_resolved(startloc_44_9_endloc_44_70_weblate_slash_trans_slash_models_slash_unit_dot_py, 'weblate.trans.models.Unit.objects.filter.extra').

% cursor.fetchall() : no sql text
kb_call_resolved(startloc_50_9_endloc_50_30_weblate_slash_trans_slash_models_slash_unit_dot_py, 'django.db.connection.cursor.fetchall').
% Unit.objects.filter( pk = pk ) : parameterized ORM query
kb_call_resolved(startloc_51_9_endloc_51_40_weblate_slash_trans_slash_models_slash_unit_dot_py, 'weblate.trans.models.Unit.objects.filter').
% something.raw() not on a manager ( no `.objects` )
kb_call_resolved(startloc_52_9_endloc_52_30_weblate_slash_trans_slash_models_slash_unit_dot_py, 'Unknown.raw').

% raw cursor, exact fqns
must(sinks_sqli_python_django(startloc_40_9_endloc_40_50_weblate_slash_trans_slash_models_slash_unit_dot_py)).
must(sinks_sqli_python_django(startloc_41_9_endloc_41_55_weblate_slash_trans_slash_models_slash_unit_dot_py)).
% RawSQL expression
must(sinks_sqli_python_django(startloc_42_20_endloc_42_60_weblate_slash_trans_slash_models_slash_unit_dot_py)).
% ORM escape hatches, suffix match
must(sinks_sqli_python_django(startloc_43_9_endloc_43_40_weblate_slash_trans_slash_models_slash_unit_dot_py)).
must(sinks_sqli_python_django(startloc_44_9_endloc_44_70_weblate_slash_trans_slash_models_slash_unit_dot_py)).
% wired into the family api
must(sinks_sqli(startloc_40_9_endloc_40_50_weblate_slash_trans_slash_models_slash_unit_dot_py)).

must_not(sinks_sqli_python_django(startloc_50_9_endloc_50_30_weblate_slash_trans_slash_models_slash_unit_dot_py)).
must_not(sinks_sqli_python_django(startloc_51_9_endloc_51_40_weblate_slash_trans_slash_models_slash_unit_dot_py)).
must_not(sinks_sqli_python_django(startloc_52_9_endloc_52_30_weblate_slash_trans_slash_models_slash_unit_dot_py)).
must_not(sinks_sqli(startloc_51_9_endloc_51_40_weblate_slash_trans_slash_models_slash_unit_dot_py)).
