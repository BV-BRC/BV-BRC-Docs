# Mulitiple Sequence Alignment Viewer

## Overview
The Multiple Sequence Alignment (MSA) Viewer provides an interactive visualization of a nucleic acid or amino acid multiple sequence alignment with a linked interactive tree viewer. 

## See also
  * [Features Tab](/quick_references/organisms_taxon/features)
  * [MSA and SNP/Variation Service Tutorial](/tutorial/msa_snp_variation/msa_snp_variation)

## Accessing the MSA Viewer
The MSA Viewer can be accessed in two different ways:

1. By selecting a set of features in the Features Tab or any other table that contains features/genes (nucleotide sequences) or proteins (amino acid sequences), then clicking the MSA button in the vertical green Action Bar to the right of the table, as shown below. Results presented in the MSA Viewer are generated using FastTree[1], Gblocks[2], and Muscle[3]. 

![MSA Action Button Selection](../images/msa_action_button_select.png)

2. By selecting can be used after completing an alignment job in the MSA and Sequence Nucleotide Polymorphism (SNP)/Variation Service. Alternatively, if you already have an aligned file, you can also view the alignment by uploading it to this service. For more information, see MSA and Variation tutorial linked above. *Note: You must be logged into BV-BRC to use this service.*  

![MSA Action Button Selection 2](../images/msa_action_button_select2.png)

Results, whether nucleotide or amino acid, will be shown in the MSA Viewer, as shown in the figures below:

**Nucleotide MSA**
![MSA Viewer - Nucleotide](../images/msa_nucleotide.png)

**Amino Acid MSA**
![MSA Viewer - Amino Acid](../images/msa_amino_acid.png)

## Features and Functionality

The visualization has 3 main components:
  1. Gene tree on the left-hand side that is constructed based on the alignment
  2. Multiple sequence alignment in the main body of the visualization.
  3. Sequence logo across the top wherein the hight of the letter corresponds to the amount of conservation of the corresponding nucleotide or amino acid

### Gene tree
The gene tree on the left-hand side is generated using . Clicking on a single sequence item in the tree selects that item, as indicated with a small check mark and a red line in the tree branch.  A set of corresponding actions becomes available in the vertical green Action Bar on the right side of the visualization (explained in detail in _Action buttons_ section below).  Also, additional information and metadata about the selected item will be displayed in the information panel on the far right.  See figure below.

![MSA Viewer - Select Item in Tree](../images/msa_node_select.png)

Clicking on a node in the treee selects all items in that branch, as indicated by check marks and red lines in that branch of the tree. 

![MSA Viewer - Select Branch Node](../images/msa_branch_select2.png)

### Multiple Sequence Alignment and Sequence Logo

The multiple sequence alignment shows color-coded alginment of the letters in the sequnces in columns. The color scheme can be changed using the Colors button in the vertical green Action Bar on right side of the aignment. The sequence logo shows the amount of consservation of the letters in that column, indicated by the height of the corresponding letter.  A scrollbar between the seqeunce logo and alignment allows horizontal scrolling across the entire alignment.

### Action buttons

After selecting one or more of the experiments by clicking the checkbox beside the Title column in the table, a set of options becomes available in the vertical green Action Bar on the right side of the table.  These include

