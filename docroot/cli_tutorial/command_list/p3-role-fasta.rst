.. _cli::p3-role-fasta:


#############
p3-role-fasta
#############


****************************
Create Fasta File for a Role
****************************



.. code-block:: perl

     p3-role-fasta.pl [options] roleDesc


This script takes as input a list of genome IDs and outputs a FASTA file containing the features in those
genomes possessing a specified role.

Parameters
==========


The positional parameter is the name of the role to use.

The standard input can be overridden using the options in :ref:`cli-input-options`.  It should contain a genome ID in
the key column identified by the :ref:`cli-column-options`.

Additional command-line options are as follows.


- binning
 
 The output file is for a binning database.  The comment will be a genome ID and the name.  Implies both \ ``--dna``\  and
 \ ``--nodups``\ .
 


- dna
 
 If specified, the output will be DNA sequences.  The default is protein sequences.
 


- verbose
 
 Progress messages will be displayed on STDERR.
 


- noDups
 
 If specified, roles that occur multiple times in the same genome will be discarded.
 



