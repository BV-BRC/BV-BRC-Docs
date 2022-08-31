.. _cli::p3-submit-metagenome-binning:


############################
p3-submit-metagenome-binning
############################


*******************************
Submit a Metagenome Binning Job
*******************************


This script submits a Metagenome Binning job to BV-BRC.  It allows input from either read libraries or a FASTA file and
organizes contigs into individual genomes.


**************
Usage Synopsis
**************



.. code-block:: perl

     p3-submit-metagenome-binning [options] output-path output-name


Start metagenome binning, producing output in the specified workspace path, using the specified name for the output folder.

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
 


The following options specify the reads to be binned.  These are assembled internally.


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
 


If contigs are being binned, specify the following parameter.  All the above parameters relating to reads should not be used
if contigs are specified.


- --contigs
 
 Input FASTA file of assembled contigs.  (If specified, all options relating to assembly will be ignored.  This is mutually exclusive with
 \ ``--paired-end-libs``\ , \ ``--single-end-libs``\ , and \ ``srr-ids``\ )
 


The following options modify the binning process.


- --genome-group
 
 Group name to be assigned to the output genomes (optional).
 


- --skip-indexing
 
 If specified, the genomes created will NOT be added to the BV-BRC database.
 


- --prokaryotes
 
 If specified, bacterial/archaeal binning will be performed.  This defaults to TRUE unless
 \ ``--viruses``\  is specified.
 


- --viruses
 
 If specified, viral binning will be performed.  This defaults to TRUE unless \ ``--prokaryotes``\ 
 is specified.
 


These options are provided for user assistance and debugging.


- --help
 
 Display the command-line usage and exit.
 


- --dry-run
 
 Display the JSON submission string and exit without invoking the service or uploading files.
 



