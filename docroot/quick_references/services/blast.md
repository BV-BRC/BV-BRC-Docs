# BLAST Service

## Overview
The BLAST service integrates the BLAST (Basic Local Aligment Search Tool) algorithms to perform searches against against public or private genomes in BV-BRC or other reference databases using a DNA or protein sequence and find matching genomes, genes, RNAs, or proteins.  

### See also
* [BLAST Service](https://www.bv-brc.org/app/Homology)
* [BLAST Service Tutorial](../../tutorial/blast/blast.html)

## Using the BLAST Service
The **BLAST** submenu option under the **Services** main menu (Genomics category) opens the BLAST input form (*shown below*). *Note: You must be logged into BV-BRC to use this service.*

![BLAST Menu](../images/bv_services_menu.png)

## Options
![BLAST Input Form](../images/blast_input_form.png) 

## Search Program 

There are four BLAST programs provided by BV-BRC, and each has a specific query sequence and database. Clicking on the button in front of the program name will select it and will also select the appropriate databases.

  * **BLASTN** – The query sequence is DNA (nucleotide), and when enabled the program will search against DNA databases of contig or gene sequences.
  * **BLASTX** – The query sequence is DNA (nucleotide), and when enabled the program will search against the protein sequence database.
  * **BLASTP** – The query sequence is protein (amino acid), and when enabled the program will search against the protein sequence database.
  * **tBLASTn** – The query sequence is protein (amino acid), and when enabled the program will search against DNA databases of contig or gene sequences.

 ## Query Source 

There are three types of Query sources that are provided by BV-BRC:

* **Enter sequence** - Paste the query sequence into the box.
* **Select FASTA file** - Choose FASTA file that has been uploaded to the Workspace.
* **Select feature group** - Choose a feature (gene/protein) that has been saved in the Workspace.

## Database Source

BV-BRC has different databases to choose from for the source to search wihin: 
 
* Reference and representative genomes (bacteria, archaea)
* Reference and representative genomes (virus)
* Selected genome list
* Selected genome group
* Selected feature group
* Taxon
* Selected fasta file



**Database:** Dropdown list of a variety of BV-BRC databases or user-selected data sets for searching. Depending upon the query type, searches are available for entire genomes or limited to only features. Specifically, blastn, tblastn, or tblastx, allows searches against either genomes or features. However, blastp or blastx are limited to features (proteins) only.   

## Advanced Options
**BLAST Parameters:** Allows adjustment of maximum number of hits returned and E value threshold.

## Buttons
**Search:** Launches the search which, upon completion, returns a set of results matching the sequence provided and selected criteria.  On the results page, the **Edit form and resubmit Button** above the search results reloads the input form so that the parameters can be easily adjusted and the search relaunched.

## Output Results
![BLAST Service Results](../images/blast_service_results.png) 

The BLAST Service generates a table of matching results (features) based on the options chosen.  

### Action buttons
After selecting one of the output files by clicking it, a set of options becomes available in the vertical green Action Bar on the right side of the table.  These include

* **Hide/Show:** Toggles (hides) the right-hand side Details Pane.
* **Download:**  Downloads the selected items (rows).
* **Copy:** Copies the selected items to the clipboard.
* **FASTA:** Provides the FASTA DNA or protein sequence for the selected feature(s).
* **ID Map:** Provides the option to map the selected feature(s) to multiple other idenfiers, such as RefSeq and UniProt.
* **MSA:** Launches the Multiple Sequence Alignment (MSA) tool and aligns the selected features by DNA or protein sequence in an interactive viewer.
* **Pathway:** Loads the Pathway Summary Table containing a list of all the pathways in BV-BRC in which the selected features are found.
* **Group:** Opens a pop-up window to enable adding the selected sequences to an existing or new group in the private workspace.
* **Feature:** Loads the Feature Page for the selected feature. *Available only if a single feature is selected.*
* **Features:** Loads the Features Table for the selected features. *Available only if multiple features are selected.*
* **Genome:** Loads the Genome View Overview page corresponding to the selected feature.  *Available only if a single feature is selected.*
* **Genomes:** Loads the Genomes Table, listing the genomes that correspond to the selected features. *Available only if multiple features are selected.*

More details are available in the [Action Buttons](../action_buttons.html) Quick Reference Guide.

## References
1.	Boratyn, G.M., Camacho, C., Cooper, P.S., Coulouris, G., Fong, A., Ma, N., Madden, T.L., Matten, W.T., McGinnis, S.D., Merezhuk, Y. et al. (2013) BLAST: a more efficient report with usability improvements. Nucleic acids research, 41, W29-33.

2.	O'Leary, N.A., Wright, M.W., Brister, J.R., Ciufo, S., Haddad, D., McVeigh, R., Rajput, B., Robbertse, B., Smith-White, B., Ako-Adjei, D. et al. (2016) Reference sequence (RefSeq) database at NCBI: current status, taxonomic expansion, and functional annotation. Nucleic acids research, 44, D733-745.
