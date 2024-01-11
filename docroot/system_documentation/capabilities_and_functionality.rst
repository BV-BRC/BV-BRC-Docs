Capabilities And Functionality
===============================

This section describes the features of the website from the end-user’s perspective. These data and features are enabled, delivered, and updated through the system infrastructure and processes, described in the other sections of this documentation.

Data Type Pages/Tabs
---------------------

Primary data types in BV-BRC have dedicated data pages that contain dynamically generated content retrieved from the BV-BRC databases and queries to other external resources.

Source Code:

- Web UI: https://github.com/BV-BRC/bvbrc_website
- Page/Tab components: https://github.com/BV-BRC/bvbrc_website/tree/master/public/js/p3/widget
- CSS: https://github.com/BV-BRC/bvbrc_website/tree/master/public/js/p3/resources
- Git submodules/external dependencies for JS: https://github.com/BV-BRC/bvbrc_website/tree/master/public/js

`Taxonomy Overview Page <https://www.bv-brc.org/view/Taxonomy/1763#view_tab=overview>`_
###########################################################################################

From Overview tab: Provides summary information for all genomes within the selected taxon level, including links to reference and representative genomes, interactive graphical portrayal of genome counts by antimicrobial resistance by RIS value (Resistant, Susceptible, or Intermediate) and metadata category (Host Name, Disease, Isolation Country, and Genome Status). Provides links to recent PubMed articles relevant to the selected taxon.

Quick Reference Guide: https://www.bv-brc.org/docs/quick_references/organisms_taxon/overview.html

`Phylogeny Page <https://www.bv-brc.org/view/Taxonomy/1763#view_tab=phylogeny>`_
####################################################################################

From Phylogeny tab: Displays the interactive Phylogeny Viewer (described below), linked to the associated order-level tree for the selected taxonomy level.

Quick Reference Guide: https://www.bv-brc.org/docs/quick_references/organisms_taxon/phylogeny.html

`Taxonomy Page <https://www.bv-brc.org/view/Taxonomy/1763#view_tab=taxontree>`_
###################################################################################

From Taxonomy tab: Provides an interactive expandable/collapsible taxonomy tree browser based on the NCBI taxonomy, filtered to the user-selected taxonomy level. The page provides links back to the appropriate Taxonomy Overview Page for the selected taxonomy level. 

Quick Reference Guide: https://www.bv-brc.org/docs/quick_references/organisms_taxon/taxonomy.html

`Genomes Page <https://www.bv-brc.org/view/Taxonomy/77643#view_tab=genomes>`_
#################################################################################

From Genomes tab: Provides a list of genomes and sequences in the PATRIC database, filtered to the selected taxonomy level. Lists are filterable through an interactive metadata summary menu and by keyword. From this page, genomes and sequences can be selected and added to the user's workspace and downloaded in Excel or text format. Selected genomes can be viewed in the Genome Browser. The table containing the list is sortable and columns can be shown/hidden—this feature is true of all interactive tables in the PATRIC Website.

Quick Reference Guide: https://www.bv-brc.org/docs/quick_references/organisms_taxon/genomes.html

`AMR Phenotypes Page <https://www.bv-brc.org/view/Taxonomy/77643#view_tab=amr>`_
####################################################################################

From AMR Phenotypes tab: Provides a list of all genomes, by antibiotic AMR value, within the selected taxonomy level which have AMR values, either RIS or MIC (minimum inhibitory concentration), with associated metadata. In addition to the standard table features for genomes, links are provided to the associated Antibiotic Page in PATRIC for the selected genome/antibiotic item.

Quick Reference Guide: https://www.bv-brc.org/docs/quick_references/organisms_taxon/amr_phenotypes.html

`Sequences Page <https://www.bv-brc.org/view/Taxonomy/77643#view_tab=sequences>`_
#####################################################################################

From AMR Phenotypes tab: Provides a list of all sequences (chromosome, contig, plasmid) associated with the genomes within the selected taxonomy level. Additional metadata such as length, GC content, sequence type, and topology are provided. In addition to the standard table features for genomes, links are provided to the associated Feature List Page for features associated with the selected sequences. 

Quick Reference Guide: https://www.bv-brc.org/docs/quick_references/organisms_taxon/sequences.html

`Features Page <https://www.bv-brc.org/view/Taxonomy/77643#view_tab=features>`_
###################################################################################

