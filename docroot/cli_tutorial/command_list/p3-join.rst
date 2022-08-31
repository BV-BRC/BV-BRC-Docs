.. _cli::p3-join:


#######
p3-join
#######


*****************************
Join Two Files on a Key Field
*****************************



.. code-block:: perl

     p3-join.pl [options] file1 file2


Join two files together on a single key field. Each record in the output will contain the fields from the first
file followed by the fields from the second file except for its key field. For each record in the first file,
every matching record in the second file will be appended. If no second-file records match, the first-file record
will be skipped.

Parameters
==========


The positional parameters are the names of the two files. If only one file is specified, the second file
will be taken from the standard input.  If a hyphen \ ``-``\  is used for the first parameter, the first file
will be taken from the standard input.

The standard input can be overridden using the options in :ref:`cli-input-options`.

Additional command-line options are the following.


- key1
 
 The index (1-based) or name of the key column in the first file. The default \ ``0``\ , indicating the last column.
 


- key2
 
 The index (1-based) or name of the key column in the second file. The default is the value of \ ``--key1``\ .
 


- nohead
 
 If specified, the files are assumed to not have headers.
 


- batchSize
 
 The number of records to read in each group from the first file.  The default is \ ``10``\ .
 


- only
 
 If specified, a comma-delimited list of column names or indices (1-based) from the second file.  Only these fields will be included in
 the output.
 


- nonblank
 
 If specified, lines with blank keys will be removed from the files.
 


- left
 
 If specified, all lines from the first file will be included in the output, even if there is not a matching copy of the second file.
 



