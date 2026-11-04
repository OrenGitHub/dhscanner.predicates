% fixture : dataflow/api.pl

% -----------------------------------------------------------------------------
% intra-procedural edges, app/views.py

% url = request.args.get( 'u' )         ( call -> url )
kb_dataflow_edge(startloc_5_11_endloc_5_34_app_slash_views_dot_py, startloc_5_5_endloc_5_8_app_slash_views_dot_py).
% target = url                          ( url -> target )
kb_dataflow_edge(startloc_5_5_endloc_5_8_app_slash_views_dot_py, startloc_6_5_endloc_6_11_app_slash_views_dot_py).
% requests.get( target )                ( target -> arg )
kb_dataflow_edge(startloc_6_5_endloc_6_11_app_slash_views_dot_py, startloc_7_18_endloc_7_24_app_slash_views_dot_py).
% a shortcut : also requests.get( url ) ( url -> arg directly )
kb_dataflow_edge(startloc_5_5_endloc_5_8_app_slash_views_dot_py, startloc_8_18_endloc_8_21_app_slash_views_dot_py).
kb_dataflow_edge(startloc_6_5_endloc_6_11_app_slash_views_dot_py, startloc_8_18_endloc_8_21_app_slash_views_dot_py).

% a loop : while ...: a = b ; b = a ; then print( b )
kb_dataflow_edge(startloc_10_5_endloc_10_6_app_slash_views_dot_py, startloc_11_5_endloc_11_6_app_slash_views_dot_py).
kb_dataflow_edge(startloc_11_5_endloc_11_6_app_slash_views_dot_py, startloc_10_5_endloc_10_6_app_slash_views_dot_py).
kb_dataflow_edge(startloc_11_5_endloc_11_6_app_slash_views_dot_py, startloc_12_11_endloc_12_12_app_slash_views_dot_py).

% a broken chain : x = input() ... ( nothing ) ... y = 'const' ; f( y )
kb_dataflow_edge(startloc_14_9_endloc_14_16_app_slash_views_dot_py, startloc_14_5_endloc_14_6_app_slash_views_dot_py).
kb_dataflow_edge(startloc_15_5_endloc_15_6_app_slash_views_dot_py, startloc_16_7_endloc_16_8_app_slash_views_dot_py).

% eleven assignments in a row : v0 -> v1 -> ... -> v11 ( past the 10 edge bound )
kb_dataflow_edge(startloc_20_5_endloc_20_7_app_slash_views_dot_py, startloc_21_5_endloc_21_7_app_slash_views_dot_py).
kb_dataflow_edge(startloc_21_5_endloc_21_7_app_slash_views_dot_py, startloc_22_5_endloc_22_7_app_slash_views_dot_py).
kb_dataflow_edge(startloc_22_5_endloc_22_7_app_slash_views_dot_py, startloc_23_5_endloc_23_7_app_slash_views_dot_py).
kb_dataflow_edge(startloc_23_5_endloc_23_7_app_slash_views_dot_py, startloc_24_5_endloc_24_7_app_slash_views_dot_py).
kb_dataflow_edge(startloc_24_5_endloc_24_7_app_slash_views_dot_py, startloc_25_5_endloc_25_7_app_slash_views_dot_py).
kb_dataflow_edge(startloc_25_5_endloc_25_7_app_slash_views_dot_py, startloc_26_5_endloc_26_7_app_slash_views_dot_py).
kb_dataflow_edge(startloc_26_5_endloc_26_7_app_slash_views_dot_py, startloc_27_5_endloc_27_7_app_slash_views_dot_py).
kb_dataflow_edge(startloc_27_5_endloc_27_7_app_slash_views_dot_py, startloc_28_5_endloc_28_7_app_slash_views_dot_py).
kb_dataflow_edge(startloc_28_5_endloc_28_7_app_slash_views_dot_py, startloc_29_5_endloc_29_7_app_slash_views_dot_py).
kb_dataflow_edge(startloc_29_5_endloc_29_7_app_slash_views_dot_py, startloc_30_5_endloc_30_7_app_slash_views_dot_py).
kb_dataflow_edge(startloc_30_5_endloc_30_7_app_slash_views_dot_py, startloc_31_5_endloc_31_8_app_slash_views_dot_py).

% -----------------------------------------------------------------------------
% inter-procedural : app/views.py calls 1st party helpers in app/utils.py

