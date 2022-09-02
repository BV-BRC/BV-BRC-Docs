.. _cli::p3-all-genomes:


##############
p3-all-genomes
##############


****************************
Return All Genomes in BV-BRC
****************************



.. code-block:: perl

     p3-all-genomes [options]


This script returns the IDs of all the genomes in the BV-BRC database. It supports standard filtering
parameters and the specification of additional columns if desired.

Parameters
==========


There are no positional parameters.

The command-line options are those given in :ref:`cli-data-options` plus the following.


- fields
 
 List the names of the available fields.
 


- public
 
 Only include public genomes. If this option is NOT specified and you are logged in (via :ref:`cli::p3-login`), your own private
 genomes will also be included in the output.
 


- private
 
 Only include private genomes. If this option is specified and you are not logged in, there will be no output. It is mutually
 exclusive with public.
 


You can peruse


.. code-block:: perl

      https://github.com/PATRIC3/patric_solr/blob/master/genome/conf/schema.xml


to gain access to all of the supported fields.  There are quite a

few, so do not panic.  You can use something like


.. code-block:: perl

     p3-all-genomes -a genome_name -a genome_length -a contigs -a genome_status


to get some commonly sought fields.

Example
-------


This command is used in several tutorials, see p3_CLI.html for example;


.. code-block:: perl

     p3-all-genomes --eq genome_name,Streptomyces --attr genome_id --attr genome_name


This example retrieves the id and genome name for all genomes having Streptomyces in their name.


.. code-block:: perl

     genome.genome_id    genome.genome_name
     284037.4    Streptomyces sporocinereus strain OsiSh-2
     67257.17    Streptomyces albus subsp. albus strain NRRL F-4371
     68042.5 Streptomyces hygroscopicus subsp. hygroscopicus strain NBRC 16556
     68042.6 Streptomyces hygroscopicus subsp. hygroscopicus strain NBRC 13472
     1395572.3   Streptomyces albulus PD-1
     ...




