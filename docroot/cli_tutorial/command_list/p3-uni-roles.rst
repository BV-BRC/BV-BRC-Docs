.. _cli::p3-uni-roles:


############
p3-uni-roles
############


*****************************************************
Produce a Table of Singly-Occurring Roles For Genomes
*****************************************************



.. code-block:: perl

     p3-uni-roles.pl [options] outFile


Given an input list of genome IDs, this program produces a list of the roles that are singly-occurring. The output file will contain a genome
ID in the first column, the domain in the second column, the seed protein sequence in the third column, and the additional columns will contain
the IDs of the singly-occurring roles. The roles are taken from a typical \ **roles.in.subsystems**\  file, which contains a role ID in the first
column, a role checksum in the second, and a role name in the third.

Status is displayed on the standard output.

Parameters
==========


The positional parameter is the name of the output file.

The standard input can be overridden using the options in :ref:`cli-input-options`. Use the options in :ref:`cli-column-options` to identify the
column containing genome IDs.

The following additional command-line options are supported.


- roleFile
 
 The \ ``roles.in.subsystems``\  file containing the roles to process. This is a tab-delimited file with no headers. Each line contains
 (0) a role ID, (1) a role checksum, and (2) a role name. The default is \ ``roles.unified``\  in the SEEDtk global data directory.
 


- resume
 
 Use this option to restart an interrupted job. It specifies the genome ID of the last genome processed in the previous run. New
 results are appended to the output file.
 



