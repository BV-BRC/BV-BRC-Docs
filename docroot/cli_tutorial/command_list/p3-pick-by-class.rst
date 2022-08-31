.. _cli::p3-pick-by-class:


################
p3-pick-by-class
################


****************************************
Pick Records for Classification Training
****************************************



.. code-block:: perl

     p3-pick-by-class.pl [options]


This script reads an entire file into memory and collates them by the key column value.  It then outputs
randomly-selected records so that the number of records with each value is roughly the same.

Parameters
==========


There are no positional parameters.

The standard input can be overridden using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-column-options` (to specify the key column) plus the following.


- verbose
 
 Display progress messages on the standard error output.
 


- fuzz
 
 Margin of error.  The maximum number of records associated with any key value is number times the count of the least
 frequent key.  The default is 1.2.  This number must be between 1 and 2 inclusive.
 


- max
 
 The maximum number of data lines to output.  The default () is to output as many as possible.
 



