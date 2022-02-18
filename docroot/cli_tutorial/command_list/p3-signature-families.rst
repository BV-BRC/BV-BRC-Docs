.. _cli::p3-signature-families:


#####################
p3-signature-families
#####################

.. highlight:: perl


*************************
Compute Family Signatures
*************************



.. code-block:: perl

      p3-signature-families --gs1=FileOfGenomeIds
                            --gs2=FileOfGenomeIds
                            [--min=MinGs1Frac]
                            [--max=MaxGs2Frac]
         > family.signatures
 
      This script produces a file in which the last field in each line
      is a family signature. The first field will be the number of hits against Gs1,
      and the second will be the number of hits against Gs2.


Parameters
==========



col
 
 Specifies the (1-based) column index or name of the genome ID column in the two
 genome input files. The default is \ ``0``\ , indicating the last colummn.
 


gs1
 
 A tab-delimited file of genomes.  These are thought of as the genomes that have a
 given property (e.g. belong to a certain species, have resistance to a particular
 antibiotic). If omitted, the standard input is used. The genome IDs must be in the
 last column.
 


gs2
 
 A tab-delimited file of genomes.  These are genomes that do not have the given property.
 If omitted, the standard input is used. The genome IDs must be in the last column.
 Any genomes present in the gs1 set will be automatically deleted from this list.
 


min
 
 Minimum fraction of genomes in Gs1 that occur in a signature family (default 0.8).
 


max
 
 Maximum fraction of genomes in Gs2 that occur in a signature family (default 0.2).
 


verbose
 
 Write progress messages to STDERR.
 



