:- style_check(-singleton).

% -----------------------------------------------------------------------------
% C# file sinks : System.IO and ASP.NET Core's physical file results.
%
% One fqn per clause, split by what the call does to the file :
%
%   read     -> `sinks_arbitrary_file_read_csharp( Call )`
%   write    -> `sinks_arbitrary_file_write_csharp( Arg )`  ( the path arg,
%               same convention as `sinks/files/java/native.pl` )
%   delete   -> `sinks_arbitrary_file_deletion_csharp( Call )`
%
% The kb does not type C# receivers, and a static class receiver loses its
% name : `File.ReadAllText( p )` reads 'Unknown.ReadAllText'. So only the
% `File` methods whose name no common API shares are listed ; `File.Delete`,
% `File.Copy`, `File.Move`, `File.OpenRead`, `Directory.Delete` read
% 'Unknown.Delete' ( .. ), too generic to match : not covered yet.
%
% Constructors resolve to the class name itself :
%
%   new FileStream( path, FileMode.Create )     'FileStream'     read and write
%   new StreamReader( path )                    'StreamReader'
%   new StreamWriter( path )                    'StreamWriter'
%   new FileInfo( path ).Delete()               'FileInfo.Delete'
%   return PhysicalFile( path, "image/png" );   'PhysicalFile'   ( implicit this )
%
% `StreamReader` / `StreamWriter` also wrap a stream ( `new StreamReader( s )` ),
% `FileStream` opens for reading or writing by its mode : all over
% approximations the dataflow on top narrows. Plain `new FileInfo( p )` only
% builds a path.
%
% No taint check here, dataflow is composed on top.
% -----------------------------------------------------------------------------

sinks_arbitrary_file_read_csharp(Call) :-
    kb_call_resolved(Call, Fqn),
    csharp_file_read_fqn(Fqn).

sinks_arbitrary_file_read_csharp(Call) :-
    kb_call_resolved(Call, Method),
    csharp_controller_file_method(Method),
    kb_called_from(Call, Caller),
    callgraph_enclosing_method(Caller, Enclosing),
    kb_method_of_class(Enclosing, Class),
    \+ callgraph_java_lookup(Class, Method, _).

sinks_arbitrary_file_write_csharp(Arg) :-
    kb_arg_i_for_call(Arg, 0, Call),
    kb_call_resolved(Call, Fqn),
    csharp_file_write_fqn(Fqn).

sinks_arbitrary_file_deletion_csharp(Call) :-
    kb_call_resolved(Call, Fqn),
    csharp_file_delete_fqn(Fqn).

csharp_file_read_fqn('FileStream').
csharp_file_read_fqn('StreamReader').
csharp_file_read_fqn('PhysicalFileResult').
csharp_file_read_fqn(Fqn) :-
    csharp_file_read_method(Method),
    atom_concat('Unknown.', Method, Fqn).

csharp_file_read_method('ReadAllText').
csharp_file_read_method('ReadAllTextAsync').
csharp_file_read_method('ReadAllBytes').
csharp_file_read_method('ReadAllBytesAsync').
csharp_file_read_method('ReadAllLines').
csharp_file_read_method('ReadAllLinesAsync').

csharp_file_write_fqn('FileStream').
csharp_file_write_fqn('StreamWriter').
csharp_file_write_fqn(Fqn) :-
    csharp_file_write_method(Method),
    atom_concat('Unknown.', Method, Fqn).

csharp_file_write_method('WriteAllText').
csharp_file_write_method('WriteAllTextAsync').
csharp_file_write_method('WriteAllBytes').
csharp_file_write_method('WriteAllBytesAsync').
csharp_file_write_method('WriteAllLines').
csharp_file_write_method('WriteAllLinesAsync').
csharp_file_write_method('AppendAllText').
csharp_file_write_method('AppendAllTextAsync').
csharp_file_write_method('AppendAllLines').
csharp_file_write_method('AppendAllLinesAsync').

csharp_file_delete_fqn('FileInfo.Delete').
csharp_file_delete_fqn('DirectoryInfo.Delete').

% ControllerBase methods that answer with the file at their path arg
csharp_controller_file_method('PhysicalFile').
