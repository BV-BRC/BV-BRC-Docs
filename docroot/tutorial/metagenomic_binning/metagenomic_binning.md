# Using the Metagenomic Binning Service in BV-BRC

![Figure 1](./images/Picture1.png "Figure 1")

The BV-BRC metagenomic binning service utilizes the BV-BRC database to furnish a large, diverse set of reference genomes. This is a service for supervised extraction and annotation of high-quality, near-complete genomes from reads or metagenomically-derived contigs. Reads are assembled using either MetaSPAdes1 or MEGAHIT2.  Each set of binned contigs represents a draft genome that will be annotated by RASTtk3 for bacteria, or with VIGOR44,5 or  Mat_Peptide6 for viruses. A structured-language binning report is provided containing quality measurements and taxonomic information about the contig bins. The BV-BRC metagenome binning service emphasizes extraction of high-quality genomes for downstream analysis using other BV-BRC tools and services.

Metagenomic binning jobs that include assembly that, on average, take an hour to complete.  However, the BV-BRC assembly service is quite popular, and there is often a long queue resulting in jobs taking 24 hours to complete.  If the size of the read file is large (Gb) or the queue is long, results could take several days.  

The code for the binning script is located at:
https://github.com/SEEDtk/p3_code/blob/master/scripts/p3x-process-checkv.pl

The code for the RASTtk pipeline is located at:
https://github.com/SEEDtk/p3_code/blob/master/scripts/p3x-process-bins_generate.pl

## Creating a folder to hold the metagenomic binning job and related data

1.	It is always good practice to create a folder to keep the results from a particular experiment or project in order.  To create a new folder, go to the Workspaces tab and click on home.
![Figure 2](./images/Picture2.png "Figure 2")

2.	This will open the home directory on your workspace.  To create a new folder, click on the Add Folder icon at the top right of the table.
![Figure 3](./images/Picture3.png "Figure 3")

3.	This will open a pop-up window.  Note that the Create Folder button is greyed out.  Type the desired name in the text box.
![Figure 4](./images/Picture4.png "Figure 4")

4.	Once the name is entered, the Create Folder icon will turn blue.  To create the folder, click on that button.
![Figure 5](./images/Picture5.png "Figure 5")

5.	The pop-up window will disappear.  At the button left of the page you will see a temporal message indicating that the folder was successfully created.
![Figure 6](./images/Picture6.png "Figure 6")

## Locating the Metagenomic Binning Service App

1.	At the top of any BV-BRC page, find the Services tab
![Figure 7](./images/Picture7.png "Figure 7")

2.	In the drop-down box, underneath Genomics, click on Annotation.
![Figure 8](./images/Picture8.png "Figure 8")

3.	This will open up the Metagenomic Binning Service landing page.  The default page shows starting with a read file.
![Figure 9](./images/Picture9.png "Figure 9")

## Selecting a read file for metagenomic binning

### Uploading paired end reads

1.	To upload a fastq file that contains paired reads, locate the box called “Paired read library.” 
![Figure 10](./images/Picture10.png "Figure 10")

2.	The reads must be located in the workspace. To initiate the upload, first click on the folder icon. 
![Figure 11](./images/Picture11.png "Figure 11")

3.	This opens up a window where the files for upload can be selected. If you want to upload data directly to your home directory, click on the icon with the arrow pointing up. 
![Figure 12](./images/Picture12.png "Figure 12")

4.	You can also navigate to a desired folder. Use the scroll bar at the left of the pop-up window to see all the data in your directory.  When the desired folder is found, click on it. This will open that directory in the window, where you can use the upload icon to upload data directly to the selected folder.
![Figure 13](./images/Picture13.png "Figure 13")

5.	This opens a new window where the file you want to upload can be selected. Note that as you entered through a specific service and file format (Metagenomic Binning, selecting read files), the upload type is set to Reads.  Not only will it look for read files in your computer interface, but it will also tag the uploaded files that way.  This is important for BV-BRC services, as any service that uses reads can “see” these files.  Click on the “Select File” in the blue bar. 
![Figure 14](./images/Picture14.png "Figure 14")

