.. _cli::p3-gto-scan:


###########
p3-gto-scan
###########

.. highlight:: perl


****************************
Analyze Genome Typed Objects
****************************



.. code-block:: perl

     p3-gto-scan.pl [options] gto1 gto2 ... gtoN


This script produces a report about the role profile of one or more :ref:`cli::GenomeTypeObject` instances. The GTOs must be
provided as files in JSON format. Each role will be converted to an MD5 role ID and counted. The counts are then
compared. Finally, there will be statistics on the number of features and the DNA sequence length. These are
normally placed at the end of the report, but can be rerouted to the standard error output.

Status of the script is written to the standard error output. The standard output contains the actual report.

Parameters
==========


The positional parameters are the names of the GTO files.  There must be at least one (although a comparison of
one is trivial and just gives you a summary of the one). All files must encode the
GTO in JSON format. (This is consistent with the output from :ref:`cli::p3-rast` and :ref:`cli::p3-gto`.)

The command-line options are those in :ref:`cli-delimiter-options` plus the following.


features
 
 If specified, the features containing each role will be listed on the output.
 


peg
 
 If specified, only protein-encoding features will be processed.
 


verbose
 
 If specified, all roles will be displayed, rather than only the roles that differ between genomes.
 



