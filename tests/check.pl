% -----------------------------------------------------------------------------
% dhscanner.predicates test harness.
%
% Run from the directory that CONTAINS this repo, checked out as `predicates/`
% ( the catalogs include each other as 'predicates/<family>/...', exactly as
% they do inside queryengine ) :
%
%     swipl predicates/tests/check.pl            % everything below
%     swipl predicates/tests/check.pl load       % 1. load gate only
%     swipl predicates/tests/check.pl fixtures   % 2. + 3. only
%
% 1. load gate : api.pl ( the root, including the six family api.pl files )
%    loads with no warnings or errors, every catalog .pl file is reached
%    from it, and every predicate a catalog calls is defined : by a catalog,
%    by SWI, by the KB ( tests/kb_schema.pl ) or by the host
%    ( tests/host.pl ). And every predicate the host calls ( host_calls/1
%    in tests/host.pl ) is defined.
% 2. coverage : every catalog file <F>.pl has tests/fixtures/<F>.pl with at
%    least one must/1 and at least one must_not/1.
% 3. fixtures : each fixture is a small KB ( kb_* facts from kb_schema.pl
%    only ) plus must( Goal ) / must_not( Goal ) expectations. Every must
%    goal has to succeed and every must_not goal has to fail against that KB
%    alone. Fixtures run one at a time, the KB is wiped in between.
% -----------------------------------------------------------------------------

:- use_module(library(lists)).
:- use_module(library(apply)).
:- use_module(library(filesex)).
:- use_module(library(prolog_codewalk)).

:- initialization(main, main).

% The root : includes the six family api.pl files, exactly what queryengine
% loads ( its utils.pl includes 'predicates/api' ).
root_api('predicates/api').

% Called by a catalog, defined nowhere. Each entry is a known bug kept so
% that v1.0.0 stays identical to queryengine's predicates/ ; fix it and
% remove the entry, never add one.
%
%   kb_has_fqn/2 : kbgen never emitted it. Only
%   sinks_has_prepared_statement_fqn/1 reads it, and nothing calls that.
known_undefined(kb_has_fqn/2).

% Catalog files whose fixture may have no must/1 / must_not/1, because
% nothing in them can be satisfied ( their fixture still has to exist and
% explain why ). Same rule as known_undefined/1 : only ever shrinks.
%
%   sinks/db/golang/gorm.pl : its only predicate reads kb_has_fqn/2.
fixture_exempt('sinks/db/golang/gorm.pl').

:- discontiguous step/1.

:- dynamic issue/2.        % issue( Where, Message )
:- dynamic collecting/1.   % collecting( Where ) while loading
:- dynamic undefined_call/2.

:- multifile user:message_hook/3.
user:message_hook(Term, Kind, _Lines) :-
    memberchk(Kind, [warning, error]),
    collecting(Where),
    message_to_codes(Term, Kind, Codes),
    atom_codes(Message, Codes),
    assertz(issue(Where, Message)),
    fail.

message_to_codes(Term, _Kind, Codes) :-
    catch(( message_to_codes(Term, Codes0), Codes = Codes0 ), _, fail), !.
message_to_codes(Term, _Kind, Codes) :-
    format(codes(Codes), '~q', [Term]).

message_to_codes(Term, Codes) :-
    '$messages':translate_message(Term, Lines, []),
    with_output_to(codes(Codes), print_message_lines(current_output, '', Lines)).

% -----------------------------------------------------------------------------
% entry

main :-
    current_prolog_flag(argv, Argv),
    ( Argv = []           -> Steps = [load, coverage, fixtures]
    ; Argv = [load]       -> Steps = [load]
    ; Argv = [fixtures]   -> Steps = [coverage, fixtures]
    ; format(user_error, 'usage: swipl predicates/tests/check.pl [load|fixtures]~n', []),
      halt(2)
    ),
    goto_base,
    load_everything,
    foldl(run_step, Steps, ok, Status),
    ( Status == ok -> format('~nall checks passed~n'), halt(0)
    ; format('~nFAILED~n'), halt(1)
    ).

run_step(Step, S0, S) :-
    format('~n== ~w~n', [Step]),
    ( step(Step) -> S = S0 ; S = failed ).

% -----------------------------------------------------------------------------
% layout

goto_base :-
    source_file(main, ThisFile),
    file_directory_name(ThisFile, TestsDir),
    file_directory_name(TestsDir, Root),
    file_base_name(Root, RootName),
    ( RootName == predicates -> true
    ; format(user_error,
             'error: the repo must be checked out as a directory named `predicates` ( found `~w` )~n',
             [RootName]),
      halt(2)
    ),
    file_directory_name(Root, Base),
    working_directory(_, Base),
    nb_setval(root, Root).

