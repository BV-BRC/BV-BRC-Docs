# Pathways

## Overview
The Pathways Tab provides access to the Comparative Pathway Tool, which facilitates identification of sets of pathways based on taxonomy, EC number, pathway ID, pathway name and/or specific annotation type. The Comparative Pathway Tool displays a table of unique pathways that match the search criteria. From there, specific pathways of interest can be selected and viewed in a heatmap or KEGG map.

## See also
  * [omparing Pathways Across Genomes Tutorial
  * [Comparative Pathway Tool](../services/comparative_pathway_service.html)

## Accessing the Comparative Pathway Tool
The Comparative Pathway Tool can be accessed from either 

* **Clicking the Pathways Tab in a Taxon View:** Displays a list of all of the pathways that have any genes assigned to them from the genomes in that taxon level.

* **Launching the Comparative Pathway Service:** Displays a list of all of the pathways that have any genes assigned to them from the selected genomes.

### Pathway Table
Results will be shown in a Pathway table, shown below.
![Pathway Table](../images/pathway_list.png)

Pathways come from the Kyoto Encyclopedia of Genes and Genomes, commonly known as [KEGG](http://www.genome.jp/kegg/). The data in this table provides summary information regarding the pathways:

* **Pathway ID:** 5-digit identifier defined by KEGG

* **Pathway Name:** Name of the pathway provided by KEGG

* **Pathway Class:** Higher level grouping of pathways provided by KEGG

* **Unique Genome Count:** Total number of genomes that have some genes present in this pathway from the set of genomes chosen.

* **Unique Gene Count:** Total of number of unique genes that belong to this pathway from the set of genomes chosen. 

* **Unique EC Count:** The Enzyme Commission number (EC number) is a numerical classification scheme for enzymes, based on the chemical reactions they catalyze and in a given KEGG metabolic pathway, each step has an EC number assigned to it. In a given genome there may be several genes that have been assigned the same EC number, meaning that several different genes have the possibility of doing the same job. The unique EC count tells how many steps within the pathway have at least one gene behind them.

* **EC Conservation %:** For a single pathway (row), this number gives the percent of unique EC numbers present in all selected genomes. 100% describes a situation in which all unique EC numbers are present in all selected genomes. Smaller numbers indicate that there is one or more genomes are missing some EC numbers.

* **Gene Conservation:** A genome can have several genes that have been assigned the same EC number. Gene conservation provides an estimate of pathways where there might be redundancies, or where EC numbers are missing. Numbers greater than one mean that in at least one genome, there is more than one gene that has been assigned a particular EC number. Numbers less than one mean indicate that in at least one genome, a particular EC number is missing. This provides a quick way to see which pathways have perfect conservation across all genomes (Gene Conservation = 1) to those pathways where there are differences among the genomes. Users can then explore these differences by drilling down on either the Unique Gene Count, or the Unique EC Count.

### Pathway Table Tools
Within this table you may do the following:

* **Navigate** the results using the three options (Pathways, EC number, and Genes) at the top of the table to refactor the search results:
  * **"Pathways" option:** List of all of the unique pathways that have genes associated with the selected genomes. Counts of unique genomes, genes, and EC numbers are provided for each pathway. 
  * **"EC Numbers" option:** List of all of the pathways, broken down with a separate row for each corresponding unique EC number for that pathway.
  * **"Genes" option:** List of all of the pathways, broken down with a separate row for each corresponding unique gene for that pathway.

* **Rearrange and narrow** the list of pathways in the table via sorting (using column headers), filtering (using the Filters tool) and keywords (using the Keyword box).

* **Download** the entire contents of the table in CSV (Excel) format by clicking the Download button above the table on the left side.

After selecting on of the pathways by clicking the checkbox beside the Pathway ID in the table (in the Pathway option view), a set of options becomes available in the vertical green Action Bar on the right side of the table.  These include

* **Hide:** Toggles (hides) the right-hand side Details Pane.
* **Download:**  Downloads the selected items (rows).
* **Copy:** Copies the selected items to the clipboard.
* **ID Map:** Launches the ID mapping tool for the selected items. 
* **Pathway:** Launches a new page containing the pathways in which the genes from the selected pathways, EC numbers, or genes are found.
* **Map:** Launches the Pathway View (see below) for the selected pathway.
* **MSA:** Launches the MSA viewer with the alignment the nucleotide or amino acid sequences for the selected genes ("Genes" option only).

## Comparative Pathway Viewers
Selecting a pathway in the table and then clicking the **Map** button in the vertical green Action Bar on the right side of the table opens the Pathway View for that pathway. From this page there are two view options - **KEGG Map** and **Heatmap**.

### Comparative Pathway KEGG Map
![Pathway View - KEGG Map](../images/pathway_kegg_map.png)

In the KEGG Map view option, there are two regions, the EC Number table and the KEGG Map itself.

**EC Table:** This table, located to the left of the KEGG Map, lists the Enzyme Commission (EC) Numbers of the genes that are found across all the genomes and are present in that particular pathway.

* **EC Number:** The Enzyme Commission number.
* **Genome Count:** The number of genomes that are summarized in the pathway.
* **Feature Count:** The number of genes in the selection of genomes, or individual genome, that have the same EC number.
* **Genome Count Not Present** The number of genomes in the current selection that *do not* have a gene with this particular EC number.
* **Occurrence:** The number of times this EC number appears in this pathway.
* **Description:** (Hidden by default) The description (name) associated with the EC Number. To show this column, click the plus sign (+) in the top right corner of the table and check the box beside "Description."

Selecting a row in the the table causes the associated EC number to be highlighted in red within the KEGG Map.

**KEGG Map:** This is the KEGG map associated with the selected pathway.

* **Map Numbers:** The numbers in the boxes are EC numbers. These numbers are part of a numerical classification schema that has been developed for enzymes and the chemical reactions they catalyze.

* **Color Coding:** The box containing the EC number will be one of three colors: 
  * **Bright green:** A protein with this EC number has been annotated in all the genomes chosen.
  * **Muted green:** A protein with this EC number has been annotated in at least one, but not all, genomes chosen.
  * **White (no color):** The annotation did not identify a protein with that EC number.

* **Names Associated with EC numbers:** Scrolling over the box that contains the EC number will give the name of the EC number. 

* **Related Pathways:** Generally, an individual KEGG pathway will show different associated pathways that specific enzymes play a part in. These pathways are named
and are found on the KEGG Map in boxes with rounded corners. Clicking the link that appears when scrolling over one of these boxes will take you to that pathway. Alternatively, you could begin a new Comparative Pathway Tool search using the pathway name as a keyword in the initial search criteria.

### Comparative Pathway Heatmap
![Pathway View - Heatmap](../images/pathway_heatmap.png)
The Heatmap is an interactive visualization tool, which provides an overview of the distribution of genomes across the set of EC numbers within a selected pathway. Patterns visible in a Heatmap can allow for many types of analysis such as, a bird’s-eye view of the conservation (or lack thereof) of particular genes of interest, discerning how many
proteins have the same function within a single genome, and identifying proteins with multiple homologs or paralogs across a set of genomes.

**Color Coding:**  Each cell is colored according to how many proteins (features) from a
specific genome are assigned a particular EC number. 
* **Black:** No representative proteins from the genome assigned that EC number 
* **Bright yellow:** One representative protein
* **Dark yellow:** Two representative proteins
* **Dark orange:** Three or more representative genomes

**Features and Functionality**

* EC Numbers and Descriptions are listed along the Y (vertical) axis and corresponding Genomes are listed along the X (horizontal) axis. The scale of these rows and columns may be controlled by sliding the x and/or y slidebars located at the axis intersection in the upper left corner of the Heatmap. The "Flip Axis" button at the top left of the heatmap will swap the positions (horizontal or vertical) of the Genomes and EC Numbers.

* Each individual column or row within the Heatmap may be clicked and dragged to any specified position.

* The following options may be accessed from a pop-up widow by clicking on any individual colored cell, any EC label, or any Genome label within the Heatmap. The same information can be collected for a whole region of interest within the Heatmap by clicking and dragging to select a group of cells.

  * **Download Heatmap Data:** Shows the count of representative features from each genome assigned to each EC Number in either a text or excel file. Note: Clicking this button from an EC label will produce a file with the count for each genome assigned to that EC number, while clicking on this button from a Genome label will produce a file with the count for that particular genome in every EC number associated for this selected pathway.
        
  * **Download Proteins:** Downloads the set of features associated with the chosen proteins.  Download available as csv, txt, or Excel file.
        
  * **Show Proteins:** Opens a feature list table containing the features associated with the chosen proteins. This view contains the same information as any feature list: Genome Name, Genome ID, RefSeq Locus Tab, Gene Symbol, protein family information, Product, length, start/stop, etc. This view also allows access to sequences, enables building of multiple sequence alignments, map IDs, etc.
    
  * **Add Proteins to Group:** button will save selected items to new, or existing, groups within the Workspace. 
                
  * **Cancel:** Closes the pop-up window.
