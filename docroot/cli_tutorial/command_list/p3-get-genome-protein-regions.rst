.. _cli::p3-get-genome-protein-regions:


#############################
p3-get-genome-protein-regions
#############################


**********************************************
Return Significant Protein Regions for Genomes
**********************************************



.. code-block:: perl

     p3-get-feature-protein-regions.pl [options]


This script takes as input a list of BV-BRC genome IDs and outputs the protein regions of interest associated with each.
The genome IDs will be read from the standard input (usually in the last column), and the data for each protein
region in any of the genome's features will be appended to the input to form the output.  Since each genome has thousands of
features, and each feature can have many identified regions, each input record will produce a significant number of
output lines.

Parameters
==========


The standard input can be overridden using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-data-options` and :ref:`cli-column-options` plus the following.


- fields
 
 List the available field names.
 