From Features tab: Provides a list of features (CDS, source, repeat region, tRNA, pseudogene, rRNA, gene, and others) associated with genomes in the selected taxonomy level. From this page, the following functionality is available for selected features:

- download in Excel or text format
- list of corresponding genomes
- display FASTA DNA and Protein sequence
- interactive multiple sequence alignment
- ID mapping (see description below)
- interactive KEGG pathways (see Comparative Pathway Tool below)
- addition to the user's workspace as a group

Quick Reference Guide: https://www.bv-brc.org/docs/quick_references/organisms_taxon/proteins.html

`Specialty Genes Page <https://www.bv-brc.org/view/Taxonomy/77643#view_tab=specialtyGenes>`_
################################################################################################

From Specialty Genes tab: Provides Specialty Genes, i.e., genes that are of particular interest to the infectious disease researches, such as virulence factors, transporters, drug targets, antibiotic resistance genes, human homologs, and essential genes (see Specialty Genes section below). For selected genes, the same functionality is available as is for features in the Feature Page. 

Quick Reference Guide: https://www.bv-brc.org/docs/quick_references/organisms_taxon/specialty_genes.html

`Protein Families Page <https://www.bv-brc.org/view/Taxonomy/77643#view_tab=proteinFamilies>`_
##################################################################################################

From Protein Families tab: Displays the interactive Protein Family Sorter (described below), filtered to the selected taxonomy level.

Quick Reference Guide: https://www.bv-brc.org/docs/quick_references/organisms_taxon/protein_families.html

`Pathways Page <https://www.bv-brc.org/view/Taxonomy/77643#view_tab=pathways>`_
###################################################################################

From Pathways tab: Displays the interactive Comparative Pathway Tool (described below), filtered to the selected taxonomy level. 

Quick Reference Guide: https://www.bv-brc.org/docs/quick_references/organisms_taxon/pathways.html

`Transcriptomics Page <https://www.bv-brc.org/view/Taxonomy/77643#view_tab=transcriptomics>`_
##################################################################################################

From Transcriptomics tab: Provides access to and comparative tools for transcriptomics data curated (primarily) from NCBI’s GEO database. Users can also privately and securely upload and analyze their own unpublished gene expression data—generated by microarray or RNA-Seq technologies—and compare it with the other curated transcriptomics datasets in PATRIC. Functionality is summarized below.

Quick Reference Guide: https://www.bv-brc.org/docs/quick_references/organisms_gene/transcriptomics.html

`Interactions Page <https://www.bv-brc.org/view/Genome/83332.12#view_tab=interactions>`_
############################################################################################

From Interactions tab: Provides experimentally and computationally derived host-pathogen and protein-protein interactions (HPI/PPI) associated with the selected taxon level. The HPI/PPI data are collected from over 15 public repositories, including STRINGDB. Displays tabular and interaction network graph views (described below). 

Quick Reference Guide: https://www.bv-brc.org/docs/quick_references/organisms_taxon/interactions.html

Tools and Visualizations
------------------------

BV-BRC tools and visualizations are interactive components within the website that enable the user to search, retrieve, filter, compare, analyze, graphically portray, and otherwise reformat the presentation of data.  Some tools (e.g., Global Search) have all of the required code in the https://github.com/BV-BRC/bvbrc_website/blob/master/.gitmodules repo, and thus do not have a separate repo 

Global Search
##############

From top-right portion of website: Performs full-text searches within the PATRIC Solr database for the specified search terms and returns lists of pages with relevant information. Pre-filter data types are selectable, including Genomes, Genome Features, Specialty Genes, Taxa, Transcriptomics Experiments, and Antibiotics. Boolean operators and exact term match options are available.

| Quick Reference Guide: https://www.bv-brc.org/docs/quick_references/global_search.html
| Source Code: https://github.com/BV-BRC/bvbrc_website/blob/master/.gitmodules

`Host-Pathogen Interactions <http://www.bv-brc.org/portal/portal/patric/HPITool?cType=taxon&cId=&dm=>`_
###########################################################################################################

From the Graph option: Provides interactive, Cytoscape-based network visualization of experimentally confirmed and computationally derived protein-protein interactions that occur between host and bacterial proteins and proteins in the bacterium. Interaction data are collected data are collected from over 15 public repositories, including STRINGDB. Interactions can be selected at the taxon, genome, and feature levels.

