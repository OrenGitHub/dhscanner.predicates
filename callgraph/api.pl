:- style_check(-singleton).

:- [ 'predicates/callgraph/java/dispatch' ].
:- [ 'predicates/callgraph/class_method' ].
:- [ 'predicates/callgraph/reach' ].

callgraph_callable_calls_callable(Caller, Callee) :- callgraph_java_dispatch(Caller, Callee).
callgraph_callable_calls_callable(Caller, Callee) :- callgraph_class_method(Caller, Callee).
