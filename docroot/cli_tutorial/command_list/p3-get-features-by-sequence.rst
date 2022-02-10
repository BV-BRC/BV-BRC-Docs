.. _cli::p3-get-features-by-sequence:


###########################
p3-get-features-by-sequence
###########################

.. highlight:: perl


*****************************************
Find Protein Features Using Sequence Data
*****************************************



.. code-block:: perl

     p3-get-features-by-sequence.pl [options]


This script takes as input a file containing DNA or protein sequences and finds features with those identical sequences. For a DNA sequence, it is
somewhat limited in that it will only find features in organisms with a genetic code of 4 or 11.

The program processes one sequence at a time, so has poor performance for a large input file.

Parameters
==========


There are no positional parameters.

The standard input can be overridden using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-column-options` (to specify the input column containing the sequence) plus the following
options.


dna
 
 The input contains DNA sequences. This is the default.
 


protein
 
 The input contains protein sequences. This is mutually exclusive with \ ``DNA``\ .
 


fasta
 
 The input file is a FASTA. In this case the output file will be tab-delimited with the columns being (1) the sequence ID, (2) the sequence comment, and (3) the
 found feature ID.
 



