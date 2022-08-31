.. _cli::p3-shuffle:


##########
p3-shuffle
##########


******************************
Scramble the Records in a File
******************************



.. code-block:: perl

     p3-shuffle.pl [options]


This script reads a file in batches of 500,000 records at a time and writes them out in a different order.  It is used
to un-sort files for deep learning purposes.

Parameters
==========


There are no positional parameters.

The standard input can be overridden using the options in :ref:`cli-input-options`.

Additional command-line options are as follows.


- batchSize
 
 Number of records to read in a batch.  The default is 500,000.
 


- verbose
 
 If specified, progress messages will be written to STDERR.
 



