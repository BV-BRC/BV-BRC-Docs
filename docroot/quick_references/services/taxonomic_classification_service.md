# Taxonomic Classification Service

## Overview
The Taxonomic Classification Service accepts reads or contigs from sequencing of a metagenomic sample and uses [Kraken 2](http://genomebiology.com/2014/15/3/R46) to assign the reads to taxonomic bins, providing an initial profile of the possible constituent organisms present in the sample.

## See also
  * [Taxonomic Classification Service](https://bv-brc.org/app/TaxonomicClassification)
  * [Taxonomic Classification Service Tutorial](../../tutorial/taxonomic_classification/taxonomic_classification.html)

/tutorial/taxonomic_classification/taxonomic_classification.html

## Using the Taxonomic Classification Service
The **Taxonomic Classification** submenu option under the **Services** main menu (Metagenomics category) opens the Taxonomic Classification input form (shown below). *Note: You must be logged into BV-BRC to use this service.*

![Taxonomic Classification Menu](../images/bv_services_menu.png)

## Options
![Taxonomic Classification Input Form](../images/taxonomic_classification_input_form_v2.png)

## Start With
The service can accept either read files or assembled contigs. If the "Read File" option is selected, the form will provide controls to allow input of read files or SRA accession numbers.  If the "Assembled Contigs" option is selected, the form will change to allow input of a contig file.   

## Input File
Depending on the option chosen above (Read File or Assembled Contigs), the Input File section will request read files or assembled contigs, respectively.

### Paired read library
**Read File 1 & 2:**  Many paired read libraries are given as file pairs, with each file containing half of each read pair. Paired read files are expected to be sorted such that each read in a pair occurs in the same Nth position as its mate in their respective files. These files are specified as READ FILE 1 and READ FILE 2. For a given file pair, the selection of which file is READ 1 and which is READ 2 does not matter.

### Single read library
**Read File:** The fastq file containing the reads.

### SRA run accession
Allows direct upload of read files from the [NCBI Sequence Read Archive](https://www.ncbi.nlm.nih.gov/sra) to the ervice. Entering the SRR accession number and clicking the arrow will add the file to the selected libraries box for use in the assembly.

## Selected libraries
Read files placed here will contribute to a single assembly.

## Parameters

### Algorithm

 * [Kraken 2](http://genomebiology.com/2014/15/3/R46) - Assigns taxonomic labels to metagenomic DNA sequences using exact alignmnet of k-mers. [Kraken 2 source code](https://ccb.jhu.edu/software/kraken2/)

### Database
Reference taxonomic database used by the algorithm.

* [All genomes](https://github.com/DerrickWood/kraken2/wiki/Manual#custom-databases) - The default Kraken 2 database at BV-BRC includes the following:

  - archaea: RefSeq complete archaeal genomes/proteins
  - bacteria: RefSeq complete bacterial genomes/proteins
  - plasmid: RefSeq plasmid nucleotide/protein sequences
  - viral: RefSeq complete viral genomes/proteins
  - human: GRCh38 human genome/proteins
  - fungi: RefSeq complete fungal genomes/proteins
  - plant: RefSeq complete plant genomes/proteins
  - protozoa: RefSeq complete protozoan genomes/proteins
  - UniVec: NCBI-supplied database of vector, adapter, linker, and primer sequences that may be contaminating sequencing projects and/or assemblies

* [RDP (SSU rRNA)](https://academic.oup.com/nar/article/25/1/109/1083216) - The Ribosomal Database Project (RDP), a naïve Bayesian-based classification for bacterial 16S rRNA sequences.
* [SILVA (SSU rRNA)](https://doi.org/10.1093/nar/gkt1209) - Comprehensive database of aligned ribosomal RNA (rRNA) gene sequences from the Bacteria, Archaea and Eukaryota domains and supplementary online services. 

### Output Folder
The workspace folder where results will be placed.

### Output Name
Name used to uniquely identify results.

## Output Results
![Taxonomic Classification Output Files](../images/taxonomic_classification_output_files_v2.png)

The Taxonomic Classification Service generates several files that are deposited in the Private Workspace in the designated Output Folder. To reivThese include

 * **TaxonomicReport.html** - A web-browser-friendly report that summarizes the results of the service (see description and image below)
 * **chart.html** - Link to [Krona](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3190407/)-based interactive chart showing the taxonomic classification distribution (see image below)
 * **classified_1.fastq.gz** - reads that were classified by Kraken 2 *(only if Save Classified Sequences option is chosen)*
 * **classified_2.fastq.gz** - reads that were classified by Kraken 2 *(only if Save Classified Sequences option is chosen)*
 * **full_report.txt** - Full Kraken 2 report; includes zero counts (see [Kraken 2 Output Formats](https://ccb.jhu.edu/software/kraken2/index.shtml?t=manual#output-formats))
 * **output.txt.gz** - Per-read Kraken 2 output file
 * **report.txt** - Kraken 2 report; suppresses zero counts
 * **unclassified_1.fastq.gz** - reads that were not classified by Kraken 2 *(only if Save Unclassified Sequences option is chosen)*
 * **unclassified_2.fastq.gz** - reads that were not classified by Kraken 2 *(only if Save Unclassified Sequences option is chosen)*

### Taxonomic Report Output
![Kraken 2 Taxonomic Classification Report](../images/taxonomic_classification_report.png)

This page is a web-friendly report that summarizes the output of Kraken 2. It provides a link to the input data, an interactive chart view (see description below), and a summary table of the top hits.  The columns in the table are as follows: 

* Pct Coverage - Percentage of fragments covered by the clade rooted at this taxon
* Frags in Clade - Number of fragments covered by the clade rooted at this taxon
* Frags in Taxon - Number of fragments assigned directly to this taxon
* Rank - A rank code, indicating (U)nclassified, (R)oot, (D)omain, (K)ingdom, (P)hylum, (C)lass, (O)rder, (F)amily, (G)enus, or (S)pecies. Taxa that are not at any of these 10 ranks have a rank code that is formed by using the rank code of the closest ancestor rank with a number indicating the distance from that rank.  E.g., "G2" is a rank code indicating a taxon is between genus and species and the grandparent taxon is at the genus rank.
* NCBI Taxon ID - NCBI taxonomic ID number
* Scientific Name - Indented scientific name. Clicking on one of these names will display the corresponding taxon page in the website.

### Taxonomic Chart
![Krona-based interactive Taxonomic Classification Chart](../images/krona_taxonomic_pie_chart.png)

This interactive chart provides a visual representation of the reads mapping to each taxon. Clicking on a taxon within the pie chart will provide a summary of the reads mapping to that specific selection on the upper right corner.

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
 
 
