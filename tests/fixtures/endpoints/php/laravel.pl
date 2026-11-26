% fixture : endpoints/php/laravel.pl

% ---------------------------------------------------------------------------
% app/Http/Controllers/ProfileController.php
%
% class ProfileController extends Controller {
kb_class_def(startloc_7_1_endloc_30_2_app_slash_Http_slash_Controllers_slash_ProfileController_dot_php, 'ProfileController', 'app/Http/Controllers/ProfileController.php').
%     public function show( Request $request, $id ) { .. }
kb_method_of_class(startloc_10_5_endloc_14_6_app_slash_Http_slash_Controllers_slash_ProfileController_dot_php, startloc_7_1_endloc_30_2_app_slash_Http_slash_Controllers_slash_ProfileController_dot_php).
kb_method_has_name(startloc_10_5_endloc_14_6_app_slash_Http_slash_Controllers_slash_ProfileController_dot_php, 'show').
kb_param_i_of_callable(startloc_10_26_endloc_10_42_app_slash_Http_slash_Controllers_slash_ProfileController_dot_php, 0, startloc_10_5_endloc_14_6_app_slash_Http_slash_Controllers_slash_ProfileController_dot_php).
kb_param_has_name(startloc_10_26_endloc_10_42_app_slash_Http_slash_Controllers_slash_ProfileController_dot_php, 'request').
kb_param_i_of_callable(startloc_10_44_endloc_10_47_app_slash_Http_slash_Controllers_slash_ProfileController_dot_php, 1, startloc_10_5_endloc_14_6_app_slash_Http_slash_Controllers_slash_ProfileController_dot_php).
kb_param_has_name(startloc_10_44_endloc_10_47_app_slash_Http_slash_Controllers_slash_ProfileController_dot_php, 'id').
%     public function __invoke( Request $request ) { .. }
kb_method_of_class(startloc_20_5_endloc_22_6_app_slash_Http_slash_Controllers_slash_ProfileController_dot_php, startloc_7_1_endloc_30_2_app_slash_Http_slash_Controllers_slash_ProfileController_dot_php).
kb_method_has_name(startloc_20_5_endloc_22_6_app_slash_Http_slash_Controllers_slash_ProfileController_dot_php, '__invoke').

% ---------------------------------------------------------------------------
% routes/web.php
%
% use Illuminate\Support\Facades\Route;
% use App\Http\Controllers\ProfileController;

% Route::get( '/profile/{id}', [ ProfileController::class, 'show' ] );
kb_call_resolved(startloc_5_1_endloc_5_80_routes_slash_web_dot_php, 'Illuminate.Support.Facades.Route.get').
kb_arg_i_for_call(startloc_5_12_endloc_5_28_routes_slash_web_dot_php, 0, startloc_5_1_endloc_5_80_routes_slash_web_dot_php).
kb_const_string(startloc_5_12_endloc_5_28_routes_slash_web_dot_php, '/profile/{id}').
kb_arg_i_for_call(startloc_5_30_endloc_5_70_routes_slash_web_dot_php, 1, startloc_5_1_endloc_5_80_routes_slash_web_dot_php).
kb_call_resolved(startloc_5_30_endloc_5_70_routes_slash_web_dot_php, '<dhscanner-instrumentation>[arrayify]').
kb_arg_i_for_call(startloc_5_31_endloc_5_55_routes_slash_web_dot_php, 0, startloc_5_30_endloc_5_70_routes_slash_web_dot_php).
kb_field_read_of_1st_party_imported_name(startloc_5_31_endloc_5_55_routes_slash_web_dot_php, 'class', 'ProfileController', 'app/Http/Controllers/ProfileController.php').
kb_arg_i_for_call(startloc_5_57_endloc_5_69_routes_slash_web_dot_php, 1, startloc_5_30_endloc_5_70_routes_slash_web_dot_php).
kb_const_string(startloc_5_57_endloc_5_69_routes_slash_web_dot_php, 'show').

% Route::post( 'profile', ProfileController::class );
kb_call_resolved(startloc_6_1_endloc_6_80_routes_slash_web_dot_php, 'Illuminate.Support.Facades.Route.post').
kb_arg_i_for_call(startloc_6_12_endloc_6_28_routes_slash_web_dot_php, 0, startloc_6_1_endloc_6_80_routes_slash_web_dot_php).
kb_const_string(startloc_6_12_endloc_6_28_routes_slash_web_dot_php, 'profile').
kb_arg_i_for_call(startloc_6_30_endloc_6_54_routes_slash_web_dot_php, 1, startloc_6_1_endloc_6_80_routes_slash_web_dot_php).
kb_field_read_of_1st_party_imported_name(startloc_6_30_endloc_6_54_routes_slash_web_dot_php, 'class', 'ProfileController', 'app/Http/Controllers/ProfileController.php').

% Route::any( $prefix, function () { .. } );
kb_call_resolved(startloc_7_1_endloc_7_80_routes_slash_web_dot_php, 'Illuminate.Support.Facades.Route.any').
kb_arg_i_for_call(startloc_7_12_endloc_7_28_routes_slash_web_dot_php, 0, startloc_7_1_endloc_7_80_routes_slash_web_dot_php).
kb_arg_i_for_call(startloc_7_30_endloc_7_60_routes_slash_web_dot_php, 1, startloc_7_1_endloc_7_80_routes_slash_web_dot_php).
kb_callable_source_body_length(startloc_7_30_endloc_7_60_routes_slash_web_dot_php, 1).

% Route::get( '/gone', [ ProfileController::class, 'missing' ] );   // no such method
kb_call_resolved(startloc_8_1_endloc_8_80_routes_slash_web_dot_php, 'Illuminate.Support.Facades.Route.get').
kb_arg_i_for_call(startloc_8_12_endloc_8_28_routes_slash_web_dot_php, 0, startloc_8_1_endloc_8_80_routes_slash_web_dot_php).
kb_const_string(startloc_8_12_endloc_8_28_routes_slash_web_dot_php, '/gone').
kb_arg_i_for_call(startloc_8_30_endloc_8_70_routes_slash_web_dot_php, 1, startloc_8_1_endloc_8_80_routes_slash_web_dot_php).
kb_call_resolved(startloc_8_30_endloc_8_70_routes_slash_web_dot_php, '<dhscanner-instrumentation>[arrayify]').
kb_arg_i_for_call(startloc_8_31_endloc_8_55_routes_slash_web_dot_php, 0, startloc_8_30_endloc_8_70_routes_slash_web_dot_php).
kb_field_read_of_1st_party_imported_name(startloc_8_31_endloc_8_55_routes_slash_web_dot_php, 'class', 'ProfileController', 'app/Http/Controllers/ProfileController.php').
kb_arg_i_for_call(startloc_8_57_endloc_8_69_routes_slash_web_dot_php, 1, startloc_8_30_endloc_8_70_routes_slash_web_dot_php).
kb_const_string(startloc_8_57_endloc_8_69_routes_slash_web_dot_php, 'missing').

% Route::get( .. )->name( 'named' ) : the chained call is not a route
kb_call_resolved(startloc_9_1_endloc_9_80_routes_slash_web_dot_php, 'Illuminate.Support.Facades.Route.get.name').
kb_arg_i_for_call(startloc_9_12_endloc_9_28_routes_slash_web_dot_php, 0, startloc_9_1_endloc_9_80_routes_slash_web_dot_php).
kb_const_string(startloc_9_12_endloc_9_28_routes_slash_web_dot_php, '/named').
kb_arg_i_for_call(startloc_9_30_endloc_9_70_routes_slash_web_dot_php, 1, startloc_9_1_endloc_9_80_routes_slash_web_dot_php).
kb_call_resolved(startloc_9_30_endloc_9_70_routes_slash_web_dot_php, '<dhscanner-instrumentation>[arrayify]').
kb_arg_i_for_call(startloc_9_31_endloc_9_55_routes_slash_web_dot_php, 0, startloc_9_30_endloc_9_70_routes_slash_web_dot_php).
kb_field_read_of_1st_party_imported_name(startloc_9_31_endloc_9_55_routes_slash_web_dot_php, 'class', 'ProfileController', 'app/Http/Controllers/ProfileController.php').
kb_arg_i_for_call(startloc_9_57_endloc_9_69_routes_slash_web_dot_php, 1, startloc_9_30_endloc_9_70_routes_slash_web_dot_php).
kb_const_string(startloc_9_57_endloc_9_69_routes_slash_web_dot_php, 'show').

% Cache::get( '/cached', [ ProfileController::class, 'show' ] );   // not the Route facade
kb_call_resolved(startloc_10_1_endloc_10_80_routes_slash_web_dot_php, 'Illuminate.Support.Facades.Cache.get').
kb_arg_i_for_call(startloc_10_12_endloc_10_28_routes_slash_web_dot_php, 0, startloc_10_1_endloc_10_80_routes_slash_web_dot_php).
kb_const_string(startloc_10_12_endloc_10_28_routes_slash_web_dot_php, '/cached').
kb_arg_i_for_call(startloc_10_30_endloc_10_70_routes_slash_web_dot_php, 1, startloc_10_1_endloc_10_80_routes_slash_web_dot_php).
kb_call_resolved(startloc_10_30_endloc_10_70_routes_slash_web_dot_php, '<dhscanner-instrumentation>[arrayify]').
kb_arg_i_for_call(startloc_10_31_endloc_10_55_routes_slash_web_dot_php, 0, startloc_10_30_endloc_10_70_routes_slash_web_dot_php).
kb_field_read_of_1st_party_imported_name(startloc_10_31_endloc_10_55_routes_slash_web_dot_php, 'class', 'ProfileController', 'app/Http/Controllers/ProfileController.php').
kb_arg_i_for_call(startloc_10_57_endloc_10_69_routes_slash_web_dot_php, 1, startloc_10_30_endloc_10_70_routes_slash_web_dot_php).
kb_const_string(startloc_10_57_endloc_10_69_routes_slash_web_dot_php, 'show').

must(endpoints_http_laravel(startloc_10_5_endloc_14_6_app_slash_Http_slash_Controllers_slash_ProfileController_dot_php, get, '/profile/{id}', startloc_5_1_endloc_5_80_routes_slash_web_dot_php)).
must(endpoints_http(_, get, startloc_5_1_endloc_5_80_routes_slash_web_dot_php, '/profile/{id}')).
must(endpoints_http_laravel(startloc_20_5_endloc_22_6_app_slash_Http_slash_Controllers_slash_ProfileController_dot_php, post, '/profile', startloc_6_1_endloc_6_80_routes_slash_web_dot_php)).
must(endpoints_http_laravel(startloc_7_30_endloc_7_60_routes_slash_web_dot_php, unknown, '{?}', startloc_7_1_endloc_7_80_routes_slash_web_dot_php)).
must(endpoints_user_input_kind_laravel(startloc_10_44_endloc_10_47_app_slash_Http_slash_Controllers_slash_ProfileController_dot_php, 'PathVariable')).
must(endpoints_user_input_kind_laravel(startloc_10_26_endloc_10_42_app_slash_Http_slash_Controllers_slash_ProfileController_dot_php, 'RequestObject')).
must(endpoints_user_input(startloc_10_26_endloc_10_42_app_slash_Http_slash_Controllers_slash_ProfileController_dot_php)).
must_not(endpoints_http_laravel(_, _, _, startloc_8_1_endloc_8_80_routes_slash_web_dot_php)).
must_not(endpoints_http_laravel(_, _, _, startloc_9_1_endloc_9_80_routes_slash_web_dot_php)).
must_not(endpoints_http_laravel(_, _, _, startloc_10_1_endloc_10_80_routes_slash_web_dot_php)).
must_not(endpoints_user_input_kind_laravel(startloc_10_26_endloc_10_42_app_slash_Http_slash_Controllers_slash_ProfileController_dot_php, 'PathVariable')).
