.. _cli::p3-genome-fasta:


###############
p3-genome-fasta
###############

.. highlight:: perl


********************************
Return a FASTA file for a Genome
********************************



.. code-block:: perl

     p3-genome-fasta [options] genomeID


This script returns a FASTA file for a specified genome. You can specify feature proteins, feature DNA, or contig DNA.

Parameters
==========


The positional parameter is the desired genome ID.

The command-line options are as follows. All three are mutually exclusive.


protein
 
 If specified, the output will be a protein FASTA file.
 


feature
 
 If specified, the output will be a feature DNA FASTA file.
 


contig
 
 If specified, the output will be a contig DNA FASTA file. this is the default.
 



