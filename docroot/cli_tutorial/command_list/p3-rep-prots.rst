.. _cli::p3-rep-prots:


############
p3-rep-prots
############


*********************************************
Create Representative Genome Server Directory
*********************************************



.. code-block:: perl

     p3-rep-prots.pl [options] outDir


This script processes a list of genome IDs to create a directory suitable for use by the representative genomes server.
It will extract all the instances of the specified seed protein (default is Phenylanyl synthetase alpha chain). The list of genome IDs and
names will go in the output file \ ``complete.genomes``\  and a FASTA of the seed proteins in \ ``6.1.1.20.fasta``\ .

Parameters
==========


The positional parameter is the name of the output directory. If it does not exist, it will be created.

The standard input can be overriddn using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-column-options` plus the following
options.


- clear
 
 Clear the output directory if it already exists. The default is to leave existing files in place.
 


- prot
 
 Role name of the protein to use. The default is \ ``Phenylalanyl-tRNA synthetase alpha chain``\ .
 


- dna
 
 If specified, a \ ``6.1.1.20.dna.fasta``\  file will be produced in addition to the others, containing
 the DNA sequences of the proteins.
 


- binning
 
 If specified, a seed protein database suitable for binning will be produced with the specified name.
 (This is similar to the \ ``dna``\  option, but produces the comments in a slightly different format).
 


- debug
 
 If specified, status messages for the PATRIC3 API will be displayed.
 