root(Root) :- nb_getval(root, Root).

catalog_file(Rel) :-
    root(Root),
    directory_member(Root, Abs, [recursive(true), extensions([pl])]),
    atom_concat(Root, '/', Prefix),
    atom_concat(Prefix, Rel, Abs),
    \+ sub_atom(Rel, 0, _, _, 'tests/'),
    \+ sub_atom(Rel, 0, _, _, '.').

% -----------------------------------------------------------------------------
% loading

load_everything :-
    root(Root),
    directory_file_path(Root, 'tests/kb_schema.pl', Schema),
    directory_file_path(Root, 'tests/host.pl', Host),
    ensure_loaded(user:Schema),
    ensure_loaded(user:Host),
    assertz(collecting(load)),
    root_api(Api),
    load_files(user:Api, []),
    retractall(collecting(_)),
    find_undefined_calls.

find_undefined_calls :-
    prolog_walk_code([ undefined(trace),
                       on_trace(record_undefined),
                       source(false)
                     ]).

called_from_catalog(Caller) :-
    root(Root),
    atom_concat(Root, '/', Prefix),
    catch(predicate_property(Caller, file(File)), _, fail),
    atom_concat(Prefix, Rel, File),
    \+ sub_atom(Rel, 0, _, _, 'tests/').

record_undefined(Callee, Caller, _Location) :-
    called_from_catalog(Caller),
    strip_module(Callee, _, Head),
    functor(Head, Name, Arity),
    PI = Name/Arity,
    ( undefined_call(PI, _) -> true
    ; assertz(undefined_call(PI, Caller))
    ).

% -----------------------------------------------------------------------------
% 1. load gate

step(load) :-
    findall(M, issue(load, M), LoadIssues),
    forall(member(M, LoadIssues), format('  load : ~w~n', [M])),
    findall(Rel, ( catalog_file(Rel), \+ loaded_catalog(Rel) ), Unwired),
    forall(member(Rel, Unwired),
           format('  not reached from its family api.pl : ~w~n', [Rel])),
    findall(PI-Caller,
            ( undefined_call(PI, Caller), \+ known_undefined(PI) ),
            Undefined),
    forall(member(PI-Caller, Undefined),
           format('  undefined : ~w ( called by ~q )~n', [PI, Caller])),
    forall(( known_undefined(PI), \+ undefined_call(PI, _) ),
           format('  known_undefined(~w) is defined now, drop it from tests/check.pl~n', [PI])),
    findall(PI, ( host_calls(PI), \+ defined_by_catalog(PI) ), MissingApi),
    forall(member(PI, MissingApi),
           format('  queryengine calls ~w, no catalog defines it ( tests/host.pl )~n', [PI])),
    LoadIssues == [], Unwired == [], Undefined == [], MissingApi == [],
    \+ ( known_undefined(PI), \+ undefined_call(PI, _) ),
    aggregate_all(count, catalog_file(_), N),
    format('  ok : ~w catalog files load cleanly~n', [N]).

defined_by_catalog(Name/Arity) :-
    functor(Head, Name, Arity),
    predicate_property(user:Head, file(File)),
    root(Root),
    atom_concat(Root, '/', Prefix),
    atom_concat(Prefix, Rel, File),
    \+ sub_atom(Rel, 0, _, _, 'tests/').

loaded_catalog(Rel) :-
    root(Root),
    directory_file_path(Root, Rel, Abs),
    source_file(Abs).

% -----------------------------------------------------------------------------
% 2. coverage

fixture_path(Rel, Abs) :-
    root(Root),
    atom_concat('tests/fixtures/', Rel, FixtureRel),
    directory_file_path(Root, FixtureRel, Abs).

step(coverage) :-
    findall(Rel, catalog_file(Rel), Catalogs),
    include(missing_fixture, Catalogs, Missing),
    forall(member(Rel, Missing),
           ( fixture_path(Rel, Abs),
             format('  no fixture for ~w ( expected ~w )~n', [Rel, Abs]) )),
    findall(Rel, ( fixture_file(Rel), \+ catalog_file(Rel) ), Orphans),
    forall(member(Rel, Orphans),
           format('  fixture with no catalog : tests/fixtures/~w~n', [Rel])),
    Missing == [], Orphans == [],
    length(Catalogs, N),
    format('  ok : all ~w catalog files have a fixture~n', [N]).

