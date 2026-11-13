% fixture : callgraph/java/dispatch.pl

% -----------------------------------------------------------------------------
% class tree ( DSpace-shaped )
%
%   interface GroupService { void delete( ... ); }
%   class GroupServiceImpl implements GroupService { delete( ... ) ; find( Context, UUID ) ; find( Context, String ) }
%   class CachedGroupServiceImpl extends GroupServiceImpl { delete( ... ) }
%   class OtherService { delete( ... ) }                         ( unrelated )
%   interface CollectionDAO { }
%   abstract class AbstractHibernateDSODAO { findByLegacyId( ... ) }
%   class CollectionDAOImpl extends AbstractHibernateDSODAO implements CollectionDAO { }

% interface GroupService
kb_class_def(startloc_5_1_endloc_20_2_org_slash_dspace_slash_eperson_slash_service_slash_GroupService_dot_java, 'GroupService', 'org/dspace/eperson/service/GroupService.java').
kb_method_of_class(startloc_8_5_endloc_8_60_org_slash_dspace_slash_eperson_slash_service_slash_GroupService_dot_java, startloc_5_1_endloc_20_2_org_slash_dspace_slash_eperson_slash_service_slash_GroupService_dot_java).
kb_method_has_name(startloc_8_5_endloc_8_60_org_slash_dspace_slash_eperson_slash_service_slash_GroupService_dot_java, 'delete').

% class GroupServiceImpl implements GroupService
kb_class_def(startloc_10_1_endloc_80_2_org_slash_dspace_slash_eperson_slash_GroupServiceImpl_dot_java, 'GroupServiceImpl', 'org/dspace/eperson/GroupServiceImpl.java').
kb_class_has_1st_party_super(startloc_10_1_endloc_80_2_org_slash_dspace_slash_eperson_slash_GroupServiceImpl_dot_java, 'GroupService', 'org/dspace/eperson/service/GroupService.java').
kb_method_of_class(startloc_20_5_endloc_30_6_org_slash_dspace_slash_eperson_slash_GroupServiceImpl_dot_java, startloc_10_1_endloc_80_2_org_slash_dspace_slash_eperson_slash_GroupServiceImpl_dot_java).
kb_method_has_name(startloc_20_5_endloc_30_6_org_slash_dspace_slash_eperson_slash_GroupServiceImpl_dot_java, 'delete').
kb_method_of_class(startloc_32_5_endloc_36_6_org_slash_dspace_slash_eperson_slash_GroupServiceImpl_dot_java, startloc_10_1_endloc_80_2_org_slash_dspace_slash_eperson_slash_GroupServiceImpl_dot_java).
kb_method_has_name(startloc_32_5_endloc_36_6_org_slash_dspace_slash_eperson_slash_GroupServiceImpl_dot_java, 'find').
kb_method_of_class(startloc_38_5_endloc_42_6_org_slash_dspace_slash_eperson_slash_GroupServiceImpl_dot_java, startloc_10_1_endloc_80_2_org_slash_dspace_slash_eperson_slash_GroupServiceImpl_dot_java).
kb_method_has_name(startloc_38_5_endloc_42_6_org_slash_dspace_slash_eperson_slash_GroupServiceImpl_dot_java, 'find').

% class CachedGroupServiceImpl extends GroupServiceImpl ( overrides delete only )
kb_class_def(startloc_6_1_endloc_30_2_org_slash_dspace_slash_eperson_slash_CachedGroupServiceImpl_dot_java, 'CachedGroupServiceImpl', 'org/dspace/eperson/CachedGroupServiceImpl.java').
kb_class_has_1st_party_super(startloc_6_1_endloc_30_2_org_slash_dspace_slash_eperson_slash_CachedGroupServiceImpl_dot_java, 'GroupServiceImpl', 'org/dspace/eperson/GroupServiceImpl.java').
kb_method_of_class(startloc_10_5_endloc_14_6_org_slash_dspace_slash_eperson_slash_CachedGroupServiceImpl_dot_java, startloc_6_1_endloc_30_2_org_slash_dspace_slash_eperson_slash_CachedGroupServiceImpl_dot_java).
kb_method_has_name(startloc_10_5_endloc_14_6_org_slash_dspace_slash_eperson_slash_CachedGroupServiceImpl_dot_java, 'delete').