6.	This will open a window that allows you to choose files that are stored on your computer. Select the file where you stored the fastq file on your computer and click “Open”.  
![Figure 15](./images/Picture15.png "Figure 15")

7.	Once selected, it will autofill the name of the file. Click on the Start Upload button. 
![Figure 16](./images/Picture16.png "Figure 16")

8.	This will auto-fill the name of the document into the text box. 
![Figure 17](./images/Picture17.png "Figure 17")

9.	Pay attention to the upload monitor in the lower right corner of the BV-BRC page. It will show the progress of the upload. Do not submit the job until the upload is 100% complete.
![Figure 18](./images/Picture18.png "Figure 18")

10.	Repeat to upload the second pair of reads.
![Figure 19](./images/Picture19.png "Figure 19")

11.	To finish the upload, click on the icon of an arrow within a circle. This will move your file into the Selected libraries box.
![Figure 20](./images/Picture20.png "Figure 20")

### Uploading single reads

1.	To upload a fastq file that contains single reads, locate the text box called “Single read library.” If the reads have previously been uploaded, click the down arrow next to the text box below Read File. 
![Figure 21](./images/Picture21.png "Figure 21")

2.	This opens up a drop-down box that shows the all the reads that have been previously uploaded into the user account. Click on the name of the reads of interest.
![Figure 22](./images/Picture22.png "Figure 22")

3.	This will auto-fill the name of the file into the text box.
![Figure 23](./images/Picture23.png "Figure 23")

4.	To finish the upload, click on the icon of an arrow within a circle. This will move the file into the Selected libraries box.
![Figure 24](./images/Picture24.png "Figure 24")

### Submitting reads that are present at the Sequence Read Archive (SRA)

1.	BV-BRC also supports analysis of existing datasets from SRA. To submit this type of data, locate the Run Accession number that you will find at SRA and copy it.
![Figure 25](./images/Picture25.png "Figure 25")

2.	Paste the copied accession number in the text box underneath SRA Run Accession, then click on the icon of an arrow within a circle.  This will move the file into the Selected libraries box.
![Figure 26](./images/Picture26.png "Figure 26")

### Submitting contigs

1.	BV-BRC also supports analysis of contigs that have been assembled in or outside of the resource.  To submit contigs, you need to click on the Assembled Contigs button.
![Figure 27](./images/Picture27.png "Figure 27")

2.	This will reload the page to show contigs only as the Input file.  Uploading files are similar to what has been described for the read files above.
![Figure 28](./images/Picture28.png "Figure 28")

## Setting Parameters when reads are the input

Parameters must be selected prior to the submission of the Metagenomic Binning job in BV-BRC.  
![Figure 29](./images/Picture29.png "Figure 29")

### Assembly Strategy

![Figure 30](./images/Picture30.png "Figure 30")

