.. _cli::p3-subsys-roles:


###############
p3-subsys-roles
###############


**************************
Create Subsystem Role File
**************************



.. code-block:: perl

     p3-subsys-roles.pl [options]


Create a subsystem role file for :ref:`cli::p3-function-to-role`.  The file will be created on the standard output.  It will be headerless and
tab-delimited, with three columns: (0) the role ID, (1)  the role checksum, and (2) the role name.

Parameters
==========


The are no positional parameters.

The following command-line options are supported.


- verbose
 
 If specified, progress messages will be written to STDERR.
 


- roleFile
 
 If specified, the name of a tab-delimited file with role names in the last column.  Rather than the output being for all roles
 in subsystems, it will be for all roles in the specified file.  The file should have headers.
 


- col
 
 If specified, the index (1-based) of the column containing the role name.  The default is \ ``0``\ , indicating the last column.
 


- nohead
 
 If specified, the role file is presumed to not have headers.  Note that the output file never has headers, for compatibility
 with older software.
 



