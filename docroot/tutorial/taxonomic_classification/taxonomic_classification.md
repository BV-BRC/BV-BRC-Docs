# Taxonomic Classification Service
Metagenomics is the study of genomic sequences obtained directly from an environment. For many metagenomic samples, the species, genera and even phyla present in the sample are largely unknown at the time of sequencing, and the goal of sequencing is to determine the microbial composition as precisely as possible. The BV-BRC Taxonomic Classification service can be used to identify the microbial composition of metagenomic samples. Researchers can submit their metagenomic samples that are reads (paired-or single-end, long or short, zipped or not) or contigs to the service, as well as the Sequence Read Archive accession numbers. This service uses Kraken 2[1]. Kraken, first released in 2014, has been shown to provide exceptionally fast and accurate classification for shotgun metagenomics sequencing projects. Kraken 2, which matches the accuracy and speed of Kraken 1, supports 16S rRNA databases.  Kraken uses exact-match database queries of k-mers, rather than inexact alignment of sequences.  Sequences are classified by querying the database for each k-mer in a sequence, and then using the resulting set of lowest common ancestor (LCA) taxa to determine an appropriate label for the sequence.

## I. Locating the Taxonomic Classification Service App

1\. At the top of any BV-BRC page, find the Services tab.
![Figure 1](./images/Picture1.png "Figure 1") 

2\. Click on Taxonomic Classification in the Metagenomics group.
![Figure 2](./images/Picture2.png "Figure 2") 

3\. This will open up the Taxonomic Classification landing page where researchers can submit long reads, single or paired read files, an SRA run accession number, or assembled contigs to the service.
![Figure 3](./images/Picture3.png "Figure 3") 


## II. Uploading paired end reads

Paired read libraries are usually given as file pairs, with each file containing the forward or reverse half of each read pair. Paired read files are expected to be sorted in such a way that each read in a pair occurs in the same Nth position as its mate in their respective files. These files are specified as READ FILE 1 and READ FILE 2. For a given file pair, the selection of which file is READ 1 or READ 2 does not matter.

1\. To upload a fastq file that contains paired reads, locate the box called “Paired read library.” 
![Figure 4](./images/Picture4.png "Figure 4") 

2\. The reads must be located in the workspace to submit them to a BV-BRC service.  To initiate the upload, first click on the folder icon. 
![Figure 5](./images/Picture5.png "Figure 5") 

3\. This opens up a pop-up window where the files for upload can be selected.  Click on the icon with the arrow pointing up. 
![Figure 6](./images/Picture6.png "Figure 6") 

4\. This opens a new pop-up window where the file can be selected.  Click on the “Select File” in the blue bar.
![Figure 7](./images/Picture7.png "Figure 7") 

5\. This will open a window that allows you to choose files that are stored on your computer.  Select the file where you stored the fastq file and click “Open”.
![Figure 8](./images/Picture8.png "Figure 8") 

6\. Once selected, it will autofill the name of the file. You can see it in the screenshot below. Click on the Start Upload button.
![Figure 9](./images/Picture9.png "Figure 9") 

7\. This will auto-fill the name of the document into the text box as seen below.
![Figure 10](./images/Picture10.png "Figure 10") 

8\. Pay attention to the upload monitor in the lower right corner of the BV-BRC page. It will show the progress of the upload. Do not submit the job until the upload is 100% complete. 
![Figure 11](./images/Picture11.png "Figure 11") 

9\. Repeat steps 2-5 to upload the second pair of reads.
![Figure 12](./images/Picture12.png "Figure 12") 

10\. To finish the upload, click on the icon of an arrow within a circle. This will move your file into the Selected libraries box.
![Figure 13](./images/Picture13.png "Figure 13") 

## III. Uploading single reads

1\. To upload a fastq file that contains single reads, locate the text box called “Single read library.”
![Figure 14](./images/Picture14.png "Figure 14") 

2\. If the reads have previously been uploaded, click the down arrow next to the text box below Read File.
![Figure 15](./images/Picture15.png "Figure 15") 

3\. This opens up a drop-down box that shows the all the reads that have been previously uploaded into the user account. Click on the name of the reads of interest.
![Figure 16](./images/Picture16.png "Figure 16") 

4\. This will auto-fill the name of the document into the text box as seen below.
![Figure 17](./images/Picture17.png "Figure 17") 

5\. To finish the upload, click on the icon of an arrow within a circle. This will move your file into the Selected libraries box.
![Figure 18](./images/Picture18.png "Figure 18") 

## IV. Submitting reads that are present at the Sequence Read Archive (SRA)
1\. BV-BRC also supports analysis of existing datasets from SRA. To submit this type of data, locate the Run Accession number and copy it.
![Figure 19](./images/Picture19.png "Figure 19") 