% name = request.args.get( 'n' ) ; run_user( name )      run_user imported from app/utils.py
kb_dataflow_edge(startloc_40_12_endloc_40_35_app_slash_views_dot_py, startloc_40_5_endloc_40_9_app_slash_views_dot_py).
kb_dataflow_edge(startloc_40_5_endloc_40_9_app_slash_views_dot_py, startloc_41_14_endloc_41_18_app_slash_views_dot_py).
kb_arg_i_for_call(startloc_41_14_endloc_41_18_app_slash_views_dot_py, 0, startloc_41_5_endloc_41_19_app_slash_views_dot_py).
kb_call_1st_party_func_defined_in_file(startloc_41_5_endloc_41_19_app_slash_views_dot_py, 'run_user', 'app/utils.py').
% def run_user( cmd ): os.system( cmd )
kb_func_def(startloc_3_1_endloc_4_23_app_slash_utils_dot_py, 'run_user', 'app/utils.py', 'app').
kb_param_i_of_callable(startloc_3_14_endloc_3_17_app_slash_utils_dot_py, 0, startloc_3_1_endloc_4_23_app_slash_utils_dot_py).
kb_dataflow_edge(startloc_3_14_endloc_3_17_app_slash_utils_dot_py, startloc_4_15_endloc_4_18_app_slash_utils_dot_py).

% path = request.args.get( 'p' ) ; read_file( path )     read_file resolved through its dir
kb_dataflow_edge(startloc_44_12_endloc_44_35_app_slash_views_dot_py, startloc_44_5_endloc_44_9_app_slash_views_dot_py).
kb_dataflow_edge(startloc_44_5_endloc_44_9_app_slash_views_dot_py, startloc_45_15_endloc_45_19_app_slash_views_dot_py).
kb_arg_i_for_call(startloc_45_15_endloc_45_19_app_slash_views_dot_py, 0, startloc_45_5_endloc_45_20_app_slash_views_dot_py).
kb_call_1st_party_func_defined_in_dir(startloc_45_5_endloc_45_20_app_slash_views_dot_py, 'read_file', 'app').
% def read_file( p ): return open( p ).read()
kb_func_def(startloc_7_1_endloc_8_30_app_slash_utils_dot_py, 'read_file', 'app/utils.py', 'app').
kb_param_i_of_callable(startloc_7_15_endloc_7_16_app_slash_utils_dot_py, 0, startloc_7_1_endloc_8_30_app_slash_utils_dot_py).
kb_dataflow_edge(startloc_7_15_endloc_7_16_app_slash_utils_dot_py, startloc_8_17_endloc_8_18_app_slash_utils_dot_py).

% tag = request.args.get( 't' ) ; log_it( 'info', tag )  tag is arg 1, log_it has a single param
kb_dataflow_edge(startloc_48_11_endloc_48_34_app_slash_views_dot_py, startloc_48_5_endloc_48_8_app_slash_views_dot_py).
kb_dataflow_edge(startloc_48_5_endloc_48_8_app_slash_views_dot_py, startloc_49_20_endloc_49_23_app_slash_views_dot_py).
kb_arg_i_for_call(startloc_49_12_endloc_49_18_app_slash_views_dot_py, 0, startloc_49_5_endloc_49_24_app_slash_views_dot_py).
kb_arg_i_for_call(startloc_49_20_endloc_49_23_app_slash_views_dot_py, 1, startloc_49_5_endloc_49_24_app_slash_views_dot_py).
kb_call_1st_party_func_defined_in_file(startloc_49_5_endloc_49_24_app_slash_views_dot_py, 'log_it', 'app/utils.py').
% def log_it( level ): logger.log( level )
kb_func_def(startloc_11_1_endloc_12_25_app_slash_utils_dot_py, 'log_it', 'app/utils.py', 'app').
kb_param_i_of_callable(startloc_11_12_endloc_11_17_app_slash_utils_dot_py, 0, startloc_11_1_endloc_12_25_app_slash_utils_dot_py).
kb_dataflow_edge(startloc_11_12_endloc_11_17_app_slash_utils_dot_py, startloc_12_19_endloc_12_24_app_slash_utils_dot_py).

% -----------------------------------------------------------------------------
% expectations

% one edge
must(dataflow_intra_path(startloc_5_11_endloc_5_34_app_slash_views_dot_py, startloc_5_5_endloc_5_8_app_slash_views_dot_py,
     [(startloc_5_11_endloc_5_34_app_slash_views_dot_py, startloc_5_5_endloc_5_8_app_slash_views_dot_py)])).
% three edges
must(dataflow_intra_path(startloc_5_11_endloc_5_34_app_slash_views_dot_py, startloc_7_18_endloc_7_24_app_slash_views_dot_py,
     [(startloc_5_11_endloc_5_34_app_slash_views_dot_py, startloc_5_5_endloc_5_8_app_slash_views_dot_py),
      (startloc_5_5_endloc_5_8_app_slash_views_dot_py, startloc_6_5_endloc_6_11_app_slash_views_dot_py),
      (startloc_6_5_endloc_6_11_app_slash_views_dot_py, startloc_7_18_endloc_7_24_app_slash_views_dot_py)])).
