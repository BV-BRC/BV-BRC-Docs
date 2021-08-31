# Protein Family Sorter Tool

The Protein Family Sorter tool enables researchers to examine the distribution of specific protein families across different genomes.  The tool uses PATtyFams[1], the protein families that are assigned in the BV-BRC annotation process.  There are two types of PATtyFams.  The global families, known as **PGFams**, can be used for cross genus comparisons.  The local families (**PLFams**) are for intra-genus comparisons.

## Locating the Protein Family Sorter App

1.	At the top of any BV-BRC page, find the Services tab and click on Protein Family Sorter. 
![Figure 1](./images/Picture1.png "Figure 1")

2.	This will open up the Protein family Sorter landing page. 
![Figure 2](./images/Picture2.png "Figure 2")

## Selecting Genomes

1.	To include any genome (reference, representative, other public, or private genomes), click on the filter button to narrow the selection and deselect the categories that are not of interest. 
![Figure 3](./images/Picture3.png "Figure 3")

2.	Typing in the text box will show a list of the genomes available that contain that text. Private genomes are indicated by a **Lock** icon. Once the genome of interest is located, clicking on it will fill the box. 
![Figure 4](./images/Picture4.png "Figure 4")

3.	The genome must be added to the genomes for comparison, a box in the Selected Genomes box. Click on the arrow at the upper right of the Select Genome box (and the name of the genome will appear in the Selected Genomes box. 
![Figure 5](./images/Picture5.png "Figure 5")

## Selecting Genome Groups

1.	To select a genome group, go to the Select Genome Group box and click on the down arrow that follows the text box. That will show a list of all the genome groups, with the most recently created appearing at the top of the list. 
![Figure 6](./images/Picture6.png "Figure 6")

2.	Entering a name (or part of a name) in the text box will populate the drop-down box with possible groups that match that text. 
![Figure 7](./images/Picture7.png "Figure 7")

3.	Clicking on the genome group of interest will make the name appear in the text box. 
![Figure 8](./images/Picture8.png "Figure 8")

4.	The genome group must be added to the genomes for comparison, a box in the **Select Genomes** box. Click on the arrow at the upper right of the **Select Genome** box and the name of the genome will appear in the box. This can be repeated until all the genome groups or genomes of interest, have been added to the Selected Genomes box. 
![Figure 9](./images/Picture9.png "Figure 9")

## Selecting Protein Family Type

1.	BV-BRC offers three types of protein families. The default, PGFams, are protein families that cross the genus boundary. PLFams are protein families across a genus. FigFams[2] are an older protein family that is not updated, where the protein families are united by function. Clicking on the down arrow at the end of the text box under Family Type will show the two types of protein families. Clicking on one will select it for the analysis.
![Figure 10](./images/Picture10.png "Figure 10")

## Submitting the Protein Family Sorter job

1.	Once the genomes, genome groups, and type of protein families are selected, the job will be initiated by clicking the submit button. The selected data will begin loading. 
![Figure 11](./images/Picture11.png "Figure 11")

2.	This will rewrite the page, which may take some time to load depending upon the number and size of the selected genomes. 
![Figure 12](./images/Picture12.png "Figure 12")

## Filtering the Protein Family Table

1.	The page will reload to show the Protein Family Table view.  This contains a dynamic filter on the left, and a table on the right that shows all the families based on the selections of the filter. 
![Figure 13](./images/Picture13.png "Figure 13")

2.	The Protein Family Sorter loads showing all the protein families across all the genomes. This is the **Pan Genome**. 
![Figure 14](./images/Picture14.png "Figure 14")

3.	The Core Genome can be seen by clicking on the box in the column head below Present in all families. This will select all the genomes in the list and will reload the table to show all the protein families that are in that selection. 
![Figure 15](./images/Picture15.png "Figure 15")

4.	The **Accessory Genome** for a species can be seen by first clicking on the box in the column head below **Absent** in all families and then clicking on the text box in the **Either/Mixed** column in front of each genome of interest. This will select all the genomes in the list and will reload the table to show all the protein families that are in that selection. 
![Figure 16](./images/Picture16.png "Figure 16")

5.	The **Accessory Genome** for a single genome can be seen by first clicking on the box in the column head below **Absent** in all families and then clicking on the text box in the **Present** column in front of the genome of interest. This will select all the genomes in the list and will reload the table to show all the protein families that are in that selection. 
![Figure 17](./images/Picture17.png "Figure 17")

6.	The text filter box can be used to find protein families that contain specific names. Enter a name of interest and click the filter button. This will re-filter the table to show the protein families that contain that text in the functional description. 
![Figure 18](./images/Picture18.png "Figure 18")

7.	The text box filter can also be used to find protein family IDs, which is an excellent way to see presence and absence across a group of genomes.  Entering the IDs in the table and then clicking on the filter icon will reload the table to show the protein families that meet that criterion. 
![Figure 19](./images/Picture19.png "Figure 19")

8.	There are additional filtering options below the text box.  This includes protein families meeting particular criteria.  One important filter is Perfect Families.  In BV-BRC, perfect families refer to those protein families where each of the genomes have a single protein that is part of the family.  This is an important default for the **Phylogenetic Tree Service**, which could be used to see if a group of genomes are “tree-able.” 
![Figure 20](./images/Picture20.png "Figure 20")

9.	The “non-perfect” protein families can also be examined, both selecting the **Non perfect Families** button, or filtering by the **Number of Proteins per Family**. 
![Figure 21](./images/Picture21.png "Figure 21")

10. The number of **Genomes per Family** can also be examined. 
![Figure 22](./images/Picture22.png "Figure 22")

## Protein Family Sorter – Heatmap

1.	The presence and/or absence of protein families can also be seen in a heatmap view. To see the heatmap, click on the Heatmap icon above the filter. This will reload the page to show the heatmap. 
![Figure 23](./images/Picture23.png "Figure 23")

2.	A filter is directly above the heatmap.  
![Figure 24](./images/Picture24.png "Figure 24")

3.	A text box filter will highlight columns that have protein families that have text that matches the text entered into the box.  This is indicated by a blue box above the column. 
![Figure 25](./images/Picture25.png "Figure 25")

4.	Expanding the slider at the top of the heatmap view will allow researchers to expand the view enough to see the protein family name.  Note that the text in the name that matches the filter criterion will be highlighted blue.  In addition, a blue line remains directly above the column. 
![Figure 26](./images/Picture26.png "Figure 26")

5.	Researchers can flip the axis of the heatmap view if desired. 
![Figure 27](./images/Picture27.png "Figure 27")

6.	The protein families can also be clustered.  This will rearrange the order of both the genomes and the protein families, depending on the clustering algorithm selected. 
![Figure 28](./images/Picture28.png "Figure 28")

7.	Clicking on **Advanced** will show the different clustering options. 
![Figure 29](./images/Picture29.png "Figure 29")

8.	BV-BRC allows researcher to cluster by either **Protein Families**, **Genomes**, or **Both**.  The default is set to Both. 
![Figure 30](./images/Picture30.png "Figure 30")

9.	To see the **Clustering algorithm** choices, click on the down arrow that follows **Pearson correlation**, which is the default setting. 
![Figure 31](./images/Picture31.png "Figure 31")

10.	Four types of clustering are available.  To see the options, click on the down arrow underneath **Clustering type** that follows **Pairwise average-linkage**, which is the default setting. 
![Figure 32](./images/Picture32.png "Figure 32")

11.	 Choosing different clustering options will change the heatmap. 
![Figure 33](./images/Picture33.png "Figure 33")

12. The protein family sorter allows users to see the protein families in the order that they appear in any given genome. This process is called anchoring a genome. To re-order the protein families, click on the **Anchor** icon. This will open a pop-up window where you can select a genome.  If you click on the down arrow that follows the words, **Select a genome**. 
![Figure 34](./images/Picture34.png "Figure 34")

13. This will open a drop-down box of all the genomes available in the group.  The heatmap will rearrange in the order of the selected genome, starting with the first gene annotate in that genome to the last.  Researchers will be able to see regions of the reference genome that are absent in some of the comparison genomes. 
![Figure 35](./images/Picture35.png "Figure 35")

14.	Mousing over individual cells in a column will open a pop-up window that shows the genome, the protein family name and ID, and the number of genes that the genome has in that family. 
![Figure 36](./images/Picture36.png "Figure 36")

15. Areas within the heatmap can be examined.  To so this, use the mouse to draw a box over the area of interest in a heatmap, which is indicated by the blue box in the figure below.  This will open a pop-up window that show the number of genomes in the selection, the number of families within it, and the number of genes/proteins (called **Members**) within the selection. 
![Figure 37](./images/Picture37.png "Figure 37")

16. Clicking on Show Proteins will open a new tab showing the Features (aka genes/proteins) that were part of that selection. 
![Figure 38](./images/Picture38.png "Figure 38")

## References

1.	Davis, J.J., et al., PATtyFams: Protein families for the microbial genomes in the PATRIC database. 2016. 7: p. 118.
2.	Meyer, F., R. Overbeek, and A. Rodriguez, FIGfams: yet another set of protein families. Nucleic acids research, 2009. 37(20): p. 6643-6654.
