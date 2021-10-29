.. _cli::p3-role-features:


################
p3-role-features
################


***********************************
Find Features for One or More Roles
***********************************



.. code-block:: perl

     p3-role-features.pl [options]


This script takes as input a list of role descriptions and outputs the relevant feature records.  It can optionally accept
a file of genome IDs to which the features must belong.

Parameters
==========


There are no positional parameters.

The standard input can be overridden using the options in :ref:`cli-input-options`.  It should contain a role description in
the key column identified by the :ref:`cli-column-options`.

Additional command-line options are those given in :ref:`cli-data-options` plus the following options.


- genomes
 
 If specified, a tab-delimited file containing genome IDs in the first column.
 


- verbose
 
 Display progress messages on STDERR.
 



