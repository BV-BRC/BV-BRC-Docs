# Phylogenetic Tree Service 

*Revised: 11/25/2022*

A phylogenetic tree or evolutionary tree is a branching diagram or “tree” showing the evolutionary relationships among various biological species or other entities. The Codon Tree service in BV-BRC allows researchers to build trees that contain private and public genomes, adjusting for the number of genes that will be used to generate the tree.

The Codon Tree pipeline generates bacterial phylogenetic trees. It uses the amino acid and nucleotide sequences from defined number of the BV-BRC global Protein Families (PGFams)[1], which are picked randomly, to build an alignment, and then generate a tree based on the differences within those selected sequences. This tutorial deals with the Codon Trees pipeline. Both the protein (amino acid) and gene (nucleotide) sequences are used for each of the selected genes from the PGFams. Protein sequences are aligned using MUSCLE[2], and the nucleotide coding gene sequences are aligned using the Codon_align function of BioPython[3]. A concatenated alignment of all proteins and nucleotides were written to a PHYLIP formatted file, and then a partitions file for RaxML[4] is generated, describing the alignment in terms of the proteins and then the first, second and third codon positions. Support values are generated using 100 rounds of the “Rapid” bootstrapping option[5] of RaxML. The resulting newick file can be viewed in BV-BRC, and we also suggest that researchers download it and view it in FigTree[6] to generate a publication quality image.
Source code for algorithms

* The source code for RaxML can be found at: https://github.com/stamatak/standard-RAxML
* The source code for MUSCLE can be found at: https://www.drive5.com/muscle/downloads.htm
* The source code for BioPython can be found at: https://github.com/biopython/biopython

