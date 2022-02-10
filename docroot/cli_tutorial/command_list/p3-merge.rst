.. _cli::p3-merge:


########
p3-merge
########

.. highlight:: perl


****************************************************
Merge Two Files-- Union, Intersection, or Difference
****************************************************



.. code-block:: perl

     p3-merge.pl [options] file1 file2 ... fileN


This script reads one or more files and outputs a new one containing whole lines from those files. The output file can be the union (all lines from all files),
intersection (all lines present in all files), or difference (all lines in the first but not the others). All files must have the same header line.
This script has a function similar to :ref:`cli::p3-file-filter`, except that script uses a single key field instead of whole lines and is limited to only two files.

Duplicate lines will be removed. That is, a line that occurs in multiple files or occurs more than once in any file will only appear once in the output.

Any one file can be replaced by the standard input.

Parameters
==========


The positional parameters are the names of the files. A minus sign (\ ``-``\ ) can be used to represent the standard input.

The standard input can be overridden using the options in :ref:`cli-input-options`.

Additional command-line options are the following.


nohead
 
 If specified, the files are presumed to have no headers.
 


and
 
 The output should only contain lines found in both files. This is mutually exclusive with \ ``or``\  and \ ``diff``\ .
 


or
 
 The output should contain all lines from either file. This is the default.
 


diff
 
 The output should contain lines from the first file not found in the second. This is mutually exclusive with \ ``and``\  and \ ``diff``\ .
 



