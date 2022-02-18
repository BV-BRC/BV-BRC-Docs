.. _cli::p3-echo:


#######
p3-echo
#######

.. highlight:: perl


*****************************
Write Data to Standard Output
*****************************



.. code-block:: perl

     p3-echo [options] value1 value2 ... valueN


This script creates a tab-delimited output file containing the values on the command line. If a single header (\ ``--title``\  option)
is specified, then the output file is single-column. Otherwise, there is one column per header. So, for example


.. code-block:: perl

     p3-echo --title=genome_id 83333.1 100226.1


produces


.. code-block:: perl

     genome_id
     83333.1
     100226.1


However, the command


.. code-block:: perl

     p3-echo --title=genome_id --title=name 83333.1 "Escherichia coli" 100226.1 "Streptomyces coelicolor"


produces


.. code-block:: perl

     genome_id   name
     83333.1     Escherichia coli
     100226.1    Streptomyces coelicolor


Parameters
==========


The positional parameters are the values to be output.

The command-line options are as follows.


title
 
 The value to use for the header line. If more than one value is specified, then the output file is multi-column. If
 omitted, the single column header \ ``id``\  is assumed.
 


nohead
 
 If this option is specified, then no column headers are output. The value is the number of columns desired.
 



