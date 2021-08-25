# SARS-CoV-2 Genome Assembly and Annotation Service

The SARS-CoV-2 Genome Assembly and Annotation Service provides a streamlined "meta- service" that accepts raw reads and performs genome assembly, annotation, and variation analysis.

A genome assembly is the sequence produced after chromosomes from the organism have been fragmented, those fragments have been sequenced, and the resulting sequences have been put back together. This is currently needed as DNA sequencing technology cannot read whole genomes in one go, but rather can read small pieces of between 20 and 30,000 bases, depending on the technology used. Typically, the short fragments, called reads, result from shotgun (random) sequencing of genomic DNA.

The protocol used for assembly and the downstream quality measures are provided by the Centers for Disease Control (CDC). This protocol was developed, tuned and validated by the Viral Discovery laboratory at CDC/NCIRD, where it was used to generate the first 16 SARS- CoV-2 genome sequences from the United States. In practice, it has been used for situations with a relatively low or predictable volume of samples and is often used in conjunction with Sanger-based tiling to resolve any potential sequencing or assembly issues. This is a reference-based assembly, which uses the genome Severe acute respiratory syndrome coronavirus 2 (Taxonomy ID: 2697049, refseq ID: NC_045512.2, Severe acute respiratory syndrome coronavirus 2 isolate Wuhan-Hu-1). Additional information and the code can be found here: https://github.com/CDCgov/SARS-CoV-2_Sequencing. 

A summary diagram of the workflow based on the sequencing platform can be found below.

![Figure 1](./images/Picture1.png "Figure 1")

Genome annotation uses the Viral Genome ORF Reader pipeline (VIGOR4), which was developed at the J. Craig Venter Institute. VIGOR 4 predicts protein sequences encoded in a viral genome by sequence similarity searching against curated viral protein databases. The code for VIGOR4 can be found at https://github.com/VirusBRC/VIGOR4. A schematic of the VIGOR4 program workflow can be found below.
![Figure 2](./images/Picture2.png "Figure 2")

## Accessing the SARS-CoV-2 genome assembly and annotation service

You can find the genome assembly and annotation service under the Services menu at the top of the any BV-BRC page. 
![Figure 3](./images/Picture3.png "Figure 3")

Click the link to launch the service.
![Figure 4](./images/Picture4.png "Figure 4")

The landing page for the SARS-CoV-2 genome assembly and annotation service has three parts. You can start with reads or contigs, select the files that you would like to analyze, and then select the parameters.
![Figure 5](./images/Picture5.png "Figure 5")

## Submitting Reads to the Service

1. Submitting paired read libraries. To assemble paired or single read libraries, or a read file from the Sequence Read Archive (SRA), click on Read File.
![Figure 6](./images/Picture6.png "Figure 6")

2. Read files must be uploaded into the workspace. To upload paired read files, click on the folder icon at the end of the text box underneath the words Paired Read Library.
![Figure 8](./images/Picture8.png "Figure 8")

3. This will open a pop-up window where you can select files. Whatever is uploaded in this process will be tagged as read files. To select the first file, click on the blue “Select File” bar in the center of the window.
![Figure 9](./images/Picture9.png "Figure 9")

4. This will open a window that allows you to choose files that are stored on your computer. Select the file where you stored the fastq file on your computer and click “Open”.
![Figure 10](./images/Picture10.png "Figure 10")

5. Once selected, it will autofill the name of the file. Click on the Start Upload button.
![Figure 11](./images/Picture11.png "Figure 11")

6. This will auto-fill the name of the document into the text box.
![Figure 12](./images/Picture12.png "Figure 12")

7. Pay attention to the upload monitor in the lower right corner of the PATRIC page. It will show the progress of the upload.
![Figure 13](./images/Picture13.png "Figure 13")

8. Repeat to upload the second pair of reads.
![Figure 14](./images/Picture14.png "Figure 14")

9. Do not submit the job until the upload is 100% complete.
![Figure 15](./images/Picture15.png "Figure 15")

