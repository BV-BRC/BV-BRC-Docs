.. _cli::p3-get-feature-protein-structures:


#################################
p3-get-feature-protein-structures
#################################


**************************************
Return Protein Structures for Features
**************************************



.. code-block:: perl

     p3-get-feature-protein-structures.pl [options]


This script takes as input a list of BV-BRC feature IDs and outputs the protein structures of interest associated with each.
The feature IDs will be read from the standard input (usually in the last column), and the data for each feature's known protein
structures will be appended to the input to form the output.  Since each feature may have many identified protein structures, each
input record can produce multiple output records.

Parameters
==========


The standard input can be overridden using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-data-options` and :ref:`cli-column-options` plus the following.


- fields
 
 List the available field names.
 