### See also
* [Phylogenetic Tree Service](https://bv-brc.org/app/PhylogeneticTree)
* [Phylogenetic Tree Service Quick Reference Guide](/quick_references/services/phylogenetic_tree_building_service)

## Creating a folder to hold the phylogenetic tree job and related data

Please refer to the [Genome Assembly Service tutorial](/tutorial/genome_assembly/assembly) for instructions on creating a folder in the workspace.

## Locating the Phylogenetic Tree App

1.	At the top of any BV-BRC page, find the Services tab and click on Phylogenetic Tree. 
![Figure 1](./images/Picture1.png "Figure 1")

2.	This will open up the Phylogenetic tree landing page where researchers can generate a phylogenetic tree. 
![Figure 2](./images/Picture2.png "Figure 2")

## Selecting genomes 

**Individual genomes**

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

**Genome Groups**

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

5.	The number of single-copy PGFams set as the default is 100. This will include 100 amino acid and nucleotide sequences for the alignment and the tree but will depend on the number of single copy genes found in all of the genomes selected. For example, if one genome has only 10 single copy genes, then the tree will be built on the protein and gene sequences for those 10 genes, even if all the other genomes have 100 single copy genes. This can be adjusted (see below for Max Allowed Deletions and Duplications). A different number can be selected by clicking on the down arrow at the end of the text box underneath **Number of Genes**, and the range is 10 to 1000 genes. Genomes that are in widely different taxa might be resolved with as few as 10 genes, but closely related genomes (same species or even strain) might require up to 1000 genes selected to separate them on a phylogenetic tree. **The more genes selected, the longer the tree job will run**. Clicking on the desired number will fill the text box. 
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

2.	This will open the Jobs Landing page where the status of submitted jobs is displayed. 
![Figure 25](./images/Picture25.png "Figure 25")

## Viewing the Phylogenetic tree job results

1.	To view a particular job, click on a row to select it. Once selected, the downstream processes available for the selection appear in the vertical green bar.  Clicking on the View icon will open the phylogenetic tree job summary. 
![Figure 26](./images/Picture26.png "Figure 26")

2.	This will rewrite the page to show the information about the phylogenetic tree job, and all of the files that are produced when the pipeline runs.  
![Figure 27](./images/Picture27.png "Figure 27")

The resulting tree can be viewed in the BV-BRC interactive Archaeopteryx.js Tree Viewer. To launch the viewer, click the **VIEW** icon at the top right of the page, to the left of the green bar.

![Figure 27a](./images/Picture27a.png "Figure 27a")

(Example Archaeopteryx.js image)
![Figure 27b](./images/Picture27b.png "Figure 27b")

The [Archaeopteryx.js Tree Viewer Quick Reference Guide](/quick_references/services/archaeopteryx) provides detailed information about its features and options. 

3.	The information about the job submission can be seen in the table at the top of the results page.  To see all the parameters that were selected when the job was submitted, click on the Parameters row. 
![Figure 28](./images/Picture28.png "Figure 28")

4.	This will show the information on what was selected when the job was originally submitted. 
![Figure 29](./images/Picture29.png "Figure 29")

5.	The Codon Trees pipeline generates several different formats of images of the phylogenetic tree.  The **.pdf** file contains the portable document format showing a midpoint rooted phylogenetic tree. 
![Figure 30](./images/Picture30.png "Figure 30")

6.	The Codon Trees pipeline also produces a portable graphic format (**.png**).
![Figure 31](./images/Picture31.png "Figure 31")

7.	A Scalable Vector Graphics (**.svg**) file, an XML-based two-dimensional graphic file format, is also produced. It is a publication quality image that is best downloaded.
![Figure 32](./images/Picture32.png "Figure 32")

8.	The **proteins.phy** file shows the aligned, trimmed, and concatenated sequences suitable to submission to RaxML. 
![Figure 33](./images/Picture33.png "Figure 33")

9.	The **report.html** file provides a detailed report on the phylogenetic tree.  This will be discussed below.
![Figure 34](./images/Picture34.png "Figure 34")

10.	The **treeWithGenomeIds.nwk** file contains the newick file.  Newick files are the instructions for building the phylogenetic tree. These files should be downloaded, and opened in viewer that can interpret them, where they can be adjusted to create the best possible image. Two viewers that we recommend are FigTree[6] and the Interactive Tree of Life (ITOL)[7]. The Codon Trees pipeline provide two different versions of **newick (.nwk)** for download. The **codontree_treeWithGenomeIDs.nwk** shows the IDs for all the genomes in the tree, which will be visible as the leaves. 
![Figure 35](./images/Picture35.png "Figure 35")

11.	The **Detail_files folder** contains additional files associated with the Codon Trees job.  Double click on the row that contains the folder.  
![Figure 36](./images/Picture36.png "Figure 36")

12.	This will rewrite the page to show the contents of the folder. 
![Figure 37](./images/Picture37.png "Figure 37")

13.	The **analysisStats** file gives the statistics for the Codon Tree job, including the number of genomes, protein alignments, aligned amino acids, gene (CGS) alignments, aligned nucleotides and a list of the protein families used.  This information is also available in the html file and can be downloaded. 
![Figure 38](./images/Picture38.png "Figure 38")

14.	The **genesPerGenome.txt** file shows the Genome IDs, the number of genes in that genome, the number of those genes that were single copy, and the number of genes viewed.  The file can be downloaded or viewed by clicking the **View** icon. This information is also available in the html file. 
![Figure 39](./images/Picture39.png "Figure 39")

15.	The **homologAlignmentStats.txt** file shows the statistics for each of the protein families used in the Codon Tree job.  The information includes the protein family ID, the number of gaps, the mean squared frequency (This calculates the frequency of each letter per column and then sum the square for each column, which would be 1.0 if all had the same letter), the number of positions in the alignment for that family, the number of sequency from all the genomes, the proportion of the alignment that consists of gap characters, the sum squared frequency (The sum of all the mean squared frequencies in the alignment, which is used to select the best alignment.) and the an indication if the protein family was used in the analysis.  The file can be downloaded or viewed in the page by clicking the **View** icon. 
![Figure 40](./images/Picture40.png "Figure 40")

16.	The **homologsAndGenesIncludedInAlignment.txt** file gives a list of the protein families and the unique identifier for each protein/gene used in the alignment. The file can be downloaded or viewed in the page by clicking the **View** icon. 
![Figure 41](./images/Picture41.png "Figure 41")

17.	The **nex** file is used to generate the graphics in a program like FigTree.  It contains parameters that tells the graphics file how to draw it.  It can be downloaded by clicking the **Download** icon. 
![Figure 42](./images/Picture42.png "Figure 42")

18.	The **partitions** file tells RaxML which alignment columns are first, second or third codon position nucleotides, or amino acids. It can be downloaded by clicking the **Download** icon. 
![Figure 43](./images/Picture43.png "Figure 43")

19. The **phy** file is the concatenated alignment in PHYLIP format.  This is a very large file and can be downloaded by clicking the Download icon. 
![Figure 44](./images/Picture44.png "Figure 44")

20.	The **raxmlcommand.sh** provides the command script to run the pipeline for the tree that was generated.  It can be run on your personal computer, can be downloaded by clicking the **Download** icon. 
![Figure 45](./images/Picture45.png "Figure 45")

21.	The **tipsAligned.pdf** file shows the midpoint rooted phylogenetic tree with the names of genomes aligned. It can be downloaded by clicking the **Download** icon. 
![Figure 46](./images/Picture46.png "Figure 46")

22. The **tipsAligned.png** shows the same tree as above, but in a portable graphic format.  It can viewed by clicking on the **View** icon or downloaded. A scaled vector graph (**SVG**) of the same tree is also available. 
![Figure 47](./images/Picture47.png "Figure 47")

23.	The **treewithGenomeNames.nwk** is a newick file that has genome names as the leaves of the tree.  It can be downloaded or viewed by clicking the appropriate icons. 
![Figure 48](./images/Picture48.png "Figure 48")

24.	The **RaxML_info** file has details on the RaxML run. 
![Figure 49](./images/Picture49.png "Figure 49")

25.	The **tree.log** file has the output of the steps that the Codon Tree pipeline took when generating the tree. 
![Figure 50](./images/Picture50.png "Figure 50")

## Phylogenetic Tree Report

1.	The **report.html** file provides a detailed report on the phylogenetic tree.  The report brings together many of the files available in the details folder.  To view the report, click on the row that has the **report.html** file, and then click on the View icon in the vertical green bar. 
![Figure 51](./images/Picture51.png "Figure 51")

2.	This will rewrite the page to show the report, the top of which contains the midpoint rooted phylogenetic tree. 
![Figure 52](./images/Picture52.png "Figure 52")

3.	Clicking on the **Alternate View** will show the same tree with the genome names aligned. 
![Figure 53](./images/Picture53.png "Figure 53")

4.	Scrolling down the report will show the will show the statistics associated with the tree. 
![Figure 54](./images/Picture54.png "Figure 54")

5.	Scrolling further down the report will show the RaxML command line that was run to generate the tree. 
![Figure 55](./images/Picture55.png "Figure 55")

6.	Scrolling down further will show the partitions information, and the genome statistics. 
![Figure 56](./images/Picture56.png "Figure 56")

7.	This is followed by the Gene Family Statistics. 
![Figure 57](./images/Picture57.png "Figure 57")

8.	If the phylogenetic tree did not contain the number of genes originally selected, the report will include a section on strategies to increase the number of genes.  It will give the list of genome IDs that could be removed from the tree, and the number of genes that would be included in the tree if they were omitted. 
![Figure 58](./images/Picture58.png "Figure 58")

## Viewing the Phylogenetic tree

1.	BV-BRC also allows researchers to view the tree in the workspace, and link to other parts of the resource from the tree.  Click on the View icon in the upper right corner. 
![Figure 59](./images/Picture59.png "Figure 59")

2.	This will open an interactive viewer in BV-BRC where the names are colored based on sharing the same genus (or first name) of the genome. 
![Figure 60](./images/Picture60.png "Figure 60")

3.	The leaves of the tree can be changed by clicking on the **ID Type** in the vertical green bar.  Clicking on **Genome ID** will change the view from the names of the genomes to their unique identifiers. 
![Figure 61](./images/Picture61.png "Figure 61")

4.	When a particular node of a branch (shown as a circle) is clicked on, all the genomes that are on that branch are selected (indicated by a check mark). This will change the icons in the vertical green bar, and researchers will be able to go to a view that includes all the genomes (Click on **Genome** in the vertical green bar) or create a group (Click on **Group** in the vertical green bar). 
![Figure 62](./images/Picture62.png "Figure 62")

5.	Clicking on the dot in front of a genome will also populate the vertical green bar with additional icons.  Click on the **Genome** icon. 
![Figure 63](./images/Picture63.png "Figure 63")

6.	This will open a new tab that has the landing page for the selected genome. 
![Figure 64](./images/Picture64.png "Figure 64")

## References

1.	Davis, J.J., et al., PATtyFams: Protein families for the microbial genomes in the PATRIC database. 2016. 7: p. 118.
2.	Edgar, R.C.J.N.a.r., MUSCLE: multiple sequence alignment with high accuracy and high throughput. 2004. 32(5): p. 1792-1797.
3.	Cock, P.J., et al., Biopython: freely available Python tools for computational molecular biology and bioinformatics. 2009. 25(11): p. 1422-1423.
4.	Stamatakis, A., RAxML version 8: a tool for phylogenetic analysis and post-analysis of large phylogenies. Bioinformatics, 2014. 30(9): p. 1312-1313.
5.	Stamatakis, A., P. Hoover, and J. Rougemont, A rapid bootstrap algorithm for the RAxML web servers. Systematic biology, 2008. 57(5): p. 758-771.
6.	Rambaut, A., FigTree, a graphical viewer of phylogenetic trees. 2007.
7.	Letunic, I. and P. Bork, Interactive Tree Of Life (iTOL): an online tool for phylogenetic tree display and annotation. Bioinformatics, 2006. 23(1): p. 127-128.