| Quick Reference Guide: https://www.bv-brc.org/docs/quick_references/organisms_taxon/interactions.html
| Source Code: npm install: https://github.com/cytoscape/cytoscape.js

`Comparative Pathway Tool <https://www.bv-brc.org/app/ComparativePathway>`_
###############################################################################

Supports comparison of consistently annotated metabolic pathways across closely related or diverse groups of genomes and visualizes them using interactive KEGG maps and heatmaps. The heatmap view is an interactive visualization tool that provides an overview of the distribution of genomes across the set of EC numbers within a selected pathway.

| Quick Reference Guide: https://www.bv-brc.org/docs/quick_references/organisms_taxon/pathways.html
| Use Case / Tutorial: https://www.bv-brc.org/docs/tutorial/comparative_systems/comparative_systems.html
| Source Code: https://github.com/BV-BRC/bvbrc_website/blob/master/.gitmodules

`Genome Metadata <https://www.bv-brc.org/view/Taxonomy/2#view_tab=genomes>`_
################################################################################

From the Filter Tool in Genome Lists: Facilitates locating, sorting, and filtering genomes of interest based on various combinations of over 70 different metadata fields. For instance, all genomes that have been isolated from humans, genomes related by phylogeny, or genomes related by lifestyle. 

| Quick Reference Guide: https://www.bv-brc.org/docs/quick_references/organisms_taxon/genome_metadata.html
| Source Code: https://github.com/BV-BRC/bvbrc_website/tree/master/public/js/p3/widget

`Transcriptomics <https://www.bv-brc.org/view/Genome/83332.12#view_tab=transcriptomics>`_
##############################################################################################

From Transcriptomics tab: Provides tools for comparative analysis of transcriptomics data including metadata filters; filtering gene lists based on Log Ratio or Z-score cut-off, up/down regulation, or gene functions; using the Heatmap Viewer and clustering; viewing corresponding metabolic pathways; and finding positively or negatively correlated genes based on gene expression ratio.

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/organisms_taxon/transcriptomics.html
| Use Case / Tutorial: https://docs.bv-brc.org/tutorial/examining_transcriptomics_data/examining_transcriptomics_data.html
| Source Code: https://github.com/nconrad/heatmap

`Phylogeny Viewer <https://www.bv-brc.org/view/Taxonomy/1763#view_tab=phylogeny>`_
#####################################################################################

Allows exploration of phylogenetic relationships using species- and genus-level coloring schemes. BV-BRC's phylogeny viewer also supports custom creation of genome groups to be used as a basis for analysis in other BV-BRC tools.

| Quick Reference Guide: https://www.bv-brc.org/docs/quick_references/organisms_taxon/phylogeny.html
| Use Case / Tutorial: https://www.bv-brc.org/docs/tutorial/genetree/genetree.html
| Source Code: https://github.com/aswarren/phyloview

`Compare Region Viewer <https://www.bv-brc.org/view/Feature/PATRIC.83332.12.NC_000962.CDS.10484.10828.fwd#view_tab=compareRegionViewer>`_
#############################################################################################################################################

Allows comparison of genomic regions around a gene of interest across closely related genomes. Shows differences in translation start sites, potential frame shifts, or missing genes and facilitates visual identification of proteins with similar functions. 

| Quick Reference Guide: https://www.bv-brc.org/docs/quick_references/organisms_gene/compare_region_viewer.html
| Source Code: https://github.com/BV-BRC/bvbrc_website

`Genome Browser <https://www.bv-brc.org/view/Genome/83332.12#view_tab=browser&loc=NC_000962%3A1..100027&tracks=refseqs%2CPATRICGenes%2CRefSeqGenes&highlight=>`_
#####################################################################################################################################################################

Provides graphical portrayal of the alignment of genes and other genomic data (i.e., genome features) depicted along a central horizontal axis of genome coordinates. BV-BRC's genome browser supports comparison of genome annotations from multiple sources (e.g., BV-BRC, RefSeq, etc.). Users can upload their own custom tracks. 

| Quick Reference Guide: https://www.bv-brc.org/docs/quick_references/organisms_gene/genome_browser.html
| Source Code: https://github.com/GMOD/jbrowse

