.. _cli::p3-tail:


#######
p3-tail
#######


***************************************
Return Last Few Lines of the Input File
***************************************



.. code-block:: perl

     p3-tail.pl [options]


This script returns the header line plus the last few data lines of the standard input stream. It is similar to the Unix \ **tail**\ 
command, but works on Windows.

Parameters
==========


There are no positional parameters.

The standard input can be overridden using the options in :ref:`cli-input-options`.

Additional command-line options are as follows.


- nohead
 
 The file has no headers.
 


- lines
 
 The number of data lines to display. If there is a header line, it is not counted in this number. The default is \ ``10``\ .
 



