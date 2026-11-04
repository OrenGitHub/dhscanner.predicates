% fixture : sinks/files/python/native.pl

% --- read ( the call is the sink )
% open( path )
kb_call_resolved(startloc_20_14_endloc_20_24_weblate_slash_trans_slash_views_slash_files_dot_py, 'open').
% django.http.FileResponse( open( path, "rb" ) )
kb_call_resolved(startloc_21_16_endloc_21_50_weblate_slash_trans_slash_views_slash_files_dot_py, 'django.http.FileResponse').
% Path( p ).read_text() : method suffix
kb_call_resolved(startloc_22_15_endloc_22_35_weblate_slash_trans_slash_views_slash_files_dot_py, 'pathlib.Path.read_text').
% p.read_bytes() on a path kept in a variable : method suffix
kb_call_resolved(startloc_23_15_endloc_23_29_weblate_slash_trans_slash_views_slash_files_dot_py, 'Unknown.read_bytes').
% f.read() : too generic
kb_call_resolved(startloc_24_15_endloc_24_23_weblate_slash_trans_slash_views_slash_files_dot_py, 'Unknown.read').
% Path( p ) : building a path is not reading it
kb_call_resolved(startloc_25_15_endloc_25_22_weblate_slash_trans_slash_views_slash_files_dot_py, 'pathlib.Path').
% os.path.exists( p ) : a check
kb_call_resolved(startloc_26_8_endloc_26_25_weblate_slash_trans_slash_views_slash_files_dot_py, 'os.path.exists').

% --- write ( the path arg is the sink, its index depends on the fqn )
% shutil.copy( src, dst ) : dst, index 1
kb_call_resolved(startloc_30_5_endloc_30_27_weblate_slash_trans_slash_views_slash_files_dot_py, 'shutil.copy').
kb_arg_i_for_call(startloc_30_17_endloc_30_20_weblate_slash_trans_slash_views_slash_files_dot_py, 0, startloc_30_5_endloc_30_27_weblate_slash_trans_slash_views_slash_files_dot_py).
kb_arg_i_for_call(startloc_30_22_endloc_30_25_weblate_slash_trans_slash_views_slash_files_dot_py, 1, startloc_30_5_endloc_30_27_weblate_slash_trans_slash_views_slash_files_dot_py).
% os.rename( src, dst ) : dst, index 1
kb_call_resolved(startloc_31_5_endloc_31_25_weblate_slash_trans_slash_views_slash_files_dot_py, 'os.rename').
kb_arg_i_for_call(startloc_31_20_endloc_31_23_weblate_slash_trans_slash_views_slash_files_dot_py, 1, startloc_31_5_endloc_31_25_weblate_slash_trans_slash_views_slash_files_dot_py).
% p.write_text( content ) : the only arg, index 0
kb_call_resolved(startloc_32_5_endloc_32_27_weblate_slash_trans_slash_views_slash_files_dot_py, 'Unknown.write_text').
kb_arg_i_for_call(startloc_32_18_endloc_32_25_weblate_slash_trans_slash_views_slash_files_dot_py, 0, startloc_32_5_endloc_32_27_weblate_slash_trans_slash_views_slash_files_dot_py).
% f.write( content ) : too generic
kb_call_resolved(startloc_33_5_endloc_33_22_weblate_slash_trans_slash_views_slash_files_dot_py, 'Unknown.write').
kb_arg_i_for_call(startloc_33_13_endloc_33_20_weblate_slash_trans_slash_views_slash_files_dot_py, 0, startloc_33_5_endloc_33_22_weblate_slash_trans_slash_views_slash_files_dot_py).

