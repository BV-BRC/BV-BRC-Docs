.. _cli::p3-count-families:


#################
p3-count-families
#################


*********************************
Count Protein Families in Genomes
*********************************



.. code-block:: perl

     p3-count-families.pl [options]


This script will count the number of occurrences of each protein family found in the specified genomes. The output will contain the family
ID, the associated product, the number of total occurrences, and the number of genomes containing the family.

Parameters
==========


There are no positional parameters.

The standard input can be overridden using the options in :ref:`cli-input-options`, and is used to specify the genomes of interest.
The column containing the genome ID can be specified using the options in :ref:`cli-column-options`. The following additional command-line
options are supported.


- singly
 
 If specified, only single-occurrence families will be counted.
 


- type
 
 The type of protein family-- \ ``local``\ , \ ``global``\ , or \ ``figfam``\ . The default is \ ``global``\ .
 


- verbose
 
 Write status messages to STDERR.
 



