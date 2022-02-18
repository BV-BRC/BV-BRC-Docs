.. _cli::p3-project-subsystems:


#####################
p3-project-subsystems
#####################

.. highlight:: perl


**************************************
Project Subsystems onto BV-BRC Genomes
**************************************



.. code-block:: perl

     gto_project.pl [ options ] outDir genome1 genome2 ... genomeN


This script will examine BV-BRC genomes and project subsystems onto them. The resulting GTOs will be output to the
specified output directory.

Parameters
==========


The positional parameters are the name of the output directory followed by one or more BV-BRC genome IDs.

The command-line options are the following:


roleFile
 
 Name of a tab-delimited file containing [role checksum, subsystem name] pairs.
 


variantFile
 
 Name of a tab-delimited file containing in each record (0) a subsystem name, (1) a variant code, and
 (2) a space-delimited list of role checksums.
 



