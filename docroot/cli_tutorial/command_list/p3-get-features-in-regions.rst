.. _cli::p3-get-features-in-regions:


##########################
p3-get-features-in-regions
##########################


******************************************
Return Features in Specific Genome Regions
******************************************



.. code-block:: perl

     p3-get-features-in-regions.pl [options] genomeCol contigCol startCol endCol


This script reads a list of genome coordinates and returns the features that overlap those coordinates.  The standard
input must contain four columns describing the coordinates-- genome ID, contig ID, start location, and end location.
Features that overlap the region will be retrieved and the specified feature attributes added to the end of each
input record.  Because multiple features may exist in a region, each input record may occur multiple times in the output.

Parameters
==========


The positional parameters are the indices (1-based) or names of the genome ID column, the contig ID column, the
starting-location column, and the ending-location column in the input.

The standard input can be overridden using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-data-options` plus the following.


- fields
 
 List the available field names.
 