`Circular Genome Viewer <https://www.bv-brc.org/view/Genome/83332.12#view_tab=circular>`_
#############################################################################################

Portrays the genome in a circular map, showing genome annotations and sequence properties.  Provides tracks for chromosomes / plasmids / contigs, CDS (forward & reverse), RNAs, GC content, GC skew, and miscellaneous features, GC content and GC skew can be displayed as a line plot, histogram, or heatmap. Users can upload their own custom tracks. 

| Source Code: https://github.com/dmachi/circulus

Genome Alignment Viewer
########################

Available to view output from Genome Alignment Service. Uses Mauve to provide an interactive view of aligned genomes including deletions, insertions, and rearrangements.

Source Code: https://github.com/nconrad/mauve-viewer

Services
---------

PATRIC services provide simple, integrated access to computational software for processing and analysis of raw data and common data types. Access is provided via the Services top menu which displays a simple submission form for each service.  In order to use most of the services, the user must be logged in (denoted by “Login required” at the end of the descriptions below). This is required in order to accommodate user upload of their data and longer, more computationally intensive analyses on HPC machines. The results of the service are deposited in the user’s workspace.  A few of the services, such as BLAST, do not require login and instead render the results appropriately in the website.

Source Code:

- Submission forms: https://github.com/BV-BRC/bvbrc_website/tree/master/public/js/p3/widget/app
- Application Execution Service: https://github.com/PATRIC3/app_service

  - *Note: All of the standalone computational services are dependent on app_service.  For services below for which no other repos are listed (e.g., Variation Analysis, Metagenomic Read Mapping, Taxonomic Classification, Protein Family Sorter, Comparative Pathway, and ID Mapping) app_service includes all PATRIC code required for the service, plus possibly other third party command line tools.* 
- Also required for all services:

  - https://github.com/PATRIC3/dev_container
  - https://github.com/PATRIC3/p3_deployment
  - https://github.com/TheSEED/typecomp
  - https://github.com/olsonanl/p3_seed_server
  - https://github.com/PATRIC3/Workspace

`Genome Assembly Service <https://www.bv-brc.org/app/Assembly>`_
####################################################################

The Genome Assembly Service can be used to perform an automated genome assembly using the latest computational tools. Single or multiple assemblers can be invoked to compare results. The assembly service attempts to select the best assembly—i.e., assembly with the smallest number of contigs and the longest average contig length. Several assembly workflows or “recipes” are available. These workflows have been tuned and tested to fit certain data types or desired analysis criteria such as throughput or rigor. The assembly service’s flexible nature also enables the rapid design and emulation of other popular protocols. Login required.

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/services/genome_assembly_service.html
| Use Case / Tutorial: https://docs.bv-brc.org/tutorial/genome_assembly/assembly.html
| Source Code: https://github.com/PATRIC3/p3_assembly

`Genome Annotation Service <https://www.bv-brc.org/app/Annotation>`_
#########################################################################

The Genome Annotation Service is based on the RAST Toolkit (RASTtk). RASTtk is a modular extensible genome annotation system that provides mechanisms for identifying genomic features and annotating their functions. The RASTtk annotation engine uses a signature k-mer method to propagate annotations taken from the CoreSEED, a genome annotation system that has been central to the quality of the RAST annotations over the years. The CoreSEED curation process takes advantage of subsystems-based annotation to ensure high-quality, consistent annotations. RASTtk is fully defined at http://www.ncbi.nlm.nih.gov/pubmed/25666585. Links and instructions for downloading and installing RASTtk client code are included. The subsystems annotation method is described at http://nar.oxfordjournals.org/content/33/17/5691.full. Login required.

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/services/genome_annotation_service.html
| Use Case / Tutorial: https://docs.bv-brc.org/tutorial/genome_annotation/annotation.html
| Source Code: https://github.com/theseed/genome_annotation

`Comprehensive Genome Analysis Service <https://bv-brc.org/app/ComprehensiveGenomeAnalysis>`_
#################################################################################################

The Comprehensive Genome Analysis Service provides a streamlined analysis "meta-service" that accepts raw reads and performs a comprehensive analysis including assembly, annotation, identification of nearest neighbors, a basic comparative analysis that includes a subsystem summary, phylogenetic tree, and the features that distinguish the genome from its nearest neighbors. Login required.

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/services/comprehensive_genome_analysis_service.html
| Use Case / Tutorial: https://docs.bv-brc.org/tutorial/comprehensive-genome-analysis/comprehensive-genome-analysis.html
| Source Code: https://github.com/PATRIC3/app_service

