# Changelog

Semver, see [CONTRIBUTING.md](CONTRIBUTING.md#versioning). Every release
records the kbgen version whose `kb_*` facts it targets ( `tests/kb_schema.pl` ).

## v1.2.0

Targets: dhscanner-kbgen 2.4.0.

queryengine drops its utils.pl ( the CVE-detection queries behind
`/querycheck` ) ; what the kbapi templates still need moves here.

- `callgraph/reach.pl`: `callgraph_reaches_call_bounded/3`, the bounded
  breadth-first call-site closure behind kbapi
  `SelectControlFlowReachableSinks`. It was queryengine's
  `utils_control_flow_reaches_call_bounded/4` ( the unused `Visited`
  argument is dropped ) ; same answers.
- `endpoints/nodejs/nextjs.pl`: `atom_concat/3` instead of the host's
  `endswith/2`. The catalogs now call nothing outside SWI and the KB.
- `tests/host.pl`: `host_calls/1` is now the predicates the kbapi templates
  call ; the predicates only utils.pl called stay defined.

## v1.1.0

Targets: dhscanner-kbgen 2.4.0.

- `api.pl` moves here from queryengine: the root, including the six family
  `api.pl` files in the same order. queryengine includes `'predicates/api'`
  instead of keeping its own copy. The load gate now loads this root, so
  the family load order has one source.
- `tests/fixtures/api.pl`

No catalog changes. Hosts that still ship their own `api.pl` keep working.

## v1.0.0

Targets: dhscanner-kbgen 2.4.0.

The `predicates/` tree of dhscanner.service.queryengine at `b019685`, moved
here with its history ( OrenGitHub/dhscanner.runner#143 ). The 38 catalog
files are unchanged. New in this repo:

- `tests/check.pl`: load gate ( no load warnings, every file wired into its
  family `api.pl`, no undefined calls, every `host_calls/1` predicate defined )
  and fixture runner
- `tests/kb_schema.pl`: the kbgen 2.4.0 fact vocabulary
- `tests/host.pl`: the queryengine interface ( the predicates it calls, and
  `endswith/2`, which it lends )
- `tests/fixtures/`: one fixture per catalog file
- CI on every PR ( no secrets, read-only token ), `CONTRIBUTING.md`, `CODEOWNERS`

Known issues, kept as is so that v1.0.0 matches queryengine's tree:

- `sinks_has_prepared_statement_fqn_{golang_gorm,nodejs_prisma}/1` read
  `kb_has_fqn/2`, which kbgen never emits ( `known_undefined/1` in
  `tests/check.pl` ). Nothing calls them. `sinks/db/golang/gorm.pl` has
  nothing else, so its fixture has no cases ( `fixture_exempt/1` ).
- `endpoints/nodejs/nextjs.pl` calls the host helper `endswith/2` ( fixed
  in v1.2.0 ).
- `auth/nodejs/native.pl` and `auth/common.pl` define derived predicates
  named `kb_gated_return_null/1` and `kb_gated_return_on_comparison/4`,
  which belong to the KB's `kb_` prefix.
