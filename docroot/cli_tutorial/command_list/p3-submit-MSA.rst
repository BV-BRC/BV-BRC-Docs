.. _cli::p3-submit-MSA:


#############
p3-submit-MSA
#############


********************************************
Submit a Multiple Sequence Alignment Request
********************************************


This script submits a request to submit an MSA job to BV-BRC.  It accepts as input multiple features and/or feature sequences,
and builds an alignment for display.


**************
Usage Synopsis
**************



.. code-block:: perl

     p3-submit-MSA [options] output-path output-name


Start a multiple sequence alignment, producing output in the specified workspace path, using the specified name for the base filename
of the output files.

Command-Line Options
====================



- --workspace-path-prefix
 
 Prefix to be put in front of the output path.  This is optional, and is provided for uniformity with other commands.
 


- --workspace-upload-path
 
 Name of workspace directory to which local files should be uplaoded.
 


- --overwrite
 
 If a file to be uploaded already exists and this parameter is specified, it will be overwritten; otherwise, the script will error out.
 


- --alphabet
 
 The type of sequences to align-- \ ``dna``\  or \ ``protein``\ .  The default is \ ``dna``\ .
 


- --fasta-file
 
 A FASTA file containing sequences to align.  If a local DNA file is specified, it will be uploaded as \ ``feature_dna_fasta``\ .
 If a local protein file is specified, it will be uploaded as \ ``feature_protein_fasta``\ .  To specify multiple FASTA files,
 specify this option multiple times.
 


- --feature_group
 
 A workspace feature group file.  This can never be a local file, so a \ ``ws:``\  prefix is simply stripped off.  To specify
 multiple feature groups, specify this option multiple times.
 


- --help
 
 Display the command-line usage and exit.
 


- --dry-run
 
 Display the JSON submission string and exit without invoking the service or uploading files.
 