2\. Paste the copied accession number in the text box underneath SRA Run Accession, then click on the icon of an arrow within a circle.
![Figure 20](./images/Picture20.png "Figure 20") 

3\. This will move the file into the Selected libraries box.
![Figure 21](./images/Picture21.png "Figure 21") 

## V. Submitting assembled contigs

1\. To submit a taxonomic classification job that uses contigs, click on the check box in front of Assembled Contigs in the upper box. Clicking on the folder icon.
![Figure 22](./images/Picture22.png "Figure 22") 

2\. This will open a pop-up window that shows data in the private workspace that can be selected. The upload icon in the upper right can also be used to upload contig files that might exist on your computer.
![Figure 23](./images/Picture23.png "Figure 23") 

3\. Clicking on the down arrow next to the contigs text box will show fasta files (ending in .fa or .fasta) that have been recently accessed in the private workspace.
![Figure 24](./images/Picture24.png "Figure 24") 

## VI. Selecting parameters

Parameters must be selected prior to job submission. The algorithm used for Taxonomic Classification is Kraken21, which uses exact alignment of k-mers for classification accuracy. The Kraken2 algorithm was downloaded from the following source: https://ccb.jhu.edu/software/kraken2/
The only database selection currently is only “All genomes”.
![Figure 25](./images/Picture25.png "Figure 25") 

1\. You can choose to save the classified sequences (meaning that those reads or contigs that mapped to the k-mers in the all genomes database) and/or the unclassified sequences (those that do not map to those k-mers).  If either (or both) of those options are selected, the files will be available in the output folder when the job is completed.
![Figure 26](./images/Picture26.png "Figure 26")  

2\. A folder must be selected for the Taxonomic Classification job. Clicking on the down arrow at the end of the text box underneath Output Folder will show recent folders that have been used. Clicking on the folder icon at the end of the text box will open a pop-up window where all folders can be viewed, or new folders created. You can also start typing the name of a folder in the text box.  A drop-down box will appear that shows folders that match what you entered.
![Figure 27](./images/Picture27.png "Figure 27") 

3\. Click on the desired folder.
![Figure 28](./images/Picture28.png "Figure 28") 

4\. The name of the folder will now appear in the box.  
![Figure 29](./images/Picture29.png "Figure 29") 

5\. A name for the job must be entered in the text box under Output Name. At this point, the Submit button turns blue and the job will be submitted once clicked.  
![Figure 30](./images/Picture30.png "Figure 30") 

6\. After clicking the submit button, your job will be launched.  A successful submission will generate a message indicating that the job has been queued.  
![Figure 31](./images/Picture31.png "Figure 31") 

The bottom of each BV-BRC page has an indicator that shows the number of jobs that are queued, running or completed. Clicking on the word Jobs will rewrite the page to show the Job status. Researchers can monitor the Jobs Status page to see the status of their job, which is indicated in the first column (Queued, Running, Complete, Failed).
![Figure 32](./images/Picture32.png "Figure 32") 

## VII. Viewing the Taxonomic Classification job – Output files

1\. To access your job, you can click on the Jobs part of your Jobs monitor.
![Figure 33](./images/Picture33.png "Figure 33") 

2\. This will open your Jobs page.
![Figure 34](./images/Picture34.png "Figure 34") 

3\. Clicking on the row that contains the job of interest will open two icons in the vertical green bar.  To view the job, click on the View icon.
![Figure 35](./images/Picture35.png "Figure 35") 

4\. This will open a pop-up window where issues with particular jobs can be reported. A description of the particular problem can be provided and clicking the submission button will generate a message to BV-BRC team members, notifying them that there has been a problem. We encourage researchers to report all failed jobs, or those that have results that are confusing. In addition, researchers should report long waits that they are experiencing in the queue.
![Figure 36](./images/Picture36.png "Figure 36") 

5\. A job that has been successfully completed can be viewed by clicking on the row (which will turn the row blue) and then clicking on the View icon in the vertical green bar.
![Figure 37](./images/Picture37.png "Figure 37") 

6\. This will open a page for the selected job. The top box has the job ID number and gives pertinent information about the time it took to complete and the selected parameters. The lower table has five output file, but if the classified an/or unclassified reads are selected when the job was submitted, it will have one or two additional rows.
![Figure 38](./images/Picture38.png "Figure 38") 

7\. Click on the TaxonomicReport.html. This will populate the vertical green bar with a number of icons. Click on the Guide icon.
![Figure 39](./images/Picture39.png "Figure 39") 

8\. This will open a new tab where you can see the Quick Reference Guide for this particular page, describing what you are seeing on the output page.
![Figure 40](./images/Picture40.png "Figure 40") 

9\. Back on the output page, in the vertical green bar you will see icons for downloading the data, viewing it, deleting the file, renaming the file, copying or sharing it with another BV-BRC user, moving it to a different director, or changing the type tagged to the file. With the TaxonomicReport.html file selected, click on the View icon.
![Figure 41](./images/Picture41.png "Figure 41") 

