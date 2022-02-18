.. _cli::p3-build-kmer-db:


################
p3-build-kmer-db
################

.. highlight:: perl


***********************************************
Build a Kmer Database from a Table of Sequences
***********************************************



.. code-block:: perl

     p3-build-kmer-db.pl [options] idCol outFile


This script creates a kmer database. The basic model of the database is that we have groups of incoming sequences, each with an ID and a name. So, for
example, a group could be a whole genome with each sequence a contig, or a group could be a specific protein with only one sequence per group-- the
protein itself and the name the protein's role. Names are entirely optional.

The database will map each kmer to a list of the groups to which it belongs. Command-line options allow you to specify that common kmers be eliminated
or that the kmers be discriminating (that is, unique to only one group). The kmer database can then be used as input to various other scripts (such as
:ref:`cli::p3-closest-seqs`).

Parameters
==========


The positional parameters are the column identifier for the column containing the group ID and the name of the output file into which the
kmer database is to be stored. The constant string \ ``fasta``\  can be used for the group ID column if a FASTA file is input. In that case, the sequence ID
is the group ID and the comment is the group name.

The standard input can be overriddn using the options in :ref:`cli-input-options`.

The options in :ref:`cli-column-options` can be used to specify the input column containing the sequence text. The default is the last input column.

Additional command-line options are the following.


kmerSize
 
 The size of a kmer. The default is \ ``15``\ .
 


max
 
 The maximum number of times a kmer can appear. A kmer appearing more than the specified number of times is considered common and discarded. A value of \ ``0``\ 
 indicates all kmers should be kept. The default is \ ``10``\ .
 


nameCol
 
 The index (1-based) or name of the input column containing the group names.
 


discriminating
 
 If specified, only discriminating kmers (that is, kmers unique to a single group) are kept. In this case, the \ ``--max``\  option is ignored.
 



