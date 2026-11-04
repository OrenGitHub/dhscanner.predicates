% fixture : callgraph/reach.pl
%
% Two call graphs, one per edge family :
%
% next.js ( hoc + file + dir edges, a cycle ) :
%
%   app/api/v2/contacts/bulk/route.ts
%     export const PUT = async ( request : NextRequest ) =>      W   ( hop 0 )
%         authenticatedApiClient( { handler : async () => {      L   ( hop 1, hoc edge )
%             upsertBulkContacts( data ) ;                       -> U  ( file edge )
%             missing() ;                                        no def, no edge
%         } } ) ;
%   app/lib/contact.ts
%     export function upsertBulkContacts( data ) {               U   ( hop 2 )
%         prisma.$queryRaw( ... ) ;
%         helper() ;                                             -> H  ( dir edge )
%     }
%   app/lib/helper.ts
%     export function helper() {                                 H   ( hop 3 )
%         fs.readFile( ... ) ;
%         upsertBulkContacts( [] ) ;                             -> U  ( cycle )
%     }
%   app/lib/orphan.ts
%     export function orphan() { fs.unlink( ... ) ; }            never reached
%
% java ( virtual dispatch edge ) :
%
%   ItemRestController.patch : itemService.update( ctx, item )  -> ItemServiceImpl.update
%   ItemServiceImpl.update   : Files.delete( path )

% -----------------------------------------------------------------------------
% next.js : W, the thin HOC wrapper ( same shape as the endpoints fixture )

kb_func_def(startloc_3_14_endloc_8_7_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 'PUT', 'app/api/v2/contacts/bulk/route.ts', 'app/api/v2/contacts/bulk').
kb_param_i_of_callable(startloc_3_28_endloc_3_49_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 0, startloc_3_14_endloc_8_7_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts).
kb_param_has_name(startloc_3_28_endloc_3_49_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 'request').
kb_param_has_resolved_type(startloc_3_28_endloc_3_49_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 'next/server.NextRequest').
kb_callable_source_body_length(startloc_3_14_endloc_8_7_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 1).
% authenticatedApiClient( ... ) : W's only call site
kb_called_from(startloc_4_5_endloc_8_6_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, startloc_3_14_endloc_8_7_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts).
% dictify( kv( "handler", <lambda L> ) )
kb_arg_i_for_call(startloc_4_28_endloc_8_5_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 0, startloc_4_5_endloc_8_6_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts).
kb_arg_i_for_call(startloc_5_9_endloc_7_10_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 0, startloc_4_28_endloc_8_5_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts).
kb_arg_i_for_call(startloc_5_9_endloc_5_16_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 0, startloc_5_9_endloc_7_10_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts).
kb_const_string(startloc_5_9_endloc_5_16_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 'handler').
kb_arg_i_for_call(startloc_5_18_endloc_7_10_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 1, startloc_5_9_endloc_7_10_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts).
kb_callable_source_body_length(startloc_5_18_endloc_7_10_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 2).

% L : upsertBulkContacts( data ) , resolved to a function in a file
kb_called_from(startloc_6_13_endloc_6_40_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, startloc_5_18_endloc_7_10_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts).
kb_call_1st_party_func_defined_in_file(startloc_6_13_endloc_6_40_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 'upsertBulkContacts', 'app/lib/contact.ts').
% L : missing() , no such function anywhere
kb_called_from(startloc_6_42_endloc_6_51_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, startloc_5_18_endloc_7_10_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts).
kb_call_1st_party_func_defined_in_file(startloc_6_42_endloc_6_51_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 'missing', 'app/lib/contact.ts').

% U : upsertBulkContacts
kb_func_def(startloc_9_1_endloc_14_2_app_slash_lib_slash_contact_dot_ts, 'upsertBulkContacts', 'app/lib/contact.ts', 'app/lib').
% U : prisma.$queryRaw( ... )
kb_called_from(startloc_10_5_endloc_10_40_app_slash_lib_slash_contact_dot_ts, startloc_9_1_endloc_14_2_app_slash_lib_slash_contact_dot_ts).
kb_call_resolved(startloc_10_5_endloc_10_40_app_slash_lib_slash_contact_dot_ts, '@prisma/client.PrismaClient.$queryRaw').
% U : helper() , resolved to a function in a dir
kb_called_from(startloc_12_5_endloc_12_13_app_slash_lib_slash_contact_dot_ts, startloc_9_1_endloc_14_2_app_slash_lib_slash_contact_dot_ts).
kb_call_1st_party_func_defined_in_dir(startloc_12_5_endloc_12_13_app_slash_lib_slash_contact_dot_ts, 'helper', 'app/lib').