% class OtherService ( not in the GroupService tree )
kb_class_def(startloc_4_1_endloc_20_2_org_slash_dspace_slash_eperson_slash_OtherService_dot_java, 'OtherService', 'org/dspace/eperson/OtherService.java').
kb_method_of_class(startloc_6_5_endloc_9_6_org_slash_dspace_slash_eperson_slash_OtherService_dot_java, startloc_4_1_endloc_20_2_org_slash_dspace_slash_eperson_slash_OtherService_dot_java).
kb_method_has_name(startloc_6_5_endloc_9_6_org_slash_dspace_slash_eperson_slash_OtherService_dot_java, 'delete').

% interface CollectionDAO
kb_class_def(startloc_4_1_endloc_15_2_org_slash_dspace_slash_content_slash_dao_slash_CollectionDAO_dot_java, 'CollectionDAO', 'org/dspace/content/dao/CollectionDAO.java').
% abstract class AbstractHibernateDSODAO { findByLegacyId( ... ) }
kb_class_def(startloc_8_1_endloc_60_2_org_slash_dspace_slash_core_slash_AbstractHibernateDSODAO_dot_java, 'AbstractHibernateDSODAO', 'org/dspace/core/AbstractHibernateDSODAO.java').
kb_method_of_class(startloc_20_5_endloc_25_6_org_slash_dspace_slash_core_slash_AbstractHibernateDSODAO_dot_java, startloc_8_1_endloc_60_2_org_slash_dspace_slash_core_slash_AbstractHibernateDSODAO_dot_java).
kb_method_has_name(startloc_20_5_endloc_25_6_org_slash_dspace_slash_core_slash_AbstractHibernateDSODAO_dot_java, 'findByLegacyId').
% class CollectionDAOImpl extends AbstractHibernateDSODAO implements CollectionDAO
kb_class_def(startloc_10_1_endloc_50_2_org_slash_dspace_slash_content_slash_dao_slash_impl_slash_CollectionDAOImpl_dot_java, 'CollectionDAOImpl', 'org/dspace/content/dao/impl/CollectionDAOImpl.java').
kb_class_has_1st_party_super(startloc_10_1_endloc_50_2_org_slash_dspace_slash_content_slash_dao_slash_impl_slash_CollectionDAOImpl_dot_java, 'AbstractHibernateDSODAO', 'org/dspace/core/AbstractHibernateDSODAO.java').
kb_class_has_1st_party_super(startloc_10_1_endloc_50_2_org_slash_dspace_slash_content_slash_dao_slash_impl_slash_CollectionDAOImpl_dot_java, 'CollectionDAO', 'org/dspace/content/dao/CollectionDAO.java').

% -----------------------------------------------------------------------------
% class GroupRestController ( the callers )

kb_class_def(startloc_10_1_endloc_100_2_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, 'GroupRestController', 'org/dspace/app/rest/GroupRestController.java').

% public void deleteGroup( ... ) {
%     groupService.delete( ctx, group );            GroupService groupService
%     groupServiceImpl.find( ctx, id );             GroupServiceImpl groupServiceImpl
%     collectionDAO.findByLegacyId( ctx, id );      CollectionDAO collectionDAO
% }
kb_method_of_class(startloc_30_5_endloc_45_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, startloc_10_1_endloc_100_2_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java).
kb_method_has_name(startloc_30_5_endloc_45_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, 'deleteGroup').
kb_called_from(startloc_40_9_endloc_40_42_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, startloc_30_5_endloc_45_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java).
kb_call_resolved(startloc_40_9_endloc_40_42_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "org/dspace/eperson/service/GroupService.java", firstPartyImportedName = Just "GroupService"}).delete').
kb_called_from(startloc_41_9_endloc_41_41_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, startloc_30_5_endloc_45_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java).
kb_call_resolved(startloc_41_9_endloc_41_41_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "org/dspace/eperson/GroupServiceImpl.java", firstPartyImportedName = Just "GroupServiceImpl"}).find').
kb_called_from(startloc_42_9_endloc_42_48_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, startloc_30_5_endloc_45_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java).
kb_call_resolved(startloc_42_9_endloc_42_48_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "org/dspace/content/dao/CollectionDAO.java", firstPartyImportedName = Just "CollectionDAO"}).findByLegacyId').

% public void purgeCache( ... ) {
%     cachedGroupService.delete( ctx, group );      CachedGroupServiceImpl cachedGroupService
% }
kb_method_of_class(startloc_50_5_endloc_55_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, startloc_10_1_endloc_100_2_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java).
kb_method_has_name(startloc_50_5_endloc_55_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, 'purgeCache').
kb_called_from(startloc_52_9_endloc_52_48_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, startloc_50_5_endloc_55_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java).
kb_call_resolved(startloc_52_9_endloc_52_48_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "org/dspace/eperson/CachedGroupServiceImpl.java", firstPartyImportedName = Just "CachedGroupServiceImpl"}).delete').

