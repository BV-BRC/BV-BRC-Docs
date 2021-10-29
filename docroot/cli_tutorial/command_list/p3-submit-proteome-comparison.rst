.. _cli::p3-submit-proteome-comparison:


#############################
p3-submit-proteome-comparison
#############################


************************************
Submit a Proteome Comparison Request
************************************


This script submits a request to compare proteins against a reference genome.  In addition to the reference genome ID, it
takes as input one or more protein feature sets.  These can be feature groups, protein FASTA files, or other genomes.


**************
Usage Synopsis
**************



.. code-block:: perl

     p3-submit-proteome-comparison [options] output-path output-name


Start a proteome comparison job, producing output in the specified workspace path, using the specified name for the base filename
of the output files.

Command-Line Options
====================



- --workspace-path-prefix
 
 Base workspace directory for relative workspace paths.
 


- --workspace-upload-path
 
 Name of workspace directory to which local files should be uplaoded.
 


- --overwrite
 
 If a file to be uploaded already exists and this parameter is specified, it will be overwritten; otherwise, the script will error out.
 


- --genome-ids
 
 Main list of genome IDs, comma-delimited.  Alternatively, this can be a local file name.  If specified, the file must be tab-delimited,
 with a header line, containing the genome IDs in the first column.  The genome IDs in this file can optionally be enclosed in quotes,
 allowing a text file download of a BV-BRC genome group or genome display to be used.
 


- --protein-fasta
 
 List of protein fasta files.  These operate as virtual genomes containing the proteins in the FASTA file.  (They may, in fact, be
 the protein fasta files of real genomes.)  For multiple values, specify the option multiple times.
 


- --user-feature-group
 
 List of BV-BRC feature group names.  These are specified as workspace files, so they are modified by the workspace path prefix,
 but they should not have the \ ``ws:``\  prefix.  Each group is treated as a virtual genome containing the proteins in the group.  For
 multiple groups, specify the option multiple times.
 


- --reference-genome-id
 
 ID of the reference genome.  If omitted, the first genome in the \ ``--genome-ids``\  list will be used.
 


The following parameters determine whether a match between two proteins is acceptable.  The matches are performed by BLASTP,
so most of these correspond to BLAST parameters.


- --min-seq-cov
 
 The minimum coverage of the sequences for the match to be accepted.  The default is 0.30 (30%).
 


- --max-e-val
 
 The maximum e-value of the sequence match for the match to be accepted.  The default is 1e-5.
 


- --min-ident
 
 The minimum fraction identity for a match to be accepted.  The default is 0.1 (10%).
 


- --min-positive
 
 The minimum fraction for positive-scording positions in a match. The default is 0.2 (20%).
 


The following options are used for assistance and debugging.


- --help
 
 Display the command-line usage and exit.
 


- --dry-run
 
 Display the JSON submission string and exit without invoking the service or uploading files.
 



