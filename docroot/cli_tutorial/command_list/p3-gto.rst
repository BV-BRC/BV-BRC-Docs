.. _cli::p3-gto:


######
p3-gto
######

.. highlight:: perl


************************************
Create GTO Files from BV-BRC Genomes
************************************



.. code-block:: perl

     p3-gto.pl [options] genome1 genome2 ... genomeN


This script creates :ref:`cli::GenomeTypeObject` files for the specified BV-BRC genomes. Each file is named using the genome ID with the suffix \ ``.gto``\ 
and placed in the current directory. The \ ``--outDir``\  option can be used to specify an alternate output directory. Existing files will be
replaced.

Parameters
==========


The positional parameters are the IDs of the genomes to extract. A parameter of \ ``-``\  indicates that the standard input contains a
list of genome IDs to process. The options in :ref:`cli-column-options` can be used to specify the input column and :ref:`cli-input-options` can
be used to modify the standard input.

In addition, the following command-line options can modify the default behavior.


outDir
 
 Name of the directory in which to put the output files. (The default is the current working directory.)
 


missing
 
 Only process genomes for which files do not yet exist in the output directory. The default is to replace existing files.
 



