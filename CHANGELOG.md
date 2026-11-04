# Changelog

Semver, see [CONTRIBUTING.md](CONTRIBUTING.md#versioning). Every release
records the kbgen version whose `kb_*` facts it targets ( `tests/kb_schema.pl` ).

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
- `endpoints/nodejs/nextjs.pl` calls the host helper `endswith/2`.
- `auth/nodejs/native.pl` and `auth/common.pl` define derived predicates
  named `kb_gated_return_null/1` and `kb_gated_return_on_comparison/4`,
  which belong to the KB's `kb_` prefix.
