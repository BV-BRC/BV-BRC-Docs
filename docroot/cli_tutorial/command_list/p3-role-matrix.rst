.. _cli::p3-role-matrix:


##############
p3-role-matrix
##############


******************************************************
Produce a Matrix of Singly-Occurring Roles For Genomes
******************************************************



.. code-block:: perl

     p3-role-matrix.pl [options] outFile


Given an input list of genome IDs, this program produces a matrix of the roles that are singly-occurring. The output file will contain a genome
ID in the first column, a taxonomic ID in the second column, and will have one additional column for each role ID. If the role is singly-occurring
in the genome, the column will contain a \ ``1``\ . Otherwise it will contain \ ``0``\ . The roles are taken from a typical \ **roles.in.subsystems**\  file, which
contains a role ID in the first column, a role checksum in the second, and a role name in the third.

Status is displayed on the standard output.

Parameters
==========


The positional parameter is the name of the role file. The role file must contain role IDs in the first column and role checksums in the second.
The file is tab-delimited and headerless. If the parameter is omitted, the default role file is used.

The standard input can be overridden using the options in :ref:`cli-input-options`. Use the options in :ref:`cli-column-options` to identify the
column containing genome IDs.

The following additional command-line options are supported.


- roleFile
 
 The \ ``roles.in.subsystems``\  file containing the roles to process. This is a tab-delimited file with no headers. Each line contains
 (0) a role ID, (1) a role checksum, and (2) a role name. The default is \ ``roles.in.subsystems``\  in the SEEDtk global data directory.
 


- resume
 
 Use this option to restart an interrupted job. It specifies the genome ID of the last genome processed in the previous run. New
 results are appended to the output file.
 



