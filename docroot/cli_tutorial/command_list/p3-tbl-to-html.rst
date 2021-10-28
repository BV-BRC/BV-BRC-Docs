.. _cli::p3-tbl-to-html:


##############
p3-tbl-to-html
##############


*********************************************
Convert a Tab-Delimited File to an HTML Table
*********************************************



.. code-block:: perl

     p3-tbl-to-html.pl [options]


This script simply converts a P3 tab-delimited file to an HTML table. The header row is converted into an actual table header row.

Parameters
==========


There are no positional parameters.

The standard input can be overridden using the options in :ref:`cli-input-options`.

Additional command-line options are the following.


- nohead
 
 If specified, it is presumed there are no headers, so there will be no header row.
 


- class
 
 If specified, style class to give to the table.
 


- border
 
 If specified, border definition to give to the table.
 