% public void misc( ... ) {
%     groupService.findAll( ctx ).size();           chained : method part has a '.'
%     GroupUtils.check( ctx );                      imported name with no class def in that file
%     helper.run();                                 'Unknown.helper.run' : an untyped receiver
%     sitemaps.returnSitemapFile( ctx );            'Unknown.returnSitemapFile' : an untyped receiver,
%                                                   no edge, though SitemapRestController has the method
% }
kb_method_of_class(startloc_60_5_endloc_70_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, startloc_10_1_endloc_100_2_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java).
kb_method_has_name(startloc_60_5_endloc_70_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, 'misc').
kb_called_from(startloc_62_9_endloc_62_43_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, startloc_60_5_endloc_70_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java).
kb_call_resolved(startloc_62_9_endloc_62_43_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "org/dspace/eperson/service/GroupService.java", firstPartyImportedName = Just "GroupService"}).findAll.size').
kb_called_from(startloc_63_9_endloc_63_32_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, startloc_60_5_endloc_70_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java).
kb_call_resolved(startloc_63_9_endloc_63_32_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "org/dspace/eperson/GroupUtils.java", firstPartyImportedName = Just "GroupUtils"}).check').
kb_called_from(startloc_64_9_endloc_64_21_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, startloc_60_5_endloc_70_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java).
kb_call_resolved(startloc_64_9_endloc_64_21_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, 'Unknown.helper.run').
kb_called_from(startloc_65_9_endloc_65_32_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, startloc_60_5_endloc_70_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java).
kb_call_resolved(startloc_65_9_endloc_65_32_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, 'Unknown.returnSitemapFile').

% -----------------------------------------------------------------------------
% class SitemapRestController
%
% public ResponseEntity retrieve( ... ) { return this.returnSitemapFile( ... ); }
% private ResponseEntity returnSitemapFile( ... ) { ... }
%
% `this.m( .. )` is the bare call `m( .. )`, a method of the class
% ( parsers 1.1.57 + codegen 1.0.47 ) :
% callgraph/class_method.pl, not java dispatch

kb_class_def(startloc_12_1_endloc_90_2_org_slash_dspace_slash_app_slash_rest_slash_SitemapRestController_dot_java, 'SitemapRestController', 'org/dspace/app/rest/SitemapRestController.java').
kb_method_of_class(startloc_20_5_endloc_40_6_org_slash_dspace_slash_app_slash_rest_slash_SitemapRestController_dot_java, startloc_12_1_endloc_90_2_org_slash_dspace_slash_app_slash_rest_slash_SitemapRestController_dot_java).
kb_method_has_name(startloc_20_5_endloc_40_6_org_slash_dspace_slash_app_slash_rest_slash_SitemapRestController_dot_java, 'retrieve').
kb_method_of_class(startloc_50_5_endloc_70_6_org_slash_dspace_slash_app_slash_rest_slash_SitemapRestController_dot_java, startloc_12_1_endloc_90_2_org_slash_dspace_slash_app_slash_rest_slash_SitemapRestController_dot_java).
kb_method_has_name(startloc_50_5_endloc_70_6_org_slash_dspace_slash_app_slash_rest_slash_SitemapRestController_dot_java, 'returnSitemapFile').
kb_called_from(startloc_30_16_endloc_30_50_org_slash_dspace_slash_app_slash_rest_slash_SitemapRestController_dot_java, startloc_20_5_endloc_40_6_org_slash_dspace_slash_app_slash_rest_slash_SitemapRestController_dot_java).
kb_call_method_of_class(startloc_30_16_endloc_30_50_org_slash_dspace_slash_app_slash_rest_slash_SitemapRestController_dot_java, 'returnSitemapFile', startloc_12_1_endloc_90_2_org_slash_dspace_slash_app_slash_rest_slash_SitemapRestController_dot_java).

