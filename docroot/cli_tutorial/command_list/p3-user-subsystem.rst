.. _cli::p3-user-subsystem:


#################
p3-user-subsystem
#################


*******************************************
Create a Spreadsheet for a Custom Subsystem
*******************************************



.. code-block:: perl

     p3-user-subsystem.pl [options] featureGroup1 featureGroup2 ... featureGroupN


This script takes as input the names of one or more feature groups and builds a subsystem
spreadsheet.  The spreadsheet is output in both tab-delimited and HTML formats.

The features listed in the feature groups define subsystem variants.  The subsystem may then be projected onto each genome
in an optionally-specified genome group.  Projection is done using protein families.

Parameters
==========


The positional parameters are the name of the subsystem and the names or one or more feature groups.

The command-line options are the following


- outDir
 
 The name of an output directory into which the output files \ ``spreadsheet.txt``\  and \ ``spreadsheet.html``\  will be written.  The default
 is the current directory.
 


- genomes
 
 The name of a genome group.  If specified, the subsystem will be projected onto the genomes in this group.
 



