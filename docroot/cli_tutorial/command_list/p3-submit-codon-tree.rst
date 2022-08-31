.. _cli::p3-submit-codon-tree:


####################
p3-submit-codon-tree
####################


******************************************
Submit a Phylogenetic Tree Mapping Request
******************************************


This script submits a request to build a codon tree to BV-BRC.  This is a slow process and the job can take more than one day, depending on the
number of genoems.  It takes a list of BV-BRC genome IDs as input and accepts a few additional parameters.


**************
Usage Synopsis
**************



.. code-block:: perl

     p3-submit-codon-tree [options] output-path output-name


Start a phylogenetic tree mapping job, producing output in the specified workspace path, using the specified name for the base filename
of the output files.

Command-Line Options
====================



- --workspace-path-prefix
 
 Prefix to be put in front of the output path.  This is optional, and is provided for uniformity with other commands.
 


- --genome-ids
 
 Main list of genome IDs, comma-delimited.  Alternatively, this can be a local file name.  If specified, the file must be tab-delimited,
 with a header line, containing the genome IDs in the first column.  The genome IDs in this file can optionally be enclosed in quotes,
 allowing a text file download of a BV-BRC genome group or genome display to be used.
 


- --number-of-genes
 
 Number of marker genes to use for building the tree (default 100).
 


- --max-genomes-missing
 
 The maximum number of genomes that can be missing from any PGFam before the family is disqualified.
 


- --max-allowed-dups
 
 The maximum number of genoems that can have multiple proteins from a PGFam before the family is disqualified.
 


- --help
 
 Display the command-line usage and exit.
 


- --dry-run
 
 Display the JSON submission string and exit without invoking the service or uploading files.
 



