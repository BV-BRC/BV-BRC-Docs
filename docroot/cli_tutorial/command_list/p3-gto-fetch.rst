.. _cli::p3-gto-fetch:


############
p3-gto-fetch
############


*****************************
Copy GTOs from SubDirectories
*****************************



.. code-block:: perl

     p3-gto-fetch.pl [options] sourceDir targetDir


This is a rather esoteric script that locates `GenomeTypeObject <GenomeTypeObject>`_ file in a set of subdirectories by genome ID.  The genome IDs
are read from the input file, and then the subdirectories are searched to find GTOs with those IDs in the names.  The GTOs are
then copied to the target directory.

Parameters
==========


The positional parameters are the names of the source and target directories.

The standard input can be overridden using the options in :ref:`cli-input-options`.  The column containing the genome ID
can be specified using the options in :ref:`cli-column-options`.

Additional command-line options are the following.


- clear
 
 Erase the target directory if it already exists.
 


- subCol
 
 If specified, the index (1-based) or name of a column containing subdirectory names.  The GTOs will be copied into
 a subdirectory of the target with the same name as the value in the column.
 



