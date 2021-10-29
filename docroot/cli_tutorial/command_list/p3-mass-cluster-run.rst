.. _cli::p3-mass-cluster-run:


###################
p3-mass-cluster-run
###################


****************
Mass Cluster Run
****************



.. code-block:: perl

     p3-mass-cluster-run.pl [options] workDir outDir


This is a special-purpose script that processes the genus-species file from :ref:`cli::p3-genus-species` as input and creates signature
cluster information for each species listed.

Parameters
==========


The positional parameters are the name of the working directory and the name of the output directory. The working directory will
contain temporary files built by the clustering script. The output directory will contain a file called \ *genus*\ \ ``.``\ \ *species*\ \ ``.clusters.html``\ 
containing the cluster data for the specified genus and species.

The standard input can be overridden using the options in :ref:`cli-input-options`. The first column must contain genus names and
the second species names.

The additional command-line options are as follows.


- size
 
 The size of each sample set when computing clusters. The default is \ ``20``\ .
 


- iterations
 
 The number of sampling iterations to run. The default is \ ``4``\ .
 


- min
 
 The minimum portion of occurrences for a protein family to be considered significant. The default is \ ``0.8``\ .
 


- max
 
 The maximum portion of occurrences for a protein family to be considered insignificant. The default is \ ``0.1``\ .
 


- resume
 
 If specified, genus-species combinations will be skipped if output files already exist.
 