% H : helper
kb_func_def(startloc_1_1_endloc_5_2_app_slash_lib_slash_helper_dot_ts, 'helper', 'app/lib/helper.ts', 'app/lib').
% H : fs.readFile( ... )
kb_called_from(startloc_2_5_endloc_2_30_app_slash_lib_slash_helper_dot_ts, startloc_1_1_endloc_5_2_app_slash_lib_slash_helper_dot_ts).
kb_call_resolved(startloc_2_5_endloc_2_30_app_slash_lib_slash_helper_dot_ts, 'fs.readFile').
% H : upsertBulkContacts( [] ) , back to U
kb_called_from(startloc_3_5_endloc_3_28_app_slash_lib_slash_helper_dot_ts, startloc_1_1_endloc_5_2_app_slash_lib_slash_helper_dot_ts).
kb_call_1st_party_func_defined_in_file(startloc_3_5_endloc_3_28_app_slash_lib_slash_helper_dot_ts, 'upsertBulkContacts', 'app/lib/contact.ts').

% orphan : nobody calls it
kb_func_def(startloc_1_1_endloc_1_45_app_slash_lib_slash_orphan_dot_ts, 'orphan', 'app/lib/orphan.ts', 'app/lib').
kb_called_from(startloc_1_28_endloc_1_42_app_slash_lib_slash_orphan_dot_ts, startloc_1_1_endloc_1_45_app_slash_lib_slash_orphan_dot_ts).
kb_call_resolved(startloc_1_28_endloc_1_42_app_slash_lib_slash_orphan_dot_ts, 'fs.unlink').

% -----------------------------------------------------------------------------
% java : ItemRestController.patch -> ( dispatch ) -> ItemServiceImpl.update

kb_class_def(startloc_6_1_endloc_40_2_org_slash_dspace_slash_content_slash_service_slash_ItemService_dot_java, 'ItemService', 'org/dspace/content/service/ItemService.java').
kb_method_of_class(startloc_12_5_endloc_12_50_org_slash_dspace_slash_content_slash_service_slash_ItemService_dot_java, startloc_6_1_endloc_40_2_org_slash_dspace_slash_content_slash_service_slash_ItemService_dot_java).
kb_method_has_name(startloc_12_5_endloc_12_50_org_slash_dspace_slash_content_slash_service_slash_ItemService_dot_java, 'update').

kb_class_def(startloc_8_1_endloc_200_2_org_slash_dspace_slash_content_slash_ItemServiceImpl_dot_java, 'ItemServiceImpl', 'org/dspace/content/ItemServiceImpl.java').
kb_class_has_1st_party_super(startloc_8_1_endloc_200_2_org_slash_dspace_slash_content_slash_ItemServiceImpl_dot_java, 'ItemService', 'org/dspace/content/service/ItemService.java').
kb_method_of_class(startloc_50_5_endloc_70_6_org_slash_dspace_slash_content_slash_ItemServiceImpl_dot_java, startloc_8_1_endloc_200_2_org_slash_dspace_slash_content_slash_ItemServiceImpl_dot_java).
kb_method_has_name(startloc_50_5_endloc_70_6_org_slash_dspace_slash_content_slash_ItemServiceImpl_dot_java, 'update').
% ItemServiceImpl.update : Files.delete( path )
kb_called_from(startloc_60_9_endloc_60_30_org_slash_dspace_slash_content_slash_ItemServiceImpl_dot_java, startloc_50_5_endloc_70_6_org_slash_dspace_slash_content_slash_ItemServiceImpl_dot_java).
kb_call_resolved(startloc_60_9_endloc_60_30_org_slash_dspace_slash_content_slash_ItemServiceImpl_dot_java, 'java.nio.file.Files.delete').

kb_class_def(startloc_10_1_endloc_90_2_org_slash_dspace_slash_app_slash_rest_slash_ItemRestController_dot_java, 'ItemRestController', 'org/dspace/app/rest/ItemRestController.java').
kb_method_of_class(startloc_20_5_endloc_30_6_org_slash_dspace_slash_app_slash_rest_slash_ItemRestController_dot_java, startloc_10_1_endloc_90_2_org_slash_dspace_slash_app_slash_rest_slash_ItemRestController_dot_java).
kb_method_has_name(startloc_20_5_endloc_30_6_org_slash_dspace_slash_app_slash_rest_slash_ItemRestController_dot_java, 'patch').
% ItemRestController.patch : itemService.update( ctx, item )
kb_called_from(startloc_25_9_endloc_25_40_org_slash_dspace_slash_app_slash_rest_slash_ItemRestController_dot_java, startloc_20_5_endloc_30_6_org_slash_dspace_slash_app_slash_rest_slash_ItemRestController_dot_java).
kb_call_resolved(startloc_25_9_endloc_25_40_org_slash_dspace_slash_app_slash_rest_slash_ItemRestController_dot_java, 'FirstPartyImport (FirstPartyImportContent {firstPartyImportedLocation = "org/dspace/content/service/ItemService.java", firstPartyImportedName = Just "ItemService"}).update').

