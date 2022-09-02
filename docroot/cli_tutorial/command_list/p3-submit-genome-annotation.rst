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


p3-submit-genome-annotation [-dfghnPpt] [long options...] output-path output-name
	Submit an annotation job with output written to output-path and named output-name.
	The output-path parameter is a BV-BRC workspace path.
	The output-name parameter is a name that will describe this annotation in the workspace.
	It may not contain slash (/) characters.


.. code-block:: perl

 	The following options describe the inputs to the annotation.
 	                                    
 	-p STR --workspace-path-prefix STR    Prefix for workspace pathnames
 	                                      as given to input parameters.
 	-P STR --workspace-upload-path STR    If local pathnames are given as
 	                                      genbank or contigs file
 	                                      parameters, upload the files to
 	                                      this directory in the
 	                                      workspace. Defaults to the
 	                                      output path.
 	-f --overwrite                        If a file to be uploaded
 	                                      already exists in the
 	                                      workspace, overwrite it on
 	                                      upload. Otherwise we will not
 	                                      continue the service submission.
 	--genbank-file STR                    A genbank file to be annotated.
 	--contigs-file STR                    A file of DNA contigs to be
 	                                      annotated.
 	--phage                               Set defaults for phage
 	                                      annotation.
 	--recipe STR                          Use the given non-default
 	                                      recipe for this annotation
 	--reference-genome STR                The BV-BRC identifier of a
 	                                      reference genome whose
 	                                      annotations will be propagated
 	                                      as part of this annotation.
 	--reference-virus STR                 The name of a virus from the
 	                                      VIGOR_DB collection to use as
 	                                      the reference for a vigor4
 	                                      viral annotation.
 	                                    
 	The following options describe the genome to be annotated.
 	In each case where the value for the specified option may be drawn
 	from a submitted genbank file it is optional to supply the value.
 	If a value is supplied, it will override the value in the genbank file.
 	                                    
 	-n STR --scientific-name STR          Scientific name for this genome.
 	-t INT --taxonomy-id INT              Numeric NCBI taxonomy ID for
 	                                      this genome. If not specified
 	                                      an estimate will be computed,
 	                                      and if that is not possible the
 	                                      catchall taxonomy ID 6666666
 	                                      will be used.
 	-g INT --genetic-code INT             Genetic code for this genome;
 	                                      either 11 or 4. If not
 	                                      specified defaults to 11 unless
 	                                      it can be determined from the
 	                                      declared or computed taxonomy
 	                                      ID.
 	-d STR --domain STR                   Domain for this genome
 	                                      (Bacteria or Archaea)
 	                                    
 	Advanced options:                   
 	                                    
 	--workflow-file STR                   Use the given workflow document
 	                                      to process annotate this genome.
 	--import-only                         Import this genome as is - do
 	                                      not reannotate gene calls or
 	                                      gene function. Only valid for
 	                                      genbank file input.
 	--raw-import-only                     Perform a raw import on this
 	                                      this genome - do not reannotate
 	                                      gene calls or gene function and
 	                                      perform a bare minimum of
 	                                      postprocessing. Only valid for
 	                                      genbank file input
 	--skip-contigs                        Do not load contigs data. Only
 	                                      valid for genbank file input.
 	--index-nowait                        Do not wait for indexing to
 	                                      complete before the job is
 	                                      marked as complete.
 	--no-index                            Do not index this genome. If
 	                                      this option is selected the
 	                                      genome will not be visible on
 	                                      the BV-BRC website.
 	--no-workspace-output                 Do not write any workspace
 	                                      output.
 	--dry-run                             Dry run. Upload files and
 	                                      validate input but do not
 	                                      submit annotation
 	                                    
 	-h --help                             Show this help message