missing_fixture(Rel) :-
    fixture_path(Rel, Abs),
    \+ exists_file(Abs).

fixture_file(Rel) :-
    root(Root),
    directory_file_path(Root, 'tests/fixtures', Dir),
    exists_directory(Dir),
    directory_member(Dir, Abs, [recursive(true), extensions([pl])]),
    atom_concat(Dir, '/', Prefix),
    atom_concat(Prefix, Rel, Abs).

% -----------------------------------------------------------------------------
% 3. fixtures

step(fixtures) :-
    findall(Rel, ( catalog_file(Rel), \+ missing_fixture(Rel) ), Rels),
    msort(Rels, Sorted),
    foldl(run_fixture, Sorted, 0, Failed),
    length(Sorted, N),
    ( Failed =:= 0 -> format('  ok : ~w fixtures pass~n', [N])
    ; format('  ~w of ~w fixtures fail~n', [Failed, N]), fail
    ).

run_fixture(Rel, F0, F) :-
    fixture_path(Rel, Abs),
    reset_kb,
    read_fixture(Abs, Terms, ReadErrors),
    partition(is_must, Terms, Musts, Rest0),
    partition(is_must_not, Rest0, MustNots, Facts),
    exclude(is_kb_fact, Facts, Stray),
    maplist(assert_fact, Facts),
    maplist(check_must, Musts, R1),
    maplist(check_must_not, MustNots, R2),
    append([ReadErrors, R1, R2], Results0),
    exclude(==(ok), Results0, Problems0),
    findall(stray(T), member(T, Stray), StrayProblems),
    ( fixture_exempt(Rel)
    -> ( Musts == [], MustNots == [] -> P1 = [], P2 = [] ; P1 = [exempt_has_cases], P2 = [] )
    ;  ( Musts == []    -> P1 = [no_must]     ; P1 = [] ),
       ( MustNots == [] -> P2 = [no_must_not] ; P2 = [] )
    ),
    append([Problems0, StrayProblems, P1, P2], Problems),
    length(Musts, NM), length(MustNots, NN),
    ( Problems == []
    -> format('  ok   ~w ( ~w must, ~w must_not )~n', [Rel, NM, NN]), F = F0
    ;  format('  FAIL ~w~n', [Rel]),
       forall(member(P, Problems), ( format('         '), report(P) )),
       F is F0 + 1
    ),
    reset_kb.

is_must(must(_)).
is_must_not(must_not(_)).

is_kb_fact(T) :-
    callable(T), T \= (_ :- _), T \= (:- _),
    functor(T, Name, Arity),
    kb_schema_fact(Name/Arity).

assert_fact(T) :- ( is_kb_fact(T) -> assertz(user:T) ; true ).

check_must(must(G), R) :-
    catch(( once(user:G) -> R = ok ; R = must_failed(G) ), E, R = error(G, E)).

check_must_not(must_not(G), R) :-
    catch(( user:G -> R = must_not_succeeded(G) ; R = ok ), E, R = error(G, E)).

report(must_failed(G))         :- format('must ~q : no answer~n', [G]).
report(must_not_succeeded(G))  :- format('must_not ~q : has an answer~n', [G]).
report(error(G, E))            :- message_to_codes(E, error, C), format('~q : ~s~n', [G, C]).
report(stray(T))               :- format('not a kb_schema.pl fact, must/1 or must_not/1 : ~q~n', [T]).
report(read_error(E))          :- message_to_codes(E, error, C), format('syntax : ~s~n', [C]).
report(no_must)                :- format('needs at least one must/1~n').
report(no_must_not)            :- format('needs at least one must_not/1~n').
report(exempt_has_cases)       :- format('has cases now, drop it from fixture_exempt/1 in tests/check.pl~n').

read_fixture(Abs, Terms, Errors) :-
    setup_call_cleanup(
        open(Abs, read, In),
        read_terms(In, Terms, Errors),
        close(In)).

read_terms(In, Terms, Errors) :-
    catch(read_term(In, T, []), E, true),
    ( nonvar(E)          -> Terms = [], Errors = [read_error(E)]
    ; T == end_of_file   -> Terms = [], Errors = []
    ; Terms = [T|Ts], read_terms(In, Ts, Errors)
    ).

reset_kb :-
    forall(kb_schema_fact(Name/Arity),
           ( functor(H, Name, Arity), retractall(user:H) )),
    abolish_all_tables.
