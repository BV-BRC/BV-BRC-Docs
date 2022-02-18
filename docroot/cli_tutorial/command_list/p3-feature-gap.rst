.. _cli::p3-feature-gap:


##############
p3-feature-gap
##############

.. highlight:: perl


*********************************
Compute Gap Between Feature Pairs
*********************************



.. code-block:: perl

     p3-feature-gap [options] <featurePairFile


This script reads in a list of feature pairs and computes the gap between the features. If the features are on different
contigs or belong to different genomes, the gap will be listed as 2 billion. This behavior can be overridden with a
command-line option.

Parameters
==========


There are no positional parameters.

The standard input can be specified using :ref:`cli-input-options`. The input column can be specified using :ref:`cli-column-options`.
The following additional command-line options can be specified.


inf
 
 Value to return for an infinite gap (different contigs or genomes). The default is \ ``2000000000``\ .
 


col2
 
 Name or index of the column containing the ID of the second feature. The default is \ ``-1``\ , which is the second-to-last column.
 



