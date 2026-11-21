:- style_check(-singleton).

% -----------------------------------------------------------------------------
% sinks_sqli_csharp( Call )
%
% Raw sql from C# : Entity Framework Core's `*Raw` methods and the ADO.NET
% command constructors. The kb does not type C# receivers, so each sink is
% the exact spelling the kb gives the call :
%
%   dbContext.Database.ExecuteSqlRawAsync( sql, ct )    'Unknown.Database.ExecuteSqlRawAsync'
%   Database.ExecuteSqlRaw( sql )   ( in a DbContext )  'Unknown.ExecuteSqlRaw'
%   dbContext.Database.SqlQueryRaw<T>( sql, .. )        'Unknown.Database.SqlQueryRaw'
%   dbContext.Set<T>().FromSqlRaw( sql, parameters )    'Unknown.Set.FromSqlRaw'
%   ( await CreateDbContextAsync() ).Set<T>()
%     .FromSqlRaw( sql )                                'Unknown.CreateDbContextAsync.Set.FromSqlRaw'
%   query.FromSqlRaw( sql )                             'Unknown.FromSqlRaw'
%   new SqlCommand( sql, connection )                   'SqlCommand'
%
% The `*Raw` methods take the sql text as given ; their interpolated
% siblings ( `FromSql`, `ExecuteSql`, `SqlQuery` ) turn every `{x}` into a
% db parameter and are not sinks. A `DbSet` property ( `db.Users.FromSqlRaw` )
% reads 'Unknown.Users.FromSqlRaw', a name per property : not covered yet,
% nor Dapper ( `connection.Query( sql )` reads 'Unknown.Query' ).
%
% No taint check here, dataflow is composed on top.
% -----------------------------------------------------------------------------

sinks_sqli_csharp(Call) :-
    kb_call_resolved(Call, Fqn),
    csharp_sql_fqn(Fqn).

csharp_sql_fqn(Fqn) :-
    csharp_sql_receiver(Receiver, Kind),
    csharp_sql_raw_method(Kind, Method),
    atomic_list_concat([Receiver, Method], '.', Fqn).
csharp_sql_fqn(Fqn) :-
    csharp_sql_command(Fqn).

% how the kb spells a DatabaseFacade / IQueryable receiver it can tell apart
csharp_sql_receiver('Unknown.Database', facade).
csharp_sql_receiver('Unknown', facade).
csharp_sql_receiver('Unknown.Set', queryable).
csharp_sql_receiver('Unknown.CreateDbContextAsync.Set', queryable).
csharp_sql_receiver('Unknown', queryable).

csharp_sql_raw_method(facade, 'ExecuteSqlRaw').
csharp_sql_raw_method(facade, 'ExecuteSqlRawAsync').
csharp_sql_raw_method(facade, 'SqlQueryRaw').
csharp_sql_raw_method(queryable, 'FromSqlRaw').

% ADO.NET commands : the constructor's first arg is the command text
csharp_sql_command('SqlCommand').          % Microsoft.Data.SqlClient / System.Data.SqlClient
csharp_sql_command('NpgsqlCommand').
csharp_sql_command('MySqlCommand').
csharp_sql_command('SqliteCommand').
csharp_sql_command('OracleCommand').
csharp_sql_command('SqlDataAdapter').
