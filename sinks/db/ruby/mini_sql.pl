:- style_check(-singleton).
:- dynamic kb_call_method_of_1st_party_imported_name/4.

% -----------------------------------------------------------------------------
% sinks_sqli_ruby_mini_sql( Call )
%
% Raw sql sent through the mini_sql gem ( https://github.com/discourse/mini_sql ).
% A connection is an instance of one of its connection classes, or of a 1st
% party subclass of one. Discourse ( OrenGitHub/dhscanner.runner#142 ) :
%
%   # lib/mini_sql_multisite_connection.rb
%   class MiniSqlMultisiteConnection < MiniSql::ActiveRecordPostgres::Connection
%     def self.instance ...
%
%   # config/initializers/000-mini_sql.rb
%   ::DB = MiniSqlMultisiteConnection.instance
%
%   # app/jobs/onceoff/clean_up_post_timings.rb
%   DB.exec <<~SQL ...
%
% The ruby front binds `DB`, in every file that uses it, to the file that
% assigns it, and the call reaches the kb as
%
%   kb_call_method_of_1st_party_imported_name( Call, exec, 'DB', 'config/initializers/000-mini_sql.rb' )
%   kb_assign_value_to_toplevel_varname( Value, 'DB', 'config/initializers/000-mini_sql.rb', _ )
%   kb_call_method_of_class( Value, instance, Class )
%   kb_class_has_3rd_party_super( Class, _, 'MiniSql.ActiveRecordPostgres.Connection' )
%
% Bound params ( `DB.exec( "... :id", id: 1 )` ) are quoted by the gem, the
% sql text ( `mini_sql_sql_arg/2` ) is what a sink receives. No taint check
% here, dataflow is composed on top.
% -----------------------------------------------------------------------------

sinks_sqli_ruby_mini_sql(Call) :-
    kb_call_method_of_1st_party_imported_name(Call, Method, Name, File),
    mini_sql_sql_arg(Method, _),
    kb_assign_value_to_toplevel_varname(Value, Name, File, _),
    mini_sql_connection_value(Value).

% `MiniSqlMultisiteConnection.instance` : a connection of a 1st party subclass
mini_sql_connection_value(Value) :-
    kb_call_method_of_class(Value, Constructor, Class),
    mini_sql_constructor(Constructor),
    kb_class_has_3rd_party_super(Class, _, Super),
    mini_sql_connection(Super).
% `MiniSql::Connection.get( pg )` : a connection of the gem itself
mini_sql_connection_value(Value) :-
    mini_sql_connection(Connection),
    mini_sql_constructor(Constructor),
    atomic_list_concat([Connection, Constructor], '.', Fqn),
    kb_call_resolved(Value, Fqn).

% the gem's connection classes ( mini_sql 1.6.0 ), as the kb spells them
mini_sql_connection('MiniSql.Connection').
mini_sql_connection('MiniSql.Postgres.Connection').
mini_sql_connection('MiniSql.Postgres.PreparedConnection').
mini_sql_connection('MiniSql.ActiveRecordPostgres.Connection').
mini_sql_connection('MiniSql.Sqlite.Connection').
mini_sql_connection('MiniSql.Sqlite.PreparedConnection').
mini_sql_connection('MiniSql.Mysql.Connection').
mini_sql_connection('MiniSql.Mysql.PreparedConnection').

% what returns a connection : the gem's `get` / `new`, a singleton `instance`
mini_sql_constructor(new).
mini_sql_constructor(get).
mini_sql_constructor(instance).

% mini_sql_sql_arg( Method, I ) : `Method` sends its i-th argument as sql
mini_sql_sql_arg(exec, 0).
mini_sql_sql_arg(query, 0).
mini_sql_sql_arg(query_single, 0).
mini_sql_sql_arg(query_hash, 0).
mini_sql_sql_arg(query_array, 0).
mini_sql_sql_arg(query_each, 0).
mini_sql_sql_arg(query_each_hash, 0).
mini_sql_sql_arg(query_decorator, 1).
mini_sql_sql_arg(build, 0).
