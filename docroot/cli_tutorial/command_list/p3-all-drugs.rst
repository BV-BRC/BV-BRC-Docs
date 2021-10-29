.. _cli::p3-all-drugs:


############
p3-all-drugs
############


**************************
Return All Drugs in BV-BRC
**************************



.. code-block:: perl

     p3-all-drugs [options]


This script returns the IDs of all the antibiotic drugs in the BV-BRC database. It supports standard filtering
parameters and the specification of additional columns if desired.

Parameters
==========


There are no positional parameters.

The command-line options are those given in :ref:`cli-data-options` plus the following.


- fields
 
 List the names of the available fields.
 


Example
-------


This command is used in the tutorial p3_CLI.html;


.. code-block:: perl

     p3-all-drugs | p3-get-drug-genomes --attr genome_id --attr genome_name --resistant


It lists all drugs in the database and feeds the id's to the p3-get-drug-genomes script to get resistance data relating to specific drugs from a list.