% -----------------------------------------------------------------------------
% ruby, Discourse-shaped ( OrenGitHub/dhscanner.runner#157 ) :
%
%   class ApplicationController
%     def serialize_data(obj, serializer, opts = nil)
%       serializer.new(obj, serializer_opts)          'Unknown.new' : an untyped receiver
%   class UserApiKeysController < ApplicationController
%     def new                                        an action named `new`
%
% no edge : 'Unknown.new' names no class ( it used to reach every `new` of
% every subclass of the caller's class )

kb_class_def(startloc_1_1_endloc_900_4_app_slash_controllers_slash_application_controller_dot_rb, 'ApplicationController', 'app/controllers/application_controller.rb').
kb_method_of_class(startloc_504_3_endloc_513_6_app_slash_controllers_slash_application_controller_dot_rb, startloc_1_1_endloc_900_4_app_slash_controllers_slash_application_controller_dot_rb).
kb_method_has_name(startloc_504_3_endloc_513_6_app_slash_controllers_slash_application_controller_dot_rb, 'serialize_data').
kb_called_from(startloc_511_7_endloc_511_43_app_slash_controllers_slash_application_controller_dot_rb, startloc_504_3_endloc_513_6_app_slash_controllers_slash_application_controller_dot_rb).
kb_call_resolved(startloc_511_7_endloc_511_43_app_slash_controllers_slash_application_controller_dot_rb, 'Unknown.new').
kb_class_def(startloc_3_1_endloc_877_4_app_slash_controllers_slash_user_api_keys_controller_dot_rb, 'UserApiKeysController', 'app/controllers/user_api_keys_controller.rb').
kb_class_has_1st_party_super(startloc_3_1_endloc_877_4_app_slash_controllers_slash_user_api_keys_controller_dot_rb, 'ApplicationController', 'app/controllers/application_controller.rb').
kb_method_of_class(startloc_39_3_endloc_71_6_app_slash_controllers_slash_user_api_keys_controller_dot_rb, startloc_3_1_endloc_877_4_app_slash_controllers_slash_user_api_keys_controller_dot_rb).
kb_method_has_name(startloc_39_3_endloc_71_6_app_slash_controllers_slash_user_api_keys_controller_dot_rb, 'new').

% -----------------------------------------------------------------------------
% expectations

% FirstPartyImport atom split
must(callgraph_java_first_party_method('FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "org/dspace/eperson/service/GroupService.java", firstPartyImportedName = Just "GroupService"}).delete',
     'org/dspace/eperson/service/GroupService.java', 'GroupService', delete)).
must_not(callgraph_java_first_party_method('FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "org/dspace/eperson/service/GroupService.java", firstPartyImportedName = Just "GroupService"}).findAll.size', _, _, _)).
must_not(callgraph_java_first_party_method('Unknown.returnSitemapFile', _, _, _)).

% receiver class : a typed call names its class, an untyped receiver none
must(callgraph_java_receiver_class(startloc_30_5_endloc_45_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java,
     'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "org/dspace/eperson/service/GroupService.java", firstPartyImportedName = Just "GroupService"}).delete',
     startloc_5_1_endloc_20_2_org_slash_dspace_slash_eperson_slash_service_slash_GroupService_dot_java, delete)).
must_not(callgraph_java_receiver_class(_, 'Unknown.returnSitemapFile', _, _)).
must_not(callgraph_java_receiver_class(startloc_60_5_endloc_70_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, 'Unknown.helper.run', _, _)).

% class tree : supers and the ( transitive, downward ) dispatch closure
must(callgraph_java_super(startloc_6_1_endloc_30_2_org_slash_dspace_slash_eperson_slash_CachedGroupServiceImpl_dot_java, startloc_10_1_endloc_80_2_org_slash_dspace_slash_eperson_slash_GroupServiceImpl_dot_java)).
must(( setof(S, callgraph_java_dispatch_class(startloc_5_1_endloc_20_2_org_slash_dspace_slash_eperson_slash_service_slash_GroupService_dot_java, S), Ss),
       msort([ startloc_5_1_endloc_20_2_org_slash_dspace_slash_eperson_slash_service_slash_GroupService_dot_java,
               startloc_10_1_endloc_80_2_org_slash_dspace_slash_eperson_slash_GroupServiceImpl_dot_java,
               startloc_6_1_endloc_30_2_org_slash_dspace_slash_eperson_slash_CachedGroupServiceImpl_dot_java ], Ss) )).
% dispatch never goes up the tree
must_not(callgraph_java_dispatch_class(startloc_10_1_endloc_80_2_org_slash_dspace_slash_eperson_slash_GroupServiceImpl_dot_java, startloc_5_1_endloc_20_2_org_slash_dspace_slash_eperson_slash_service_slash_GroupService_dot_java)).

% lookup : nearest definition walking up the supers
must(callgraph_java_lookup(startloc_10_1_endloc_50_2_org_slash_dspace_slash_content_slash_dao_slash_impl_slash_CollectionDAOImpl_dot_java, findByLegacyId,
     startloc_20_5_endloc_25_6_org_slash_dspace_slash_core_slash_AbstractHibernateDSODAO_dot_java)).
% CachedGroupServiceImpl overrides delete : GroupServiceImpl.delete is not looked up
must_not(callgraph_java_lookup(startloc_6_1_endloc_30_2_org_slash_dspace_slash_eperson_slash_CachedGroupServiceImpl_dot_java, delete,
     startloc_20_5_endloc_30_6_org_slash_dspace_slash_eperson_slash_GroupServiceImpl_dot_java)).
% CachedGroupServiceImpl does not override find : inherited from GroupServiceImpl
must(callgraph_java_lookup(startloc_6_1_endloc_30_2_org_slash_dspace_slash_eperson_slash_CachedGroupServiceImpl_dot_java, find,
     startloc_32_5_endloc_36_6_org_slash_dspace_slash_eperson_slash_GroupServiceImpl_dot_java)).
% CollectionDAO declares no findByLegacyId and has no supers
must_not(callgraph_java_lookup(startloc_4_1_endloc_15_2_org_slash_dspace_slash_content_slash_dao_slash_CollectionDAO_dot_java, findByLegacyId, _)).

% deleteGroup's callees : delete over the whole GroupService tree, both find
% overloads, and findByLegacyId inherited from AbstractHibernateDSODAO
must(( setof(C, callgraph_java_dispatch(startloc_30_5_endloc_45_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, C), Cs),
       msort([ startloc_8_5_endloc_8_60_org_slash_dspace_slash_eperson_slash_service_slash_GroupService_dot_java,
               startloc_20_5_endloc_30_6_org_slash_dspace_slash_eperson_slash_GroupServiceImpl_dot_java,
               startloc_10_5_endloc_14_6_org_slash_dspace_slash_eperson_slash_CachedGroupServiceImpl_dot_java,
               startloc_32_5_endloc_36_6_org_slash_dspace_slash_eperson_slash_GroupServiceImpl_dot_java,
               startloc_38_5_endloc_42_6_org_slash_dspace_slash_eperson_slash_GroupServiceImpl_dot_java,
               startloc_20_5_endloc_25_6_org_slash_dspace_slash_core_slash_AbstractHibernateDSODAO_dot_java ], Cs) )).
% OtherService.delete is outside the declared class tree
must_not(callgraph_java_dispatch(startloc_30_5_endloc_45_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java,
     startloc_6_5_endloc_9_6_org_slash_dspace_slash_eperson_slash_OtherService_dot_java)).

% purgeCache : typed CachedGroupServiceImpl, only its own delete
must(callgraph_java_dispatch(startloc_50_5_endloc_55_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java,
     startloc_10_5_endloc_14_6_org_slash_dspace_slash_eperson_slash_CachedGroupServiceImpl_dot_java)).
must_not(callgraph_java_dispatch(startloc_50_5_endloc_55_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java,
     startloc_20_5_endloc_30_6_org_slash_dspace_slash_eperson_slash_GroupServiceImpl_dot_java)).
must_not(callgraph_java_dispatch(startloc_50_5_endloc_55_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java,
     startloc_8_5_endloc_8_60_org_slash_dspace_slash_eperson_slash_service_slash_GroupService_dot_java)).

% this.returnSitemapFile( .. ) : not java dispatch ( class_method.pl, below )
must_not(callgraph_java_dispatch(startloc_20_5_endloc_40_6_org_slash_dspace_slash_app_slash_rest_slash_SitemapRestController_dot_java, _)).

% misc : chained call, class-less import, untyped receivers
must_not(callgraph_java_dispatch(startloc_60_5_endloc_70_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, _)).

% wired into the family api
must(callgraph_callable_calls_callable(startloc_20_5_endloc_40_6_org_slash_dspace_slash_app_slash_rest_slash_SitemapRestController_dot_java,
     startloc_50_5_endloc_70_6_org_slash_dspace_slash_app_slash_rest_slash_SitemapRestController_dot_java)).
must_not(callgraph_callable_calls_callable(startloc_60_5_endloc_70_6_org_slash_dspace_slash_app_slash_rest_slash_GroupRestController_dot_java, _)).

% ruby serializer.new( .. ) : no edge, UserApiKeysController#new is not reached
must_not(callgraph_callable_calls_callable(startloc_504_3_endloc_513_6_app_slash_controllers_slash_application_controller_dot_rb, _)).
