# Mulitiple Sequence Alignment Viewer

## Overview
The Multiple Sequence Alignment (MSA) Viewer provides an interactive visualization of a nucleic acid or amino acid multiple sequence alignment with a linked interactive tree viewer. Results presented in the MSA Viewer are generated using FastTree (Price 2009) and Gblocks (Castresana 2002), and Muscle (Edgar 2004).

### See also
  * [Features Tab](../organisms_taxon/features.html)

## Accessing the MSA Viewer
The MSA can be accessed by selecting a set of features in the Features Tab or any other table that contains features/genes (nucleotide sequences) or proteins (amino acid sequences), then clicking the MSA button in the vertical green Action Bar to the right of the table, as shown below: 

![MSA Action Button Selection](../images/msa_action_button_select.png)

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
* **Colors:** Displays a list of color coding options for the sequence alignment and logo.
* **ID Type:** Allows changing labels on in gene tree from genome name to genomes ID.
* **Filter:** Allows filtering (hiding) of columns based on % conservation and % gaps
* **Group:** Opens a pop-up window to enable adding the selected sequences to an existing or new group in the private workspace.
* **MSA:** (Re-)launches the Multiple Sequence Alignment (MSA) tool and aligns the selected features by DNA or protein sequence in an interactive viewer.
* **Feature:** Loads the Feature Page for the selected feature. *Available only if a single feature is selected.*
* **Features:** Loads the Features Table for the selected features. *Available only if multiple features are selected.*
* **Genome:** Loads the Genome View Overview page corresponding to the selected feature.  *Available only if a single feature is selected.*
* **Genomes:** Loads the Genomes Table, listing the genomes that correspond to the selected features. *Available only if multiple features are selected.*
* **Download:**  Downloads the selected items (rows).

## References
* Castresana, J. (2002). Gblocks, v. 0.91 b. Online version available at: http://molevol.cmima.csic.es/castresana/Gblocks_server.html.
* Edgar, R.C. (2004) MUSCLE: multiple sequence alignment with high accuracy and high throughput
  Nucleic Acids Res. 32(5):1792-1797.
* Price, M. N., Dehal, P. S., & Arkin, A. P. (2009). FastTree: computing large minimum evolution trees with profiles instead of a distance matrix. Molecular biology and evolution, 26(7), 1641-1650.

