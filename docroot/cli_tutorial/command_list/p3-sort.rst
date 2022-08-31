.. _cli::p3-sort:


#######
p3-sort
#######


****************************
Small File Multi-Column Sort
****************************



.. code-block:: perl

     p3-sort.pl [options] col1 col2 ... colN


This is a sort script variant that sorts a single small file in memory with the ability to specify multiple columns.
It assumes the file has a header, and the columns are tab-delimited. If no columns are specified, it sorts by the
first column only.

Parameters
==========


The positional parameters are the indices (1-based) or names of the key columns. Columns to be sorted numerically
are indicated by a slash-n (\ ``/n``\ ) at the end of the column index or name. So,


.. code-block:: perl

     p3-sort genome.genome_id feature.start/n


Would indicate two key columns, the second of which is to be sorted numerically.

Use \ ``/p``\  to sort in PEG order, which means the column contains FIG feature IDs.

To sort in reverse, add \ ``/r``\  for reverse string sort and \ ``/nr``\  for reverse numeric sort.

The standard input can be overridden using the options in :ref:`cli-input-options`.

The following additional options are suppported.


- count
 
 If specified, the output will consist only of the key fields with a count column added.
 


- nonblank
 
 If specified, records with at least one empty key field will be discarded.
 


- unique
 
 Only include one output line for each key value.  This option is mutually exclusive with \ ``--dups``\ .
 


- dups
 
 Only include lines with duplicate keys in the output.  This option is mutually exclusive with \ ``--unique``\ .
 


- nohead
 
 If specified, the input file has no headers.
 


- verbose
 
 Write progress messages to STDERR.
 



