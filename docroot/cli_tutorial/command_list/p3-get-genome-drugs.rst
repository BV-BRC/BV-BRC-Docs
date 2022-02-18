.. _cli::p3-get-genome-drugs:


###################
p3-get-genome-drugs
###################

.. highlight:: perl


*************************************
Return AMR Data For Genomes in BV-BRC
*************************************



.. code-block:: perl

     p3-get-genome-drugs [options]


This script returns the anti-microbial resistance data about the genomes identified in the standard
input. It supports standard filtering parameters and the specification of additional columns if desired.

Parameters
==========


There are no positional parameters.

The standard input can be overriddn using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-data-options` and :ref:`cli-column-options` plus the following.


fields
 
 List the fields of the table.
 


resistant
 
 Filter for drugs to which the genome is resistant.
 


susceptible
 
 Filter for drugs to which the genome is susceptible.
 



