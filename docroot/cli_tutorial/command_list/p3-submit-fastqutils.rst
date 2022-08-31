.. _cli::p3-submit-fastqutils:


####################
p3-submit-fastqutils
####################


****************************
Submit a Fastq Utilities Job
****************************


This script submits a Fastqutils job to BV-BRC.  It allows input from all supported read libraries, and requests a list
of services to be performed.


**************
Usage Synopsis
**************



.. code-block:: perl

     p3-submit-fastqutils [options] output-path output-name


Start a FASTQ processing job specified workspace path, using the specified name for the output job folder.

Command-Line Options
====================



- --paired-end-lib
 
 Two paired-end libraries containing reads.  These are coded with a single invocation, e.g. \ ``--paired-end-lib left.fa right.fa``\ .  The
 libraries must be paired FASTQ files.  A prefix of \ ``ws:``\  indicates a file is in the BV-BRC workspace; otherwise they are uploaded
 from the local file system.  This parameter may be specified multiple times.
 
 \=item --single-end-lib
 
 A library of single reads.  This must be a FASTQ file.  A prefix of \ ``ws:``\  indicates a file is in the BV-BRC workspace; otherwise they are
 uploaded from the local file system.  This parameter may be specified multiple times.
 


- --srr-id
 
 A run ID from the NCBI sequence read archive.  The run will be downloaded from the NCBI for processing.  This parameter may be specified
 multiple times.
 


- --trim
 
 Trim the sequences.  This operation is performed before quality control.
 


- --paired_filter
 
 Perform paired-end filtering.  This operation is always performed first.
 


- --fastqc
 
 Run the FASTQ quality control analysis.  This operation is performed after trimming.
 


- --reference-genome-id
 
 If specified, the ID of a genome in BV-BRC to which the reads will be aligned.  This operation is always performed last.
 


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
 



