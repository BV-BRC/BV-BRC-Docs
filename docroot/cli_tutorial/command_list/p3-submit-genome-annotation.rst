.. _cli::p3-submit-genome-annotation:


###########################
p3-submit-genome-annotation
###########################


*************************************
Submit a BV-BRC Genome Annotation Job
*************************************



.. code-block:: perl

     p3-submit-genome-annotation [options] output-path output-name


Submit a genome to the BV-BRC genome annotation service.


**************
Usage synopsis
**************



.. code-block:: perl

     p3-submit-genome-annotation [-h] output-path output-name
 
     Submit an annotation job with output written to output-path and named
     output-name.
 
         The following options describe the inputs to the annotation:
 
            --workspace-path-prefix STR   Prefix for workspace pathnames as given
                                to input parameters.
            --workspace-upload-path STR	 If local pathnames are given as library or
                            reference assembly parameters, upload the
                          files to this directory in the workspace.
                          Defaults to the output path.
            --overwrite			 If a file to be uploaded already exists in
                             the workspace, overwrite it on upload. Otherwise
                          we will not continue the service submission.
            --genbank-file FILE		 A genbank file to be annotated.
        --contigs FILE		 A file of DNA contigs to be annotated.
            --phage			 Set annotation defaults for phage annotation.
            --recipe NAME		 Use the given annotation recipe for this genome.
            --reference-genome GID	 The BV-BRC identifier of a reference genome
                               whose annotations will be propagated as
                      part of this annotation.
 
         The following options describe the genome to be annotated. In each case
     where the value for the specified option may be drawn from a submitted
     genbank file it is optional to supply the value. If a value is supplied,
     it will override the value in the genbank file.
 
            --scientific-name "Genus species strain"
                                   Scientific name for this genome.
        --taxonomy-id NUM		 Numeric NCBI taxonomy ID for this genome.
                          If not specified an estimate will be
                      computed, and if that is not possible the
                      catchall taxonomy ID 6666666 will be used.
        --genetic-code NUM		 Genetic code for this genome; either 11 or 4.
                           If not specified defaults to 11 unless it
                      can be determined from the declared or computed
                      taxonomy ID.
        --domain STR			 Domain for this genome (Bacteria or Archaea)
 
 
     Advanced options:
 
        --workflow-file STR		 Use the given workflow document to process
                            annotate this genome.
        --index-nowait		 Do not wait for indexing to complete before
                      the job is marked as complete.
        --no-index			 Do not index this genome. If this option
                         is selected the genome will not be visible
                      on the BV-BRC website.


