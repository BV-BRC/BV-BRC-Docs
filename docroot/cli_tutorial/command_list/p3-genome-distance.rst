.. _cli::p3-genome-distance:


##################
p3-genome-distance
##################


*********************************************************************
Compute the Distance Between a Specified Genome and Genomes in a File
*********************************************************************



.. code-block:: perl

     p3-genome-distance.pl [options] baseGenome


This script uses protein families to compute genome distance.  A single genome is chosen as the \ *base genome*\ .  We run
through all the protein families and compute the kmers in common for each family member in the other genomes.  The
\ *similarity score*\  is the total number of kmers in common.  The higher the similarity score, the closer the genome is
to the base.  The number produced is not scaled, so it can only be used for relative comparison.

Parameters
==========


The positional parameter is the ID of the base genome.

The standard input should contain the IDs of the genomes to compare.  The standard input can be overridden using the options in :ref:`cli-input-options`
and the options in :ref:`cli-column-options` can be used to specify the column containing the genome IDs.  If the base genome is
found in the input, it will be ignored.

The standard output will contain the genome IDs and their distances.  The following additional options are supported.


- dna
 
 Use DNA kmers instead of protein kmers.
 


- kmer
 
 The kmer size to use.  The default is \ ``8``\  for proteins and \ ``16``\  for DNA.
 


- verbose
 
 If specified, progress messages will be displayed on the standard error output.
 