`BLAST Service <https://bv-brc.org/app/BLAST>`_
###################################################

The PATRIC BLAST service integrates the BLAST (Basic Local Alignment Search Tool) algorithms to perform searches against public or private genomes in PATRIC or other reference databases using a DNA or protein sequence and find matching genomes, genes, RNAs, or proteins.

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/services/blast.html
| Use Case / Tutorial: https://docs.bv-brc.org/tutorial/blast/blast.html
| Source Code: https://github.com/PATRIC3/homology_service

`Similar Genome Finder <https://www.bv-brc.org/app/GenomeDistance>`_
########################################################################

The Similar Genome Finder Service will, for a user-selected genome or for an uploaded FASTA file, find the closest related public genomes (by sequence) in PATRIC using the MInHash algorithm to perform comparisons. Login required.

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/services/similar_genome_finder_service.html
| Use Case / Tutorial: https://docs.bv-brc.org/tutorial/similar_genome_finder/similar_genome_finder.html
| Source Code:

`Variation Analysis Service <https://www.bv-brc.org/app/Variation>`_
########################################################################

The Variation Service can be used to identify and annotate sequence variations using a variety of aligner and SNP calling programs. The service enables users to upload one or multiple short read samples and compare them to a closely related reference genome. For each sample, the service computes the variations against the reference and presents a detailed list of SNPs, MNPs, insertions and deletions with confidence scores and effects such as “synonymous mutation” and “frameshift”. High confidence variations are downloadable in the standard VCF format augmented by SNP annotation. A summary table illustrating how the variations are shared across the samples is also available. Login required.

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/services/variation_analysis_service.html
| Use Case / Tutorial: https://docs.bv-brc.org/tutorial/variation_analysis_service/variation_analysis_service.html
| Source Code: https://github.com/PATRIC3/app_service

`Tn-Seq Analysis Service <https://www.bv-brc.org/app/Tnseq>`_
################################################################

The Tn-Seq Analysis Service allows users to align reads and measure essentiality of their Tn-Seq data using the TRANSIT software. The results can be downloaded or viewed as alignments to the reference genome in the Genome Browser. The alignments are presented as a separate track in the Genome Browser along with annotated genes. Login required.

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/services/tn_seq_analysis_service.html
| Use Case / Tutorial: https://docs.bv-brc.org/tutorial/tn-seq/tn-seq.html
| Source Code: https://github.com/PATRIC3/p3_tnseq

`Phylogenetic Tree Service <https://www.bv-brc.org/app/PhylogeneticTree>`_
##############################################################################

The Phylogenetic Tree Service enables construction of custom phylogenetic trees for up to 50 user-selected genomes. The service builds trees using conserved protein sequences, which is the same methodology used to build the public genus-level phylogenetic trees in the PATRIC website. The service also provides an option for building a codon tree. Users can view or download a Newick file, or access the new tree in the interactive Phylogenetic Tree Viewer in PATRIC. Login required. 

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/services/phylogenetic_tree_building_service.html
| Use Case / Tutorial: https://docs.bv-brc.org/tutorial/phylogenetic_tree_building/tree_building.html, https://docs.bv-brc.org/tutorial/codon_tree_building/codon_tree_building.html
| Source Code: 

- Codon tree: https://github.com/PATRIC3/codon_trees
- Shared proteins: https://github.com/PATRIC3/pepr

`Genome Alignment Service <https://bv-brc.org/app/GenomeAlignment>`_
########################################################################

The Whole Genome Alignment Service aligns genomes using progressiveMauve to create whole genome alignments of up to 20 genomes. Login required.

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/services/genome_alignment_service.html
| Use Case / Tutorial: TBD
| Source Code: https://github.com/PATRIC3/p3_mauve

`Metagenomic Read Mapping Service <https://bv-brc.org/app/MetagenomicReadMapping>`_
#######################################################################################

The Metagenomic Read Mapping Service uses KMA to align reads against antibiotic resistance genes from CARD and virulence factors from VFDB. Login required.

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/services/metagenomic_read_mapping_service.html
| Use Case / Tutorial: https://docs.bv-brc.org/tutorial/metagenomic_read_mapping/metagenomic_read_mapping.html
| Source Code: https://github.com/PATRIC3/app_service

