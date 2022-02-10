.. _cli::p3-identify-clusters:


####################
p3-identify-clusters
####################

.. highlight:: perl


****************************
Identify Clusters in Genomes
****************************



.. code-block:: perl

     p3-identify-clusters.pl [options] clusterFile <features.tbl


Given an input file of features and locations, this script find occurrences of functional clusters.

The cluster file should contain in its last column a list of the clustered identifiers (usually roles or protein family IDs), separated by
a double colon delimited (\ ``::``\ ). The first column should contain a cluster ID of some sort. This is the default for the output of
:ref:`cli::p3-generate-clusters`.

The input file must include columns for the genome ID, the identifier used for clustering (again, usually roles or protein family IDs), the
sequence ID, and the location. Features that are close together on the chromosome and belong to the same cluster will be output along with
the sequence ID, start and end locations, and a cluster ID number.

Parameters
==========


The positional parameter is the name of a tab-delimited file containing the clusters. The clusters must be in the first column,
and consist of multiple clustered identifiers (roles or family IDs) separated by item delimiters (\ ``::``\ ).

The standard input can be overriddn using the options in :ref:`cli-input-options`. The standard input must be a tab-delimited file
containing features. By default, the feature ID should be in a column named \ ``patric_id``\ , the location in a column named \ ``location``\ ,
the sequence ID in a column named \ ``sequence_id``\ , and the clustered identifier (role or family) should be in the last column.
The clustered identifier is considered the key column.

Additional command-line options are those given in :ref:`cli-delimiter-options` (to specify the delimiters between identifiers) and
:ref:`cli-column-options` plus the following.


locCol
 
 Index (1-based) or name of the location column in the input.  The default is \ ``location``\ .
 


idCol
 
 Index (1-based) or name of the feature ID column in the input.  The default is \ ``patric_id``\ .
 


seqCol
 
 Index (1-based) or name of the sequence ID column in the input. The default is \ ``sequence_id``\ .
 


maxGap
 
 The maximum gap between features for them to be considered part of a cluster. The default is \ ``2000``\ .
 


minItems
 
 The minimum number of features for a group to be considered a cluster. The default is \ ``3``\ .
 


showRoles
 
 If specified, the roles found in the cluster will be displayed in a column of the output.
 


showFids
 
 If specified, the features found in the cluster will be displayed in a column of the output.
 



