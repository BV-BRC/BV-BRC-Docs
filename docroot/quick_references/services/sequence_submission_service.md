# Sequence Submission Service

## Overview
The Sequence Submission service allows user to validate and submit virus sequences to NCBI Genbank. User-provided metadata and FASTA sequences are validated against the Genbank data submission standards to identify any sequence errors before submission. Sequences are also annotated using the VIGOR4 and FLAN annotation tools for internal use by users. The Sequence Submission service provides a validation report that should be reviewed by the user before submitting the sequences to the Genbank. 

Note: Current pipeline only supports Influenza A, B, or C virus family.

### See also
  * [Sequence Submission Service](https://bv-brc.org/app/SequenceSubmission)
  * [Sequence Submission Service Tutorial](../../tutorial/sequence_submission/sequence_submission.html)

## Using the Sequence Submission Service

The **Seqeuence Submission** submenu option under the **"TOOLS & SERVICES"** main menu (Genomics category) opens the Sequence Submission Service input form. *Note: You must be logged into BV-BRC to use this service.*

![Sequence Submission menu option](../images/bv_services_menu.png) 

## Parameters

Below is a screenshot of the Sequence Submission input form, as well as a summary of customizable parameters.  

![Sequence Submission Input Form](../images/seuquence_submission/Picture2.png "Input Form") 




**P-value:** the probability of the observed data given that the null hypothesis is true. 

**Output Folder:** The workspace folder where results will be placed.

**Output Name:** A user-specified label. This name will appear in the workspace when the analysis job is complete.

**Fasta Text Input:** Users may enter custom sequences here by pasting in FASTA formatted sequences. 

### *Input Options*

**Auto Grouping:** Allows users to group sequences by available metadata such as: host, country, year, virus type, host age, host gender, etc. The appropriate metadata field may be selected from the “METADATA” drop-down menu. 

**And/or Select Feature Group:** Users may input a nucleic acid or protein FASTA file containing a previously selected “Feature Group” (eg. CDS, tRNA etc.) from their workspace here, either in addition to the FASTA text input, or as an alternative.

**Metadata:** Auto grouping by available metadata options includes: Host name, geographic location, isolation country, species, genus, and collection year.

**Feature Groups:** This option allows users to select previously identified groups of sequences saved to their workspace.

**Alignment File:** This option allows users to select a previously aligned group of nucleotides or proteins.

**Select Feature Group:** This option allows users to specify feature groups previously saved to their workbench.

**DNA/PROTEIN:** Allows users to specify whether their sequences are nucleic acid or protein sequences.  

**Group names:** User-specified names for custom groups. 

**Delete Rows:** Allows users to delete unwanted sequences.

## Buttons

![Figure 2](../images/metacats_Picture2.png "Figure 2")

**Reset:** Resets the input form to default values 

**Submit:** Launches the MSA job. A message will appear below the box to indicate that the job is now in the queue. 

![Figure 3](../images/metacats_Picture3.png "Figure 3")

## Output Results

Clicking on the Jobs indicator at the bottom of the BV-BRC page open the Jobs Status page that displays all current and previous service jobs and their status. 

![Figure 4](../images/metacats_Picture4.png "Figure 4")

Once the job has completed, selecting the job by clicking on it and clicking the “View” button on the green vertical Action Bar on the right-hand side of the page displays the results files (red box). 

![Figure 5](../images/metacats_Picture5.png "Figure 5")

The results page will consist of a header describing the job and a list of output files, as shown below. 

![Figure 6](../images/metacats_Picture6.png "Figure 6")

The Meta-CATS Service generates several files that are deposited in the Private Workspace in the designated Output Folder. These include:

* **chisqTable.tsv** - a tab separated value file with results for a “Chi-square Goodness” of fit test result: ie: positions that have significant non-random distribution between the specified groups
* **mcTable.tsv** - a tab separated value file with results for adjusted  p-values for multiple comparisons.
* **Mafft.log** - an output log file produced by the Mafft aligner. 

## Action buttons
After selecting one of the output files by clicking it, a set of options becomes available in the vertical green Action Bar on the right side of the table. These include:

* **Hide/Show:** Toggles (hides) the right-hand side Details Pane.
* **Guide Link:** to the corresponding Quick Reference.
* **Download:** Downloads the selected item.
* **View:** Displays the content of the file, typically as plain text or rendered html, depending on filetype.
* **Delete:** Deletes the file.
* **Rename:** Allows renaming of the file.
* **Copy:** Copies the selected items to the clipboard.
* **Move:** Allows moving of the file to another folder.

More details are available in the [Action Bar](../action_bar.html) Quick Reference Guide.
