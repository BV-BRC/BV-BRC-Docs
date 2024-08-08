# Small-molecule Docking Service

*Revised: August 6, 2024*

## Overview
The small-molecule docking service uses the DiffDock method of molecular docking to compute a set of predicted
poses for a given protein structure and a set of small-molecule ligands.  This service utilizes a diffusion model, [DiffDock](https://arxiv.org/abs/2210.01776) to comput a set of poses for a target protein sructure and a set of small-molecule ligands.  The aim is to simulate and analyze potential binding scenarios “in silico”. Offering a crucial advantage by predicting the success of protein ligand combinations ahead of costly and time-consuming in vivo experiments.

## See also
* [Docking Application](https://bv-brc.org/app/Docking)
* [Docking Tutorial](/tutorial/docking/docking)

## Using the Docking Service
The **Docking** submenu option under the **"SERVICES"** main menu (Protein Tools category) opens the Docking Service input form. *Note: You must be logged into BV-BRC to use this service.*

![Docking menu option](../images/bv_services_menu.png)

Below is a screenshot of the Docking Service landing page, as well as a summary of customizable parameters.

![User Interface](../images/docking/user_interface.png "User Interface")

## PDB Selection

**PDB ID:** The PDB identifier of the target protein. The PDB identifiers here come from
the collection loaded into the BV-BRC resource. The **Preview PDB** button may be used
to preview the given PDB structure using the BV-BRC struture viewer.


## Ligand library selection

Choose a set of ligands to bind. These may be specified using one of the following mechanisms:

 * By using the **Enter SMILES Strings** option, one or more SMILES strings may be pasted into the text
box, one per line. If you wish to specify identifiers for the SMILES strings these may be provided before the SMILES string.
For example:
```
    coffee CN1C=NC2=C1C(=O)N(C(=O)N2C)C
    sugar  C(C1C(C(C(C(O1)OC2(C(C(C(O2)CO)O)O)CO)O)O)O)O
```

 *  By using the **Select File of SMILES Strings** option. Here you may choose an existing
file of SMILES strings from the workspace, or upload a new file from your computer. The format
is the same as the format used in the SMILES text box described above.

* By using the **Predefined Ligand Libraries** option. We offer two ligand libraries. The approved compound are a library of compounds approved by at least one of various governing bodies for human use.  There are around two thousand compounds in this library. The experimental drug compound library is more robust, with nearly ten thousand compounds. The results from the ligand library will link out to [DrugBank Online](https://go.drugbank.com/).
## Parameters

**Output Folder:** The workspace folder where results will be placed.

**Output Name:** A user-specified label. This name will appear in the workspace when the analysis job is complete.

## Buttons

**Reset:** Resets the input form to default values

**Submit:** Launches the Docking job. A message will appear below the box to indicate that the job is now in the queue.

## Output Results

![Select output folder](../images/docking/select_output_folder_output_name.png "Select output folder")

The Docking Service generates several files that are deposited in the Private Workspace in the designated Output Folder. 

The top level folder includes a file named **DockingRreport.html**.
This contains a report summarizing the results of the docking against each ligand
including scores for each match and a link to the structure viewer with the protein structure
with the ligand placed in it.

Each protein that was docked has more detailed output in a folder named with the PDB identifier for the protein.
In this folder is a set of additional folders, one per ligand. In these folders you will find the details
for the docking of the protein with the given ligand:

* **result.csv** contains a table summarizing the results. The columns are as follows:
  * **ident** Ligand identifier
  * **rank** Rank of the pose as determined by DiffDock
  * **score** Confidence score of the pose as determined by DiffDock
  * **lig_sdf** The name of a SDF file containing the posed ligand
  * **comb_pdb** The name of a PDB file containing the ligand and PDB structure composed together
  * **CNNscore** The CNN score of the pose as determined by GNINA
  * **CNNAffinity** The CNN affinity of the pose as determined by GNINA
  * **Vinardo** The Vinardo score of the pose as determined by GNINA

* **<PDB_ID>_rank\<N>_confidence-\<CONF>.pdb** - The composed PDB file for rank N with confidence CONF
* **rank\<N>.sdf** - A SDF file containing the top-ranked ligand pose
* **rank\<N>_confidence-\<CONF>.sdf** - A SDF file for the pose with rank N
* **rank\<N>_confidence-\<CONF>.pdb** - A PDB file for the pose with rank N


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

More details are available in the [Action Bar](/quick_references/action_bar) Quick Reference Guide.

## References
* Olson RD, Assaf R, Brettin T, Conrad N, Cucinell C, Davis JJ, Dempsey DM, Dickerman A, Dietrich EM, Kenyon RW, Kuscuoglu
M, Lefkowitz EJ, Lu J, Machi D, Macken C, Mao C, Niewiadomska A, Nguyen M, Olsen GJ, Overbeek JC, Parrello B, Parrello V, Porter JS, Pusch GD, Shukla M, Singh I, Stewart L, Tan G, Thomas C, VanOeffelen M, Vonstein V, Wallace ZS, Warren AS,Wattam AR, Xia F, Yoo H, Zhang Y, Zmasek CM, Scheuermann RH, Stevens RL. Nucleic Acids Res. 2022 Nov 9:gkac1003. doi: 10.1093/nar/gkac1003. Epub ahead of print. PMID: 36350631.
* Corso, Gabriele, Arthur Deng, Benjamin Fry, Nicholas Polizzi, Regina Barzilay, and Tommi Jaakkola. "Deep Confident Steps to New Pockets: Strategies for Docking Generalization." arXiv preprint arXiv:2402.18396 (2024).
* McNutt, Andrew T., Paul Francoeur, Rishal Aggarwal, Tomohide Masuda, Rocco Meli, Matthew Ragoza, Jocelyn Sunseri, and David Ryan Koes. "GNINA 1.0: molecular docking with deep learning." Journal of cheminformatics 13, no. 1 (2021): 43.
* Quiroga R, Villarreal MA (2016) Vinardo: A Scoring Function Based on Autodock Vina Improves Scoring, Docking, and Virtual Screening. PLOS ONE 11(5): e0155183. https://doi.org/10.1371/journal.pone.0155183.
* Bento, A.P., Hersey, A., Félix, E. et al. An open source chemical structure curation pipeline using RDKit. J Cheminform 12, 51 (2020). https://doi.org/10.1186/s13321-020-00456-1.
* David Sehnal, Sebastian Bittrich, Mandar Deshpande, Radka Svobodová, Karel Berka, Václav Bazgier, Sameer Velankar, Stephen K Burley, Jaroslav Koča, Alexander S Rose: Mol* Viewer: modern web app for 3D visualization and analysis of large biomolecular structures, Nucleic Acids Research, 2021; https://doi.org/10.1093/nar/gkab314.
