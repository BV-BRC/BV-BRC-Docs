.. _cli::p3-write-kmers:


##############
p3-write-kmers
##############


********************
Write Kmers to Files
********************



.. code-block:: perl

     p3-write-kmers.pl [options] kmerdb outDir


This script takes a `KmerDb <KmerDb>`_ as input and writes the kmer groups to flat files.  The output files will be written to the
specified output directory, and each will have as its name the group ID or name with a suffix of \ ``.kmer``\ .  The files will
not have headers, and consist of one kmer per line.

Parameters
==========


The positional parameters are the file name of the kmer database (which must be stored in JSON format) and the name of the output
directory.

Additional command-line options are as follows.


- names
 
 If specified, the group names rather than the group IDs will be used to form the output file names.
 


- clear
 
 If specified, the output directory will be emptied before processing.
 



