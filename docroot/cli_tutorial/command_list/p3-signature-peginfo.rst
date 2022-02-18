.. _cli::p3-signature-peginfo:


####################
p3-signature-peginfo
####################

.. highlight:: perl


*****************************************************
Return Signature Feature Data From Families in BV-BRC
*****************************************************



.. code-block:: perl

     p3-signature-peginfo


This script is a shortcut to create the input file for :ref:`cli::p3-signature-clusters` from the output of
:ref:`cli::p3-signature-families`. It takes the signature-families output file and the list of relevant genomes (the
\ ``--gs1``\  option from signature-families) and produces a file of feature data restricted to features in the
families belonging to the specified genomes.

Parameters
==========


There are no positional parameters.

The standard input can be overriddn using the options in :ref:`cli-input-options`.

The additional command-line option is


gs1
 
 Name of a tab-delimited file containing genome IDs in a column labelled \ ``genome.genome_id``\ .
 