% --- delete ( the call is the sink )
% os.unlink( path )
kb_call_resolved(startloc_40_5_endloc_40_20_weblate_slash_trans_slash_views_slash_files_dot_py, 'os.unlink').
% shutil.rmtree( dir )
kb_call_resolved(startloc_41_5_endloc_41_23_weblate_slash_trans_slash_views_slash_files_dot_py, 'shutil.rmtree').
% Path( p ).unlink()
kb_call_resolved(startloc_42_5_endloc_42_23_weblate_slash_trans_slash_views_slash_files_dot_py, 'pathlib.Path.unlink').
% p.unlink() on a path kept in a variable : deletion has no suffix match
kb_call_resolved(startloc_43_5_endloc_43_15_weblate_slash_trans_slash_views_slash_files_dot_py, 'Unknown.unlink').

must(sinks_arbitrary_file_read_python(startloc_20_14_endloc_20_24_weblate_slash_trans_slash_views_slash_files_dot_py)).
must(sinks_arbitrary_file_read_python(startloc_21_16_endloc_21_50_weblate_slash_trans_slash_views_slash_files_dot_py)).
must(sinks_arbitrary_file_read_python(startloc_22_15_endloc_22_35_weblate_slash_trans_slash_views_slash_files_dot_py)).
must(sinks_arbitrary_file_read_python(startloc_23_15_endloc_23_29_weblate_slash_trans_slash_views_slash_files_dot_py)).
must(sinks_arbitrary_file_write_python(startloc_30_22_endloc_30_25_weblate_slash_trans_slash_views_slash_files_dot_py)).
must(sinks_arbitrary_file_write_python(startloc_31_20_endloc_31_23_weblate_slash_trans_slash_views_slash_files_dot_py)).
must(sinks_arbitrary_file_write_python(startloc_32_18_endloc_32_25_weblate_slash_trans_slash_views_slash_files_dot_py)).
must(sinks_arbitrary_file_deletion_python(startloc_40_5_endloc_40_20_weblate_slash_trans_slash_views_slash_files_dot_py)).
must(sinks_arbitrary_file_deletion_python(startloc_41_5_endloc_41_23_weblate_slash_trans_slash_views_slash_files_dot_py)).
must(sinks_arbitrary_file_deletion_python(startloc_42_5_endloc_42_23_weblate_slash_trans_slash_views_slash_files_dot_py)).
% wired into the family api
must(sinks_arbitrary_file_read(startloc_20_14_endloc_20_24_weblate_slash_trans_slash_views_slash_files_dot_py)).
must(sinks_arbitrary_file_write(startloc_30_22_endloc_30_25_weblate_slash_trans_slash_views_slash_files_dot_py)).
must(sinks_arbitrary_file_deletion(startloc_40_5_endloc_40_20_weblate_slash_trans_slash_views_slash_files_dot_py)).

must_not(sinks_arbitrary_file_read_python(startloc_24_15_endloc_24_23_weblate_slash_trans_slash_views_slash_files_dot_py)).
must_not(sinks_arbitrary_file_read_python(startloc_25_15_endloc_25_22_weblate_slash_trans_slash_views_slash_files_dot_py)).
must_not(sinks_arbitrary_file_read_python(startloc_26_8_endloc_26_25_weblate_slash_trans_slash_views_slash_files_dot_py)).
% the src arg ( index 0 ) of shutil.copy is not the written path
must_not(sinks_arbitrary_file_write_python(startloc_30_17_endloc_30_20_weblate_slash_trans_slash_views_slash_files_dot_py)).
must_not(sinks_arbitrary_file_write(startloc_30_17_endloc_30_20_weblate_slash_trans_slash_views_slash_files_dot_py)).
must_not(sinks_arbitrary_file_write_python(startloc_33_13_endloc_33_20_weblate_slash_trans_slash_views_slash_files_dot_py)).
% the write call itself is not the write sink
must_not(sinks_arbitrary_file_write_python(startloc_30_5_endloc_30_27_weblate_slash_trans_slash_views_slash_files_dot_py)).
must_not(sinks_arbitrary_file_deletion_python(startloc_43_5_endloc_43_15_weblate_slash_trans_slash_views_slash_files_dot_py)).
% open is listed as a read, never as a deletion
must_not(sinks_arbitrary_file_deletion_python(startloc_20_14_endloc_20_24_weblate_slash_trans_slash_views_slash_files_dot_py)).