`Taxonomic Classification Service <https://bv-brc.org/app/TaxonomicClassification>`_
########################################################################################

The Taxonomic Classification Service accepts reads or contigs from sequencing of a metagenomic sample and uses Kraken 2 to assign the reads to taxonomic bins, providing an initial profile of the possible constituent organisms present in the sample. Login required.

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/services/taxonomic_classification_service.html
| Use Case / Tutorial: https://docs.bv-brc.org/tutorial/taxonomic_classification/taxonomic_classification.html
| Source Code: https://github.com/PATRIC3/app_service

`Metagenomic Binning Service <https://bv-brc.org/app/MetagenomeBinning>`_
#############################################################################

The Metagenomic Binning Service accepts either reads or contigs, and attempts to "bin" the data into a set of genomes. This service can be used to reconstruct bacterial and archael genomes from environmental samples. Login required.

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/services/metagenomic_binning_service.html
| Use Case / Tutorial: https://docs.bv-brc.org/tutorial/metagenomic_binning/metagenomic_binning.html
| Source Code: 

- https://github.com/SEEDtk/RASTtk
- https://github.com/SEEDtk/kernel
- https://github.com/SEEDtk/utils
- https://github.com/SEEDtk/tbltools
- https://github.com/SEEDtk/ERDB

`Expression Import Service <https://www.bv-brc.org/app/Expression>`_
########################################################################

The Expression Import Service allows users to upload differential expression data into their private workspace and compare it with other expression data available in PATRIC. The service supports gene expression, protein expression, and phenotype array data in the form of log ratios, generated by comparing samples, conditions, or time points. Login required.

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/services/expression_data_import_service.html
| Use Case / Tutorial: https://docs.bv-brc.org/tutorial/expression_import/expression_import.html
| Source Code: https://github.com/PATRIC3/p3diffexp

`RNA-Seq Analysis Service <https://www.bv-brc.org/app/Rnaseq>`_
###################################################################

The RNA-Seq Analysis Service provides tools for aligning, assembling, and testing differential expression on RNA-Seq data. Three recipes for processing RNA-Seq data are included: 1) Rockhopper, based on the popular Rockhopper tool for processing prokaryotic RNA-Seq data; 2) Tuxedo, based on the tuxedo suite of tools (i.e., Bowtie, Cufflinks, Cuffdiff); and 3) Host HISTAT2 for analyzing RNA-Seq datasets from host (human, mouse, etc.) in support of dual RNA-Seq. The service provides SAM/BAM output for alignment, tab delimited files profiling expression levels, and differential expression test results between conditions. Login required.

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/services/rna_seq_analysis_service.html
| Use Case / Tutorial: https://docs.bv-brc.org/tutorial/rna_seq_submission/submitting_rna_seq_job.html
| Source Code: https://github.com/aswarren/Prok-tuxedo

Included RNA-Seq tools:

- https://cs.wellesley.edu/~btjaden/Rockhopper/download.html
- https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
- https://sourceforge.net/projects/samstat/

`Protein Family Sorter Service <https://bv-brc.org/app/ProteinFamily>`_
###########################################################################

The Protein Family Sorter Service tool enables researchers to examine the distribution of protein families across a set of user-selected genomes. Results are displayed in a page showing all the families associated with the selected genomes, plus filter controls and an interactive heatmap.

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/services/protein_family_service.html
| Use Case / Tutorial: https://docs.bv-brc.org/tutorial/protein_family_sorter/protein_family_sorter.html
| Source Code: https://github.com/PATRIC3/app_service

`Proteome Comparison Service <https://www.bv-brc.org/app/SeqComparison>`_
############################################################################

The Proteome Comparison Service performs protein sequence-based genome comparison using bidirectional BLASTP. This service allows users to select up to 8 genomes (either public or private) and compare them to a user selected reference genome. The service also allows users to upload an external genome file in FASTA format for an additional comparison. The genome comparison result is displayed as an interactive circular genome view on the webpage. Both the SVG image and the bidirectional BLASTP comparison results can be downloaded. Login required.

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/services/proteome_comparison_service.html
| Use Case / Tutorial: https://docs.bv-brc.org/tutorial/proteome_comparison/proteome_comparison.html
| Source Code: https://github.com/PATRIC3/app_service

