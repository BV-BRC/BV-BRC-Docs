.. _cli::p3-submit-CGA:


#############
p3-submit-CGA
#############


******************************************
Submit a Comprehensive Genome Analysis Job
******************************************


This script submits a CGA job to BV-BRC.  It allows input from either read libraries or a FASTA file, annotates the sequences
(after any necessary assembly), and produces a page of useful reports and graphs.


**************
Usage Synopsis
**************



.. code-block:: perl

     p3-submit-CGA [options] output-path output-name


Start a comprehensive genome analysis, producing output in the specified workspace path, using the specified name for the base filename
of the output files.

Command-Line Options
====================


The following options are used to assist in the specification of files.  Files specified in the options that are in the workspace
should have a \ ````\ ws:> prefix.  All others are assumed to be local.


- --workspace-path-prefix
 
 Base workspace directory for relative workspace paths.
 


- --workspace-upload-path
 
 Name of workspace directory to which local files should be uplaoded.
 


- --overwrite
 
 If a file to be uploaded already exists and this parameter is specified, it will be overwritten; otherwise, the script will error out.
 


The following options specify the reads from which the genome should be assembled.


- --paired-end-lib
 
 Two paired-end libraries containing reads.  These are coded with a single invocation, e.g. \ ``--paired-end-lib left.fa right.fa``\ .  The
 libraries must be paired FASTQ files.  A prefix of \ ``ws:``\  indicates a file is in the BV-BRC workspace; otherwise they are uploaded
 from the local file system.  This parameter may be specified multiple times.
 


- --single-end-lib
 
 A library of single reads.  This must be a FASTQ file.  A prefix of \ ``ws:``\  indicates a file is in the BV-BRC workspace; otherwise they are
 uploaded from the local file system.  This parameter may be specified multiple times.
 


- --srr-id
 
 A run ID from the NCBI sequence read archive.  The run will be downloaded from the NCBI for processing.  This parameter may be specified
 multiple times.
 


These options modify the way reads are processed during assembly, so they should precede any library specifications to which they apply.
For example,


.. code-block:: perl

     --platform illumina --paired-end-lib S1.fq S2.fq --platform pacbio --single-end-lib ERR12345.fq  --srr-id SRR54321


means that the local files \ ``S1.fq``\  and \ ``S2.fq``\  are from the illumina platform, but the single-end library \ ``ERR12345.fq``\  comes
from the pacbio platform.  These options \ **only**\  apply to FASTQ libraries, and not to libraries accessed via na NBCI ID.  Thus
\ ``SRR54321``\  above will use the default mode of having its platform inferred from the data.


- --platform
 
 The sequencing platform for the subsequent read library or libraries.  Valid values are \ ``infer``\ , \ ``illumina``\ , \ ``pacbio``\ , or <nanopore>.
 The default is \ ``infer``\ .
 


- --insert-size-mean
 
 The average size of an insert in all subsequent read libraries, used for optimization.
 


- --insert-size-stdev
 
 The standard deviation of the insert sizes in all subsequent read libraries, used for optimization.
 


- --read-orientation-inward
 
 Indicates that all subsequent read libraries have the standard read orientation, with the paired ends facing inward.  This is the default.
 


- --read-orientation-outward
 
 Indicates that all subseqyent read libraries have reverse read orientation, with the paired ends facing outward.
 


The following options modify the entire assembly process.


- --min-contig-length
 
 Minimal output contig length (default \ ``300``\ ).
 


- --min-contig-cov
 
 Minimal output contig coverage (Default \ ``5``\ ).
 


- --trim
 
 If specified, the reads should be trimmed before assembly.
 


- --pilon-iter
 
 Number of pilon iterations (default \ ``2``\ ).
 


- --racon-iter
 
 Number of racon iterations (default <2>).
 


- --recipe
 
 Assembly recipe (\ ``auto``\ , \ ``full_spades``\ , \ ``fast``\ , \ ``miseq``\ , \ ``smart``\ , or \ ``kiki``\ ; default \ ``auto``\ ).
 


The following option specifies the contigs for the genome.  If this is specified, the above options relating to reads
should not be used.


- --contigs
 
 Input FASTA file of assembled contigs.  (If specified, all options relating to assembly will be ignored.  This is mutually exclusive with
 \ ``--paired-end-libs``\ , \ ``--single-end-libs``\ , and \ ``srr-ids``\ )
 


The following options describe the genome for the annotation process.


- --scientific-name
 
 Scientific name of genome to be annotated.
 


- --label
 
 Label to add to end of scientific name to form genome name.
 


- --taxonomy-id
 
 NCBI taxonomy identifier for the genome.
 


- --code
 
 Genetic code (\ ``4``\  or \ ``11``\ , default \ ``11``\ ).
 


- --domain
 
 Domain of the submitted genome (\ ``Archaea``\  or \ ``Bacteria``\ , default \ ``Bacteria``\ ).
 


The following options are provided for user assistance and debugging.


- --help
 
 Display the command-line usage and exit.
 


- --dry-run
 
 Display the JSON submission string and exit without invoking the service or uploading files.
 



