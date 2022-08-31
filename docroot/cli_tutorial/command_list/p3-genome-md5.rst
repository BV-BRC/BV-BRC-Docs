.. _cli::p3-genome-md5:


#############
p3-genome-md5
#############


********************************************
Compute Checksums for Whole Genome Sequences
********************************************



.. code-block:: perl

     p3-genome-md5.pl [options]


This script will compute an MD5 checksum for a genome's complete DNA sequence.  Every genome with identical contigs
(that is, the same number of contigs, with the same sequence content) will hash to the same MD5.  The genomes must
be in BV-BRC, and the genome IDs are taken from the standard input.

Parameters
==========


There are no positional parameters.

The standard input can be overridden using the options in :ref:`cli-input-options`. The options in P3Utils/col_options can
be used to select the column containing the genome ID.

Additional command-line options are the following.


- restart
 
 Restart after a run that ended in error.  No headers will be output, and all genomes up to and including the one
 identified by this parameter will be skipped.
 


- verbose
 
 Display debug information on STDERR.
 



