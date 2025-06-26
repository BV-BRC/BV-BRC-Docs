# TreeSort Service

## Overview

The idea behind TreeSort is the observation that *if there is no reassortment, then the evolutionary histories of different segments should be identical*. TreeSort then uses a phylogenetic tree for one segment (e.g., the HA influenza A virus segment) as an evolutionary hypothesis for another segment (e.g., the NA segment). We will refer to the first segment as the *reference* and the second segment as the *challenge*. By trying to fit the sequence alignment of the challenge segment to the reference tree, TreeSort identifies points on that tree, where this evolutionary hypothesis breaks. The "breaking" manifests in the mismatch between the divergence time on the reference tree (e.g., 1 year divergence between sister clades) and an unlikely high number of substitutions in the challenge segment that are required to explain the reference tree topology under the null hypothesis of no reassortment.

TreeSort has demonstrated very high accuracy in reassortment inference in simulations (manuscript in preparation). TreeSort can process datasets with tens of thousands of virus strains in just a few minutes and can scale to very large datasets with hundreds of thousands of strains. (This overview is from [https://github.com/flu-crew/TreeSort/blob/main/README.md](https://github.com/flu-crew/TreeSort/blob/main/README.md))

## See Also
  * [TreeSort Service](https://www.bv-brc.org/app/TreeSort)
  * TreeSort Service Tutorial (TODO)

## Using the Subspecies Classification Service
  The **“TreeSort”** submenu (red arrow) under the **“SERVICES”** main menu (Viral Services category) opens the input form.

  * *Note: You must be logged into BV-BRC to use this service.*

## Parameters
TODO



## Input data
**Input file** Select a FASTA file from your workspace.

## Output data

**Output path** The directory in your workspace where a directory will be created for the TreeSort results.

**Output name** The name of the directory created under "Output path"


## TreeSort parameters

- **Reference segment** The segment to use as the reference.

- **Segments** Select at least 2 segments to include in the analysis.

- **Match type**
   * **Strain** Match the names (deflines in FASTAs) across the segments based on the strain name. E.g., "A/Texas/32/2021" or "A/swine/A0229832/Iowa/2021". Works for flu A, B, C, and D, and no pre-processing is needed to standardize the names before the analysis.
   * **EPI_ISL_XXX** Segments are matched based on the "EPI_ISL_XXX" field (if present in deflines).
   * **RegEx** Provide your own custom regular expression to match the segments across the alignments.

- **Inference method** Methods are "local" (default) or "mincut". The mincut method always determines the most parsimonious reassortment placement even in ambiguous circumstances.

- **Reference tree inference method** Select the tool that will be used to infer the reference tree: FastTree (default) or IQ-Tree (recommended for better accuracy)

- **Allowed deviation** Maximum deviation from the estimated substitution rate within each segment. The default is 2: The substitution rate on a particular tree branch is allowed to be twice as high or twice as low as the estimated rate. The default value was estimated from the empirical influenza A data.

- **P-value threshold** The cutoff p-value for the reassortment tests: the default is 0.001 (0.1 percent). You may want to decrease or increase this parameter depending on how stringent you want the analysis to be.

- **Clades filename** The path to an output file where clades with evidence of reassortment will be saved.

- **Estimate molecular clock rates for different segments** Estimate molecular clock rates for different segments: assume equal rates.

- **Time-scale the reference tree** Indicates that the reference tree is time-scaled (e.g., through TreeTime).

- **Collapse near-zero length branches into multifurcations** Collapse near-zero length branches into multifurcations (by default, TreeSort collapses all branches shorter than 10^-7^ (1e-7) and then optimizes the multifurcations).


## Buttons

**Reset:** Resets the input form to default values

**Submit:** Launches the classification job. A message will appear below the box to indicate that the job is now in the queue. 


## Output Results
Clicking on the Jobs indicator at the bottom of the BV-BRC page open the Jobs Status page that displays all current and previous service jobs and their status.

**Job Status Bar** TODO: create an image and add a link

Once the job has completed, select the job by double-clicking on it, or clicking the “View” button on the green vertical Action Bar on the right-hand side of the page (red box). This displays the results files.

**Job Status Page** TODO: create an image and add a link

The results page will consist of a header describing the job and a list of output files, as shown below.

**Job Status Results Page** TODO: create an image and add a link

The TreeSort Service generates several files that are deposited in the private Workspace in the previously designated Output Folder. 

### The primary output file 

* ***output name*.tre** An annotated tree file in Nexus format.

### Segment-specific files
* <*segment name*>-input.fasta.aln
* <*segment name*>-input.fasta.aln.dates.csv
* <*segment name*>-input.fasta.aln.rooted.tre
* <*segment name*>-input.fasta.tre
 
* <*segment name*>-input.fasta.aln.treetime
   * outliers.tsv
   * root_to_tip_regression.pdf
   * rtt.csv


## Action Buttons
After selecting one of the output files by clicking it, a set of options becomes available in the vertical green Action Bar on the right side of the table. These include:

* **Hide/Show:** Toggles (hides) the right-hand side Details Pane.
* **Guide** Link to the corresponding User Guide
* **Download:** Downloads the selected item.
* **View** Displays the content of the file, typically as plain text or rendered html, depending on filetype.
* **Delete** Deletes the file.
* **Rename** Allows renaming of the file.
* **Copy:** Copies the selected items to the clipboard.
* **Move** Allows moving of the file to another folder.
* **Edit Type** Allows changing of the type of the file in terms of how BV-BRC interprets the content and uses it in other services or parts of the website. Allowable types include unspecified, contigs, nwk, reads, differential expression input data, and differential expression input metadata.

More details are available in the [Action Buttons](https://bv-brc.org/docs/user_guides/action_buttons.html) user guide.

## References

1. Alexey Markin, Catherine A. Macken, Amy L. Baker, Tavis K. Anderson, "Revealing reassortment in influenza A viruses with TreeSort"
[bioRxiv 2024.11.15.623781](https://www.biorxiv.org/content/10.1101/2024.11.15.623781v1); doi: https://doi.org/10.1101/2024.11.15.623781

2. GitHub: [https://github.com/flu-crew/TreeSort](https://github.com/flu-crew/TreeSort)




