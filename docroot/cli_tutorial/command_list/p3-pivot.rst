.. _cli::p3-pivot:


########
p3-pivot
########


**************************************
Create a Pivot Analysis of Two Columns
**************************************



.. code-block:: perl

     p3-pivot.pl [options] col1 col2


This script analyzes the frequency distribution of the values in one column compared to the values in the
other.  Unlike :ref:`cli::p3-compare-cols`, it can be used when the number of possible values for the second
column is very high.  Instead of a matrix, the output is in the form of a five-column table: (0) the value in
the first column, (1) the value in the second column, (2) the number of times the pair occured, (3) the
percent of rows containing the first column's value that had the second column's value, and (4) the percent
of rows containing the second column's value that had the first column's value.

Parameters
==========


The positional parameters are the column indices (1-based) or names of the two columns.

The standard input can be overridden using the options in :ref:`cli-input-options`.


