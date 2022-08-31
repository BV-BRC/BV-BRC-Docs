.. _cli::p3-submit-gene-tree:


###################
p3-submit-gene-tree
###################


************************************
Submit a Gene Phylogeny Tree Request
************************************


This script submits a request to build a phylogenetic tree of protein sequences.  It accepts as input a group of FASTA files,
and forms them into a tree using various criteria and methods.


**************
Usage Synopsis
**************



.. code-block:: perl

     p3-submit-gene-tree [options] output-path output-name


Start a gene phylogeny job, producing output in the specified workspace path, using the specified name for the base filename
of the output files.

Command-Line Options
====================



- --workspace-path-prefix
 
 Base workspace directory for relative workspace paths.
 


- --workspace-upload-path
 
 Name of workspace directory to which local files should be uplaoded.
 


- --overwrite
 
 If a file to be uploaded already exists and this parameter is specified, it will be overwritten; otherwise, the script will error out.
 


- --sequences
 
 Main list of FASTA input files.  These can be protein fasta files or DNA fasta files.  For multiple files, specify the
 option multiple times.
 


- --trim-threshold
 
 Alignment end-trimming threshold.
 


- --gap-threshold
 
 Threshold for deleting alignments with large gaps.
 


- --dna
 
 If specified, the inputs are assumed to be DNA sequences.  The default is protein sequences.
 


- --substitution-model
 
 Substitution model to use.  The options are \ ``HKY85``\ , \ ``JC69``\ , \ ``K80``\ , \ ``F81``\ , \ ``F84``\ , \ ``TN93``\ , \ ``GTR``\ ,
 \ ``LG``\ , \ ``WAG``\ , \ ``JTT``\ , \ ``MtREV``\ , \ ``Dayhoff``\ , \ ``DCMut``\ , \ ``RtREV``\ , \ ``CpREV``\ , \ ``VT``\ , \ ``AB``\ , \ ``Blosum62``\ ,
 \ ``MtMam``\ , \ ``MtArt``\ , \ ``HIVw``\ , or \ ``HIVb``\ .
 


- --recipe
 
 Recipe for building the tree.  The options are \ ``RAxML``\ , \ ``PhyML``\ , or \ ``FastTree``\ .  The default is \ ``RAxML``\ .
 


The following options are used for assistance and debugging.


- --help
 
 Display the command-line usage and exit.
 


- --dry-run
 
 Display the JSON submission string and exit without invoking the service or uploading files.
 



