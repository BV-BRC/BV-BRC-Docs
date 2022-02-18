.. _cli::p3-set-to-relation:


##################
p3-set-to-relation
##################

.. highlight:: perl


*******************************************
Convert a Table of Sets to a Relation Table
*******************************************



.. code-block:: perl

     p3-set-to-relation.pl [options]


This script will look at an input file that has sets in a single column. Each set is represented by a list of items
separated by a delimiter (default \ ``::``\ ). Each set is given a number, and the output file puts
one set element on each line along with its set number, thus improving readability.

Parameters
==========


There are no positional parameters.

The standard input can be overriddn using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-column-options` which specifies the input
column, :ref:`cli-delimiter-options` which specifies the delimiter between set items, and the following.


idCol
 
 The index (1-based) or name of the column containing the set ID. If omitted, the set IDs are generated internally.
 