1.	The assembly strategy for the reads must be selected.  Clicking on the down arrow that follows the text box under Assembly Strategy will open a drop-down box that shows all the strategies that BV-BRC offers.  A description of each strategy is listed below. 
    * The metaSPAdes(1) software is part of the SPAdes toolkit, developed to address the various challenges of metagenomic assembly.  The latest version of the SPAdes toolkit that includes metaSPAdes is available here (http://cab.spbu.ru/software/spades/).

    * MEGAHIT is a de novo assembler for assembling large and complex metagenomics data(2). The MegaHit software is available here: https://github.com/voutcn/megahit.  MEGAHIT assembles the data as a whole (i.e., no preprocessing like partitioning and normalization).

### Organisms of Interest

![Figure 31](./images/Picture31.png "Figure 31")

1.	Organisms of interest must be selected.  Clicking on Bacteria/Archaea will only show those results,  clicking on Viruses will only show those, and clicking on Both will show all of those results.  
    * If **Bacteria/Archaea** are selected, the RASTtk3 annotation pipeline will be used. The code for the RASTtk pipeline is located at https://github.com/SEEDtk/p3_code/blob/master/scripts/p3x-process-bins_generate.pl

    * Selecting **Viruses** will use one of two annotation pipelines. Other viruses are first run through the VIGOR4(4,5) pipeline.  (The software for the VIGOR pipeline is located at: https://github.com/JCVenterInstitute/VIGOR4). If that does not find a virus match, the Mat Peptide6 pipeline is used.

    * When selecting **Both** the bacterial/archaeal and viral pipelines will be run.  The workflow for this strategy is available at the top of this tutorial.

### Output Folder

![Figure 32](./images/Picture32.png "Figure 32")

1.	An output folder must be selected for the metagenomic binning job.  Typing the name of the folder in the text box underneath the words Output Folder will show a drop-down box that shows close hits to the name.
![Figure 33](./images/Picture33.png "Figure 33")

2.	Clicking on the arrow at the end of the box will open a drop-down box that shows the most recently created folders.  
![Figure 34](./images/Picture34.png "Figure 34")

3.	To find a previously created folder, or to create a new one, click on the folder icon at the end of the text box.  This will open a pop-up window that shows all the previously created folder.
![Figure 35](./images/Picture35.png "Figure 35")

4.	Click on the folder of interest, and then click the OK button in the lower right corner of the window.
![Figure 36](./images/Picture36.png "Figure 36")

### Output Name

![Figure 37](./images/Picture37.png "Figure 37")

1.	A name for the job must be included prior to submitting the job.  Enter the name in the text box underneath the words Output Name.

### Genome Group Name

![Figure 38](./images/Picture38.png "Figure 38")

1.	The metagenome binning service currently creates a series of single-bin annotations and a genome group which supports some rudimentary multi-genome functionality, e.g. protein family heatmaps.  A name for the genome group that will be generated must be included prior to submitting the job.  Enter the name in the text box underneath the words Genome Group Name. 

## Submitting the Metagenomic binning job 
1.	Once the input data and the parameters have been selected, the Submit button at the bottom of the page will turn blue.  The metagenomic binning job will be submitted once this button is clicked. Once submitted, the job will enter the queue.  You can check the status of your job by clicking on the Jobs monitor at the lower right.
![Figure 39](./images/Picture39.png "Figure 39")

## Finding the completed Metagenomic binning job 

1.	There are two places to access a completed job in BV-BRC or PATRIC.  Clicking on the Jobs icon at the bottom right of any page will open the list of jobs that have been submitted.
![Figure 40](./images/Picture40.png "Figure 40")

2.	A complete list of all completed jobs will appear from most recent to first job.  Clicking on any of the column heads will resort the page to sow the results in that order.
![Figure 41](./images/Picture41.png "Figure 41")

3.	Clicking on an individual job or row will show possible downstream functions, which appear as icons, in the vertical green bar to the right of the list.  Clicking on the View icon will rewrite the page to show the results of the selected job.
![Figure 42](./images/Picture42.png "Figure 42")

4.	The files produced by the specific job will be shown on the Jobs results page.  As with the Jobs page, clicking on an individual row will populate the vertical green bar with possible action icons, like viewing or downloading the data.
![Figure 43](./images/Picture43.png "Figure 43")

5.	Completed jobs can also be access through the workspace, which you can access by clicking on the Workspaces tab, which is at the top of any BV-BRC page.
![Figure 44](./images/Picture44.png "Figure 44")

6.	This will open a drop-down box for the workspace.  To view the home workspace, click on “home”.
![Figure 45](./images/Picture45.png "Figure 45")

7.	This will rewrite the page to show the home directory. Scrolling down the page will show the files and folders in the workspace
![Figure 46](./images/Picture46.png "Figure 46")

8.	If the job is in a particular folder, that can be opened by double clicking on the row that has the job.
![Figure 47](./images/Picture47.png "Figure 47")

9.	This rewrites the page to show the data in that particular folder.  Completed jobs are indicated by a checkered flag in the first column.   The completed job can be accessed by double clicking on that row.
![Figure 48](./images/Picture48.png "Figure 48")

10.	This will rewrite the page to show the files produced by the completed job.  As with the Jobs page, clicking on an individual row will populate the vertical green bar with possible action icons, like viewing or downloading the data.
![Figure 49](./images/Picture49.png "Figure 49")

## Metagenomic binning job results

1.	Any job run in the BV-BRC contains a number of files, as well as information about the submitted job.  To view the input parameters that were selected when the job was submitted, click on the arrow that precedes the word “Parameters.”
![Figure 50](./images/Picture50.png "Figure 50")

2.	This will open a drop-down box that shows the parameters.  This box can be closed by clicking on the same arrow.
![Figure 51](./images/Picture51.png "Figure 51")

3.	The **BinningReport.html** is among the files produced by the Metagenomic Binning service, but only when Bacteria/Archaea was included or selected under Organisms of Interest when the job was submitted.  This is the binning report for the bacterial or archaeal organisms found in the submitted data.  To view this document, click on the row that contains it, and then click the View icon in the vertical green bar to the right.
![Figure 52](./images/Picture52.png "Figure 52")

4.	This will show the binning report. The top part of the page shows information about the binning job. Immediately below is a brief description of the results. The binning report shows all of the bins found by the PATRIC metagenomic processor. The bins are divided into two categories– those of high quality (good) and those of questionable quality (bad).  Each of the columns contains specific information:

    * **Score**: A weighted sum of the completeness and consistency scores, less the contamination score. The contamination is weighted very heavily, so a highly contaminated bin may have a negative score. The maximum score is 2090 and the minimum score is -5000. The bins are sorted from the highest score to the lowest. Clicking on this number takes you to the detail report on the bin.
    * **Genome ID**: The ID number assigned to the genome in BV-BRC that represents the bin. Clicking on this number takes you to the genome.
    * **Genome Name**: The name given to the bin. This is usually the species of the closest reference genome followed by the phrase clonal population.
    * **Reference Genome**: The ID of the reference genomes used to create the bin. There is usually only one. Sometimes there are two, indicating that the bin represents multiple strains that could not be easily distinguished during the binning. 
    * **Coarse Consistency**: The percent of predictable roles whose presence or absence matches the computations of the consistency tool. A high coarse consistency indicates the bin is either a single genome or a cluster of very close strains.
    * **Fine Consistency**: The percent of predictable roles whose number of occurrences matches the computations of the consistency tool. This number is always lower than the coarse consistency. A high fine consistency indicates a bin that can be treated like a functioning genome. A fine consistency of 87% is the minimum required for a bin to be considered a good genome.
    * **Completeness and Contamination**: Two internal BV-BRC tools are used– EvalG7, which computes completeness and contamination using marker roles, and EvalCon7, which determines whether the proteins found in the genome make sense together. A genome that is sufficiently complete (80%), with sufficiently low contamination (10%), and sufficiently consistent proteins (87%) is considered good and is shown in the first table.  
    * **Hypothetical**: The percent of the annotated proteins in the genome that are named “Hypothetical.” A high percental of hypothetical proteins is an indication of a poor-quality genome.
    * **Contig count**:  The number of contigs from the assembled sample that were placed in the bin.
    * **DNA size (bp)**:  The number of DNA base pairs in the bin.
    * **Contigs N50 (bp)**: A statistical measure of the relative contig sizes: a higher number indicates a better assembly. This is the size of the longest contig such that half of the base pairs are in contig this size or larger.
    * **Mean coverage**:  The average coverage for contigs in the bin. If no coverage information was provided, this will be 50 for every bin.
    * **Potentially Problematic Roles**:  The number of roles that failed the consistency or completeness/contamination checks. Clicking on the numbers in this column takes you to the bin’s detail report, which includes a list of the roles in question.
    * **Good PheS**:  A Yes, or “Y” here indicates that the bin contains a single PheS protein of reasonable size, otherwise it is left blank. Because the PheS is used to identify the reference genomes of the bin, a questionable PheS protein is considered a serious problem with the bin.
    * **A yellow cell** indicates a score that is problematic for the quality of the bin.

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


