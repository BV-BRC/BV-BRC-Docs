.. _cli::p3-find-couples:


###############
p3-find-couples
###############

.. highlight:: perl


*********************************************************
Find Physically Coupled Categories (e.g. Roles, Families)
*********************************************************



.. code-block:: perl

     p3-find-couples.pl [options] catCol


This script performes the general function of finding categories of features that tend to be physically coupled,
that is, commonly occurring in close proximity on the contigs. It can be
used to find coupled protein families, coupled roles, coupled functional assignments, or any number of things.
The input (key) column should contain feature IDs. The \ *category column*\  specified as a parameter should identify
the column that contains the feature classification of interest. This could be the feature's role, its global protein
family (or other type of protein family), or anything of importance that groups similar features. The output will
display pairs of these categories that tend to occur phyiscally close together on the chromosome. So, for example,
if the category column contained roles, this program would output role couples. If the category column contained
global protein families, this program would output protein family couples.

A blank value in the category column will cause the input line to be ignored.

The output will be three columns-- the two category IDs and the number of times the couple occurred.

If both the location and the sequence ID are present in the input file, then this command will not query the
database. In that case, it can be run independent of access to BV-BRC, even on genomes not necessarily in the
BV-BRC system. The feature IDs, however, must include the genome ID as a substring (which means the IDs should
be of a format similar to the short-form BV-BRC feature IDs).

Parameters
==========


The positional parameter is the index (1-based) or name of the column containing the category information.

The standard input can be overridden using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-column-options` (to specify the column containing
feature IDs) plus the following.


minCount
 
 The minimum number of times a couple must occur to be considered significant. The default is \ ``5``\ .
 


maxGap
 
 The maximum number of base pairs allowed between two features in the same cluster. The default is \ ``2000``\ .
 


location
 
 If the feature location is already present in the input file, the name of the column containing the feature location.
 The feature location should be in the form \ *start*\ \ ``..``\ \ *end*\ .
 


sequence
 
 If the sequence ID is already present in the input file, the name of the column containing the sequence ID.
 



