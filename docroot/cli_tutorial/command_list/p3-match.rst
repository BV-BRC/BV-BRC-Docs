.. _cli::p3-match:


########
p3-match
########

.. highlight:: perl


******************************
Select Rows from an Input File
******************************



.. code-block:: perl

     p3-match [options] value


This script extracts rows from a tab-delimited file based on the value in a specified column. Optionally,
it can create a second output file containing the rejected rows.

Parameters
==========


The single positional parameter is the value on which to match. If the value is numeric, the match will be
exact. If it is non-numeric, then the match will be case-insensitive, and a record will match if any subsequence of
the words in the key column match the words in the input value.

The standard input may be overridden by the command-line options given in :ref:`cli-input-options`.

The command-line options are those in :ref:`cli-column-options` (for selection of the key column) plus the
following.


reverse
 
 If specified, only rows that do not match will be output.
 


discards
 
 If specified, the name of a file to contain the records that do not match.
 



