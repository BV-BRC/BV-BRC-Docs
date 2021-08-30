# Phylogenetic Tree Service 

A phylogenetic tree or evolutionary tree is a branching diagram or “tree” showing the evolutionary relationships among various biological species or other entities. The Codon Tree service in BV-BRC allows researchers to build trees that contain private and public genomes, adjusting for the number of genes that will be used to generate the tree.

The Codon Tree pipeline generates bacterial phylogenetic trees. It uses the amino acid and nucleotide sequences from defined number of the BV-BRC global Protein Families (PGFams)[1], which are picked randomly, to build an alignment, and then generate a tree based on the differences within those selected sequences. This tutorial deals with the Codon Trees pipeline. Both the protein (amino acid) and gene (nucleotide) sequences are used for each of the selected genes from the PGFams. Protein sequences are aligned using MUSCLE[2], and the nucleotide coding gene sequences are aligned using the Codon_align function of BioPython[3]. A concatenated alignment of all proteins and nucleotides were written to a PHYLIP formatted file, and then a partitions file for RaxML[4] is generated, describing the alignment in terms of the proteins and then the first, second and third codon positions. Support values are generated using 100 rounds of the “Rapid” bootstrapping option[5] of RaxML. The resulting newick file can be viewed in BV-BRC, and we also suggest that researchers download it and view it in FigTree[6] to generate a publication quality image.
Source code for algorithms

* The source code for RaxML can be found at: https://github.com/stamatak/standard-RAxML
* The source code for MUSCLE can be found at: https://www.drive5.com/muscle/downloads.htm
* The source code for BioPython can be found at: https://github.com/biopython/biopython

## Creating a folder to hold the phylogenetic tree job and related data

Please refer to the [Genome Assembly Service tutorial](../genome_assembly/assembly.html) for instructions on creating a folder in the workspace.

## Locating the Phylogenetic Tree App

1.	At the top of any BV-BRC page, find the Services tab and click on Phylogenetic Tree. 
![Figure 1](./images/Picture1.png "Figure 1")

2.	This will open up the Phylogenetic tree landing page where researchers can generate a phylogenetic tree. 
![Figure 2](./images/Picture2.png "Figure 2")

## Selecting genomes 

### Individual genomes

1.	Public or private genomes that are in the BV-BRC database can be used to build a phylogenetic tree. Up to 100 genomes can be used in this service. To add a private genome, click on the Filter icon at the beginning of the text box underneath **Select Genome**. 
![Figure 3](./images/Picture3.png "Figure 3")

2.	This will open a drop-down box with a list of the types of genomes that can be filtered on. Click off the check box in front of Reference, Representative and All Other Public Genomes to enable filtering on private genomes that are in the researcher’s workspace. 
![Figure 4](./images/Picture4.png "Figure 4")

3.	Clicking on the drop-down box at the end of the text box under Select Genome will show the private genomes in the workspace that have most recently been annotated. 
![Figure 5](./images/Picture5.png "Figure 5")

4.	The list can also be filtered by beginning to type a name in the text box under Select Genome. 
![Figure 6](./images/Picture6.png "Figure 6")

5.	A genome of interest can be selected by clicking on it. This will auto-fill the name of the genome into the text box. 
![Figure 7](./images/Picture7.png "Figure 7")

6.	The genome needs to be added into the Selected Input Genome Table. Click the **+ Add** button at the end of the text box, and the genome will appear in the table. 
![Figure 8](./images/Picture8.png "Figure 8")

7.	To add a different type of genome (Reference, Representative, or All Other Public Genomes), click on the filter icon and click the check boxes to the desired category.  The selected genomes will be moved to the Selected Genome Input Table by clicking on the name and then the Add button.

## Genome Groups

1.	Genome groups can also be added to the Input Genome Table. Clicking on the down arrow that follows the text box underneath **And/Or Select Genome Group** will show the genome groups that have most recently been created by the researcher. 
![Figure 9](./images/Picture9.png "Figure 9")

2.	The list can be filtered by beginning to type a name in the text box under Select Genome. 
![Figure 10](./images/Picture10.png "Figure 10")

3.	A genome group of interest can be selected by clicking on it. This will auto-fill the name of the genome into the text box. 
![Figure 11](./images/Picture11.png "Figure 11")

4.	The selected genomes will be moved to the Selected Genome Input Table by clicking on the name and then the **+ Add** button.  This will move the selection to the top of the **Selected Input Genome Table**. 
![Figure 12](./images/Picture12.png "Figure 12")

5.	Clicking on the Information icon following the name will show the Genome IDs of the genomes within a selected group. 
![Figure 13](./images/Picture13.png "Figure 13")

6.	Clicking on the **X** icon that follows the name of a genome or genome group in the Selected Input Genome Table will remove it from the selection. 
![Figure 14](./images/Picture14.png "Figure 14")

## Setting parameters

1.	Several parameters must be addressed before the codon tree job can be submitted, and the Submit button will turn blue when the job is ready.
![Figure 15](./images/Picture15.png "Figure 15")

2.	The phylogenetic tree job must be placed in an **Output Folder**.  Clicking on the down arrow that follows the text box underneath Output Folder will show the folders that have most recently been created by the researcher. 
![Figure 16](./images/Picture16.png "Figure 16")