% -----------------------------------------------------------------------------
% next.js

% hop 0 : Source's own call sites
must(callgraph_reaches_call_bounded(startloc_3_14_endloc_8_7_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, startloc_4_5_endloc_8_6_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 0)).
% hop 1 : through the hoc edge into the handler lambda
must(callgraph_reaches_call_bounded(startloc_3_14_endloc_8_7_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, startloc_6_13_endloc_6_40_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 1)).
% hop 2 : through the file edge, the prisma sink
must(callgraph_reaches_call_bounded(startloc_3_14_endloc_8_7_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, startloc_10_5_endloc_10_40_app_slash_lib_slash_contact_dot_ts, 2)).
% hop 3 : through the dir edge, fs.readFile
must(callgraph_reaches_call_bounded(startloc_3_14_endloc_8_7_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, startloc_2_5_endloc_2_30_app_slash_lib_slash_helper_dot_ts, 3)).
% the cycle U <-> H terminates, every reachable call site comes once : 7 of them
must(( findall(C, callgraph_reaches_call_bounded(startloc_3_14_endloc_8_7_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, C, 10), Cs),
       length(Cs, 7), sort(Cs, Sorted), length(Sorted, 7) )).
% a bound past the graph's depth changes nothing
must(( findall(C, callgraph_reaches_call_bounded(startloc_3_14_endloc_8_7_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, C, 3), C3), length(C3, 7) )).
% the one-hop edges themselves
must(callgraph_reach_edge(startloc_3_14_endloc_8_7_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, startloc_5_18_endloc_7_10_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts)).
must(callgraph_reach_edge(startloc_5_18_endloc_7_10_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, startloc_9_1_endloc_14_2_app_slash_lib_slash_contact_dot_ts)).
must(callgraph_reach_edge(startloc_9_1_endloc_14_2_app_slash_lib_slash_contact_dot_ts, startloc_1_1_endloc_5_2_app_slash_lib_slash_helper_dot_ts)).

% the bound is respected : the lambda's call sites are 1 hop away, readFile 3
must_not(callgraph_reaches_call_bounded(startloc_3_14_endloc_8_7_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, startloc_6_13_endloc_6_40_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 0)).
must_not(callgraph_reaches_call_bounded(startloc_3_14_endloc_8_7_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, startloc_2_5_endloc_2_30_app_slash_lib_slash_helper_dot_ts, 2)).
% an uncalled function is never reached
must_not(callgraph_reaches_call_bounded(startloc_3_14_endloc_8_7_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, startloc_1_28_endloc_1_42_app_slash_lib_slash_orphan_dot_ts, 10)).
% edges are directed : from U nothing leads back to the route
must_not(callgraph_reaches_call_bounded(startloc_9_1_endloc_14_2_app_slash_lib_slash_contact_dot_ts, startloc_4_5_endloc_8_6_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, 10)).
% a 1st party call with no matching def is no edge
must_not(callgraph_reach_edge(startloc_5_18_endloc_7_10_app_slash_api_slash_v2_slash_contacts_slash_bulk_slash_route_dot_ts, startloc_1_1_endloc_1_45_app_slash_lib_slash_orphan_dot_ts)).

% -----------------------------------------------------------------------------
% java

% the dispatch edge reaches the implementation's Files.delete in 1 hop
must(callgraph_reaches_call_bounded(startloc_20_5_endloc_30_6_org_slash_dspace_slash_app_slash_rest_slash_ItemRestController_dot_java, startloc_60_9_endloc_60_30_org_slash_dspace_slash_content_slash_ItemServiceImpl_dot_java, 1)).
must_not(callgraph_reaches_call_bounded(startloc_20_5_endloc_30_6_org_slash_dspace_slash_app_slash_rest_slash_ItemRestController_dot_java, startloc_60_9_endloc_60_30_org_slash_dspace_slash_content_slash_ItemServiceImpl_dot_java, 0)).
