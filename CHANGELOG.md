# Changelog

Semver, see [CONTRIBUTING.md](CONTRIBUTING.md#versioning). Every release
records the kbgen version whose `kb_*` facts it targets ( `tests/kb_schema.pl` ).

## v1.6.0

Targets: dhscanner-kbgen 2.4.0. Ruby sinks and rails handler inputs, no new kb fact.

- `sinks/open_redirects/ruby/rails.pl`: `sinks_open_redirect_ruby_rails/1`,
  a receiverless `redirect_to` in a method ( or its blocks ) of a class whose
  super chain reaches `ActionController.Base`, wired into
  `sinks_open_redirect/1`.
- `sinks/ssrf/ruby/native.pl`: `sinks_ssrf_ruby/1`, the `HTTParty` /
  `RestClient` / `Faraday` verbs, `Net.HTTP.get / get_response / post /
  post_form / start` and `OAuth2.Client.new.auth_code.get_token`, wired into
  `sinks_ssrf/1`. Building a connection ( `Faraday.new`, `Net.HTTP.new` ) is
  not a request.
- `endpoints/ruby/rails.pl`: `endpoints_user_input_of_handler_rails/2`, the
  `params` calls of a rails action and of the methods it reaches within 10
  hops ( the reach bound of a sink query ), a new `host_calls` entry : the
  queryengine handlers template reads it instead of
  `endpoints_user_input_of_method_rails/2`, so a `params` read in a private
  helper is a user input of the action.
- Chatwoot ( parsers 1.1.56 / codegen 1.0.47 ) : 39 redirect sinks, 97 ssrf
  sinks ; `instagram/callbacks#show` has 7 inputs ( was 1 ) and
  `params[:error]` flows into its `redirect_to` ( OrenGitHub/dhscanner.runner#154,
  #156 ).

## v1.5.0

Targets: dhscanner-kbgen 2.4.0. Needs parsers 1.1.55 / codegen 1.0.46 /
fronts rb a43bb34 for the Discourse numbers ( a `params` vcall, hash keys,
dotted class names, def-less classes in the kb ).

- `callgraph/class_method.pl`: two edges through `callgraph_java_lookup/3`.
  A call on a class ( `kb_call_method_of_class`, `new` looks up
  `initialize` ) reaches that method of the class or its nearest 1st party
  super. A receiverless call ( implicit self ) reaches the method of exactly
  that name in the caller's own class ( or a 1st party super ), climbing
  out of blocks ( `callgraph_enclosing_method/2` ). No language check : a
  structural heuristic. Discourse : reachable calls 13,745 -> 30,414, sqli
  handlers 4 -> 23.
- `dataflow/api.pl`: arg i of such a call flows into param i.
- `endpoints/ruby/rails.pl`: `endpoints_user_input_rails/1`, a `params`
  call in a method ( or its blocks ) of a class whose super chain reaches
  the 3rd party `ActionController.Base`, wired into `endpoints_user_input/1`,
  and `endpoints_user_input_of_method_rails/2` ( new in `host_calls/1` ) for
  the queryengine handlers template. Discourse : 665 handlers, 1,718 inputs.
- `AGENTS.md`: no string parsing of kb atoms in a catalog ; prefer a
  structural heuristic to a language check.

## v1.4.0

Targets: dhscanner-kbgen 2.4.0.

- `callgraph/reach.pl`: a 5th one-hop edge, from a caller to a lambda passed
  as an argument of a call site in its body ( `kb_arg_i_for_call` of a
  callable ). A ruby block is that lambda : the parsers lower
  `json_result(@category) do |cat| ... end` to a call whose last arg is the
  block ( parsers 1.1.54 ). JS callbacks ( `arr.forEach(x => ...)` ) take the
  edge too. An over approximation : the callee is assumed to call it.
  Discourse : reachable call sites over the 1,290 handlers 10,026 -> 13,745,
  `categories#update` 2 -> 30.
- `tests/fixtures/callgraph/reach.pl`: a ruby block section.

## v1.3.0

Targets: dhscanner-kbgen 2.4.0.

- `sinks/db/ruby/mini_sql.pl`: `sinks_sqli_ruby_mini_sql/1`, raw sql sent
  through the mini_sql gem, wired into `sinks_sqli/1`. A connection is a top
  level name ( `::DB = MiniSqlMultisiteConnection.instance` ) whose value is
  a `new` / `get` / `instance` of one of the gem's 8 connection classes, or
  of a 1st party subclass of one ( `kb_class_has_3rd_party_super` ), and the
  sink is any of its 9 sql methods ( `mini_sql_sql_arg/2` records the sql
  argument, `query_decorator` takes it 2nd ). Exact atoms only. Needs the
  ruby front / parsers / codegen of OrenGitHub/dhscanner.runner#146, which
  bind `DB` to its file and keep the qualified super name. Discourse : 1,152
  sinks, every `DB.<sql method>` call ( runner #142 ).
- `tests/fixtures/sinks/db/ruby/mini_sql.pl`

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
