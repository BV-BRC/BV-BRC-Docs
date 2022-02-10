.. _cli::p3-function-to-role:


###################
p3-function-to-role
###################

.. highlight:: perl


**************************************************
Convert Functions to Roles in a Tab-Delimited File
**************************************************



.. code-block:: perl

     p3-function-to-role [options] <features.with.functions.tbl >features.with.roles.tbl


This script takes a file of features with functional assignments (products) included and
replaces the functions with roles. Hypothetical roles are not considered real, so some features
may be deleted. Conversely, some functions have multiple roles, so other features may be
replicated.

If a strict subset of roles is desired, the \ ``--roles``\  option should be used.

Parameters
==========


There are no positional parameters.

The standard input can be overriddn using the options in :ref:`cli-input-options`.

The command-line options in :ref:`cli-column-options` can be used to select the input column. The
input column should contain functional assignments. This column will be replaced with role
descriptions in the output.

The additional command-line options are


roles
 
 A tab-delimited file of roles. Each record consists of (0) a role ID, (1) the role checksum, and
 (2) the role description. Specify this file if you want a role-filtering scheme other than
 official BV-BRC roles.
 



