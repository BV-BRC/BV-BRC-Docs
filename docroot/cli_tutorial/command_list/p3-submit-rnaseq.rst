.. _cli::p3-submit-rnaseq:


################
p3-submit-rnaseq
################


********************************
Submit an RNA Seq Processing Job
********************************


This script submits an RNA Seq processing job to BV-BRC.  It allows input from all supported read libraries, and specifies
the tool to use as well as any conditions or contrasts that we want to appear on the output.


**************
Usage Synopsis
**************



.. code-block:: perl

     p3-submit-rnaseq [options] output-path output-name


Start an RNA Seq expression data processing job with output to the specified workspace path, using the specified name for the
job folder.

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
 


The following options specify the reads from which the genome should be assembled.


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
 


hese options modify the way reads are labelled during processing, so they must precede the library specifications to which
they apply.  So, for example


.. code-block:: perl

     --condition low_temp --srr-id SRR12345 --condition high_temp --srr-id SRR67890


Means that sample SRR12345 was tested in the \ ``low_temp``\  condition and SRR67890 was tested in the \ ``high_temp``\  condition.


- --condition
 
 Name of a condition that applies to this library.
 


These options specify what is to be done to the RNA Seq reads.


- --contrast
 
 Comma-separated pair of conditions to be contrasted.  This parameter can be specified multiple times.
 


- --tuxedo
 
 Use the Tuxedo suite of RNA tools. (This is the default.)
 


- --hisat
 
 Use the Host HISAT suite of RNA tools.
 


- --reference-genome-id
 
 If specified, the ID of a genome in BV-BRC to which the reads will be aligned.  This operation is always performed last.
 


These options are provided for user assistance and debugging.


- --help
 
 Display the command-line usage and exit.
 


- --dry-run
 
 Display the JSON submission string and exit without invoking the service or uploading files.
 