% the shortest path wins ( url -> arg, not url -> target -> arg ), and only one answer
must(findall(P, dataflow_intra_path(startloc_5_5_endloc_5_8_app_slash_views_dot_py, startloc_8_18_endloc_8_21_app_slash_views_dot_py, P),
     [[(startloc_5_5_endloc_5_8_app_slash_views_dot_py, startloc_8_18_endloc_8_21_app_slash_views_dot_py)]])).
% through a loop, without going round it
must(dataflow_intra_path(startloc_10_5_endloc_10_6_app_slash_views_dot_py, startloc_12_11_endloc_12_12_app_slash_views_dot_py,
     [(startloc_10_5_endloc_10_6_app_slash_views_dot_py, startloc_11_5_endloc_11_6_app_slash_views_dot_py),
      (startloc_11_5_endloc_11_6_app_slash_views_dot_py, startloc_12_11_endloc_12_12_app_slash_views_dot_py)])).
% ten edges : exactly at the bound
must(( dataflow_intra_path(startloc_21_5_endloc_21_7_app_slash_views_dot_py, startloc_31_5_endloc_31_8_app_slash_views_dot_py, P), length(P, 10) )).
% the bounded walker honours its budget
must(dataflow_bounded_intra_path(startloc_5_11_endloc_5_34_app_slash_views_dot_py, startloc_7_18_endloc_7_24_app_slash_views_dot_py, 3,
     [startloc_5_11_endloc_5_34_app_slash_views_dot_py], _)).
must_not(dataflow_bounded_intra_path(startloc_5_11_endloc_5_34_app_slash_views_dot_py, startloc_7_18_endloc_7_24_app_slash_views_dot_py, 2,
     [startloc_5_11_endloc_5_34_app_slash_views_dot_py], _)).

% broken chain : x never reaches f( y )
must_not(dataflow_intra_path(startloc_14_9_endloc_14_16_app_slash_views_dot_py, startloc_16_7_endloc_16_8_app_slash_views_dot_py, _)).
% eleven edges : past the bound
must_not(dataflow_intra_path(startloc_20_5_endloc_20_7_app_slash_views_dot_py, startloc_31_5_endloc_31_8_app_slash_views_dot_py, _)).
% edges are directed
must_not(dataflow_intra_path(startloc_7_18_endloc_7_24_app_slash_views_dot_py, startloc_5_11_endloc_5_34_app_slash_views_dot_py, _)).

% arg -> param edges : defined-in-file and defined-in-dir resolution
must(dataflow_inter_edge(startloc_41_14_endloc_41_18_app_slash_views_dot_py, startloc_3_14_endloc_3_17_app_slash_utils_dot_py)).
must(dataflow_inter_edge_from_arg_to_param(startloc_45_15_endloc_45_19_app_slash_views_dot_py, startloc_7_15_endloc_7_16_app_slash_utils_dot_py)).
% arg 1 has no matching param ( log_it has only param 0 )
must_not(dataflow_inter_edge(startloc_49_20_endloc_49_23_app_slash_views_dot_py, _)).

% request.args.get -> name -> run_user( name ) -> cmd -> os.system( cmd )
must(dataflow_inter_path(startloc_40_12_endloc_40_35_app_slash_views_dot_py, startloc_4_15_endloc_4_18_app_slash_utils_dot_py,
     [(startloc_40_12_endloc_40_35_app_slash_views_dot_py, startloc_40_5_endloc_40_9_app_slash_views_dot_py),
      (startloc_40_5_endloc_40_9_app_slash_views_dot_py, startloc_41_14_endloc_41_18_app_slash_views_dot_py),
      (startloc_41_14_endloc_41_18_app_slash_views_dot_py, startloc_3_14_endloc_3_17_app_slash_utils_dot_py),
      (startloc_3_14_endloc_3_17_app_slash_utils_dot_py, startloc_4_15_endloc_4_18_app_slash_utils_dot_py)])).
% request.args.get -> path -> read_file( path ) -> p -> open( p )
must(dataflow_inter_path(startloc_44_12_endloc_44_35_app_slash_views_dot_py, startloc_8_17_endloc_8_18_app_slash_utils_dot_py, _)).
% tag lands in arg 1, which no param receives
must_not(dataflow_inter_path(startloc_48_11_endloc_48_34_app_slash_views_dot_py, startloc_12_19_endloc_12_24_app_slash_utils_dot_py, _)).
% name never flows into read_file
must_not(dataflow_inter_path(startloc_40_12_endloc_40_35_app_slash_views_dot_py, startloc_8_17_endloc_8_18_app_slash_utils_dot_py, _)).
