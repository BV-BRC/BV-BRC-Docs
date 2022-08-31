.. _cli::p3-peg-kmer-hits:


################
p3-peg-kmer-hits
################


***************************
Count KMER Hits in Proteins
***************************



.. code-block:: perl

     p3-peg-kmer-hits.pl [options] kmerDB


This script takes as input a list of genome IDs and outputs the best group for each protein feature in each genome.  The output
file will be tab-delimited, with the genomeID, the feature ID, the group ID, the group name, and the kmer hit count.  The kmer
database must specify protein kmers.

Parameters
==========


The positional parameter is the file name of the kmer database.  This is a json-format `KmerDb <KmerDb>`_ object.

The standard input can be overridden using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-column-options` (to choose the genome ID column) plus the following
options.


- verbose
 
 If specified, progress messages will be written to STDERR.
 



