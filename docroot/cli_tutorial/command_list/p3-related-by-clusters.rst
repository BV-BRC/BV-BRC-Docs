.. _cli::p3-related-by-clusters:


######################
p3-related-by-clusters
######################

.. highlight:: perl


**************************************************
Compute Related Protein Families Based on Clusters
**************************************************



.. code-block:: perl

      p3-related-by-clusters --gs1 Genome_set_1
                             --gs2 Genome_set_2
                             --sz1 Sample_size_for_gs1
                             --sz2 Sample_size_for_gs2
                             --iterations Number_random_sample_iterations
                             --family fam_type
                             --Output Directory


This tool takes as input two genome sets.  These will often be


.. code-block:: perl

     gs1    genomes for a specific species (e.g., Streptococcus pyogenes)
     gs2    genomes from the same genus, but different species


The tool picks random subsets of gs1 and gs2, computes signature families for
each pair of picks, then computes clusters of these families for each pick.

It does a set of iterations, saving the signature clusters for each iteration.

After running the set of iterations, it computes the number of times each pair
of signature families were in signature clusters.

It outputs the pairs of co-ocurring signature families, along with the
signature clusters computed for each iteration.

The output goes to a created directory.  Within that directory, the subdirectory


.. code-block:: perl

     CS


will contain the cluster signatures for each iteraion, and


.. code-block:: perl

     related.signature.families


is set to the predicted functionally-coupled pairs of families:


.. code-block:: perl

     [occurrence-count,family1,family2] sorted into descending order based on count.


Each CS/n file contains entries of the form


.. code-block:: perl

           famId1 peg1 func1
           famId2 peg2 func2
           .
           .
           .
           //


Parameters
==========


There are no positional parameters.

Standard input is not used.

The additional command-line options are as follows.


gs1
 
 Genome set 1: a file containing genome ids in the first column
 These genomes will be the onces containing signature families and clusters.
 


gs2
 
 Genome set 2: a file containing genome ids in the first column
 


sz1
 
 For each iteration pick a sample of sz1 genomes from gs1
 


sz2
 
 For each iteration pick a sample of sz2 genomes from gs2
 


iterations
 
 run this many iterations of random subsets of gs1 and gs2
 


output
 
 a created directory that will contain the output
 


family
 
 Type of protein family-- local, global, or figfam.
 



