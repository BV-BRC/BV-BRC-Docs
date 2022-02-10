.. _cli::p3-get-drug-genomes:


###################
p3-get-drug-genomes
###################

.. highlight:: perl


*************************************
Return AMR Data for Drugs From BV-BRC
*************************************



.. code-block:: perl

     p3-get-drug-genomes [options]


This script returns general anti-microbial resistance data given an input column of drug names. It supports
standard filtering parameters and the specification of additional output columns if desired.

Parameters
==========


There are no positional parameters.

The standard input should contain drug names in the key column. You may specify the standard input using
the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-data-options` and :ref:`cli-column-options` plud
the following


fields
 
 Show available fields.
 


resistant
 
 Filter for genomes resistant to the incoming drug.
 


susceptible
 
 Filter for genoems susceptible to the incoming drug.
 



