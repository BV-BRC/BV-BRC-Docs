# Metagenomic Read Mapping

The Metagenomic Read Mapping Service uses KMA (k-mer alignment[1]), to align reads against antibiotic resistance genes or virulence factors. KMA maps raw reads directly against these databases and uses k-mer seeding to speed up mapping and the Needleman-Wunsch algorithm to accurately align extensions from k-mer seeds. Software for KMA was downloaded at the following location: https://bitbucket.org/genomicepidemiology/kma.

## Creating a folder to hold the Metagenomic Read Mapping job and related data

Please refer to the [Genome Assembly Service tutorial](../genome_assembly/assembly.html) for instructions on creating a folder in the workspace.

## Locating the Metagenomic Read Mapping App

1.	Click on the Services tab at the top of the page, and then click on Metagenomic Read Mapping. 
![Figure 1](./images/Picture1.png "Figure 1")

2.	This will open the landing page for the service. 
![Figure 2](./images/Picture2.png "Figure 2")

## Input File

**Uploading paired end reads**
Please refer to the [Genome Assembly Service tutorial](../genome_assembly/assembly.html) for instructions on uploading paired-end reads. 

**Uploading single reads**
Please refer to the [Genome Assembly Service tutorial](../genome_assembly/assembly.html) for instructions on uploading single reads. 

**Submitting reads that are present at the Sequence Read Archive (SRA)**
Please refer to the [Genome Assembly Service tutorial](../genome_assembly/assembly.html) for instructions on submitting reads from the Sequence Read Archive. 

1.	Once read files have been uploaded or located, the files must be transferred prior to the job beginning.  Click on the icon of an arrow within a circle. This will move your file into the **Selected libraries** box. 
![Figure 3](./images/Picture3.png "Figure 3")

## Parameters

1.	Click on the down arrow at the end of the text box under Predefined Gene Set Name to see the possible selections. The Metagenomic Mapping Read service has two gene sets to choose from. The Comprehensive Antibiotic Resistance Database (**CARD**)[2] is the current gold standard for antimicrobial resistance genes. It is a manually curated resource containing high quality reference data on the molecular basis of antimicrobial resistance (AMR) that emphasizes genes, proteins and mutations that are involved in AMR. The Virulence Factor Database (**VFDB**)[3] is the current gold standard reference source for virulence factors, providing up-to-date knowledge of virulence factors from various bacterial pathogens. Select either CARD or VFDB as the gene set. 
![Figure 4](./images/Picture4.png "Figure 4")

2.	A folder must be selected for the Metagenomic Read Mapping job. Begin typing a name in the text box underneath **Output Folder** will show all folders that match that text, or click on the down arrow to show recent folders, or clicking on the folder icon at the end of the text box will open a pop-up window where all folders can be viewed.  Clicking on the desired folder will populate the text box with its name. 
![Figure 5](./images/Picture5.png "Figure 5")

3.	A name for the job must be entered in the text box under **Output Name**.  
![Figure 6](./images/Picture6.png "Figure 6")

## Submitting the Metagenomic Read Mapping job

1.	After the reads and parameters have been selected, the Submit button turns blue and the job will be submitted once clicked. 
![Figure 7](./images/Picture7.png "Figure 7")

2.	A successful submission will generate a message indicating that the job has been queued. 
![Figure 8](./images/Picture8.png "Figure 8")

## Monitoring progress on the Jobs page

1.	Click on the Jobs box at the bottom right of any BV-BRC page. 
![Figure 9](./images/Picture9.png "Figure 9")

2.	This will open the Jobs Landing page where the status of submitted jobs is displayed. 
![Figure 10](./images/Picture10.png "Figure 10")

## Viewing the Metagenomic Read Mapping job results

1.	On the jobs page, click on the row that has the job of interest.  This will populate the vertical green bar on the right with possible downstream steps, which include viewing the results of the job, or reporting an issue that was experienced (like a job failure).  Click on the **View** icon. 
![Figure 11](./images/Picture11.png "Figure 11")

