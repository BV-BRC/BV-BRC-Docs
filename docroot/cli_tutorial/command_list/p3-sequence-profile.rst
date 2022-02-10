.. _cli::p3-sequence-profile:


###################
p3-sequence-profile
###################

.. highlight:: perl


***********************************
Profile Sequences by Letter Content
***********************************



.. code-block:: perl

     p3-sequence-profile.pl [options]


This script analyzes DNA or protein sequences in the key column of the incoming file and outputs the number of times
each letter occurs. The output file will contain the letter in the first column and the count in the second, and
will be sorted from most frequent to least. This can lead to very small output files.

Parameters
==========


There are no positional parameters.

The standard input can be overriddn using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-column-options` (to select the column containing the sequences).


