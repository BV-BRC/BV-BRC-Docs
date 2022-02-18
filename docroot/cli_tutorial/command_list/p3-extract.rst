.. _cli::p3-extract:


##########
p3-extract
##########

.. highlight:: perl


*********************************
Select Columns from an Input File
*********************************



.. code-block:: perl

     p3-extract [options] col1 col2 ... colN


This script extracts the specified columns from a tab-delimited file.

Parameters
==========


The positional parameters are the numbers or names of the columns to include in the output. The column numbers
are 1-based, and the column names are taken from the header record of the input file.

The standard input may be overridden by the command-line options given in :ref:`cli-input-options`.

The following additional options are supported.


all
 
 Output all the columns. This simply copies the file.
 


nohead
 
 If specified, the file is presumed to have no headers.
 



