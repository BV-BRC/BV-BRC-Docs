.. _cli::p3-discriminating-kmers:


#######################
p3-discriminating-kmers
#######################


***************************************
Find Discriminating Kmers in Big Groups
***************************************



.. code-block:: perl

     p3-discriminating-kmers.pl [options] file1 file2 ... fileN


This script reads sequences from multiple tab-delimited files.  The files must all have the same column format.  If the
input column is specified as a column index, then the sequences must be in the same column.  If it is specified as a column
name, then the sequence columns must all have the same name.  If one file is FASTA, all of them must be FASTA.

Each file is presumed to contain sequences from a single group.  We will output a json-format kmer database containing
discriminators For each group.

The name of each group will be the base name of the incoming file.  If two incoming files have the same base name this means
they will be considered part of the same group.

Progress messages will be written to the standard output.

Parameters
==========


The positional parameters are the names of the input files.

Additional command-line options are those given in :ref:`cli-column-options` (to specify the index or name of the column containing the
sequences) plus the following options.


- fasta
 
 If specified, the input files are presumed to be FASTA files.
 


- groups
 
 If specified, a comma-delimited list of group names.  There must be one per input file, and they will override the file names
 when computing the group names.  If multiple groups have the same name, they will be treated as a single group.
 


- kmer
 
 The kmer size, in characters. The default is \ ``8``\  normally, and \ ``14``\  for DNA sequences.
 


- dna
 
 If specified, the sequences are treated as DNA instead of proteins.
 


- output
 
 The name of the output file.  The default is \ ``discrim.json``\  in the current directory.
 



