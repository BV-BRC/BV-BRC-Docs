.. _cli::p3-get-subsystem-roles:


######################
p3-get-subsystem-roles
######################


*******************************
Return the Roles of a Subsystem
*******************************



.. code-block:: perl

     p3-get-subsystem-roles.pl [options]


This script takes as input a list of subsystem IDs or names and appends the subsystem's roles.  There will always
be multiple roles per subsystem, so each input line will produce more than one output line.

Parameters
==========


There are no positional parameters.

The standard input can be overridden using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-column-options` plus the following.


- fields
 
 List the available field names.
 


- names
 
 If specified, then the input is presumed to contain subsystem names (with spaces) instead of subsystem IDs (with
 underscores).  Note that some subsystem names have invisible spaces at the end, and these MUST be included in the
 input.
 



