.. _cli::p3-feature-upstream:


###################
p3-feature-upstream
###################

.. highlight:: perl


*************************
Find Upstream DNA Regions
*************************



.. code-block:: perl

     p3-feature-upstream.pl [options] parms


This script takes as input a file of feature IDs. For each feature, it appends the upstream region on the input record.
Use the \ ``--downstream``\ ) option to get the downstream regions instead.

Parameters
==========


There are no positional parameters.

The standard input can be overriddn using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-column-options` plus the following.


downstream
 
 Display downstream instead of upstream regions.
 


length
 
 Specifies the length to display upstream. The default is \ ``100``\ .
 



