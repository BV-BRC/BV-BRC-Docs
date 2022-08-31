.. _cli::p3-compare-cols:


###############
p3-compare-cols
###############


*****************************
Compare Two Columns in a File
*****************************



.. code-block:: perl

     p3-compare-cols.pl [options] col1 col2


Read in a single tab-delimited file and output a comparison between two columns.  The output will be a tab-delimited
matrix indicating how many times each value in the second column occurs with each value in the first.  The number of
distinct values in the second column should be small.

Parameters
==========


The positional parameters are positions (1-based) or names of the two columns being compared.  The first column will be
rows, and the second will be matrix columns.

The standard input can be overridden using the options in :ref:`cli-input-options`.

The command-line options are as follows.


- save
 
 The name of a file in which to save lines where the two column values do not match.
 



