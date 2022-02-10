.. _cli::p3-gto-fasta:


############
p3-gto-fasta
############

.. highlight:: perl


*************************************
Convert Genome Typed Objects to FASTA
*************************************



.. code-block:: perl

     p3-gto-fasta.pl [options] gtoFile


This script produces FASTA files from a :ref:`cli::GenomeTypeObject` instance. The GTO must be
provided as a file in JSON format.

Parameters
==========


The positional parameter is the name of the GTO file. If none is specified, the GTO file is read from the standard input.

The command-line options are the following. All three are mutually exclusive.


protein
 
 If specified, the output will be a protein FASTA file.
 


feature
 
 If specified, the output will be a feature DNA FASTA file.
 


contig
 
 If specified, the output will be a contig DNA FASTA file. this is the default.
 



