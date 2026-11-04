% fixture : sinks/files/nodejs/native.pl

% import { readFile, writeFile } from 'fs/promises'

% await readFile( path )
kb_call_resolved(startloc_12_9_endloc_12_27_src_slash_routes_slash_files_dot_ts, 'fs/promises.readFile').

% await writeFile( path, data ) : the sink is the path arg
kb_call_resolved(startloc_13_9_endloc_13_34_src_slash_routes_slash_files_dot_ts, 'fs/promises.writeFile').
kb_arg_i_for_call(startloc_13_19_endloc_13_23_src_slash_routes_slash_files_dot_ts, 0, startloc_13_9_endloc_13_34_src_slash_routes_slash_files_dot_ts).
kb_arg_i_for_call(startloc_13_25_endloc_13_29_src_slash_routes_slash_files_dot_ts, 1, startloc_13_9_endloc_13_34_src_slash_routes_slash_files_dot_ts).

% readFileSync( path ) from 'fs' : only the promises api is listed
kb_call_resolved(startloc_14_9_endloc_14_31_src_slash_routes_slash_files_dot_ts, 'fs.readFileSync').
% fs.writeFileSync( path, data ) : not the promises api, its path arg is not a sink
kb_call_resolved(startloc_15_9_endloc_15_38_src_slash_routes_slash_files_dot_ts, 'fs.writeFileSync').
kb_arg_i_for_call(startloc_15_25_endloc_15_29_src_slash_routes_slash_files_dot_ts, 0, startloc_15_9_endloc_15_38_src_slash_routes_slash_files_dot_ts).

must(sinks_arbitrary_file_read_nodejs(startloc_12_9_endloc_12_27_src_slash_routes_slash_files_dot_ts)).
must(sinks_arbitrary_file_write_nodejs(startloc_13_19_endloc_13_23_src_slash_routes_slash_files_dot_ts)).
% wired into the family api
must(sinks_arbitrary_file_read(startloc_12_9_endloc_12_27_src_slash_routes_slash_files_dot_ts)).
must(sinks_arbitrary_file_write(startloc_13_19_endloc_13_23_src_slash_routes_slash_files_dot_ts)).

% the data arg of writeFile is not the path
must_not(sinks_arbitrary_file_write_nodejs(startloc_13_25_endloc_13_29_src_slash_routes_slash_files_dot_ts)).
% the write call itself is not the sink, its path arg is
must_not(sinks_arbitrary_file_write_nodejs(startloc_13_9_endloc_13_34_src_slash_routes_slash_files_dot_ts)).
must_not(sinks_arbitrary_file_read_nodejs(startloc_14_9_endloc_14_31_src_slash_routes_slash_files_dot_ts)).
must_not(sinks_arbitrary_file_write_nodejs(startloc_15_25_endloc_15_29_src_slash_routes_slash_files_dot_ts)).
% writing is not reading
must_not(sinks_arbitrary_file_read_nodejs(startloc_13_9_endloc_13_34_src_slash_routes_slash_files_dot_ts)).
