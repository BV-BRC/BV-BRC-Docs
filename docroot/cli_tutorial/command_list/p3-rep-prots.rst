.. _cli::p3-rep-prots:


############
p3-rep-prots
############

.. highlight:: perl


*********************************************
Create Representative Genome Server Directory
*********************************************



.. code-block:: perl

     p3-rep-prots.pl [options] outDir


This script processes a list of genome IDs to create a directory suitable for use by the `RepresentativeGenomes <RepresentativeGenomes>`_ server.
It will extract all the instances of the specified seed protein (usually Phenylanyl synthetase alpha chain) and only
keep genomes with a single instance of reasonable length. The list of genome IDs and names will go in the output file
\ ``complete.genomes``\  and a FASTA of the seed proteins in \ ``6.1.1.20.fasta``\ .

Parameters
==========


The positional parameter is the name of the output directory. If it does not exist, it will be created.

The standard input can be overriddn using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-column-options` plus the following
options.


protein
 
 The description string of the desired protein role. The default is \ ``Phenylalanyl-tRNA synthetase alpha chain``\ .
 


minlen
 
 The minimum acceptable length for the protein. The default is 209.
 


maxlen
 
 The maximum acceptable length for the protein. The default is 485.
 


clear
 
 Clear the output directory if it already exists. The default is to leave existing files in place.
 



