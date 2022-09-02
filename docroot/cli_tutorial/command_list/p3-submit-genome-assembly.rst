.. _cli::p3-submit-genome-assembly:


#########################
p3-submit-genome-assembly
#########################


***********************************
Submit a PATRIC Genome Assembly Job
***********************************



.. code-block:: perl

     p3-submit-genome-assembly [options] output-path output-name


Submit a set of one or more read libraries to the PATRIC genome assembly service.


**************
Usage synopsis
**************



.. code-block:: perl

     p3-submit-genome-assembly [-h] output-path output-name
 
     Submit an assembly job with output written to output-path and named
     output-name.
 
     The following options describe the inputs to the assembly:
 
     --workspace-path-prefix STR   Prefix for workspace pathnames as given
 			          to library parameters.
     --workspace-upload-path STR	 If local pathnames are given as library parameters,
 			    	 upload the files to this directory in the workspace.
 			 
     --overwrite			 If a file to be uploaded already exists in
 				 the workspace, overwrite it on upload. Otherwise
 				 we will not continue the service submission.
     --paired-end-lib P1 P2	 A paired end read library. May be repeated.
     --interleaved-lib LIB	 An interleaved paired end read library. May be repeated.
     --single-end-lib LIB	 A single end read library. May be repeated.
     --srr-id STR		 Sequence Read Archive Run ID. May be repeated.
 
     The following options describe the processing requested:
 
     --recipe                      Assembly recipe. Defaults to auto.
 				  Valid values are auto, unicycler, canu,
 			          spades, meta-spades, plasmid-spades, single-cell
     --trim-reads		  Trim reads before assembly
     --racon-iter		  Number of racon polishing iterations (for long reads)
     --pilon-iter		  Number of pilon polishing iterations (for short reads)
     --min-contig-len		  Filter out short contigs in the final assembly.
     --min-contig-cov		  Filter out contigs with low read depth
 				  in the final assembly.
     --genome-size		  Estimated genome size (for canu)
 
     The following options describe the read libraries:
 
     --platform STR		 The sequencing platform for the next read
 				 library or libraries. Valid values are
 				 infer, illumina, pacbio, nanopore, iontorrent
     --read-orientation-inward	 The reads in the next read library face inward (defaults to true)
     --read-orientation-outward	 The reads in the next read library face outward (defaults to false)


