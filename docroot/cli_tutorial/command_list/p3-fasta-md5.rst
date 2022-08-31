.. _cli::p3-fasta-md5:


############
p3-fasta-md5
############


************************************************
Compute the Whole-Sequence MD5 from a FASTA File
************************************************



.. code-block:: perl

     p3-fasta-md5.pl [options]


This script computes the whole-genome MD5 checksum from a genome's FASTA file.  This can be used to
determine if two genomes have identical DNA.

Parameters
==========


There are no positional parameters.

The standard input can be overridden using the options in :ref:`cli-input-options`.  The input should be a DNA FASTA file.

The checksum will be produced on the standard output.


