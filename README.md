# dhscanner.predicates

The Prolog catalogs [dhscanner](https://github.com/OrenGitHub/dhscanner.runner)
uses to recognize **sinks, sanitizers, endpoints, auth**, dataflow and call
graph edges in the knowledge base it builds for a scanned repo.

[dhscanner.service.queryengine](https://github.com/OrenGitHub/dhscanner.service.queryengine)
loads this repo as a submodule at `predicates/`, pinned to a release tag.

- New sink / sanitizer / framework? See [CONTRIBUTING.md](CONTRIBUTING.md).
- Release history: [CHANGELOG.md](CHANGELOG.md).
