# Pathways

## Overview
The Pathways Tab displays the pathways associated with the selected set of genomes. which displays table that includes the Genome Name, RefSeq Locus Tag, BRC ID, Gene, Product, EC Description, Pathway ID, and Pathway Name. From this table, you can access additional information such as other genomes that contain the pathway and the KEGG map associated with the pathway.

## See also
  * [Comparative Systems Service](https://www.bv-brc.org/app/ComparativeSystems)
  * [Comparative Systems Service Tutorial](/tutorial/comparative_systems/comparative_systems)
  * [Pathway Comparison Tool Quick Reference Guide](/quick_references/other/pathway_comparison_tool)

## Pathway Table
Clicking on the Pathways Tab displays the Pathway table, shown below.
![Pathway Table](../images/pathways/pathway_table.png)

Pathways come from the Kyoto Encyclopedia of Genes and Genomes, commonly known as [KEGG](http://www.genome.jp/kegg/). The data in this table provides summary information regarding the pathways:

* **Genome Name:** Genome name(s) from selected set of genomes or taxonomy level

* **RefSeq Locus Tag:** Unique identifier assigned specific gene in the genome associated with the pathway within the NCBI Reference Sequence (RefSeq) database 

* **BRC ID:** BV-BRC identifier associated with the gene/feature

* **Gene:** Gene name, if available

* **Product:** the molecule or substance that is created as a result of a chemical reaction catalyzed by the enzyme 

* **EC Description** Type of enzyme

* **Pathway ID:** 5-digit identifier defined by KEGG

* **Pathway Name:** Name of the pathway provided by KEGG

* **Pathway Class:** Higher level grouping of pathways provided by KEGG


**Features and Functionality**

* EC Numbers and Descriptions are listed along the Y (vertical) axis and corresponding Genomes are listed along the X (horizontal) axis. The scale of these rows and columns may be controlled by sliding the x and/or y slidebars located at the axis intersection in the upper left corner of the Heatmap. The "Flip Axis" button at the top left of the heatmap will swap the positions (horizontal or vertical) of the Genomes and EC Numbers.

* Each individual column or row within the Heatmap may be clicked and dragged to any specified position.

* The following options may be accessed from a pop-up widow by clicking on any individual colored cell, any EC label, or any Genome label within the Heatmap. The same information can be collected for a whole region of interest within the Heatmap by clicking and dragging to select a group of cells.

  * **Download Heatmap Data:** Shows the count of representative features from each genome assigned to each EC Number in either a text or excel file. Note: Clicking this button from an EC label will produce a file with the count for each genome assigned to that EC number, while clicking on this button from a Genome label will produce a file with the count for that particular genome in every EC number associated for this selected pathway.
        
  * **Download Proteins:** Downloads the set of features associated with the chosen proteins.  Download available as csv, txt, or Excel file.
        
  * **Show Proteins:** Opens a feature list table containing the features associated with the chosen proteins. This view contains the same information as any feature list: Genome Name, Genome ID, RefSeq Locus Tab, Gene Symbol, protein family information, Product, length, start/stop, etc. This view also allows access to sequences, enables building of multiple sequence alignments, map IDs, etc.
    
  * **Add Proteins to Group:** button will save selected items to new, or existing, groups within the Workspace. 
                
  * **Cancel:** Closes the pop-up window.
