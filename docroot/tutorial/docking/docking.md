# Small Molecule Ligand Docking Service

*Revision: 08/6/2024*
The small-molecule docking service uses the DiffDock method of molecular docking to compute a set of predicted
poses for a given protein structure and a set of small-molecule ligands.  This service utilizes a diffusion model, [DiffDock](https://arxiv.org/abs/2210.01776) to comput a set of poses for a target protein sructure and a set of small-molecule ligands.  The aim is to simulate and analyze potential binding scenarios “in silico”. Offering a crucial advantage by predicting the success of protein ligand combinations ahead of costly and time-consuming in vivo experiments.

## Locating the Small Molecule Ligand Docking Service
The **Docking** submenu option under the **"SERVICES"** main menu (Protein Tools category) opens the Docking Service input form. *Note: You must be logged into BV-BRC to use this service.*

![Docking menu option](../images/bv_services_menu.png)

Below is a screenshot of the Docking Service landing page, as well as a summary of customizable parameters.

![User Interface](../images/user_interface.png "User Interface")

## Submitting a Protein and Small Molecule Ligands to the Service 
This service takes one protein and offers three options to provide small molecules for docking. We support the [RCSB Protein Data Bank](https://www.rcsb.org/)(PDB).  The ligands are provided in the form of SMILE string. The OpenSmiles group maintains a detailed specification for SMILES. For a detailed explaination of SMILE strings please visit [OpenSmiles](http://opensmiles.org/opensmiles.html).

![Select PDB](../images/pdb_selection.png "Select PDB")
1. Select a protein using the PDB identifier frm the drop down or start typing a PBD identifier and the dropdown options will populate according to your text entry.
2. You have the option to click "Preview PBD" button to view the protein structure ahead of submitting the job.
3. We offer three options for providing ligand libraries. Ligand libraries are used to describe the options to enter 

![Enter SMILES Strings](../images/ligand_library_selection_enter_smile_strings.png "Enter SMILES Strings")

* The **Enter SMILES Strings** option, one or more SMILES strings may be pasted into the text
box, one per line. If you wish to specify identifiers for the SMILES strings these may be provided before the SMILES string.
For example:
```
    coffee CN1C=NC2=C1C(=O)N(C(=O)N2C)C
    sugar  C(C1C(C(C(C(O1)OC2(C(C(C(O2)CO)O)O)CO)O)O)O)O
```

![Select File of SMILES Strings](../images/ligand_library_selection_select_file_of_smiles.png "Select File of SMILES Strings")

 *  By using the **Select File of SMILES Strings** option. Here you may choose an existing
file of SMILES strings from the workspace, or upload a new file from your computer. The format
is the same as the format used in the SMILES text box described above.

![Predefined Ligand Libraries](../images/ligand_library_selection_select_ligand_library.png "Predefined Ligand Libraries")

* By using the **Predefined Ligand Libraries** option. We offer two ligand libraries. The approved compound are a library of compounds approved by at least one of various governing bodies for human use.  There are around two thousand compounds in this library. The experimental drug compound library is more robust, with nearly ten thousand compounds. The results from the ligand library will link out to [DrugBank Online](https://go.drugbank.com/).

## Parameters
1. As you would with our other services, please select an output folder and unique output name where the job results will populate.

## Reviewing the results
1. The output page lands on a directory for the protein submitted and a report "small_molecule_docking_report.html.
2. The report begins with a breif description of the service, analysis workflow and results.
3. The table at top shows the small molecules that DiffDock successfully bound to the structure. This table is sorted by Vinardo score which is the leading consideration.
4. The columns of the table are as follows:
* Ligand ID: The name of the ligand. If a ligand ID is not provided the program will assign “ID #” where the number is assigned according to the line number in the input.

* **Viewer**: Click on the hyper link to open a new table with the BVBRC protein structure viewer showing that specific protein ligand interaction.

* **DiffDocK Confidence**: Confidence score of this result as assigned by DiffDock. A lower confidence score indicates more confidence in the ligand protein docking successfully.

* **CNN Score**: CNN refers to a type of artificial intelligence called convolutional neural network (CNNs). The CNN Score gives a numerical value that represents how how plausible is the binding pose base on the CNN model evaluation. A higher score indicates better docking potential.

* **CNN Affinity**: CNN affinity is a hypothetical measurement of the ligands affinity to dock with the target protein as calculated by the central neural network described above. A higher affinity value indicates a a better chance of successful ligand docking.

* **Vinardo**: An empirical score function that evaluate the binding pose with terms from Gaussian steric attractions, quadratic steric repulsions, Lennard-Jones potentials, electrostatic interactions, hydrophobic interactions, non-hydrophobic interactions, and non-directional hydrogen bonds. A lower Vinardo score indicates a better chance of ligand binding.

* **SMILES**: SMILES is the “Simplified Molecular Input Line Entry System,” which is used to translate a chemical's three-dimensional structure into a string of symbols that is easily understood by computer software.
5. Click the "Structure" button to open a new tab and show the protein ligand docking configuration in our protein viewer.
  
