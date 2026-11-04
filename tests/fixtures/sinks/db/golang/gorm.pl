% fixture : sinks/db/golang/gorm.pl
%
% NOT COVERABLE : the catalog's only predicate,
% sinks_has_prepared_statement_fqn_golang_gorm/1, reads kb_has_fqn/2, which
% kbgen never emits ( not in tests/kb_schema.pl, listed as known_undefined in
% tests/check.pl ). Calling it throws an existence error, so there is no
% must / must_not that exercises this file honestly. Left without cases on
% purpose : the maintainer decides whether to drop the predicate or move it
% onto a fact kbgen does emit ( e.g. kb_call_resolved/2 ).
