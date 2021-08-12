# Taxonomic Classification
Metagenomics is the study of genomic sequences obtained directly from an environment. For many metagenomic samples, the species, genera and even phyla present in the sample are largely unknown at the time of sequencing, and the goal of sequencing is to determine the microbial composition as precisely as possible. The BV-BRC Taxonomic Classification service can be used to identify the microbial composition of metagenomic samples. Researchers can submit their metagenomic samples that are reads (paired-or single-end, long or short, zipped or not) or contigs to the service, as well as the Sequence Read Archive accession numbers. This service uses Kraken 21. Kraken, first released in 2014, has been shown to provide exceptionally fast and accurate classification for shotgun metagenomics sequencing projects. Kraken 2, which matches the accuracy and speed of Kraken 1, supports 16S rRNA databases.  Kraken uses exact-match database queries of k-mers, rather than inexact alignment of sequences.  Sequences are classified by querying the database for each k-mer in a sequence, and then using the resulting set of lowest common ancestor (LCA) taxa to determine an appropriate label for the sequence.

## I. Locating the Taxonomic Classification Service App

1. At the top of any BV-BRC page, find the Services tab.
![Figure 1](./images/Picture1.png "Figure 1")

2. Click on Taxonomic Classification.
![Figure 2](./images/Picture2.png "Figure 2")

3. This will open up the Taxonomic Classification landing page where researchers can submit long reads, single or paired read files, an SRA run accession number, or assembled contigs to the service.
![Figure 3](./images/Picture3.png "Figure 3")


## II. Uploading paired end reads

Paired read libraries are usually given as file pairs, with each file containing the forward or reverse half of each read pair. Paired read files are expected to be sorted in such a way that each read in a pair occurs in the same Nth position as its mate in their respective files. These files are specified as READ FILE 1 and READ FILE 2. For a given file pair, the selection of which file is READ 1 or READ 2 does not matter.

1.	To upload a fastq file that contains paired reads, locate the box called “Paired read library.”
![Figure 4](./images/Picture4.png "Figure 4")

2.	The reads must be located in the workspace to submit them to a BV-BRC service.  To initiate the upload, first click on the folder icon.
![Figure 5](./images/Picture5.png "Figure 5")

3.	This opens up a pop-up window where the files for upload can be selected.  Click on the icon with the arrow pointing up.
![Figure 6](./images/Picture6.png "Figure 6")

4.	This opens a new pop-up window where the file can be selected.  Click on the “Select File” in the blue bar.
![Figure 7](./images/Picture7.png "Figure 7")

5.	This will open a window that allows you to choose files that are stored on your computer.  Select the file where you stored the fastq file and click “Open”.
![Figure 8](./images/Picture8.png "Figure 8")

6.	Once selected, it will autofill the name of the file. You can see it in the screenshot below. Click on the Start Upload button.
![Figure 9](./images/Picture9.png "Figure 9")

7.	This will auto-fill the name of the document into the text box as seen below.
![Figure 10](./images/Picture10.png "Figure 10")

8.	Pay attention to the upload monitor in the lower right corner of the BV-BRC page. It will show the progress of the upload. Do not submit the job until the upload is 100% complete.
![Figure 11](./images/Picture11.png "Figure 11")

9.	Repeat steps 2-5 to upload the second pair of reads.
![Figure 12](./images/Picture12.png "Figure 12")

10.	To finish the upload, click on the icon of an arrow within a circle. This will move your file into the Selected libraries box.
![Figure 13](./images/Picture13.png "Figure 13")

## III. Uploading single reads

1.	To upload a fastq file that contains single reads, locate the text box called “Single read library.”
![Figure 14](./images/Picture14.png "Figure 14")

2.	If the reads have previously been uploaded, click the down arrow next to the text box below Read File.
![Figure 15](./images/Picture15.png "Figure 15")

3.	This opens up a drop-down box that shows the all the reads that have been previously uploaded into the user account. Click on the name of the reads of interest.
![Figure 16](./images/Picture16.png "Figure 16")