10.	Click on the arrow that follows the “Select a platform” box below the paired reads.
![Figure 16](./images/Picture16.png "Figure 16")

11.	The Assembly service will assemble Illumina or Ion Torrent reads. Click on the platform used to sequence the genome or click on Infer Platform to allow the service to determine the reads.
![Figure 17](./images/Picture17.png "Figure 17")

12.	The reads must be moved to the Selected libraries box. Click on the arrow right above the text box.
![Figure 18](./images/Picture18.png "Figure 18")

13.	This moves the paired reads to the Selected libraries box. Clicking on the “x” will remove the reads from this box and clicking on the “I” will show the reads that were submitted in each individual row.
![Figure 19](./images/Picture19.png "Figure 19")

14.	_Submitting single read libraries_. To submit single read libraries, you can upload files as described above. However, if you have previously uploaded the data to your workspace, you can access your workspace by clicking on the folder icon at the end of the text box underneath the words Single Read Library.
![Figure 20](./images/Picture20.png "Figure 20")

15.	This will open a pop-up window where you can see the files in your workspace. Scroll to the files of interest. If your data is in a particular folder, find the folder and double click on it.
![Figure 21](./images/Picture21.png "Figure 21")

16.	This will open that folder. Clicking on the row that has the read files will highlight the row blue. Once that row is selected, click on the OK button at the bottom right corner.
![Figure 22](./images/Picture22.png "Figure 22")

17.	The name of the file will appear in the text box. To select the sequencing platform associated with the file, click on the down arrow in the text box underneath the name.
![Figure 23](./images/Picture23.png "Figure 23")

18.	If the sequencing platform is known, click on the appropriate row. If the sequencing platform is unknown, or not shown in the drop-down, click on Infer Platform.
![Figure 24](./images/Picture24.png "Figure 24")

19.	The read files must be moved into the Selected libraries box to the right. Click on the arrow to the right of the words SINGLE READ LIBRARY to transfer them.
![Figure 25](./images/Picture25.png "Figure 25")

20. This moves the paired reads to the Selected libraries box. Clicking on the “x” will remove the reads from this box, and clicking on the “I” will show the reads that were submitted in each individual row.
![Figure 26](./images/Picture26.png "Figure 26")

21.	_Submitting reads from the Sequence Read Archive (SRA)_. BV-BRC also allows researchers to submit reads that are available in the SRA. Enter the SRA run accession number in the text box.
![Figure 27](./images/Picture27.png "Figure 27")

22.	After the accession number is entered, the reads must be moved into the Selected libraries box to the right. Click on the arrow to the right of the words SRA RUN ACCESSION LIBRARY to transfer them.
![Figure 28](./images/Picture28.png "Figure 28")

## Selecting Parameters

1. _Assembly strategy_. BV-BRC provides several assembly strategies. Click on the down arrow in the text box under STRATEGY to see the possibilities.

![Figure 29](./images/Picture29.png "Figure 29")

2. This opens a drop-down box that shows the three assembly strategies that are offered.
![Figure 30](./images/Picture30.png "Figure 30")

