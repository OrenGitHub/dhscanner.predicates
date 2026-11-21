:- style_check(-singleton).
:- dynamic kb_call_method_of_1st_party_imported_name/4.

% -----------------------------------------------------------------------------
% callgraph_java_dispatch( Caller, Callee )
%
% Java method calls whose receiver is a 1st party class ( or interface ) :
%
%   typed call      `groupService.delete( ... )` with `GroupService groupService`
%                   kbgen ( >= 2.5.0 ) names the receiver's class and its file :
%
%     kb_call_method_of_1st_party_imported_name( Call, delete, 'GroupService', '<File>' )
%
% A call on the class's own instance, `this.returnSitemapFile( ... )` or a
% bare `returnSitemapFile( ... )`, is a `kb_call_method_of_class` fact, the
% way ruby's receiverless call is ( the parsers lower `this.m( .. )` to
% `m( .. )`, parsers 1.1.57, and codegen 1.0.47 resolves a bare call of a
% method of the class ), handled by `callgraph/class_method.pl`, not here.
% 'Unknown.<method>' is a call on a receiver kbgen could not type : it names
% no class ( no `kb_call_method_of_1st_party_imported_name` ), so it gives no edge.
% Neither does a longer chain, `groupService.findAll().size()`. It used to be read as a call on the
% caller's class and all its subclasses : ruby `serializer.new( .. )` in
% Discourse `ApplicationController#serialize_data` reached the `new` action
% of `UserApiKeysController` ( OrenGitHub/dhscanner.runner#157 ).
%
% Virtual dispatch : the callee is `<method>` as looked up from the declared
% class and from each of its 1st party subclasses ( `kb_class_has_1st_party_super` ),
% where the lookup takes the nearest definition walking up the supers - so an
% implementation inherited from a base outside the declared class tree counts
% too ( `CollectionDAOImpl.findByLegacyId` lives in `AbstractHibernateDSODAO` ).
% Overloads are not told apart : every method of that name in the nearest
% defining class is a callee.
%
% The 1st party facts exist because the cli maps java imports to repo files
% by their package declaration ( runner #119 ).
% -----------------------------------------------------------------------------

callgraph_java_dispatch(Caller, Callee) :-
    kb_called_from(Call, Caller),
    callgraph_java_receiver_class(Call, Class, Method),
    callgraph_java_dispatch_class(Class, Dispatched),
    callgraph_java_lookup(Dispatched, Method, Callee).

callgraph_java_receiver_class(Call, Class, Method) :-
    kb_call_method_of_1st_party_imported_name(Call, Method, ClassName, File),
    kb_class_def(Class, ClassName, File).

:- table callgraph_java_super/2.
callgraph_java_super(Class, Super) :-
    kb_class_has_1st_party_super(Class, SuperName, SuperFile),
    kb_class_def(Super, SuperName, SuperFile).

:- table callgraph_java_dispatch_class/2.
callgraph_java_dispatch_class(Class, Class).
callgraph_java_dispatch_class(Class, Sub) :-
    callgraph_java_super(Mid, Class),
    callgraph_java_dispatch_class(Mid, Sub).

callgraph_java_lookup(Class, Method, Callee) :-
    (   callgraph_java_defines(Class, Method)
    ->  callgraph_java_method_named(Class, Method, Callee)
    ;   callgraph_java_super(Class, Super),
        callgraph_java_lookup(Super, Method, Callee)
    ).

callgraph_java_defines(Class, Method) :-
    callgraph_java_method_named(Class, Method, _),
    !.

callgraph_java_method_named(Class, Method, Callee) :-
    kb_method_of_class(Callee, Class),
    kb_method_has_name(Callee, Method).
