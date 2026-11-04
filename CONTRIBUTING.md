# Contributing

PRs adding **sinks, sanitizers, endpoints and auth recognizers** are welcome.
This repo is unprivileged: it has no secrets and publishes nothing. A merged
PR reaches scans only after the maintainer tags a release and moves the
`predicates` submodule pointer in
[dhscanner.service.queryengine](https://github.com/OrenGitHub/dhscanner.service.queryengine).

## Layout

```
<family>/api.pl                       family entry points, includes every leaf
<family>/<kind>/<language>/<lib>.pl   one leaf per kind / language / framework
tests/check.pl                        the harness ( load gate + fixtures )
tests/kb_schema.pl                    the kb_* facts kbgen emits ( the KB contract )
tests/host.pl                         what queryengine calls, and the helpers it lends
tests/fixtures/<same path as the leaf>
```

Families: `sinks`, `sanitizers`, `endpoints`, `auth`, `dataflow`, `callgraph`.
For example, `sinks/ssrf/python/native.pl` recognizes outgoing HTTP requests
from Python's `requests` / `httpx` / `urllib`.

The catalogs read **only** the KB that
[kbgen](https://hackage.haskell.org/package/dhscanner-kbgen) emits for a scanned
repo: `kb_*` facts about calls, functions, classes, params, constants and
dataflow edges, keyed by location atoms such as
`startloc_10_5_endloc_10_25_app_slash_views_dot_py`. `tests/kb_schema.pl` lists
every fact with its arity.

## Adding a sink ( the same steps apply to the other families )

1. **Find or create the leaf.** A new library for an existing kind and
   language goes into a new file, e.g. `sinks/ssrf/python/aiohttp.pl`. A new
   FQN for a library that already has a leaf goes into that leaf.
2. **Define the leaf entry point**, named
   `<family>_<kind>_<language>[_<lib>]/N`, e.g. `sinks_ssrf_python_aiohttp/1`.
   Give helper predicates the same prefix, or `<language>_<kind>_...`: every
   file loads into the same module, so a short helper name like `verb/1`
   collides with other files.
3. **Wire it into the family's `api.pl`.** Add an include for the new file
   ( `:- [ 'predicates/sinks/ssrf/python/aiohttp' ].` ) next to its siblings,
   and a clause in the family entry point:
   ```prolog
   sinks_ssrf(Call) :- sinks_ssrf_python_aiohttp(Call).
   ```
4. **Add a fixture** at `tests/fixtures/sinks/ssrf/python/aiohttp.pl`
   ( see below ).
5. **Run the checks** ( see below ) and open the PR. Mention a real repo and
   source line where the sink shows up, if you have one.

### Rules

- Read `kb_*` facts only, and only the ones in `tests/kb_schema.pl`. If you
  need a fact kbgen doesn't emit yet, open an issue in
  [dhscanner.runner](https://github.com/OrenGitHub/dhscanner.runner/issues) instead.
- **Never define a predicate whose name starts with `kb_`.** That prefix
  belongs to the KB.
- Use SWI built-ins, not the host helpers in `tests/host.pl`.
- No `assert` / `retract` / global variables. `:- table` is fine for
  recursive predicates.
- Comment the leaf: which source shapes it recognizes, which near misses it
  deliberately skips, and where it was first seen.
- No taint or dataflow logic inside a sink. Sinks only say "this call is
  dangerous"; dataflow is composed on top.

## Fixtures

Every catalog file `<F>.pl` has a fixture `tests/fixtures/<F>.pl`. A fixture
is a tiny hand-written KB plus expectations, and contains only:

- `kb_*` facts from `tests/kb_schema.pl`
- `must( Goal ).`: Goal must succeed against this KB
- `must_not( Goal ).`: Goal must fail against this KB

It needs **at least one `must` and one `must_not`**:

- one `must` per shape the leaf recognizes ( per clause body shape or FQN
  family, not one per atom )
- one `must` on the family entry point ( e.g. `sinks_ssrf/1` ), which proves
  the wiring
- `must_not` cases are **near misses** that the leaf's comments say it skips
  ( building a request object without sending it, a client kept in a
  variable, the wrong annotation, ... ), not unrelated junk

Use location atoms in the same format kbgen emits
( `startloc_<line>_<col>_endloc_<line>_<col>_<path>`, with `/` written as
`_slash_` and `.` as `_dot_` ). File and dir *arguments* ( e.g. the
DefinedInFile of `kb_func_def/4` ) are raw paths, as kbgen writes them:
`'app/api/users/route.ts'`. Some catalogs inspect both.

The worked example is
[`tests/fixtures/sinks/ssrf/python/native.pl`](tests/fixtures/sinks/ssrf/python/native.pl).

## Running the checks

The catalogs include each other as `'predicates/<family>/...'`, so the repo has
to be checked out in a directory named `predicates`, and swipl runs from its
parent directory. CI uses Ubuntu 24.04's `swi-prolog-nox` ( 9.0.4 ), the
same build that runs in production:

```sh
git clone https://github.com/<you>/dhscanner.predicates predicates
docker run --rm -v "$PWD/predicates:/w/predicates:ro" -w /w ubuntu:24.04 \
  sh -c 'apt-get update -qq && apt-get install -y -qq swi-prolog-nox >/dev/null && swipl predicates/tests/check.pl'
```

If swipl is installed locally, run `swipl predicates/tests/check.pl` from the
parent directory.

`check.pl` fails on:

- any warning or error while loading ( e.g. discontiguous clauses )
- a catalog file not included from its family `api.pl`
- a call to a predicate nobody defines ( catches `kb_*` typos )
- a predicate queryengine calls ( `host_calls/1` ) going missing
- a missing fixture, or one without a `must` / `must_not`
- a `must` without an answer, or a `must_not` with one

## Versioning

Releases are semver git tags ( `vX.Y.Z` ), and every release has an entry in
[`CHANGELOG.md`](CHANGELOG.md):

- **patch**: fixes to existing recognizers ( fewer false positives or
  negatives ) with no new coverage
- **minor**: new sinks / sanitizers / endpoints / auth recognizers, or new
  shapes in existing ones
- **major**: a predicate in `host_calls/1` is renamed, removed, or changes
  arity or argument meaning, **or** the release needs a newer kbgen
  ( `tests/kb_schema.pl` changed ). queryengine has to change with it.

Each CHANGELOG entry records the kbgen version the release targets.
