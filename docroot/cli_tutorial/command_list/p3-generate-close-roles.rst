.. _cli::p3-generate-close-roles:


#######################
p3-generate-close-roles
#######################

.. highlight:: perl


************************************
Find Roles That Occur Close Together
************************************



.. code-block:: perl

     p3-generate-close-roles.pl [options] <roles.tbl >pairs.tbl


This script is part of a pipeline to compute functionally-coupled roles. It takes a file of locations and roles, then
outputs a file of pairs of roles with the number of times features containing those two roles occur close together on
the chromosome. Such roles typically have related functions in a genome.

The input file must contain the following four fields.


1
 
 genome ID
 


2
 
 contig (sequence) ID
 


3
 
 location in the sequence
 


4
 
 functional role
 


The default script assumes the four columns are in that order. This can all be overridden with command-line options.

The input file must be sorted by genome ID and then by sequence ID within genome ID. Otherwise, the results will be
incorrect. Use :ref:`cli::p3-sort` to sort the file.

The location is a BV-BRC location string, either of the form \ *start*\ \ ``..``\ \ *end*\  or \ ``complement(``\ \ *left*\ \ ``..``\ \ *right*\ \ ``)``\ .
Given a set of genome IDs in the file \ ``genomes.tbl``\ , you can generate the proper file using the following pipe.


.. code-block:: perl

     p3-get-genome-features --attr sequence_id --attr location --attr product <genomes.tbl | p3-function-to-role


(If BV-BRC does not yet have roles defined, you will need to use an additional command-line option on :ref:`cli::p3-function-to-role`.)

Parameters
==========


There are no positional parameters.

The standard input can be overriddn using the options in :ref:`cli-input-options`.

Additional command-line options are


genome
 
 The index (1-based) or name of the column containing the genome ID. The default is \ ``1``\ .
 


sequence
 
 The index (1-based) or name of the column containing the sequence ID. The default is \ ``2``\ .
 


location
 
 The index (1-based) or name of the column containing the location string. The default is \ ``3``\ .
 


role
 
 The index (1-based) or name of the column containing the role description. The default is \ ``4``\ .
 


maxGap
 
 The maximum space between two features considered close. The default is \ ``2000``\ .
 


minOcc
 
 The minimum number of occurrences for a pair to be considered significant. The default is \ ``4``\ .
 