10\. This will rewrite the page to show Kraken2’s standard output report format. 
![Figure 42](./images/Picture42.png "Figure 42") 

11\. The top of the TaxonomicReport.html page includes the SRA run accession number (if that was used).  This is a hyperlink and clicking on it will open a new tab that shows the landing page for the data in the Sequence Read Archive.
![Figure 43](./images/Picture43.png "Figure 43") 

12\. Further down in the TaxonomicClassification.html page, there is a line that says “Results: (Click here to view Interactive Chart).  Clicking on that will open an interactive, visual description of the results using Krona[2].
![Figure 44](./images/Picture44.png "Figure 44") 

13\. This view has a search box at the top of the page.  Entering any text will search the graph for text that matches the entry.
![Figure 45](./images/Picture45.png "Figure 45") 

14\. At the top of the view, there are several controls that can be used to change the visualization or download the data.
![Figure 46](./images/Picture46.png "Figure 46")  

15\. The image can be downloaded by clicking on the Download icon at the top of this page.
![Figure 47](./images/Picture47.png "Figure 47") 

16\. The number of circles shown in the graph can be changed by increasing the number (+) or decreasing the number (-) using the Max depth function.
![Figure 48](./images/Picture48.png "Figure 48") 

17\. The font size in the visualization can be changed by using the buttons to decrease (-) or increase (+) it in front of the words Font size.
![Figure 49](./images/Picture49.png "Figure 49") 

18\. Change the chart size.
![Figure 50](./images/Picture50.png "Figure 50") 

19\. You can see the taxonomy spectrum by clicking on a region of interest in the Krona chart.  This will rewrite the view to show how the data mapped within the particular taxon selected.
![Figure 51](./images/Picture51.png "Figure 51") 

20\. Following the changes, a snapshot of the new image can be downloaded by clicking on Snapshot.
![Figure 52](./images/Picture52.png "Figure 52") 

21\. A shareable link will also be generated if Link is clicked.
![Figure 53](./images/Picture53.png "Figure 53") 

22\. A link to the Krona documentation can be viewed by clicking on the question mark (?) icon.
![Figure 54](./images/Picture54.png "Figure 54") 

23\. Going back to the TaxonomicReport.html page, and underneath the link to the Krona diagram is a table that shows Kraken 2’s standard sample report format, which is tab-delimited with one line per taxon. The fields of the output, from left-to-right, are as follows:

   * Percentage of fragments covered by the clade rooted at this taxon
   * Number of fragments covered by the clade rooted at this taxon
   * Number of fragments assigned directly to this taxon
   * A rank code, indicating (U)nclassified, (R)oot, (D)omain, (K)ingdom, (P)hylum, (C)lass, (O)rder, (F)amily, (G)enus, or (S)pecies. Taxa that are not at any of these 10 ranks have a rank code that is formed by using the rank code of the closest ancestor rank with a number indicating the distance from that rank. E.g., “G2” is a rank code indicating a taxon is between genus and species and the grandparent taxon is at the genus rank.
   * NCBI taxonomic ID number
   * Indented scientific name
![Figure 55](./images/Picture55.png "Figure 55") 

24\. Clicking on any of the names in the blue text will open the landing page for the selected taxon. 
![Figure 56](./images/Picture56.png "Figure 56") 

25\. Returning to the job output page, click the chart.html row and then click the View icon. This will re-write the page with the Kronos image described above.
![Figure 57](./images/Picture57.png "Figure 57") 

26\. The full_report.txt is a downloadable text file of the results seen in the report.txt file, but also includes taxonomy entries for which there were zero hits. To view this file, select the row and then click on the View icon.
![Figure 58](./images/Picture58.png "Figure 58") 

27\. The full report contains any taxonomy entry which has one percent or more of the total hits, but also includes taxonomy entries for which there were zero hits.
![Figure 59](./images/Picture59.png "Figure 59") 

28\. The output.txt.gz contains information about each input sequence. This will be a large file that should be downloaded in order to view it.
![Figure 60](./images/Picture60.png "Figure 60") 

29\. The report.txt report can be viewed by selecting the row and then clicking on the View icon in the vertical green bar.
![Figure 61](./images/Picture61.png "Figure 61") 

30\. This will rewrite the page to show the report.  It  contains any taxonomy entry which has one percent or more of the total hits.
![Figure 62](./images/Picture62.png "Figure 62") 

## References
1. Lu, J. & Salzberg, S. L. Ultrafast and accurate 16S rRNA microbial community analysis using Kraken 2. Microbiome 8, 1-11 (2020).
2. Ondov, B. D., Bergman, N. H. & Phillippy, A. M. Interactive metagenomic visualization in a Web browser. BMC bioinformatics 12, 385 (2011).