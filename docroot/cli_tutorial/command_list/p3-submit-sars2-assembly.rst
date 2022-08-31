.. _cli::p3-submit-sars2-assembly:


########################
p3-submit-sars2-assembly
########################


***************************************
Submit a PATRIC SARS-CoV-2 Assembly Job
***************************************



.. code-block:: perl

     p3-submit-sars2-assembly [options] output-path output-name


Submit a set of one or more read libraries to the PATRIC SARS-CoV-2 assembly service.


**************
Usage synopsis
**************



.. code-block:: perl

     p3-submit-sars2-assembly [-h] output-path output-name
 
 	Submit an assembly job with output written to output-path and named
 	output-name.    
 
     	The following options describe the inputs to the assembly:
 
            --workspace-path-prefix STR   Prefix for workspace pathnames as given
     	   			   	 to library parameters.
            --workspace-upload-path STR	 If local pathnames are given as library parameters,
     					 upload the
     					 files to this directory in the workspace.
            --overwrite			 If a file to be uploaded already exists in
     	   				 the workspace, overwrite it on upload. Otherwise
     					 we will not continue the service submission.
     	   --paired-end-lib P1 P2	 A paired end read library. May be repeated.
            --single-end-lib LIB	 	 A single end read library. May be repeated.
 	   --srr-id STR		 	 Sequence Read Archive Run ID. May be repeated.
 
     	The following options describe the processing requested:
 
            --recipe                      Assembly recipe. Defaults to auto.
 	   				 Valid values are cdc-nanopore, cdc-illumina, or artic-nanopore
            --container-id		 (Internal) Use the specified container to run this application
 
     The following options describe the read libraries:
 	
            --platform STR		 The sequencing platform for the next read 
     					 library or libraries. Valid values are
 					 infer, illumina, pacbio, nanopore, iontorrent


