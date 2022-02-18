.. _cli::p3-find-in-clusters:


###################
p3-find-in-clusters
###################

.. highlight:: perl


*******************************************
Identify Clusters Containing Input Features
*******************************************



.. code-block:: perl

     p3-find-in-clusters.pl [options] realClusterFile


This script takes as input a list of features and compares it to a list of physical clusters (the output of :ref:`cli::p3-identify-clusters`).
If a features is within the bounds of a cluster, or within the gap distance of either end, it will be output with the cluster ID appended.

Parameters
==========


The positional parameter is the name of the file containing the cluster information. This must be a tab-delimited file with the following
columns-- (1) cluster ID, (2) genome ID, (3) sequence ID, (4) start location, and (5) end location. This is the output format from
:ref:`cli::p3-identify-clusters`.

The standard input can be overriddn using the options in :ref:`cli-input-options`. The standard input should contain feature IDs in the
key column (specified using the options in :ref:`cli-column-options`) plus the feature location and the ID of the containing sequence.
The following additional options are supported.


maxGap
 
 The maximum number of base pairs allowed between two features in the same cluster. The default is \ ``2000``\ .
 


location
 
 In index (1-based) or name of the column containing the feature location. The default is \ ``location``\ .
 


sequence
 
 The index (1-based) or name of the column containing the sequence ID. The defahult is \ ``sequence_id``\ .
 



