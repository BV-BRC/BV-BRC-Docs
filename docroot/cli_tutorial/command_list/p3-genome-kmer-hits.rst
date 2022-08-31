.. _cli::p3-genome-kmer-hits:


###################
p3-genome-kmer-hits
###################


**************************
Count KMER Hits in Genomes
**************************



.. code-block:: perl

     p3-genome-kmer-hits.pl [options] kmerDB


This script takes as input a list of genome IDs and outputs a table of the number of kmer hits by group in each genome.  The output
file will be tab-delimited, with the genomeID, the sequence ID, the group ID, the group name, and the kmer hit count.

Parameters
==========


The positional parameter is the file name of the kmer database.  This is a json-format `KmerDb <KmerDb>`_ object.

The standard input can be overridden using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-column-options` (to choose the genome ID column) plus the following
options.


- prot
 
 If specified, the kmers are assumed to be protein kmers.
 


- pegs
 
 If specified, the kmer hits will be counted against the genome's proteins, not the genome itself.  This implies
 \ ``--prot``\ .
 


- verbose
 
 If specified, progress messages will be written to STDERR.
 