`Comparative Pathway Service <https://bv-brc.org/app/ComparativePathway>`_
##############################################################################

The Comparative Pathway Service allows users to identify a set of pathways based on taxonomy, EC number, pathway ID, pathway name and/or specific annotation type. 

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/services/comparative_pathway_service.html
| Use Case / Tutorial: https://docs.bv-brc.org/tutorial/comparative_pathways/comparative_pathways.html
| Source Code: https://github.com/PATRIC3/app_service

`Model Reconstruction Service <https://www.bv-brc.org/app/Reconstruct>`_
############################################################################

The Model Reconstruction Service allows users to construct their own metabolic model for any genome in PATRIC. The service includes support for model gap-filling, flux balance analysis, essential gene prediction, and export of models in SBML format. The service leverages capabilities of the ModelSEED (PMID: 20802497). Login required. 

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/services/model_reconstruction_service.html
| Use Case / Tutorial: https://docs.bv-brc.org/tutorial/metabolic_model_reconstruction/metabolic_model_reconstruction.html
| Source Code: https://github.com/ModelSEED/ProbModelSEED

`ID Mapper Service <https://www.bv-brc.org/app/IDMapper>`_
##############################################################

The ID Mapper Service allows users to map individual or sets of PATRIC identifiers to those from other prominent external databases, such as GenBank, RefSeq, EMBL, UniProt, KEGG, etc. Alternatively, users can start with a list of external database identifiers and map them to the corresponding PATRIC features. Login required.

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/services/id_mapper.html
| Use Case / Tutorial: https://docs.bv-brc.org/tutorial/id_mapper/id_mapper.html
| Source Code: https://github.com/PATRIC3/app_service

Project Information Pages
--------------------------

The information in these pages in the PATRIC website are maintained in a GitHub repository and delivered through the PATRIC Static Content management process, described below. These are available through the Help menu and other areas of the site.

PATRIC Quickstart Video
########################

From Help Menu: Short video that provides an overview of the PATRIC website and how to navigate through the site. 

Source Code: https://github.com/PATRIC3/p3_docs/blob/master/docroot/quickstart_video.md

`Quick Reference Guides <https://docs.bv-brc.org/user_guides/index.html>`_
##########################################################################

Contains complete listing of all user documentation. Quick Reference Guides are available for all major PATRIC features.

| Quick Reference Guide: https://docs.bv-brc.org/user_guides/index.html
| Source Code: https://github.com/PATRIC3/p3_docs/tree/master/docroot/user_guides

`Tutorials (Use Cases) <https://docs.bv-brc.org/tutorial/index.html>`_
###########################################################################

Provides print-friendly Use Case / Tutorials that explain step-by-step how to use key PATRIC features and tools using realistic biological research examples.

| Quick Reference Guide: https://docs.bv-brc.org/tutorial/index.html
| Source Code: https://github.com/PATRIC3/p3_docs/tree/master/docroot/tutorial

`Common Tasks <https://docs.bv-brc.org/common_tasks/>`_
###########################################################

Provides an overview with links to Quick Reference Guides and Tutorials, organized by common tasks in PATRIC.

Source Code: https://github.com/PATRIC3/p3_docs/tree/master/docroot/common_tasks

`CLI (Command Line Interface) Tutorial <https://docs.bv-brc.org/cli_tutorial/>`_
#####################################################################################

Provides installation instructions and links to reference information and tutorials for the PATRIC Command Line Interface.

Source Code: https://github.com/PATRIC3/p3_docs/tree/master/docroot/cli_tutorial

`Webinars <https://docs.bv-brc.org/webinar/>`_
##################################################

Provides information on upcoming webinars and links to previously recorded webinars. Videos of recorded webinars are hosted on PATRIC’s YouTube Channel.

Source Code: https://github.com/PATRIC3/p3_docs/tree/master/docroot/webinar

`Instructional Videos <https://docs.bv-brc.org/videos/>`_
#############################################################

Provides links to short videos that demonstrate how to perform common tasks in PATRIC. The videos are hosted on PATRIC’s YouTube Channel.

Source Code: https://github.com/PATRIC3/p3_docs/tree/master/docroot/videos

`PATRIC Workshops <https://docs.bv-brc.org/website/workshops.html>`_
########################################################################

