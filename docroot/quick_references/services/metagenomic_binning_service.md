# Metagenomic Binning Service

## Overview
The Metagenomic Binning Service accepts either reads or contigs, and attempts to "bin" the data into a set of genomes. This service can be used to reconstruct bacterial and archael genomes from environmental samples.

### See also
* [Metagenomic Binning Service](https://bv-brc.org/app/MetagenomicBinning)
* [Metagenomic Binning Service Tutorial](../../tutorial/metagenomic_binning/metagenomic_binning.html)

## Using the Metagenomic Binning Service
The **Metagenomic Binning** submenu option under the **Services** main menu (Genomics category) opens the Metagenomic Binning Service input form (*shown below*). *Note: You must be logged into BV-BRC to use this service.*

![Metagenomic Binning Menu](../images/bv_services_menu.png)

## Options

## Start With
The service supports input of read files or assembled contigs. This selection changes the options in the Input File box on the form. 

### Read File Option
![Metagenomic Binning Input Form](../images/metagenomic_binning_input_form_reads.png) 

### Assembled Contigs Option
![Metagenomic Binning Input Form](../images/metagenomic_binning_input_form_contigs.png) 

## Input File
The Input File box options depend on whether Read File or Assembled Contigs is chosen in the Start With box. 

### Read File Option
Multiple read types can be uploaded and submitted to the service. Clicking the arrow beside each one after uploading the file moves it to the Selected Libraries box, which will all be included when the service is run.

#### Paired Read Library - Read File 1 & 2
Many paired read libraries are given as file pairs, with each file containing half of each read pair. Paired read files are expected to be sorted such that each read in a pair occurs in the same Nth position as its mate in their respective files. These files are specified as READ FILE 1 and READ FILE 2. For a given file pair, the selection of which file is READ 1 and which is READ 2 does not matter.

#### Single Read Library
This option allows upload of a fastq file that contains single reads.

#### SRR Run Accession
This option allows upload of existing read data at the NCBI Sequence Read Archive (SRA) by entering the SRR Run Accession number. 

### Assembled Contigs Option

#### Contigs
Alternatively, contigs can be uploaded and used with the service instead of read files.

## Parameters

### Assembly Strategy
3 options are available for read assembly:

* **MetaSpades [1]** - part of the SPAdes toolkit, developed to address the various challenges of metagenomic assembly. 

### Parameters





### Output Folder
The workspace folder where results will be placed.

### Output Name
Name used to uniquely identify results.

### Genome Group Name
Name used to create genome group with identified genomes.

## Output Results
![Metagenomic Binning Service Output Files](../images/metagenomic_binning_result.png) 

The Metagenomic Binning Service generates several files that are deposited in the Private Workspace in the designated Output Folder. These include

* **BinningReport.html** - Document containing the list of bins and other summary information. Double-clicking on this file to display it.
![Metagenomic Binning Report](../images/metagenomic_binning_report.png) 
* **bin.#.####** - Annotation job result of bin number #.
* **bin.#.####.fa** - a FASTA file containing the bin’s contigs for bin number #.

## References
1. Parrello, B., Butler, R., Chlenski, P., Pusch, G. D. & Overbeek, R. Supervised extraction of near-complete genomes from metagenomic samples: A new service in PATRIC. Plos one 16, e0250092 (2021).
2. Nurk, S., Meleshko, D., Korobeynikov, A. & Pevzner, P. A. metaSPAdes: a new versatile metagenomic assembler. Genome research 27, 824-834 (2017)
3. Li, D. et al. MEGAHIT v1. 0: a fast and scalable metagenome assembler driven by advanced methodologies and community practices. Methods 102, 3-11 (2016).