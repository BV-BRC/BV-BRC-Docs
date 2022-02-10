.. _cli::p3-blast:


########
p3-blast
########

.. highlight:: perl


****************
Blast FASTA Data
****************



.. code-block:: perl

     p3-blast.pl [ options ] type blastdb


Blast the input against a specified blast database. The input should be a FASTA file. The blast database
can also be a FASTA file, the input itself, or it can be a genome ID.

Parameters
==========


The positional parameters are the name of the blast program (\ ``blastn``\ , \ ``blastp``\ , \ ``blastx``\ , or \ ``tblastn``\ )
followed by the file name of the blast database. If the blast database is not pre-built, it will be built in
place. If the database is not found, it is presumed to be a genome ID. If the database name is omitted, the
input will be blasted against itself.

The options in :ref:`cli-input-options` can be used to override the standard input.

The additional command-line options are as follows.


hsp
 
 If specified, then the output is in the form of HSP data (see :ref:`cli::Hsp`). This is the default, and is mutually exclusive with \ ``sim``\  and \ ``tbl``\ .
 


sim
 
 If specified, then the output is in the form of similarity data (see :ref:`cli::Sim`). This parameter is mutually exclusive with \ ``hsp``\  and \ ``tbl``\ .
 


tbl
 
 If specified, then the output is in the form of a six-column table: query ID, query description, subject ID, subject description, percent identity, and e-value.
 


best
 
 If specified, then only the best match for each query sequence will be output.
 


BLAST Parameters
 
 The following may be specified as BLAST parameters
 
 
 maxE
  
  Maximum E-value (default \ ``1e-10``\ ).
  
 
 
 maxHSP
  
  Maximum number of returned results (before filtering). The default is to return all results.
  
 
 
 minScr
  
  Minimum required bit-score. The default is no minimum.
  
 
 
 percIdentity
  
  Minimum percent identity. The default is no minimum.
  
 
 
 minLen
  
  Minimum permissible match length (used to filter the results). The default is no filtering.
  
 
 



