# Taxonomic Classification Service

## Overview
The Taxonomic Classification Service accepts reads or contigs from sequencing of a metagenomic sample and uses [Kraken 2](http://genomebiology.com/2014/15/3/R46) to assign the reads to taxonomic bins, providing an initial profile of the possible constituent organisms present in the sample.

### See also
  * [Taxonomic Classification Service](https://bv-brc.org/app/TaxonomicClassification)
  * [Taxonomic Classification Service Tutorial](../../tutorial/taxonomic_classification/taxonomic_classification.html)

/tutorial/taxonomic_classification/taxonomic_classification.html

## Using the Taxonomic Classification Service
The **Taxonomic Classification** submenu option under the **Services** main menu (Metagenomics category) opens the Taxonomic Classification input form (shown below). *Note: You must be logged into BV-BRC to use this service.*

![Taxonomic Classification Menu](../images/bv_services_menu.png)

## Options
![Taxonomic Classification Input Form](../images/taxonomic_classification_input_form_v2.png)

## Input File
This service is designed to process short reads. This can be via single read files, paired read files or the SRA run accession. 

## Sample Identifiers
The SAMPLE IDENTIFIER Field will auto populate with the file name. Edit the field by clicking into the text box. The text entered to this the SAMPLE IDENTIFER fields will be used throughout the output files for the service. This documentation refers to this field as a sample id.
### Paired read library
**Read File 1 & 2:**  Many paired read libraries are given as file pairs, with each file containing half of each read pair. Paired read files are expected to be sorted such that each read in a pair occurs in the same Nth position as its mate in their respective files. These files are specified as READ FILE 1 and READ FILE 2. For a given file pair, the selection of which file is READ 1 and which is READ 2 does not matter.

### Single read library
**Read File:** The fastq file containing the reads.

### SRA run accession
Allows direct upload of read files from the [NCBI Sequence Read Archive](https://www.ncbi.nlm.nih.gov/sra) to the ervice. Entering the SRR accession number and clicking the arrow will add the file to the selected libraries box for use in the assembly.

## Selected libraries
Read files placed here will be submited to the service.

## Parameters

### Algorithm

 * [Kraken 2](http://genomebiology.com/2014/15/3/R46) - Assigns taxonomic labels to metagenomic DNA sequences using exact alignmnet of k-mers. [Kraken 2 source code](https://ccb.jhu.edu/software/kraken2/)

### Database
Reference taxonomic database used by the algorithm.

* [Kraken2 Standard Database](https://ccb.jhu.edu/software/kraken2/index.shtml?t=manual#standard-kraken-2-database) - Standard Kraken 2 database containing distinct 31-mers, based on completed microbial genomes from NCBI.
* [BV-BRC Database]( https://github.com/DerrickWood/kraken2/wiki/Manual#custom-databases) - The default Kraken 2 database at BV-BRC includes the following:

    * archaea: RefSeq complete archaeal genomes/proteins

    * bacteria: RefSeq complete bacterial genomes/proteins

    * plasmid: RefSeq plasmid nucleotide/protein sequences

    * viral: RefSeq complete viral genomes/proteins

    * human: GRCh38 human genome/proteins

    * fungi: RefSeq complete fungal genomes/proteins

    * plant: RefSeq complete plant genomes/proteins

    * protozoa: RefSeq complete protozoan genomes/proteins

    * UniVec: NCBI-supplied database of vector, adapter, linker, and primer sequences that may be contaminating sequencing projects and/or assemblies

### Output Folder
The workspace folder where results will be placed.

### Output Name
Name used to uniquely identify results.

## Output Results
![Taxonomic Classification Output Files](../images/output_results.png)

The Taxonomic Classification Service generates several files that are deposited in the Private Workspace in the designated Output Folder. To reivThese include

### All Jobs Will Output
* **multiqc_report.html** - An interactive output report from [MultiQC]( https://multiqc.info/)
* **sample_key.csv** - An Excel compatible file displaying the user input SAMPLE IDENTIFIER used in the output files and the user input fille name.
* **SAMPLE IDENTIFIER_sankey.html** - A Sankey diagram for each sample named with sample identifier displays an overview of taxa at each domain level.

### Jobs With Multiple Samples Will Output
* **multi_sample_table** - An Excel compatible file of the data displayed in multisample_comparison.html
* **multisample_comparison.html** - An interactive chart displaying z-scores across multiple samples with heatmap style coloring.
* **multisample_krona.html** - Link to [Krona](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3190407/)-based interactive chart showing the taxonomic classification distribution for every sample in the analysis.
*  **summary_table.csv** An Excel compatible file with the Kraken2 summary statistics for each sample.

### Microbiome Analysis Jobs Will Output
* **alpha_diversity.csv** - An Excel compatible file of the data displayed in alpha_diversity.html
* **alpha_diversity.html** - A data table with the alpha diversity (Berger-parker, Shannon, Fisher's index, Simpson, statistics Simpson's Reciprocal Index) for each sample.
* **beta_diversity.csv** - An Excel compatible file of the data displayed in beta_stats_heatmap.html
* **beta_stats_heatmap.html** - A heatmap with diversity statistics between each sample

### Krona Chart
![Krona-based interactive Taxonomic Classification Chart](../images/krona_taxonomic_pie_chart.png)

This interactive chart provides a visual representation of the reads mapping to each taxon. Clicking on a taxon within the pie chart will provide a summary of the reads mapping to that specific selection on the upper right corner.

### MultiQC Report
### Sample Key
### Sankey Diagram
### Multiple Sample Comparison
### Multiple Sample Krona
### Sankey Diagram
### Alpha Diversity
### Beta Diversity Heatmap


### Action buttons
After selecting one of the output files by clicking it, a set of options becomes available in the vertical green Action Bar on the right side of the table.  These include

* **Hide/Show:** Toggles (hides) the right-hand side Details Pane.
* **Guide** Link to the corresponding Quick Reference Guide.
* **Download:**  Downloads the selected item.
* **View** Displays the content of the file, typically as plain text or rendered html, depending on filetype.
* **Delete** Deletes the file.
* **Rename** Allows renaming of the file.
* **Copy:** Copies the selected items to the clipboard.
* **Move** Allows moving of the file to another folder.

More details are available in the [Action Bar](../action_bar.html) Quick Reference Guide.

## References
 * Ondov BD, Bergman NH, and Phillippy AM. Interactive metagenomic visualization in a Web browser. BMC Bioinformatics. 2011 Sep 30; 12(1):385.
 * Maidak, Bonnie L., et al. "The RDP (ribosomal database project)." Nucleic acids research 25.1 (1997): 109-110.
 * Wood DE, Salzberg SL: Kraken: ultrafast metagenomic sequence classification using exact alignments. Genome Biology 2014, 15:R46.
 * Yilmaz P, Parfrey LW, Yarza P, Gerken J, Pruesse E, Quast C, Schweer T, Peplies J, Ludwig W, Glöckner FO. The SILVA and “All-species Living Tree Project (LTP)” taxonomic frameworks. Nucleic Acids Res. 2014; 42(Database issue):643–8.
 
 
