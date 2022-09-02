.. _cli::p3-submit-variation-analysis:


############################
p3-submit-variation-analysis
############################


*******************************
Submit a Variation Analysis Job
*******************************


This script submits a Variation Analysis job to BV-BRC.  It takes input from read libraries and looks for small differences
against a reference genome.


**************
Usage Synopsis
**************



.. code-block:: perl

     p3-submit-variation-analysis [options] output-path output-name


Start a variation analysis, producing output in the specified workspace path, using the specified name for the base filename
of the output files.

Command-Line Options
====================


The following options are used to assist in the specification of files.  Files specified in the options that are in the workspace
should have a \ ````\ ws:> prefix.  All others are assumed to be local.


- --workspace-path-prefix
 
 Base workspace directory for relative workspace paths.
 


- --workspace-upload-path
 
 Name of workspace directory to which local files should be uplaoded.
 


- --overwrite
 
 If a file to be uploaded already exists and this parameter is specified, it will be overwritten; otherwise, the script will error out.
 


The following options specify the reads to be analyzed.


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
 


The following options modify the analysis process.


- --reference-genome-id
 
 The ID of the genome in BV-BRC to be used as a reference.
 


- --mapper
 
 Mapping utility to use-- \ ``BWA-mem``\ , \ ``BWA-mem-strict``\ , \ ``Bowtie2``\ , or \ ``LAST``\ .  Default is \ ``BWA-mem``\ .
 


- --caller
 
 SNP-calling utility to use-- \ ``FreeBayes``\  or \ ``SAMtools``\ .  Default is \ ``FreeBayes``\ .
 


These options are provided for user assistance and debugging.


- --help
 
 Display the command-line usage and exit.
 


- --dry-run
 
 Display the JSON submission string and exit without invoking the service or uploading files.
 



