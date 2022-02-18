.. _cli::p3-closest-seqs:


###############
p3-closest-seqs
###############

.. highlight:: perl


**********************************
Find Closest Sequences Using Kmers
**********************************



.. code-block:: perl

     p3-closest-seqs.pl [options] kmerDB


This script takes as input a file of DNA or protein sequences and compares them to a kmer database. The closest
groups within a certain threshold are listed. So, for example, given a kmer database of protein sequences for features
and an incoming file of new proteins, each new protein would be paired with the features in the kmer database with
which it is closest. Given a kmer database of DNA sequences for genomes and an incoming file of contigs, each incoming
contig would be paired with the genomes with which it is closest. Use :ref:`cli::p3-build-kmer-db` to build the kmer database.

Parameters
==========


The positional parameter is the file name of the kmer database.

The standard input can be overridden using the options in :ref:`cli-input-options`.

The default location for the incoming sequence is the last column of the input file. Use the options in :ref:`cli-column-options`
to change it.

The following additional options are supported.


min
 
 Minimum number of kmer matches for a sequence to be considered close. The default is \ ``40``\ .
 



