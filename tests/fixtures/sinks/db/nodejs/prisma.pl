% fixture : sinks/db/nodejs/prisma.pl
%
% sinks_has_prepared_statement_fqn_nodejs_prisma/1 reads kb_has_fqn/2, which
% kbgen never emits ( known_undefined in tests/check.pl ), so it is not called
% here. Its pure fqn classifier prisma_prepared_statement_method_fqn/1 is.

% prisma.$queryRawUnsafe( `SELECT * FROM users WHERE id = ${id}` )
kb_call_resolved(startloc_10_17_endloc_10_70_src_slash_db_slash_users_dot_ts, '@prisma/client.PrismaClient.$queryRawUnsafe').
% prisma.$executeRawUnsafe( sql )
kb_call_resolved(startloc_11_17_endloc_11_50_src_slash_db_slash_users_dot_ts, '@prisma/client.PrismaClient.$executeRawUnsafe').
% prisma.$queryRaw`SELECT * FROM users WHERE id = ${id}`
kb_call_resolved(startloc_12_17_endloc_12_65_src_slash_db_slash_users_dot_ts, '@prisma/client.PrismaClient.$queryRaw').
% prisma.$executeRaw`UPDATE users SET ...`
kb_call_resolved(startloc_13_17_endloc_13_60_src_slash_db_slash_users_dot_ts, '@prisma/client.PrismaClient.$executeRaw').

% prisma.user.findMany( { where : { id } } ) : typed model method, no textual seam
kb_call_resolved(startloc_20_17_endloc_20_55_src_slash_db_slash_users_dot_ts, '@prisma/client.PrismaClient.user.findMany').
% client.$queryRawUnsafe( sql ) on an unresolved client : the raw shapes are exact fqns
kb_call_resolved(startloc_21_17_endloc_21_55_src_slash_db_slash_users_dot_ts, 'Unknown.$queryRawUnsafe').

% raw shapes, one clause per fqn
must(sinks_sqli_nodejs_prisma(startloc_10_17_endloc_10_70_src_slash_db_slash_users_dot_ts)).
must(sinks_sqli_nodejs_prisma(startloc_11_17_endloc_11_50_src_slash_db_slash_users_dot_ts)).
must(sinks_sqli_nodejs_prisma(startloc_12_17_endloc_12_65_src_slash_db_slash_users_dot_ts)).
must(sinks_sqli_nodejs_prisma(startloc_13_17_endloc_13_60_src_slash_db_slash_users_dot_ts)).
% wired into the family api
must(sinks_sqli(startloc_10_17_endloc_10_70_src_slash_db_slash_users_dot_ts)).
% prepared-statement classifier : PrismaClient prefix + a typed model verb tail
must(prisma_prepared_statement_method_fqn('@prisma/client.PrismaClient.user.findMany')).
must(prisma_prepared_statement_method_fqn('@prisma/client.PrismaClient.post.upsert')).

must_not(sinks_sqli_nodejs_prisma(startloc_20_17_endloc_20_55_src_slash_db_slash_users_dot_ts)).
must_not(sinks_sqli_nodejs_prisma(startloc_21_17_endloc_21_55_src_slash_db_slash_users_dot_ts)).
must_not(sinks_sqli(startloc_20_17_endloc_20_55_src_slash_db_slash_users_dot_ts)).
% raw entry points are not prepared statements
must_not(prisma_prepared_statement_method_fqn('@prisma/client.PrismaClient.$queryRawUnsafe')).
% a findMany outside @prisma/client ( another ORM ) is not prisma's
must_not(prisma_prepared_statement_method_fqn('typeorm.Repository.findMany')).
