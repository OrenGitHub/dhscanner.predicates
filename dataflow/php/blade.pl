:- style_check(-singleton).

% -----------------------------------------------------------------------------
% Laravel Blade : a value passed to a view flows into the template that reads it.
%
%   return view( 'posts.show', [ 'post' => $post ] );          // a controller
%
%   {{ $post->title }}                                         // resources/views/posts/show.blade.php
%   @include( 'posts.meta' )                                   // passes every var on
%
%   {{ $post->author }}                                        // resources/views/posts/meta.blade.php
%
% In the kb ( parsers >= 1.1.69, fronts f22917f ) :
%
% * `view` is `laravel.view` ; fronts rewrites its arg 0 to the template's
%   file ( `'resources/views/posts/show.blade.php'` ), its arg 1 is an
%   `<dhscanner-instrumentation>[arrayify]` whose `'post' => $post` is a
%   keyword arg ( `kb_keyword_arg_for_call/3` ).
% * a compiled template is a script, the caller of its top level calls,
%   named by its file in kb_called_from_script ( kbgen >= 2.10.0 ) ;
%   a var it reads but never binds is a call
%   `<dhscanner-instrumentation>[unbound-var-blade-php-file]( 'post' )`.
% * `@include( 'posts.meta' )` compiles to `$__env->make( .. )`, whose arg 0
%   fronts rewrites the same way ; Blade passes it all the vars in scope.
%
% Edges : the keyword arg value -> the unbound var marker of the same name,
% in the view's own script ( 1 hop ) or in a script it @includes ( 2 hops ).
% Deliberately no deeper : no closure over @include chains.
%
% Not covered : a view name fronts did not rewrite ( `pkg::a.b`, dynamic ),
% `view( .. )->with( 'k', $v )`, `compact( 'k' )`, vars the parent template
% binds itself ( `@php $x = .. @endphp`, `@foreach` vars ) passed on to an
% @include, the explicit data arg of `@include( 'a', [ 'k' => $v ] )`.
% -----------------------------------------------------------------------------

:- dynamic kb_keyword_arg_for_call/3.
:- dynamic kb_called_from_script/2.

% dataflow_edge_blade( Value, Marker )
dataflow_edge_blade(Value, Marker) :-
    dataflow_blade_view_kwarg(Value, Name, File),
    dataflow_blade_script_of_file(File, Script),
    dataflow_blade_unbound_var(Script, Name, Marker).

dataflow_edge_blade(Value, Marker) :-
    dataflow_blade_view_kwarg(Value, Name, File),
    dataflow_blade_script_of_file(File, Script),
    dataflow_blade_include(Script, IncludedFile),
    dataflow_blade_script_of_file(IncludedFile, IncludedScript),
    dataflow_blade_unbound_var(IncludedScript, Name, Marker).

% `view( File, [ .. Name => Value .. ] )`
dataflow_blade_view_kwarg(Value, Name, File) :-
    kb_keyword_arg_for_call(Name, Value, Arrayified),
    kb_call_resolved(Arrayified, '<dhscanner-instrumentation>[arrayify]'),
    kb_arg_i_for_call(Arrayified, 1, View),
    kb_call_resolved(View, 'laravel.view'),
    kb_arg_i_for_call(Arg0, 0, View),
    kb_const_string(Arg0, File).

% The script of a template file : the caller of any of its top level
% calls ( kb_called_from_script, kbgen >= 2.10.0 ).
dataflow_blade_script_of_file(File, Script) :-
    once((
        kb_called_from_script(TopLevelCall, File),
        kb_called_from(TopLevelCall, Script)
    )).

% a call of `Script` whose arg 0 names a template file ( the rewritten
% `$__env->make( .. )` of an `@include` ). Structural on purpose : the
% receiver `$__env` is not resolved in the kb, and only fronts' rewrite
% produces such a path in a template.
dataflow_blade_include(Script, IncludedFile) :-
    kb_called_from(Include, Script),
    kb_arg_i_for_call(Arg0, 0, Include),
    kb_const_string(Arg0, IncludedFile),
    once(kb_called_from_script(_, IncludedFile)).

dataflow_blade_unbound_var(Script, Name, Marker) :-
    kb_called_from(Marker, Script),
    kb_call_resolved(Marker, '<dhscanner-instrumentation>[unbound-var-blade-php-file]'),
    kb_arg_i_for_call(Arg0, 0, Marker),
    kb_const_string(Arg0, Name).
