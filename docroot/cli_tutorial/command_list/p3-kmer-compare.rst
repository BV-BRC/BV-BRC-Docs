.. _cli::p3-kmer-compare:


###############
p3-kmer-compare
###############

.. highlight:: perl


*****************************************
Perform a Kmer Comparison for Two Genomes
*****************************************



.. code-block:: perl

     p3-kmer-compare.pl [options] genome1 genome2 ... genomeN


This script compares genomes based on DNA kmers. It outputs the number of kmers the two genomes have in common, the number appearing
only in the first genome, and the number appearing only in the second.

In verbose mode, it produces a pair of percentages for each combination-- completeness and contamination-- displayed in a matrix. The percentages
project the row genome onto the column genome. A completeness of 100% means every kmer in the column genome is found in the row genome. A
contamination of 100% means every kmer in the column genome is NOT found in the row genome. So, if the genomes are identical, the percentages
will be \ ``100.0/0.0``\ . If the column genome is a subset of the row genome, the completeness will be 100% but the contamination will be nonzero.

NOTE that for best performance, the longest genome should be specified first in the list. This reduces the number of times memory needs to be
reorganized.

Parameters
==========


The positional parameters are the two genomes to compare. Each genome can be either (1) a BV-BRC genome ID, (2) the name of a DNA FASTA file, or
(3) the name of a :ref:`cli::GenomeTypeObject` file.

There is no standard input.

The command-line options are as follows.


kmerSize
 
 The size of a kmer. The default is \ ``12``\  for DNA and \ ``8``\  for protein.
 


geneticCode
 
 If specified, a genetic code to use to translate the DNA sequences to proteins. In this case, the matching will be on protein kmers.
 


verbose
 
 If specified, completeness and contamination percentages will be included in the output matrix.
 



