.. _cli::p3-rast:


#######
p3-rast
#######

.. highlight:: perl


****************************
Annotate a Genome Using RAST
****************************



.. code-block:: perl

     p3-rast.pl [ options ] taxonID name


This script invokes the RAST service over the web to annotate a genome. It will submit a FASTA
file to RAST, wait for the job to finish, and then format the results into a JSON-form :ref:`cli::GenomeTypeObject`.

Parameters
==========


The input can be a contig-only GenomeTypeObject in JSON format or a contig FASTA file. The
two positional parameters are the proposed taxonomic ID and the genome name. The command-line options in
:ref:`cli-input-options` are used to specify the standard input. The additional command-line
options are as follows.


gto
 
 If specified, then the input file is presumed to be a contig object or a workspace contig object
 encoded in JSON format. The contigs must be in the form of a list attached to the \ ``contigs``\ 
 member or the \ ``contigs``\  member of the \ ``data``\  member (the latter indicating a workspace object).
 


domain
 
 The domain of the new genome-- \ ``B``\  for bacteria, \ ``A``\  for archaea, and so forth. The default is
 \ ``B``\ .
 


geneticCode
 
 The genetic code of the new genome. The default is \ ``11``\ .
 


user
 
 User name for RAST access.
 


password
 
 Password for RAST access.
 


sleep
 
 Sleep interval in seconds while waiting for the job to complete. The default is \ ``60``\ .
 



