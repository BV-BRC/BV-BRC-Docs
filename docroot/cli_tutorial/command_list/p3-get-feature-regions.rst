.. _cli::p3-get-feature-regions:


######################
p3-get-feature-regions
######################


********************************
Display DNA Regions for Features
********************************



.. code-block:: perl

     p3-get-feature-regions.pl [options]


This script takes as input a list of feature IDs and displays the DNA region surrounding each feature.  The portion of each region
occupied by the feature itself and the feature's neighbors will be shown in upper case, the rest in lower case.  The output will be
in FASTA format.

Parameters
==========


There are no positional parameters

The standard input can be overridden using the options in :ref:`cli-input-options`.

The input column can be specified using :ref:`cli-column-options`.  Additional command-line options are as follows.


- distance
 
 The distance in base pairs to show around the specified feature.  The default is \ ``100``\ .
 


- comment
 
 If specified, a field to put in the FASTA comments.  If multiple fields are desired, the option should be specified multiple
 times.
 


- consolidated
 
 If a requested feature's region includes another requested feature, the region will be expanded to include it.  If this is
 done, a description of the features in each sequence and their locations will be appended to the comment field.  Note that
 there will still be one output sequence per incoming feature; however, some may be duplicated.
 