2.	This will rewrite the page to show the information about the metagenomic read mapping job, and all of the files that are produced when the pipeline runs.  The information about the job submission can be seen in the table at the top of the results page.  To see all the parameters that were selected when the job was submitted, click on the **Parameters** row. 
![Figure 12](./images/Picture12.png "Figure 12")

3.	This will show the information on what was selected when the job was originally submitted. 
![Figure 13](./images/Picture13.png "Figure 13")

4.	To examine the **MetagenomicReadMappingReport.html**, click on the **View** icon. 
![Figure 14](./images/Picture14.png "Figure 14")

5.	This page shows KMA’s standard sample report format. The fields of the output, from left-to-right, are as follows:
   * **Template**: Identifier of the template (reference gene) sequence that match the query reads
   * **Function**: Template gene function
   * **Genome**: Genome that contains template gene
   * **Score**: Global alignment score of the template
   * **Expected**: Expected alignment score if all mapping reads were smeared over all templates in the database
   * **Template_length**: Template gene length in nucleotides
   * **Template_Identity**: Percent identity between the query and template sequence, over the length of the matching template sequence
   * **Template_Coverage**: Percent of the template that is covered by the query
   * **Query_Identity**: Percent identity between the query and template sequence, over the length of the matching query sequence
   * **Query_Coverage**: Length of the matching query sequence divided by the template length
   * **Depth**: Number of times the template has been covered by the query.
   * **q_value**: Quantile from McNemars test, to test whether the current template is a significant hit.
   * **p_value**: p-value corresponding to the obtained q_value 
![Figure 15](./images/Picture15.png "Figure 15")

6.	Clicking on any of the template identifiers in the first column, called **#Template**, will open a Specialty Gene List View that shows all the genes in the BV-BRC that have BLAT[4] hits to the same template gene. 
![Figure 16](./images/Picture16.png "Figure 16")

7.	Clicking on the name in the **Genome** column will open a new tab that shows the Genome List view, which shows all the genomes in the BV-BRC that fall under the same taxonomy of the selected name. 
![Figure 17](./images/Picture17.png "Figure 17")

8.	To see an alignment details, click on the **kma.aln** row and then on the **View** icon.  This will open a text file that shows the alignment between the template and the submitted query sequence. 
![Figure 18](./images/Picture18.png "Figure 18")

9.	The **kma.frag.gz** file should be downloaded. It has mapping information on each mapped read, and the columns found in the download are as follows: read, number of equally well mapping templates, mapping score, start position, end position (w.r.t. template), the chosen template. 
![Figure 19](./images/Picture19.png "Figure 19")

10.	The **kma.fsa** can be viewed in the workspace. Select the row and click on the **View** icon.  It shows the consensus sequence drawn from the alignment. 
![Figure 20](./images/Picture20.png "Figure 20")

11.	The **kma.res** file can be downloaded or viewed in the workspace. Click on the row and click on the **View** icon.  This is the text file that matches the **MetagenomicReadMapping.html** file. 
![Figure 21](./images/Picture21.png "Figure 21")

## References 

1.	Clausen, P.T., F.M. Aarestrup, and O. Lund, Rapid and precise alignment of raw reads against redundant databases with KMA. BMC bioinformatics, 2018. 19(1): p. 307.
2.	Alcock, B.P., et al., CARD 2020: antibiotic resistome surveillance with the comprehensive antibiotic resistance database. Nucleic acids research, 2020. 48(D1): p. D517-D525.
3.	Liu, B., et al., VFDB 2019: a comparative pathogenomic platform with an interactive web interface. Nucleic acids research, 2019. 47(D1): p. D687-D692.
4.	Kent, W.J., BLAT—the BLAST-like alignment tool. Genome research, 2002. 12(4): p. 656-664.
