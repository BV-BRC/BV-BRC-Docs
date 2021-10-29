.. _cli::p3-format-results:


#################
p3-format-results
#################


***************************************
Format Raw Data for Conversion to HTML.
***************************************



.. code-block:: perl

      p3-format-results -d DataDirectory > condensed Output


This tool takes as input an Output Directory created by p3-related-by-clusters.
It produces a condensed text for of the computed clusters.

These text-forms can be run through p3-aggregates-to-html to get versions
that can be perused by a biologist.

The input directory contains a list of protein family pairs in a file called \ ``related.signature.families``\ .  Each
record consists of three tab-delimited columns-- (0) first family ID, (1) second family ID, and (2) count.

For each pair, we want to create an output group that shows the pairing (and the intervening features) for
each genome.  Each such group consists of the following.


- coupling_header
 
 A header consisting of the string \ ``////``\ .
 


- count
 
 Immediately after the header, a tab-delimited line containing (0) the first family ID, (1) the second family ID, and
 (2) the occurrence count.
 


- genome_header
 
 Following the count, there are one or more genome groups.  Each starts with a header containing \ ``###``\ , a tab, and the
 genome name.
 


- feature
 
 Inside the genome group there are one or more feature records. The feature record is tab-delimited, and consists of (0)
 a feature ID, (1) a protein family ID, and (2) a functional assignment.
 


The \ **count**\  records are taken directly from \ ``related.signature.families``\ .  The \ **feature**\  records are taken from
the iteration files in the data directory.  These files are found in the subdirectory <CS>, and each genome group
is separated by a \ ``//``\  line.

Our strategy will be to read in all the genome groups and track the genome and the protein family set for each.
When we process a protein family pairing, we will output all of the genome groups that have both protein families
present.

Parameters
==========


There are no positional parameters.

Standard input is not used.

The additional command-line options are as follows.


- d DataDirectory




