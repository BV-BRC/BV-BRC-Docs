.. _cli::p3-nucleon-runs:


###############
p3-nucleon-runs
###############


********************************************************
Find Long Runs of Amino or Nucleic Acids in a FASTA file
********************************************************



.. code-block:: perl

     p3-nucleon-runs.pl [options] letter inFile [inFile2]


Search a set of contigs for runs of a particular amino acid or nucleic acid.  We will output the number of runs greater than a
certain size, and the location of the longest run.

Parameters
==========


The first positional parameter is the DNA or amino acid letter for which to search.

The second positional parameter is the input FASTA file or interlaced FASTQ file.  If a paired FASTQ file is specified, the
third positional parameter should be its name.

Additional command-line options are the following.


- geneticCode
 
 If specified, the DNA is translated using the specified genetic code and the input letter is presumed to be an amino acid.
 


- run
 
 The size of the desired runs.  The default is \ ``10``\ .  Only runs of the specified size or greater will be counted.
 


- reads
 
 If specified, the input is FASTQ instead of FASTA.
 


- details
 
 If specified, the name of a file to contain the number of runs in each sequence.
 



