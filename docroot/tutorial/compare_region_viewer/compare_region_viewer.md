# Compare Region Viewer

The Compare Region Viewer was designed to show the genomic neighborhood of a protein-coding gene across a phylogenetic distance. Along with the ability to view the genes in a particular region and filter on reference, representative or all public genomes in the resource, this viewer also enables selecting the number of regions, size, and type of protein family[1, 2].

## Finding, viewing and manipulating the Compare Region Viewer
1.	From any protein encoding gene landing page, click on the **Compare Region Viewer** tab.
![Compare Region View tab on the Feature Landing page](./images/Figure_1_CRV_tab.png "Compare Region Viewer tab.")

2.	This will open the tab that shows the neighborhood surrounding the gene of interest, which is a red arrow.  The default view shows the cross-genus protein families (PGFams[3]) in a region of 10,000 bp across 10 of the [RefSeq Reference and Representative genomes](https://www.ncbi.nlm.nih.gov/refseq/about/prokaryotes/).  The 10 genomes shown are selected based on the strength of the BLAST[4] hit for the selected gene, which is depicted in red. 
![Default Compare Region View](./images/Figure_2_Defaule_CRV.png "Default Compare Region View.")

3.	If one is interested in looking at genomes within the same genus, the genus-specific protein families (PLFams) should be selected. Click on the down arrow at the end of the text box under Method.  This will open a drop-down box where the PLFams can be selected.  Click on that row, and then on the blue **Update** button at the lower left.  This will rewrite the tab to show genomes within the same genus, with the genome having the strongest BLAST hit to the reference gene at the top. 
![Change to PLFam](./images/Figure_3_Change_PLFams.png "Change to PLFam.")

4.	There is a distinct anatomy to the viewer.  The reference genome is the first row, and all subsequent rows are comparison genomes.  Every view has genes upstream and downstream of the reference gene, which is colored red.  The box directly underneath it is a visual representation of the strength and length of the BLAST hits, with dark red showing a stronger hit, and lesser shades of red indicating a weaker red color.  The genomes are place depending on the strength of the BLAST hit to the reference gene, with the strongest hit being in the genome directly underneath the reference.  If the BLAST hit is only to a part of the gene, the length of the BLAST hit will not extend the length of the gene.  Genes in the same protein family are indicated by a similar color, and they have a number over the arrow as a second way to indicate the same family.
![Viewer Anatomy](./images/Figure_4_Anatomy_of_Viewer.png "Viewer Anatomy.")


