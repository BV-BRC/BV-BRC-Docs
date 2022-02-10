.. _cli::p3-get-feature-sequence:


#######################
p3-get-feature-sequence
#######################

.. highlight:: perl


****************************************
Create A FASTA File of Feature Sequences
****************************************



.. code-block:: perl

     p3-get-feature-sequence [options] < feature-ids


This script takes as input a table of feature IDs and outputs a FASTA file of the feature sequences. The FASTA comment will be the
feature annotation (product).

Parameters
==========


There are no positional parameters.

The standard input can be overridden using the options in :ref:`cli-input-options`.

The command-line options are those in :ref:`cli-column-options` (to choose the input column) plus the following.


protein
 
 Output amino acid sequences (the default).
 


dna
 
 Output DNA sequences (mutually exclusive with \ ``protein``\ ).
 