* **Hide/Show:** Toggles (hides) the right-hand side Details Pane.
* **Colors:** Displays a list of color coding options for the sequence alignment and logo. Several color schemes are available for visualizing MSAs.  Color schemes with an asterix (\*) have been adapted from the Jalview MSA (more information here) 
   * *Nucleotide\* (nucleotide color scheme)*
   * *Purine\* = purine/pyrimidine (nucleotide color scheme)*
   * *[Zappo](http://www.jalview.org/help/html/colourSchemes/zappo.html)\* (protein color scheme):* amino acid residues are colored by their physicochemical properties
   * *[Taylor](http://www.jalview.org/help/html/colourSchemes/taylor.html)\* (protein color scheme):* amino acid residues are colored by the scheme provided by [Taylor, 1997](https://pubmed.ncbi.nlm.nih.gov/9342138/).
   * *Hydrophobicity (protein color scheme):* amino acid residues are colored by the [table of hydrophobicity](https://pubmed.ncbi.nlm.nih.gov/7108955/). Briefly, the most hydrophobic residues are colored in red, the most hydrophilic ones in blue, and residues with intermediate properties are the halftones of purple.
   * *Lesk (protein color scheme)*
   * *Cinema (protein color scheme)*
   * *MAE (protein color scheme)*
   * *[Clustal](http://www.jalview.org/help/html/colourSchemes/clustal.html)\* (protein color scheme):* color scheme used in the "Clustal" application
   * *Clustal2 (protein color scheme):* color scheme used in the "Clustal2" application
   * *[Turn](http://www.jalview.org/help/html/colourSchemes/turn.html)\* = turn propensity:* amino acid residues are colored by their preference for formation of turns ([Levitt, 1978](https://pubs.acs.org/doi/10.1021/bi00613a026)).
   * *Strand\* = strand propensity:* amino acid residues are colored by their preference for formation of beta-folds ([Levitt, 1978](https://pubs.acs.org/doi/10.1021/bi00613a026))
   * *[Buried](http://www.jalview.org/help/html/colourSchemes/buried.html)\* = buried index:* amino acid residues are colored by their frequency of occurrence inside a globule. 
   * *[Helix](http://www.jalview.org/help/html/colourSchemes/helix.html)\*:* amino acid residues are colored by their preference for formation of alpha helices ([Levitt, 1978](https://pubs.acs.org/doi/10.1021/bi00613a026)). 
   * *PID (protein color scheme):* percent identity; amino acid residues are colored by the rate of occurrence of a symbol in a column. See default values in table below: 

      * Percent	Color
      * \> 80 %	Mid blue
      * \> 60 %	Light blue
      * \> 40 %	Light grey
      * \>= 40%	White
   * *No color (no color scheme)*
* **ID Type:** Allows changing labels on in gene tree from Genome Name to Gene ID.
* **Filter:** Allows filtering (hiding) of columns based on % conservation and % gaps. Selecting one of these options will open a window that allows users to select the desired threshold (percent). If none is chosen, a default value will be provided. Options  are provided below. 
   * Hide columns by % conservation (\>=) 
   * Hide columns by % conservation (\<=) 
   * Hide columns by % conservation (between)
   * Hide columns by % gaps (\>=) 
   * Hide columns by % gaps (\<=) 
   * Hide columns by % gaps (between)
   * Reset

* **Download:**  allows users to download the file options listed below. 
   * *MSA txt:* plain text version of the MSA. 
   * *MSA fasta:* a MSA file in fasta format.
   * *MSA image:* portable network graphic file of the current view of the MSA. 
   * *MSA clustal:* a MSA file in clustal format. 
   * *Tree svg:* Scalable vector graphics image format.
   * *Tree newick:* Newick tree format file. 

## References

1. Price, M. N., Dehal, P. S., & Arkin, A. P. (2009). FastTree: computing large minimum evolution trees with profiles instead of a distance matrix. Molecular biology and evolution, 26(7), 1641-1650.
2. Castresana, J. (2002). Gblocks, v. 0.91 b. Online version available at: http://molevol.cmima.csic.es/castresana/Gblocks_server.html.
3. Edgar, R.C. (2004) MUSCLE: multiple sequence alignment with high accuracy and high throughput. Nucleic Acids Res. 32(5):1792-1797.
4. Waterhouse, A.M., Procter, J.B., Martin, D.M.A, Clamp, M. and Barton, G. J. (2009). Jalview Version 2 - a multiple sequence alignment editor and analysis workbench. Bioinformatics25 (9) 1189-1191. doi: 10.1093/bioinformatics/btp033 

