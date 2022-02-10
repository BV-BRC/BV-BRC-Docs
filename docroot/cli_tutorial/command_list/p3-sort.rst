.. _cli::p3-sort:


#######
p3-sort
#######

.. highlight:: perl


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

The standard input can be overriddn using the options in :ref:`cli-input-options`.

The following additional options are suppported.


count
 
 If specified, the output will consist only of the key fields with a count column added.
 


nonblank
 
 If specified, records with at least one empty key field will be discarded.
 


unique
 
 Only include one output line for each key value.
 



