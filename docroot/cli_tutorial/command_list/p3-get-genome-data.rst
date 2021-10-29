.. _cli::p3-get-genome-data:


##################
p3-get-genome-data
##################


**********************************
Return Data From Genomes in BV-BRC
**********************************



.. code-block:: perl

     p3-get-genome-data [options]


This script returns data about the genomes identified in the standard input. It supports standard filtering
parameters and the specification of additional columns if desired.

Parameters
==========


There are no positional parameters.

The standard input can be overriddn using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-data-options` and :ref:`cli-column-options` plus the following.


- fields
 
 List the available field names.
 


Example
-------


This command is shown in the tutorial p3_CLI.html

p3-all-genomes --eq genome_name,Streptomyces | p3-get-genome-data --attr genome_name --attr contigs --attr genome_length


.. code-block:: perl

     genome.genome_id    genome.genome_name  genome.contigs  genome.genome_length
     284037.4    Streptomyces sporocinereus strain OsiSh-2   125 10242506
     67257.17    Streptomyces albus subsp. albus strain NRRL F-4371  307 9246299
     68042.5 Streptomyces hygroscopicus subsp. hygroscopicus strain NBRC 16556   133 10141569
     68042.6 Streptomyces hygroscopicus subsp. hygroscopicus strain NBRC 13472   680 9464604
     1395572.3   Streptomyces albulus PD-1   425 9340057
     ...




