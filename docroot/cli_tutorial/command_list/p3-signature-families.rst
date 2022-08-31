.. _cli::p3-signature-families:


#####################
p3-signature-families
#####################


*************************
Compute Family Signatures
*************************



.. code-block:: perl

      p3-signature-families --gs1=FileOfGenomeIds
                            --gs2=FileOfGenomeIds
                            [--min=MinGs1Frac]
                            [--max=MaxGs2Frac]
         > family.signatures


This script compares two genome groups-- group 1 contains genomes that are interesting for some reason,
group 2 contains genomes that are not. The output contains protein families that are common in the interesting
set but not in the other set. The output file will be tab-delimited, with four columns-- the number of
family occurrences in set 1, the number of family occurrences in set 2, the family ID, and the family's
assigned function.

Parameters
==========


There are no positional parameters.  The parameters in :ref:`cli-column-options` can be used to specify the key column
in both input files.  The following additional parameters are also supported.


- gs1
 
 A tab-delimited file of genomes.  These are thought of as the genomes that have a
 given property (e.g. belong to a certain species, have resistance to a particular
 antibiotic). If omitted, the standard input is used. The genome IDs must be in the
 last column.
 


- gs2
 
 A tab-delimited file of genomes.  These are genomes that do not have the given property.
 If omitted, the standard input is used. The genome IDs must be in the last column.
 Any genomes present in the gs1 set will be automatically deleted from this list.
 


- min
 
 Minimum fraction of genomes in Gs1 that occur in a signature family
 


- max
 
 Maximum fraction of genomes in Gs2 that occur in a signature family
 


- verbose
 
 Write progress messages to STDERR.
 



