.. _cli::p3-get-subsystem-features:


#########################
p3-get-subsystem-features
#########################


**********************************************
Get All the Features in One or More Subsystems
**********************************************



.. code-block:: perl

     p3-get-subsystem-features.pl [options]


This script takes as input a file of subsystem IDs (names) and lists the features in each one.  As with all database
scripts, the fields retrieved are appended to the input record.  In this case, however, the number of results returned
for each input record is expected to be very large.

Note that the returned object is a subsystem-item record.  It contains data about the feature's relationship to the
subsystem, not the feature itself.  To get feature data, pipe this command into :ref:`cli::p3-get-feature-data`.

Parameters
==========


There are no positional parameters.

The standard input can be overridden using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-data-options` and :ref:`cli-column-options` plus the following.


- fields
 
 List the available field names.
 


- names
 
 If specified, then the input is presumed to contain subsystem names (with spaces) instead of subsystem IDs (with
 underscores).  Note that some subsystem names have invisible spaces at the end, and these MUST be included in the
 input.
 



