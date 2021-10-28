.. _cli::p3-get-genome-features:


######################
p3-get-genome-features
######################


**************************************
Return Features From Genomes in BV-BRC
**************************************



.. code-block:: perl

     p3-get-genome-features [options]


This script returns data for all the features in one or more genomes from the BV-BRC database. It supports standard filtering
parameters and the specification of additional columns if desired.

Parameters
==========


There are no positional parameters.

The standard input can be overriddn using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-data-options` and :ref:`cli-column-options` plus the following.


- fields
 
 List the available fields.
 


- selective
 
 If specified, the number of features per genome is expected to be small, so a faster algorithm can be used.
 


Example
-------


This command is shown in the tutorial p3_CLI.html


.. code-block:: perl

     p3-all-genomes --eq genus,Methylobacillus | p3-get-genome-features --attr patric_id --attr product
     genome.genome_id        feature.patric_id       feature.product
     265072.11       fig|265072.11.rna.17    tRNA-Arg-CCG
     265072.11       fig|265072.11.rna.18    tRNA-Lys-TTT
     265072.11       fig|265072.11.rna.19    tRNA-Arg-ACG
     265072.11       fig|265072.11.rna.20    tRNA-Ser-GCT
     265072.11       fig|265072.11.rna.37    tRNA-Gly-GCC
     ...