3. The three strategies can be seen in the diagram below. The CDC-Illumina assembly strategy uses Cutadapt[1] for trimming, Bowtie2[2] for read mapping, and SAMtools- mpileup[3] for variant calling and generating a consensus sequence. The CDC Nanopore strategy uses Cutadapt for trimming, Minimap2[4] for read mapping, and Medaka (https://nanoporetech.github.io/medaka/) for variant calling and generating a consensus sequence. More information about the CDC strategies can be found here: https://github.com/CDCgov/SARS-CoV-2_Sequencing/blob/master/protocols/CDC-Comprehensive/CDC_SARS-CoV-2_Sequencing_200325-2.pdf

The Artic-Nanopore strategy uses Align_trim for trimming, Minimap2 for read mapping, and Medaka for variant calling and generating a consensus sequence. More information on the Artic-Nanopore strategy can be found here: https://artic.network/ncov-2019/ncov2019- bioinformatics-sop.html

Clicking on Auto will allow the service to select the appropriate strategy.
![Figure 31](./images/Picture31.png "Figure 31")

4. _Job name_. Once the appropriate strategy is selected, a unique identifier must be entered for this job. Enter the name in the text box under the words MY LABEL. Note that as you enter the text, you will see it appended to the name for the reference genome in the OUTPUT NAME box.
![Figure 32](./images/Picture32.png "Figure 32")

5. _Creating new folder_. The job will be placed in your private workspace. It is best to have a folder to hold the relevant information. To create a new folder, click on the folder icon at the end of the text box underneath the words OUTPUT FOLDER.
![Figure 33](./images/Picture33.png "Figure 33")

6. This will open a pop-up window to your workspace. To create a new folder, click on the Folder icon at the upper right (you could also scroll through your workspace to find an appropriate folder).
![Figure 34](./images/Picture34.png "Figure 34")

7. Clicking on the folder icon will open a pop-up window where you can name the new folder. Enter the new name in the text box.
![Figure 35](./images/Picture35.png "Figure 35")

8. Click the Create Folder button to create the new folder.
![Figure 36](./images/Picture36.png "Figure 36")

9. In the workspace window, scroll until you find the newly named folder and select the row. It will turn the row blue. When that row is highlighted, click on the OK button at the lower right of the window.
![Figure 37](./images/Picture37.png "Figure 37")

10.	_Using an existing folder_. Additionally, if a folder of interest has been recently created, you can click on the down arrow at the end of the text box.
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


![Figure 65](./images/Picture65.png "Figure 65")


![Figure 66](./images/Picture66.png "Figure 66")


![Figure 67](./images/Picture67.png "Figure 67")


![Figure 68](./images/Picture68.png "Figure 68")


![Figure 69](./images/Picture69.png "Figure 69")


![Figure 70](./images/Picture70.png "Figure 70")


![Figure 71](./images/Picture71.png "Figure 71")


![Figure 72](./images/Picture72.png "Figure 72")


![Figure 73](./images/Picture73.png "Figure 73")


![Figure 74](./images/Picture74.png "Figure 74")


![Figure 75](./images/Picture75.png "Figure 75")


![Figure 76](./images/Picture76.png "Figure 76")


![Figure 77](./images/Picture77.png "Figure 77")


![Figure 78](./images/Picture78.png "Figure 78")


![Figure 79](./images/Picture79.png "Figure 79")


![Figure 80](./images/Picture80.png "Figure 80")


![Figure 81](./images/Picture81.png "Figure 81")


![Figure 82](./images/Picture82.png "Figure 82")


![Figure 83](./images/Picture83.png "Figure 83")


![Figure 84](./images/Picture84.png "Figure 84")


![Figure 85](./images/Picture85.png "Figure 85")


![Figure 86](./images/Picture86.png "Figure 86")


![Figure 87](./images/Picture87.png "Figure 87")


![Figure 88](./images/Picture88.png "Figure 88")


![Figure 89](./images/Picture89.png "Figure 89")


![Figure 90](./images/Picture90.png "Figure 90")


![Figure 91](./images/Picture91.png "Figure 91")


![Figure 92](./images/Picture92.png "Figure 92")


![Figure 93](./images/Picture93.png "Figure 93")


![Figure 94](./images/Picture94.png "Figure 94")


![Figure 95](./images/Picture95.png "Figure 95")


![Figure 96](./images/Picture96.png "Figure 96")


![Figure 97](./images/Picture97.png "Figure 97")


![Figure 98](./images/Picture98.png "Figure 98")


![Figure 99](./images/Picture99.png "Figure 99")


![Figure 100](./images/Picture100.png "Figure 100")


![Figure 100](./images/Picture100.png "Figure 101")


![Figure 100](./images/Picture100.png "Figure 102")


![Figure 100](./images/Picture100.png "Figure 103")


![Figure 100](./images/Picture100.png "Figure 104")


![Figure 100](./images/Picture100.png "Figure 105")


![Figure 100](./images/Picture100.png "Figure 106")


![Figure 100](./images/Picture100.png "Figure 107")



