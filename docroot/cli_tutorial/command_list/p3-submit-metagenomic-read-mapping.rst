.. _cli::p3-submit-metagenomic-read-mapping:


##################################
p3-submit-metagenomic-read-mapping
##################################


*************************************
Submit a Metagenomic Read Mapping Job
*************************************


This script submits a Metagenomic Read-Mapping job to BV-BRC.  It takes input from read libraries and uses either the CARD or VFDB database
to identify the nature of the incoming reads.


**************
Usage Synopsis
**************



.. code-block:: perl

     p3-submit-metagenomic-read-mapping [options] output-path output-name


Start a metagenomic read mapping, producing output in the specified workspace path, using the specified name for the base filename
of the output files.

Command-Line Options
====================



- --paired-end-lib
 
 Two paired-end libraries containing reads.  These are coded with a single invocation, e.g. \ ``--paired-end-lib left.fa right.fa``\ .  The
 libraries must be paired FASTQ files.  A prefix of \ ``ws:``\  indicates a file is in the BV-BRC workspace; otherwise they are uploaded
 from the local file system.  This parameter may be specified multiple times.
 


- --single-end-lib
 
 A library of single reads.  This must be a FASTQ file.  A prefix of \ ``ws:``\  indicates a file is in the BV-BRC workspace; otherwise they are
 uploaded from the local file system.  This parameter may be specified multiple times.
 


- --srr-id
 
 A run ID from the NCBI sequence read archive.  The run will be downloaded from the NCBI for processing.  This parameter may be specified
 multiple times.
 


- --gene-set-name
 
 The gene set name-- \ ``CARD``\  or \ ``VFDB``\ .  The default is \ ``CARD``\ .
 


- --workspace-path-prefix
 
 Base workspace directory for relative workspace paths.
 


- --workspace-upload-path
 
 Name of workspace directory to which local files should be uplaoded.
 


- --overwrite
 
 If a file to be uploaded already exists and this parameter is specified, it will be overwritten; otherwise, the script will error out.
 


- --help
 
 Display the command-line usage and exit.
 


- --dry-run
 
 Display the JSON submission string and exit without invoking the service or uploading files.
 



