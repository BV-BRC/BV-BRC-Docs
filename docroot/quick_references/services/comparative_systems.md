# Comparative Systems Service

## Overview
The Comparative Systems Service allows users to identify a set of pathways, subsystems, and protein families for a set of genomes or genome groups. It combines together functionality from three different tools and data from the legacy PATRIC system: the **Protein Family Sorter**, **Pathway Comparison Tool**, and **Subsystems Data**.

### See also
  * [Comparative Systems Service](https://www.bv-brc.org/app/ComparativeSystems)
  * [Comparative Systems Service Tutorial](../../tutorial/comparative_systems/comparative_systems.html)

## Using the Comparative Systems Service
The **Comparative Systems** submenu option under the **Services** main menu (Genomics category) opens the Comparative Systems input form (shown below). *Note: You must be logged into BV-BRC to use this service.*

![Comparative Systems Menu](../images/bv_services_menu.png)

## Options
![Comparative Systems Input Form](../images/comparative_systems_input_form.png)

## Select Genome
The service can accept selected genomes and genome groups. To include any genome (reference, representative, other public, or private genomes), click on the filter icon in the text box in the "Select Genome" box to narrow the selection and deselect the categories that are not of interest. Typing in the text box will display a list of matching genomes. Clicking on the genome name selects it, and clicking on the arrow icon in the top right of the box adds it to the "Selected Genomes" list. Multiple genomes can be added.

## Select Genome Group
To include a genome group in the analysis, click on the down arrow in the text box in the "Select Genome Group" box. This will display a list of all the genome groups, with the most recently created appearing at the top of the list. Selecting a group and clicking on the arrow icon in the top right of the box adds it to the "Selected Genomes" list. Multiple genome groups can be added.

## Selected Genomes
This box displays the list of all of the genomes and/or genome groups selected to be included in the analysis.

## Parameters
* **Output folder** - The workspace folder where results will be placed.
* **Output name** - A user-specified label. This name will appear in the workspace when the annotation job is complete.

## Buttons
* **Reset** - clears the form and resets all default values
* **Submit** - Submits the analysis service job. This button is only enabled after all required fields and settings in the form are completed.

## Output Results
![Comparative Systems Output Files](../images/comparative_systems_result.png) 

The Comparative Systems Service generates several files that are deposited in the Private Workspace in the designated Output Folder. These include

* **BinningReport.html** - Document containing the list of bins and other summary information. Double-clicking on this file to display it.
![Metagenomic Binning Report](../images/metagenomic_binning_report.png) 
* **bin.#.####** - Annotation job result of bin number #.
* **bin.#.####.fa** - a FASTA file containing the bin’s contigs for bin number #.

## References
1. Parrello, B., Butler, R., Chlenski, P., Pusch, G. D. & Overbeek, R. Supervised extraction of near-complete genomes from metagenomic samples:






