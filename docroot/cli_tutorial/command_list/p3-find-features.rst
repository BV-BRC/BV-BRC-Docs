.. _cli::p3-find-features:


################
p3-find-features
################

.. highlight:: perl


*************************************
Find Features By Filtering on a Field
*************************************



.. code-block:: perl

     p3-find-features.pl [options] keyName


This script finds features based on the value in one of several feature-identifying fields (other than \ ``patric_id``\ ).
It provides standard filtering parameters to otherwise limit the output. (So, for example, you can require that the
features output belong only to a specific genome using \ ``--eq genome_id``\ .)

Parameters
==========


The positional parameter is the name of the field used to match the incoming keys. The following fields are permitted.


refseq_locus_tag

 The locus tag from REFSEQ



protein_id

 The REFSEQ protein ID.



gene

 The common gene name (e.g. \ ``rpoA``\ ).



gene_id

 The standard gene number.



aa_sequence_md5

 The protein sequence MD5 code.



The standard input can be overridden using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-data-options` and :ref:`cli-column-options` plus the following.


keyNames

 Rather than processing the input, list the valid key names.