Provides listing of all past PATRIC workshops and links to registration information for upcoming workshops. 

Source Code: https://github.com/PATRIC3/p3_docs/blob/master/docroot/workshops.rst

`Contact Us <https://docs.bv-brc.org/contact.html>`_
########################################################

Provides information on how to get in contact with the PATRIC team.

Source Code: https://github.com/PATRIC3/p3_docs/blob/master/docroot/contact.md

Provide Feedback
#################

From the Help Menu: Provides a feedback form that generates a ticket in the PATRIC Jira user issue tracking system. 

Source Code: https://github.com/BV-BRC/bvbrc_website

`News <https://docs.bv-brc.org/news/>`_
###########################################

Listing of all recent and past PATRIC news items.  

Source Code: https://github.com/PATRIC3/p3_docs/tree/master/docroot/news

`Publications <https://docs.bv-brc.org/website/publications.html>`_
#######################################################################

Provides listing of all publications developed in whole or in part through the PATRIC project, with links to the publications themselves. 

Source Code: https://github.com/PATRIC3/p3_docs/blob/master/docroot/publications.md

`Workshops <https://docs.bv-brc.org/website/workshops.html>`_
#################################################################

Provides listing of all past PATRIC workshops and links to registration information for upcoming workshops.

Source Code: https://github.com/PATRIC3/p3_docs/blob/master/docroot/workshops.rst

`Presentations <https://docs.bv-brc.org/website/presentations.html>`_
#########################################################################

Provides listing of all past PATRIC external presentations. 

Source Code: https://github.com/PATRIC3/p3_docs/blob/master/docroot/presentations.rst

`Usage Metrics <https://docs.bv-brc.org/website/usage_metrics.html>`_
##########################################################################

Provides summary metrics for website traffic, analysis service usage, citations to the PATRIC resource, and other similar information. 

Source Code: https://github.com/PATRIC3/p3_docs/blob/master/docroot/usage_metrics.md

`About PATRIC <https://docs.bv-brc.org/website/about.html>`_
################################################################

Provides general information about the PATRIC project, its scope, funding, and project team. 

Source Code: https://github.com/PATRIC3/p3_docs/blob/master/docroot/about.md

`Cite PATRIC <https://docs.bv-brc.org/website/cite_patric.html>`_
######################################################################

Provides reference information for citing PATRIC and a link to the full article at PubMed Central. 

Source Code: https://github.com/PATRIC3/p3_docs/blob/master/docroot/cite_patric.md

`Scientific Working Group (SWG) <https://docs.bv-brc.org/website/swg.html>`_
#########################################################################################

Provides listing of the PATRIC SWG members and their institutional affiliations. 

Source Code: https://github.com/PATRIC3/p3_docs/blob/master/docroot/scientific_working_group.rst

`Personnel <https://docs.bv-brc.org/website/personnel.html>`_
#################################################################

Provides listing of PATRIC team personnel. 

Source Code: https://github.com/PATRIC3/p3_docs/blob/master/docroot/personnel.rst

`Scientific Collaborations <https://docs.bv-brc.org/acknowledgements.html>`_
#####################################################################################

Provides listing of PATRIC key collaborators, data sources, and software tools used, with appropriate links.

Source Code: https://github.com/PATRIC3/p3_docs/blob/master/docroot/collaborations.md

`Related Sites <https://docs.bv-brc.org/website/related_sites.html>`_
##########################################################################

Provides links to resources of relevance to PATRIC. 

Source Code: https://github.com/PATRIC3/p3_docs/blob/master/docroot/related_sites.md

`System Documentation <https://docs.bv-brc.org/system_documentation.html>`_
################################################################################

Link to the PATRIC GitHub code repository, including architectural and system descriptions. 

Source Code: https://github.com/PATRIC3/p3_docs/tree/master/docroot/system_documentation

`PATRIC GitHub <https://github.com/patric3>`_
###############################################

Link to PATRIC source code repository. 

Source Code: https://github.com/PATRIC3/p3_docs/blob/master/docroot/github.rst

`System Status <https://www.bv-brc.org/status>`_
####################################################

Provides listing of current status (operational, down) of key backend services. This can be helpful for PATRIC developers and users if there appears to be a problem with some part the site. 

Source Code: https://github.com/BV-BRC/bvbrc_website
