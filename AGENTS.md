# AGENTS

Notes for agents ( and humans ) writing catalog predicates here. The human
contributor guide is [`CONTRIBUTING.md`](CONTRIBUTING.md) ; this file adds the
rules that are easy to break by accident.

## No string parsing of kb atoms

**Do not take kb atoms apart as strings in a catalog.** No `sub_atom/5`,
`atom_concat/3`, `atomic_list_concat/3` ( split mode ), `split_string/4`,
`re_match/2` or friends on an atom that came out of a `kb_*` fact : a location
atom ( `startloc_..._endloc_..._<path>` ), a resolved fqn
( `kb_call_resolved/2` ), a Haskell-Show atom
( `'CallMethodOfClass (Location {...}) ...'`,
`'FirstPartyImport (FirstPartyImportContent {...}).m'` ), a file path.

Why : those atoms are an encoding, not an interface. Their spelling changes
with kbgen / codegen versions ( the Show format, the `Unknown.` prefix, how a
path is escaped ), and a catalog that parses them silently stops matching,
with no error. It also hides a missing fact : if a predicate needs to know
"this call has no receiver", "this file is ruby" or "the class name inside
this fqn", the kb should say so.

Instead :

1. **Join on facts, compare atoms whole.** `kb_call_resolved(Call, 'YAML.load_stream')`
   ( an exact atom ) is fine ; `sub_atom(Fqn, _, _, _, '.readFile')` is not.
2. **Check whether the guard is needed at all.** A lookup by name often
   filters by itself : no `kb_method_has_name` is dotted, so a dotted fqn can
   never match a method name, no `sub_atom` needed.
3. **Prefer a structural heuristic to a language check.** The kb is
   language agnostic on purpose : no `kb_*` fact says "this is ruby", and a
   catalog should not guess it from a path. Eg implicit self
   ( `callgraph/class_method.pl` ) needs no language : a receiverless call is
   linked only when the caller's own class ( or a 1st party super ) defines a
   method of exactly that name.
4. **Really missing a fact ? Add it to kbgen**, as a structured, language
   agnostic `kb_*` fact, and add it to `tests/kb_schema.pl`. Until kbgen emits
   it, the catalog waits, or the gap is written down ( an issue, the leaf's
   comment ), not worked around.

Legacy : string parsing is already in 13 catalog files ( 61 uses, 2026-11-07 ) :
`auth/nodejs/native.pl`, `callgraph/java/dispatch.pl`, `endpoints/java/servlet.pl`,
`endpoints/java/spring.pl`, `endpoints/nodejs/nextjs.pl`, `endpoints/python/django.pl`,
`endpoints/ruby/rails.pl`, `sinks/db/java/jpa.pl`, `sinks/db/nodejs/prisma.pl`,
`sinks/db/python/django.pl`, `sinks/db/ruby/mini_sql.pl`, `sinks/files/python/native.pl`,
`sinks/ssrf/python/native.pl` ( and the queryengine templates' `sink_kind/3` ).
**Do not add new uses, and do not copy those patterns.** When you touch one of
those leaves, prefer replacing its string parsing by a kbgen fact.

Analysis scripts outside the catalogs ( one-off probes run against a kb ) may
parse whatever they like : the rule is about the predicates queryengine loads.
