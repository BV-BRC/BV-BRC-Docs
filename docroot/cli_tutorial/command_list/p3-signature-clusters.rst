.. _cli::p3-signature-clusters:


#####################
p3-signature-clusters
#####################

.. highlight:: perl


**************************
Compute Cluster Signatures
**************************



.. code-block:: perl

      p3-signature-clusters
         < peg.data
         > cluster.signatures


The standard input file normally contains \ *[n/a, n/a, family_id, feature_id, contig, start, end, strand, function]*\ 
(the first two columns are ignored). Such a file is created from a family signatures file (output of `p3-signature-familes <http://docs.patric.local/cli_tutorial/command_list/p3-signature-families.html>`__) using the following command


.. code-block:: perl

     p3-signature-peginfo --gs1=FileOfGenomeIds < family.data > peg.data


However, any file containing the appropriately named columns in the headers (see below) will work.

This script produces a file containing entries of the form


.. code-block:: perl

           famId1 peg1 func1
           famId2 peg2 func2
           .
           .
           .
           //


if the --verbose flag is used.  Else, you get 1 line per cluster of the form


.. code-block:: perl

           genome1 peg11,peg12,...,peg1n1
           genome1 peg13,peg14,...,peg1n2
           genome2 peg21,peg22,...,peg2n1
             .
             .
             .


that is, you get the genome containing the cluster followed by
a comma-separated list of peg ids.  There is often a number of
clusters for a single genome.

In the non-verbose mode you get a header line containing


.. code-block:: perl

              genome_id pegs_in_cluster


Parameters
==========


There are no positional parameters.

The standard input is specified using the options in :ref:`cli-input-options`. It should be a tab-delimited
file with headers, containing the following fields at minimum.


family.family_id
 
 The ID of a protein family.
 


feature.patric_id
 
 The ID of a feature in the protein family.
 


feature.accession
 
 The ID of the contig containing the feature.
 


feature.start
 
 The index of the leftmost location for the feature on the contig.
 


feature.end
 
 The index of the rightmost location for the feature on the contig.
 


feature.strand
 
 The strand containing the feature (\ ``+``\  or \ ``-``\ ).
 


feature.product
 
 The function assigned to the feature.
 


The additional command-line options are as follows.


terse
 
 In normal mode, clusters are written in a readable format, and the
 family id and the peg function are included for each member of a
 cluster. In terse mode, each cluster is written on a single line.
 


distance
 
 Maximum base-pair distance between the midpoints of two features in order for them to be
 considered close. The default is 2000.
 



