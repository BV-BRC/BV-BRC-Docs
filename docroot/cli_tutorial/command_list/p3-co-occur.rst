.. _cli::p3-co-occur:


###########
p3-co-occur
###########


**********************************
Compute Co-Occurrences of Proteins
**********************************



.. code-block:: perl

     p3-co-occur.pl [options] catFile


This script will compute the number of co-occurrences of specified protein categories. The most common category is role (product), but it is also
possible to specify protein families.

Parameters
==========


The positional parameter is the name of the file containing the category names. The file should be tab-delimited with the names in the first column.
If no file is specified, all recognizable category values will be counted. This can be problematic if the categories are roles.

The standard input can be overridden using the options in :ref:`cli-input-options`. The standard input will contain the genome IDs. The options in
:ref:`cli-column-options` can be used to configure headers and the column containing the genome IDs. In addition, the following options are
supported.


- gap
 
 The maximum gap distance for two proteins to be considered physically close. The default is \ ``2000``\ .
 


- type
 
 The type of category-- currently \ ``role``\ , \ ``ecnum``\ , or \ ``family``\ . The default is \ ``role``\ .
 


- verbose
 
 If specified, status messages will be written to the standard error output.
 



