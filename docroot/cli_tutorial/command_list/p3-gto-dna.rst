.. _cli::p3-gto-dna:


##########
p3-gto-dna
##########

.. highlight:: perl


**********************
Extract DNA from a GTO
**********************



.. code-block:: perl

     p3-gto-dna.pl [options] gtoFile


This script reads one or more locations from the standard input and outputs the corresponding DNA from the input :ref:`cli::GenomeTypeObject` file.

Parameters
==========


The positional parameter should be the name of the :ref:`cli::GenomeTypeObject` file in JSON format.

The standard input can be overridden using the options in :ref:`cli-input-options`. The standard input should contain location
strings in the key column (specified using :ref:`cli-column-options`) and the region name in the column identified by the
\ ``--label``\  parameter.

Location strings are of the form \ *contigID*\ \ ``_``\ \ *start*\ \ ``+``\ \ *len*\  for the forward strand and \ *contigID*\ \ ``_``\ \ *start*\ \ ``-``\ \ *len*\  for
the backward strand.

Additional command-line options are as follows.


fasta
 
 Output should be in FASTA format, with the region name as the ID.
 


label
 
 Index (1-based) or name of the column containing the region names. The default is the first column (\ ``1``\ ).
 



