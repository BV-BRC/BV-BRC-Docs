.. _cli::p3-submit-BLAST:


###############
p3-submit-BLAST
###############


**********************
Submit a BLAST Request
**********************


This script submits a request to submit a BLAST job to BV-BRC.  It is a swiss army knife, accepting two sources of query input of
two types and five sources of subject input of four types.


**************
Usage Synopsis
**************



.. code-block:: perl

     p3-submit-BLAST [options] output-path output-name


Start a BLAST job, producing output in the specified workspace path, using the specified name for the base filename
of the output files.

Command-Line Options
====================



- --workspace-path-prefix
 
 Prefix to be put in front of the output path.  This is optional, and is provided for uniformity with other commands.
 


- --workspace-upload-path
 
 Name of workspace directory to which local files should be uplaoded.
 


- --overwrite
 
 If a file to be uploaded already exists and this parameter is specified, it will be overwritten; otherwise, the script will error out.
 


- --in-type
 
 The type of input-- \ ``dna``\  or \ ``aa``\ .  The default is \ ``aa``\ .
 


- --db-type
 
 The type of database to search-- \ ``fna``\  (contig DNA), \ ``ffn``\  (feature DNA), \ ``frn``\  (RNA), or \ ``faa``\  (protein).  The default is
 \ ``faa``\ .
 


- --evalue-cutoff
 
 Maximum e-value cutoff.  The default is \ ``1e-5``\ .
 


- --max-hits
 
 The maximum number of hits to return per query.  The default is \ ``10``\ .
 


- --min-coverage
 
 The minimum percent coverage for an acceptable hit.  The default is \ ``0``\ .
 


The following options specify the input (query) sequences.  Only one may be specified.


- --in-id-list
 
 Comma-delimited list of sequence IDs.  These must be feature IDs.
 


- --in-fasta-file
 
 FASTA file of sequences.  If this is a DNA local file, it will be uploaded as \ ``feature_dna_fasta``\ .  If it is an amino acid
 local file, it will be uploaded as \ ``feature_protein_fasta``\ .
 


The following options specified the subject (database) sequences.  Only one may be specified.


- --db-fasta-file
 
 FASTA file of sequences.  If this is a contig local file, it will be uploaded as \ ``contigs``\ .  If it is a feature DNA
 local file or an RNA local file, it will be uploaded as \ ``feature_dna_fasta``\ .  If it is a protein file, it
 will be uploaded as \ ``feature_protein_fasta``\ .
 


- --db-genome-list
 
 A comma-delimited list of genome IDs.  Alternatively, the name of a local file (tab-delimited with headers) containing a list
 of genome IDs in the first column.
 


- --db-taxon-list
 
 A comma-delimited list of taxon IDs.
 


- --db-database
 
 The name of a pre-computed database-- currently \ ``RefSeq``\  (reference and representative genomes), \ ``BV-BRC``\  (all prokaryotic genomes),
 \ ``Plasmids``\  (all plasmids), or \ ``Phages``\  all phages.
 


The following options are provided for user assistance and debugging.


- --help
 
 Display the command-line usage and exit.
 


- --dry-run
 
 Display the JSON submission string and exit without invoking the service or uploading files.
 



