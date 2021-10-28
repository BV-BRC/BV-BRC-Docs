.. _cli::p3-function-parse:


#################
p3-function-parse
#################


********************************************************************
Parse Functional Assignments to Convert them to Roles and Subsystems
********************************************************************



.. code-block:: perl

     p3-function-parse.pl [options]


This script's default behavior is to split functional assignments into roles.  Unlike :ref:`cli::p3-function-to-role`, it does
not convert the roles to IDs, so it captures all roles, even the ones that are not in the common role table.  Optionally,
you can request a list of the subsystems containing the role.  This is appended as a list (delimiter-separated) in an
extra column when available.

If a function has multiple roles, multiple output rows will be produced.

Parameters
==========


There are no positional parameters.

The standard input can be overridden using the options in :ref:`cli-input-options`.  The standard input should contain the
functional assignments.

Additional command-line options are those given in :ref:`cli-column-options` (to specify the column containing the functional
assignments), :ref:`cli-delimiter-options` (to specify the delimiter for the subsystem column), and the following options.




If specified, an additional column will be added containing the subsystems for each role.
