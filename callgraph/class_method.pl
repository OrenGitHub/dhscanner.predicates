:- style_check(-singleton).

% -----------------------------------------------------------------------------
% callgraph_class_method_callee( Call, Callee )
%
% A call whose receiver kbgen already resolved to a 1st party class :
%
%     kb_call_method_of_class( Call, Method, Class )
%
% eg ruby `CategoryUser.set_notification_level_for_category( .. )`
% ( Discourse `categories_controller.rb:360`, OrenGitHub/dhscanner.runner#152 ).
% The callee is `Method` as looked up from `Class`, nearest definition first,
% walking up the 1st party supers ( `callgraph_java_lookup/3`, which is not
% java specific : it only reads `kb_class_has_1st_party_super`,
% `kb_method_of_class` and `kb_method_has_name` ).
%
% `Foo.new( .. )` is the constructor : the callee is `initialize` ( ruby ).
% A class with no `initialize` up its 1st party supers gives no edge.
%
% Ruby class methods ( `def self.m` ) and instance methods are both
% `kb_method_of_class` facts, so they are not told apart : every method of
% that name in the nearest defining class is a callee.
%
% Skipped : the class is 3rd party ( no `kb_class_def` ), the method is not
% defined up the 1st party supers ( eg an ActiveRecord finder `find_by`,
% inherited from `ApplicationRecord < ActiveRecord::Base` ).
% -----------------------------------------------------------------------------

callgraph_class_method_callee(Call, Callee) :-
    kb_call_method_of_class(Call, Method, Class),
    callgraph_class_method_name(Method, Looked),
    callgraph_java_lookup(Class, Looked, Callee).

% Implicit self ( c++ / java style ) : a ruby call with no receiver is a call
% on the class whose body holds it :
%
%     def self.set_notification_level_for_category(user, level, category_id)
%       ...
%       auto_watch(user_id: user.id)            kb_call_resolved( Call, 'auto_watch' )
%
% ( Discourse `category_user.rb:83`, OrenGitHub/dhscanner.runner#152 ). The
% call is in a method of `Class` ( or in a block inside one, see
% `callgraph_enclosing_method/2` ), and the callee is the method of that name
% looked up from `Class`, nearest definition first.
%
% Only the bare name : the lookup by `kb_method_has_name` keeps it so, no
% method name is dotted, so `'Unknown.<m>'` ( in a ruby kb, a call on a
% receiver kbgen could not type, `params[:x].to_i` ) and
% `'<dhscanner-instrumentation>[..]'` never match. Java writes receiverless
% calls as `'Unknown.<m>'`, `callgraph_java_dispatch/2` handles those.
%
% Every language : the heuristic is that a method of that exact name exists in
% the caller's own class ( or up its 1st party supers ). Where a bare `foo()`
% inside a method is a module function ( python / js / php ), it gives an edge
% only when the class also defines a method `foo`, a rare, accepted over
% approximation.
%
% Skipped : names no 1st party class up the supers defines ( `raise`,
% `render`, `redirect_to` : Kernel / 3rd party supers ).
callgraph_class_method_callee(Call, Callee) :-
    kb_call_resolved(Call, Method),
    kb_called_from(Call, Caller),
    callgraph_enclosing_method(Caller, Enclosing),
    kb_method_of_class(Enclosing, Class),
    callgraph_java_lookup(Class, Method, Callee).

callgraph_class_method_name(new, initialize) :- !.
callgraph_class_method_name(Method, Method).

% -----------------------------------------------------------------------------
% callgraph_enclosing_method( Callable, Method )
%
% `Callable` itself when it is a method, else the method a block ( lambda )
% is written in : the parsers lower a ruby block to the last arg of its call
% ( `hijack do .. end`, `respond_to do |format| .. end` ), so climb from the
% lambda to the callable holding that call, as many blocks deep as needed.
% -----------------------------------------------------------------------------

callgraph_enclosing_method(Method, Method) :-
    kb_method_of_class(Method, _),
    !.
callgraph_enclosing_method(Lambda, Method) :-
    kb_arg_i_for_call(Lambda, _, Call),
    kb_called_from(Call, Outer),
    Outer \== Lambda,
    callgraph_enclosing_method(Outer, Method).

% -----------------------------------------------------------------------------
% callgraph_class_method( Caller, Callee )
%
% The one hop callable edge : a call site in `Caller`'s body whose callee is
% `Callee` ( wired into `callgraph_callable_calls_callable/2` ).
% -----------------------------------------------------------------------------

callgraph_class_method(Caller, Callee) :-
    kb_called_from(Call, Caller),
    callgraph_class_method_callee(Call, Callee).
