.. _cli::p3-get-feature-protein-regions:


##############################
p3-get-feature-protein-regions
##############################


***********************************************
Return Significant Protein Regions for Features
***********************************************



.. code-block:: perl

     p3-get-feature-protein-regions.pl [options]


This script takes as input a list of BV-BRC feature IDs and outputs the protein regions of interest associated with each.
The feature IDs will be read from the standard input (usually in the last column), and the data for each feature's protein
regions will be appended to the input to form the output.  Since each feature may have many identified regions, each input
record can produce multiple output records.

Parameters
==========


The standard input can be overridden using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-data-options` and :ref:`cli-column-options` plus the following.


- fields
 
 List the available field names.
 



