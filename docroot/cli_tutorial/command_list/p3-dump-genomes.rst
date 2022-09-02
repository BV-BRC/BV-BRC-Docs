.. _cli::p3-dump-genomes:


###############
p3-dump-genomes
###############


*********************************************
Create GTO or FASTA Files from BV-BRC Genomes
*********************************************



.. code-block:: perl

     p3-dump-genomes.pl [options] genome1 genome2 ... genomeN


This script creates `GenomeTypeObject <GenomeTypeObject>`_ or FASTA files for the specified BV-BRC genomes. Each file is named using the genome ID with
the appropriate suffix and placed in the current directory. The \ ``--outDir``\  option can be used to specify an alternate 
output directory. Existing files will be replaced.  This script is more general than :ref:`cli::p3-gto`, which it replaces.

Parameters
==========


The positional parameters are the IDs of the genomes to extract. A parameter of \ ``-``\  indicates that the standard input contains a
list of genome IDs to process. The options in :ref:`cli-column-options` can be used to specify the input column and :ref:`cli-input-options` can
be used to modify the standard input.

One or more output options can be specified to determine what files to produce for each genome.  If no option is specified, the
default is \ ``--gto``\ .

In addition, the following command-line options can modify the default behavior.


- outDir
 
 Name of the directory in which to put the output files. (The default is the current working directory.)
 


- missing
 
 Only process genomes for which files do not yet exist in the output directory. The default is to replace existing files.
 


- fasta
 
 Produce DNA FASTA files for the genomes.  There will be one sequence per contig and the suffix will be \ ``.fa``\ .
 


- gto
 
 Produce JSON-format `GenomeTypeObject <GenomeTypeObject>`_ files for the genomes.  The suffix will be \ ``.gto``\ .
 


- prot
 
 Produce protein FASTA files for the genomes.  There will be one sequence per CDS and the suffix will be \ ``.faa``\ .
 


- dna
 
 Produce DNA feature FASTA files for the genomes.  There will be one sequence per feature and the suffix will be \ ``.fna``\ .
 



