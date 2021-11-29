# Protein Structure Data

## Overview
Protein structure data allows users to search for 3D protein structure files obtained from the [Protein Data Bank (PDB)](https://www.rcsb.org/). Protein(s) are associated with each PDB file UniProt database. One protein structure can be assigned to multiple GenBank protein records.

### See also
* Protein Structure Tutorial

## Accessing Protein Structure data

Protein structure data can be accessed through multiple routes in the BV-BRC: 

1\. Specifically searching for protein structure data by selecting "Protein Structures" as the Data Type from the Global Search bar.

![Figure 1](./images/structures_Picture1.png "Figure 1")

2\. Selecting “Protein Structures” data type from the search results (red arrow) after performing search using a relevant keyword in the Global Search bar. 

![Figure 3](./images/structures_Picture3.png "Figure 3")

3\. Selecting "Protein Structures" from the Advanced Search under the “SEARCHES” menu. 

![Figure 2](./images/structures_Picture2.png "Figure 2")

4\. Selecting the “Protein Structures” tab when browsing data for a specific organism.  

![Figure 4](./images/structures_Picture4.png "Figure 4")

## Protein Structure List View and Metadata Definitions

Protein structure results are presented in tabular format in BV-BRC as shown below. 

![Figure 5](./images/structures_Picture5.png "Figure 5")

Several metadata fields are associated with protein structure records. Visible metadata columns can be customized by clicking on the “+” sign at the top right corner of the table, as shown below.  

![Figure 6](./images/structures_Picture6.png "Figure 6")

Below is a list of available metadata fields (columns) and their definitions. 

**PDB ID:** The protein data bank identification number for the structure. 

**Title:** The descriptive name of the protein structure. 

**Organism Name:** The scientific name of the organism. 

**Taxon ID:** The NCBI Taxonomy ID number of the organism.

**Taxon Lineage IDs:** The taxonomic hierarchical classification lineage of the source organism; numerical ID. 

**Taxon Lineage Names:** The taxonomic hierarchical classification lineage of the source organism; descriptive name. 

**Genome ID:** The internal BV-BRC identification given to the sequence. 

**UniProtKB Accession:** The identifier for the UniProtKB entries.

**Gene:** The gene name. 

**Product:** The gene’s protein product name. 

**Sequence MD5:** The protein MD5 checksum. 

**Sequence:** The amino acid sequence of the relevant protein structure. 

**Alignments:** The coordinates (start and end positions) of the alignment of the pdb sequence with the corresponding UniProt sequence.

**Method:** The experimental method used to determine the protein structure. 

**Resolution:** The measure of the quality of the data that has been collected on the structure.

**PMID:** The NCBI’s PubMed ID associated with the publication describing the structure (if applicable). 

**Institution:** The institute associated with the protein structure record submission. 

**Authors:** The authors associated with the protein structure record submission.

**Release Date:** The publication date of the protein structure record. 

Users who wish to further filter results can do so by clicking the “FILTERS” icon (red arrow) and selecting the desired criteria as shown below.   

![Figure 7](./images/structures_Picture7.png "Figure 7")

Users may also customize the filters bar by clicking on the gear icon at the top right corner of the page. 

![Figure 8](./images/structures_Picture8.png "Figure 8")

## Action buttons

After selecting one of the output files by clicking it, a set of options becomes available in the vertical green “Action Bar” on the right side of the table. These include:

* **Hide/Show:** Toggles (hides) the right-hand side Details Pane.
* **Guide:** Links to the corresponding Quick Reference guide.
* **Download:** Downloads the selected item.
* **Copy:** Copies the selected items to the clipboard.
* **Feature:** Displays the Feature Page for the selected feature. Available only if a single feature is selected.
* **Genome:** Displays the Genome View Overview page corresponding to the selected genome/feature. Available only if a single feature is selected.
* **Structure:** Displays the Protein Structure View Overview page corresponding to the selected genome/feature. Available only if a single feature is selected.  

More details are available in the [Selection Action Bar](../action_bar.html) Quick Reference.