4.	This will auto-fill the name of the document into the text box as seen below.
![Figure 17](./images/Picture17.png "Figure 17")

5.	To finish the upload, click on the icon of an arrow within a circle. This will move your file into the Selected libraries box.
![Figure 18](./images/Picture18.png "Figure 18")

## IV. Submitting reads that are present at the Sequence Read Archive (SRA)
1.	BV-BRC also supports analysis of existing datasets from SRA. To submit this type of data, locate the Run Accession number and copy it.
![Figure 19](./images/Picture19.png "Figure 19")

2.	Paste the copied accession number in the text box underneath SRA Run Accession, then click on the icon of an arrow within a circle.
![Figure 20](./images/Picture20.png "Figure 20")

3.	This will move the file into the Selected libraries box.
![Figure 21](./images/Picture21.png "Figure 21")

## V. Submitting assembled contigs

1.	To submit a taxonomic classification job that uses contigs, click on the check box in front of Assembled Contigs in the upper box. Clicking on the folder icon.
![Figure 22](./images/Picture22.png "Figure 22")

2.	This will open a pop-up window that shows data in the private workspace that can be selected. The upload icon in the upper right can also be used to upload contig files that might exist on your computer.
![Figure 23](./images/Picture23.png "Figure 23")

3.	Clicking on the down arrow next to the contigs text box will show fasta files (ending in .fa or .fasta) that have been recently accessed in the private workspace.
![Figure 24](./images/Picture24.png "Figure 24")

## VI. Selecting parameters

Parameters must be selected prior to job submission. The algorithm used for Taxonomic Classification is Kraken21, which uses exact alignment of k-mers for classification accuracy. The Kraken2 algorithm was downloaded from the following source: https://ccb.jhu.edu/software/kraken2/
The only database selection currently is only “All genomes”.
![Figure 25](./images/Picture25.png "Figure 25")

1.	You can choose to save the classified sequences (meaning that those reads or contigs that mapped to the k-mers in the all genomes database) and/or the unclassified sequences (those that do not map to those k-mers).  If either (or both) of those options are selected, the files will be available in the output folder when the job is completed.
![Figure 26](./images/Picture26.png "Figure 26")

2.	A folder must be selected for the Taxonomic Classification job. Clicking on the down arrow at the end of the text box underneath Output Folder will show recent folders that have been used. Clicking on the folder icon at the end of the text box will open a pop-up window where all folders can be viewed, or new folders created. You can also start typing the name of a folder in the text box.  A drop-down box will appear that shows folders that match what you entered.
![Figure 27](./images/Picture27.png "Figure 27")

3.	Click on the desired folder.
![Figure 28](./images/Picture28.png "Figure 28")

4.	The name of the folder will now appear in the box.  
![Figure 29](./images/Picture29.png "Figure 29")

5.	A name for the job must be entered in the text box under Output Name. At this point, the Submit button turns blue and the job will be submitted once clicked.  
![Figure 30](./images/Picture30.png "Figure 30")

6.	After clicking the submit button, your job will be launched.  A successful submission will generate a message indicating that the job has been queued.  
![Figure 31](./images/Picture31.png "Figure 31")

The bottom of each BV-BRC page has an indicator that shows the number of jobs that are queued, running or completed. Clicking on the word Jobs will rewrite the page to show the Job status. Researchers can monitor the Jobs Status page to see the status of their job, which is indicated in the first column (Queued, Running, Complete, Failed).
![Figure 32](./images/Picture32.png "Figure 32")

## VII. Viewing the Taxonomic Classification job – Output files


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





## References
1. Lu, J. & Salzberg, S. L. Ultrafast and accurate 16S rRNA microbial community analysis using Kraken 2. Microbiome 8, 1-11 (2020).
2. Ondov, B. D., Bergman, N. H. & Phillippy, A. M. Interactive metagenomic visualization in a Web browser. BMC bioinformatics 12, 385 (2011).






