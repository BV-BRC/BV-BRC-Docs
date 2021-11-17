# Phylogenetic Tree (Gene Tree) Service

## Overview
The BV-BRC Phylogenetic Tree Building Service enables construction of custom phylogenetic trees built from user-selected genomes, genes, or proteins. Trees can be built based on either nucleotide or protein input sequences. The "FastTree" option computes large minimum evolution trees with profiles instead of a distance matrix. [1,2]. We also offer two maximum likelihood tree building algorithms: PhyML [3] and RaxML [4]. User-defined settings are required for either. PhyML and RaxML infer a more evolutionarily accurate phylogenetic topology by applying a substitution model to the nucleotide sequences. This algorithm is best applied to datasets containing: 
1) fewer than 100 very long sequences, and
2) between 100 and 1,000 small or medium length sequences.

The service returns a Newick file which can be rendered in the interactive Archaeopteryx Tree Viewer in the BV-BRC or downloaded and viewed in other software.   

### See also
* [Phylogenetic Gene Tree Service](https://beta.bv-brc.org/app/GeneTree)
* [Phylogenetic Gene Tree Tutorial](../../tutorial/genetree/genetree.html)

## Using the Service
The **Gene Tree** submenu option under the **"SERVICES"** main menu (Viral Services category) opens the phylogenetic tree input form. *Note: You must be logged into BV-BRC to use this service.*

![BV-BRC Services Menu](../images/bv_services_menu.png) 

## Input Options and Parameters

Several options exist for tree building. Below is a description of input, output, and parameter options. 

![Figure 1](./images/genetree_Picture1.png "Figure 1")


![Figure 2](./images/genetree_Picture2.png "Figure 2")


![Figure 3](./images/genetree_Picture3.png "Figure 3")


![Figure 4](./images/genetree_Picture4.png "Figure 4")


![Figure 5](./images/genetree_Picture5.png "Figure 5")


![Figure 6](./images/genetree_Picture6.png "Figure 6")


![Figure 7](./images/genetree_Picture7.png "Figure 7")


![Figure 8](./images/genetree_Picture8.png "Figure 8")


![Figure 9](./images/genetree_Picture9.png "Figure 9")


![Figure 10](./images/genetree_Picture10.png "Figure 10")

