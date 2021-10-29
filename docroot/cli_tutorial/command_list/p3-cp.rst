.. _cli::p3-cp:


#####
p3-cp
#####


******************************************************
Copy files between local computer and PATRIC workspace
******************************************************



.. code-block:: perl

     p3-cp [options] source_file target_file
     p3-cp [options] source_file ... target_directory
     p3-cp -R [options] source_file ... target_directory


In the first form, copy source_file to target_file. Here, neither parameter may be a directory.

In the second form, copy all source_file items to target_directory.

In the third form, recursively copy all source_file items to target_directory.

Source and destination file and directories may either be files local 
to the current computer or in the PATRIC workspace. Names in the workspace
are denoted with a ws: prefix.


**************
Usage synopsis
**************



.. code-block:: perl

     p3-cp [options] source dest
     p3-cp [options] source... directory
     p3-cp [options] -t directory source...


Copy source to dest, or multiple source(s) to directory.

Source and destination file and directories may either be files local 
to the current computer or in the PATRIC workspace. Names in the workspace
are denoted with a ws: prefix.

The following options may be provided:


.. code-block:: perl

     -r or --recursive	           	If source is a directory, copies the directory and its contents.
 				   	If source ends in /, copy the contents of the directory.
     -p or --workspace-path-prefix STR	Prefix for relative workspace pathnames specified with ws: 
     -f or --overwrite			If a file to be uploaded already exists, overwrite it.
     -m or --map-suffix suffix=type	When copying to workspace, map a file with the given
     					suffix to the given type.


