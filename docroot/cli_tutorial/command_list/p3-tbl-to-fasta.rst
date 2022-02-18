.. _cli::p3-tbl-to-fasta:


###############
p3-tbl-to-fasta
###############

.. highlight:: perl


*************************************
Convert a Tab-Delimited File to FASTA
*************************************



.. code-block:: perl

     p3-tbl-to-fasta.pl [options] idCol seqCol


This script will convert a tab-delimited file containing sequence data to a FASTA file. The tab-delimited file is taken from
the standard input; the FASTA file will be the standard output.

Parameters
==========


The positional parameters are the index (1-based) or name of the column containing the sequence IDs and the index or name of the column
containing the sequences.

The standard input can be overriddn using the options in :ref:`cli-input-options`.

The following additional command-line options are supported.


comment
 
 The index (1-based) or name of the column containing comment text. If omitted, no comment text is included in the output.
 