3.	Clicking on a folder name will add it to the text box.  Links to instructions on creating a new folder are available at the top of this tutorial. 
![Figure 17](./images/Picture17.png "Figure 17")

 4.	The phylogenetic tree job needs a name, which can be entered in the text box under **Output Name**.
![Figure 18](./images/Picture18.png "Figure 18")

5.	The number of single-copy PGFams set as the default is 100. This will include 100 amino acid and nucleotide sequences for the alignment and the tree but will depend on the number of single copy genes found in all of the genomes selected. For example, if one genome has only 10 single copy genes, then the tree will be built on the protein and gene sequences for those 10 genes, even if all the other genomes have 100 single copy genes. This can be adjusted (see below for Max Allowed Deletions and Duplications). 

A different number can be selected by clicking on the down arrow at the end of the text box underneath **Number of Genes**, and the range is 10 to 1000 genes. Genomes that are in widely different taxa might be resolved with as few as 10 genes, but closely related genomes (same species or even strain) might require up to 1000 genes selected to separate them on a phylogenetic tree. **The more genes selected, the longer the tree job will run**. Clicking on the desired number will fill the text box. 
![Figure 19](./images/Picture19.png "Figure 19")

6.	The selection of “single-copy” genes can be made more lenient by allowing one or more instances of genomes missing a member of a particular homology group (**Max Allowed Deletions**). If the number is set at 1, 9 genomes would have a gene in a particular PGFam, and the 10th would be missing it. Likewise, if the number is set at 2, 8 genomes would have the PGFam and the last 2 would be missing it. This would only be used if there are not enough PGFams meet the single copy criterion. The number of deletions allowed can be set between 0 and 10 in the text box underneath Max Allowed Deletions (0-10). 
![Figure 20](./images/Picture20.png "Figure 20")

7.	The selection of “single-copy” genes can also be made more lenient by allowing for PGFams that might have more than one copy of a single gene within a single genome. If the number is set at 1, then. Nine genomes have one gene in a particular PGFam, and the 10th has two. If the number is set at 2, 8 genomes will have one gene in a particular PGFam and the other two have 2. When there are two copies of a gene, the algorithm will pick the gene that is the most similar to the other genes found in the other selected genomes. This would only be used if there are not enough PGFams meet the single copy criterion. This number of can be set between 0 and 10 in the text box underneath **Max Allowed Duplications** (0-10). 
![Figure 21](./images/Picture21.png "Figure 21")

8.	When all the parameters are entered, the codon tree job is ready to submit. Submit the job by clicking on the blue Submit button. 
![Figure 22](./images/Picture22.png "Figure 22")

9.	A message will appear above the submit button, indicating that the submission was successful. 
![Figure 23](./images/Picture23.png "Figure 23")

## Monitoring progress on the Jobs page

1.	Click on the Jobs box at the bottom right of any BV-BRC page.
![Figure 24](./images/Picture24.png "Figure 24")


![Figure 25](./images/Picture25.png "Figure 25")


![Figure 26](./images/Picture26.png "Figure 26")


![Figure 27](./images/Picture27.png "Figure 27")


![Figure 28](./images/Picture28.png "Figure 28")


![Figure 29](./images/Picture29.png "Figure 29")


![Figure 30](./images/Picture30.png "Figure 30")


![Figure 31](./images/Picture31.png "Figure 31")


![Figure 32](./images/Picture32.png "Figure 32")


![Figure 33](./images/Picture33.png "Figure 33")


![Figure 34](./images/Picture34.png "Figure 34")


![Figure 35](./images/Picture35.png "Figure 35")


![Figure 36](./images/Picture36.png "Figure 36")


![Figure 37](./images/Picture37.png "Figure 37")


![Figure 38](./images/Picture38.png "Figure 38")


![Figure 39](./images/Picture39.png "Figure 39")


![Figure 40](./images/Picture40.png "Figure 40")


![Figure 41](./images/Picture41.png "Figure 41")


![Figure 42](./images/Picture42.png "Figure 42")


![Figure 43](./images/Picture43.png "Figure 43")


![Figure 44](./images/Picture44.png "Figure 44")


![Figure 45](./images/Picture45.png "Figure 45")


![Figure 46](./images/Picture46.png "Figure 46")


![Figure 47](./images/Picture47.png "Figure 47")


![Figure 48](./images/Picture48.png "Figure 48")


![Figure 49](./images/Picture49.png "Figure 49")


![Figure 50](./images/Picture50.png "Figure 50")


![Figure 51](./images/Picture51.png "Figure 51")


![Figure 52](./images/Picture52.png "Figure 52")


![Figure 53](./images/Picture53.png "Figure 53")


![Figure 54](./images/Picture54.png "Figure 54")


![Figure 55](./images/Picture55.png "Figure 55")


![Figure 56](./images/Picture56.png "Figure 56")


![Figure 57](./images/Picture57.png "Figure 57")


![Figure 58](./images/Picture58.png "Figure 58")


![Figure 59](./images/Picture59.png "Figure 59")


![Figure 60](./images/Picture60.png "Figure 60")


![Figure 61](./images/Picture61.png "Figure 61")


![Figure 62](./images/Picture62.png "Figure 62")


![Figure 63](./images/Picture63.png "Figure 63")


![Figure 64](./images/Picture64.png "Figure 64")


