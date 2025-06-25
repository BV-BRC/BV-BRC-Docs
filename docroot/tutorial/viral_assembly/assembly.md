# Analyzing Viral Genome Assembly Using BV-BRC Tools Tutorial
#### [Made by Anna Capria with Scribe](https://scribehow.com/shared/Analyzing_Viral_Genome_Assembly_Using_BV-BRC_Tools_Tutorial__A-fXajgCQi-bD-Wzs4rmXw)


#### Viral Genome Assembly Service


Alert: Beta Version: 13 February 2025


#### Overview


1\. The Viral Genome Assembly Service allows users to assemble viral genomes utilzing IRMA(1)(currently the BV-BRC tool supports Influenza). Once the assembly process has started by clicking the Assemble button, the genome is queued as a "job" for the Assembly Service to process, and will increment the count in the Jobs information box on the bottom right of the page. Once the assembly job has successfully completed, the output file will appear in the workspace.\
This service and tutorial are currently in beta- and will be updated to reflect the tools development.\
A genome assembly is the sequence produced after chromosomes from the organism have been fragmented, those fragments have been sequenced, and the resulting sequences have been put back together. This is currently needed as DNA sequencing technology cannot read whole genomes in one go, but rather can read small pieces of between 20 and 30,000 bases, depending on the technology used. Typically, the short fragments, called reads, result from shotgun (random) sequencing of genomic DNA.

De novo sequence assemblers are a type of program that assembles short nucleotide sequences into longer ones without the use of a reference genome. These are commonly used in bioinformatic studies to assemble genomes or transcriptomes.

What follows is a tutorial showing how to submit reads for assembly and selecting parameters for the assembly algorithm.

The BV-BRC Viral Genome Assembly service uses an open source, third-part bioinformatics program- IRMA developed by the CDC. IRMA provides a robust next-generation sequencing assembly solution that is adapted to the needs and characteristics of viral genomes. More information about IRMA (<https://bmcgenomics.biomedcentral.com/articles/10.1186/s12864-016-3030-6>) can be found here IRMA  and <https://wonder.cdc.gov/amd/flu/irma/irma.html> pages.


Tip: See Also: [Viral Genome Assembly Service](https://bv-brc.org/app/ViralAssembly)


#### Using the Viral Genome Assembly Service


2\. Using the Viral Genome Assembly Service\
The **Viral Assembly** submenu option under the **Services** main menu (Viral Tools category) opens the Viral Genome Assembly input form, shown below. *Note: You must be logged into BV-BRC to use this service.*

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/3e44f1e8-a377-4ca0-a140-54b10bc3ce47/screenshot.jpeg?tl_px=0,0&br_px=1434,1064&force_format=jpeg&q=100&width=1120.0)


3\. Navigate to [https://www.bv-brc.org/](https://www.bv-brc.org/)


4\. Click "Viral Assembly"

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/c5c31b36-b02b-4a13-80bb-f4e3f191d8ec/File.jpeg?tl_px=0,53&br_px=2122,1438&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=689,329)


5\. Three options for file input types.

**Paired read library**

**Read File 1 & 2:** Many paired read libraries are given as file pairs, with each file containing half of each read pair. Paired read files are expected to be sorted such that each read in a pair occurs in the same Nth position as its mate in their respective files. These files are specified as READ FILE 1 and READ FILE 2. For a given file pair, the selection of which file is READ 1 and which is READ 2 does not matter.

### Single read library

**Read File:** The fastq file containing the reads.

### SRA run accession

Allows direct upload of read files from the [NCBI Sequence Read Archive](https://www.ncbi.nlm.nih.gov/sra) to the BV-BRC Assembly Service. Entering the SRR accession number and clicking the arrow will add the file to the selected libraries box for use in the assembly.

## Files accepted by BV-BRC Assembly Service

The assembly service accepts read files in either fastq, fasta, fastq.gz, or fasta.gz format.

**FASTQ** is a text-based format for storing both a nucleotide sequence and its corresponding quality scores. Both the sequence letter and quality score are each encoded with a single ASCII character. A FASTQ file normally uses four lines per sequence:

- Line 1 begins with a ‘@’ character and is followed by a sequence identifier and an optional description (like a FASTA title line).
- Line 2 is the raw sequence letters.
- Line 3 begins with a ‘+’ character and is optionally followed by the same sequence identifier (and any description) again.
- Line 4 encodes the quality values for the sequence in Line 2 and must contain the same number of symbols as letters in the sequence.

**FASTA** is a text-based format for representing either nucleotide sequences or amino acid (protein) sequences using single-letter codes. The format allows for sequence names and comments to precede the sequences. A **FASTA read file** has two parts:

- Line 1 begins with a ‘&gt;’.  Everything from the beginning ‘&gt;’ to the first whitespace is considered the sequence identifier. Everything after that is considered the sequence description (this can be metadata, machine serial number, read orientation, etc.), all in a single line.
- Line 2 has the sequence, which can span multiple lines depending on the length.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/7638a065-552c-4c34-80bb-031b1cabdefd/File.jpeg?tl_px=0,0&br_px=2122,1384&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=458,178)


6\. Click the "Sra Run Accession" field.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/645c2b2d-4233-434d-8c86-733bc83e9c9b/File.jpeg?tl_px=0,0&br_px=2122,1384&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=580,177)


7\. You can see the parameters for this service here.

## Parameters

**Assembly Strategy:**

- IRMA - IRMA is currently the only viral assembly tool. Any other tool can be recommended or requested.

## Setting Parameters

1. Currently the only assembly strategy available is IRMA.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/e8e0ab37-63a3-40f4-90cc-4365f428640c/File.jpeg?tl_px=0,0&br_px=2122,1384&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=413,253)


8\. Click "FLU". The Flu module has been tested thoroughly the others are still in testing stages. Feel free to add feedback as necessary.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/a85998f3-934b-4be7-a479-87e23cce810b/File.jpeg?tl_px=0,61&br_px=2122,1446&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=694,329)


9\. An output folder must be selected for the assembly job.  Typing the name of the folder in the text box underneath the words **Output Folder** will show a drop-down box that shows close hits to the name, and clicking on the arrow at the end of the box will open a drop-down box that shows the most recently created folders.  To find a previously created folder, or to create a new one, click on the **Folder** icon at the end of the text box.  This will open a pop-up window that shows all the previously created folders.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/4e42f95f-71da-430c-82e0-dd705a404e29/File.jpeg?tl_px=0,127&br_px=2122,1512&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=417,329)


10\. Put your job in whatever folder you feel like having it in.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/137ac290-429b-4bbf-87ba-d2b65d63c3d2/File.jpeg?tl_px=0,0&br_px=2122,1384&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=422,325)


11\. Name the job whatever you want it to be called- for the example it is Assembly_workshop_prep.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/44fcff05-5dd2-4213-85a0-c06a7c8b2622/File.jpeg?tl_px=0,210&br_px=2122,1595&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=395,329)


12\. Click "Tutorial" to view this tutorial if you have any questions.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/d1263bab-4437-4bd3-a38f-62210903339a/File.jpeg?tl_px=0,0&br_px=2122,1384&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=517,113)


13\. Type in the SRA accession number of interest. For the example: SRR31821206

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/af1c875a-352b-42c1-9a40-c42c07175687/File.jpeg?tl_px=0,0&br_px=2122,1384&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=495,191)


14\. Click "Assemble"

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/1d54574d-1630-4dfd-9c34-ba56a683ffd6/File.jpeg?tl_px=0,239&br_px=2122,1624&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=541,359)


15\. Check that "The accession is a valid id."

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/1b9b0256-39ee-4b91-a0fd-aae09db3b0ec/File.jpeg?tl_px=0,0&br_px=2122,1384&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=502,228)


16\. Click "Submitting Assembly Job"

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/2d7abedf-c18e-4fc4-8812-2f9593ba0307/File.jpeg?tl_px=0,239&br_px=2122,1624&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=603,380)


17\. A message will appear at the bottom of the page, indicating that the submitted job has entered the BV-BRC queue.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/a9dc3389-3dcb-4fc6-8648-4498cc5747b4/File.jpeg?tl_px=0,239&br_px=2122,1624&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=592,416)


18\. Clicking on the **Jobs** box at the bottom right of any BV-BRC page/

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/39fba459-fb71-4a97-a24a-384b28f3a930/File.jpeg?tl_px=0,239&br_px=2122,1624&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=950,668)


19\. ## Viewing and Interpreting the Assembly Job Results

1. On the jobs page, click on the row that has the assembly of interest. This will populate the vertical green bar on the right with possible downstream steps, which include viewing the results of the job, or reporting an issue that was experienced (like a job failure).  Click on the **View** icon.\
   \
   Double-click your completed job to view result.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/97bb0930-1c86-4d3a-ad13-a69d909b6cd9/File.jpeg?tl_px=0,0&br_px=2122,1384&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=398,151)


20\. This will rewrite the page to show the information about the assembly job, and all of the files that are produced when the pipeline runs.

The information about the job submission can be seen in the table at the top of the results page.  To see all the parameters that were selected when the job was submitted, click on the **Parameters** row. This will show the information on what was selected when the job was originally submitted.\
\
You can click on the output files of the job to see the .fasta

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/7c883a6f-7f15-4a6a-b038-a48c67cb8b94/user_cropped_screenshot.jpeg?tl_px=0,119&br_px=2122,1504&force_format=jpeg&q=100&width=1120.0)


21\. You can click on the report icon to see the report of this job.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/ef70f219-fbf0-47e2-94ee-63ab24ace02a/user_cropped_screenshot.jpeg?tl_px=0,0&br_px=2122,1384&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=705,27)


22\. The Genome Assembly report contains valuable information about the assembly, including the number of contigs. Clicking on the row that contains the number of contigs, depth and coverage.  **AssemblyReport.html** will highlight it in blue and populate the action bar with possible downstream steps.  Click on the **View** icon.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/e4d504ed-84c8-4021-8aee-9e546581a162/File.jpeg?tl_px=0,98&br_px=2122,1483&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=221,329)


23\. You can click on the output files of the job to see the .fasta

Click "A_MP.fasta" Or any of the fasta files to get the different fasta's for each segment. You can download with the download icon on the green bar.\
\
The whole point of the assembly service is the assembly of a contig file from the submitted reads.  The contig files can be used in downstream services.  Note that the file, which can be clicked on from the Jobs page, has the type matched as “contigs” in the information panel beyond the green bar.  The contig file can be used as is in BV-BRC or downloaded for use in other resources or pipelines.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/b7a36134-947c-4b59-889e-6088df9b66b2/user_cropped_screenshot.jpeg?tl_px=0,80&br_px=2122,1465&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=121,329)


24\. Double-click "IRMA" to view the IRMA output files.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/59c46881-e318-4b27-94b4-9cedfc0682fa/File.jpeg?tl_px=0,239&br_px=2122,1624&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=97,480)


25\. Double-click "amended_consensus" to see into that folder. Any of this can be used for further analysis.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/c4693be9-3f08-416d-8c78-490677ef20bb/File.jpeg?tl_px=0,239&br_px=2122,1624&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=115,473)


26\. Click "IRMA"

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/ed854d04-7939-418b-8b11-1a41eb2521e2/File.jpeg?tl_px=0,0&br_px=2122,1384&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=399,25)


27\. Click ".irma_test_SRR31821206"

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/125a72b9-64e6-4b8b-a6a7-7691310d1a2f/File.jpeg?tl_px=0,0&br_px=2122,1384&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=312,34)


28\. Click this arrow to go back to the directory above as needed.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/3ba9d40f-a3dc-488a-9ed6-44b1e542b5a8/File.jpeg?tl_px=0,0&br_px=2122,1384&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=-21,97)


29\. Double-click "irma_test_SRR31821206" This is an alternative way to get to the job run. The job is marked by a flag icon.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/f3182be4-befd-4b50-81a7-3425709cc0a6/File.jpeg?tl_px=0,50&br_px=2122,1435&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=167,329)


30\. Click "All statistics are based on contigs of size &gt;= 300 bp, unless otherwise noted (e.g., "# contigs (&gt;= 0 bp)" and "Total length (&gt;= 0 bp)" include ..."

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/2704f63f-e17d-4e3c-915c-3b4ad46a4edd/File.jpeg?tl_px=0,136&br_px=2122,1521&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=205,329)


31\. Click "Quast HTML Report"

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/5b8602af-c0f5-44dd-a5db-0004f1ca599f/File.jpeg?tl_px=0,0&br_px=2122,1384&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=99,284)


32\. Scrolling down will reveal a **Quast report**, which is also included in the Genome Assembly report. Quast is a quality assessment tool for evaluating and comparing genome assemblies, and shows statistics of the contigs generated in the assembly.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/e39d9243-7095-48d2-a8d7-c91f5502c020/File.jpeg?tl_px=0,0&br_px=2122,1384&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=303,34)


33\. Double-click "quast"

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/1fdb2795-5d52-43dc-964f-e08995042b15/File.jpeg?tl_px=0,239&br_px=2122,1624&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=25,360)


34\. Click "GC_content_plot.pdf" You can download the GC content plot for further analysis.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-02-13/751c38d1-97ee-46dd-af2e-f118d67a157d/File.jpeg?tl_px=0,0&br_px=2122,1384&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=93,124)


35\. The Viral Assembly Service generates several files that are deposited in the Private Workspace in the designated Output Folder. These include

- **assembly_report.html** - Web-viewable report of the assembly including information about the submitted reads and assembly process used.
- **quast** - Folder including all of the standard outputs of quast.
- **IRMA** - Folder including the VCF, bam and bam.bai files generated by IRMA. It also includes sub folders for amended)consensus, figures, intermediate, log, matrices, secondary and tables.
- **.fasta** - All of the associated fasta files for the assembly, including by segment and cummulative.

### Action buttons

After selecting one of the output files by clicking it, a set of options becomes available in the vertical green Action Bar on the right side of the table.  These include:

- **Hide/Show:** Toggles (hides) the right-hand side Details Pane.
- **Guide:** Link to the corresponding Quick Reference Guide.
- **Download:**  Downloads the selected item.
- **View:** Displays the content of the file, typically as plain text or rendered html, depending on filetype.
- **Delete:** Deletes the file.
- **Rename:** Allows renaming of the file.
- **Copy:** Copies the selected items to the clipboard.
- **Move:** Allows moving of the file to another folder.
- **Edit Type:** Allows changing of the type of the file in terms of how BV-BRC interprets the content and uses it in other services or parts of the website.  Allowable types include unspecified, contigs, nwk, reads, differential expression input data, and differential expression input metadata.

More details will be available in the upcoming Quick Reference Guide.


36\. References\
Gurevich, A., et al., QUAST: quality assessment tool for genome assemblies. Bioinformatics, 2013. 29(8): p. 1072-1075.\
Shepard, S.S., Meno, S., Bahl, J. et al. Viral deep sequencing needs an adaptive approach: IRMA, the iterative refinement meta-assembler. BMC Genomics 17, 708 (2016). <https://doi.org/10.1186/s12864-016-3030-6>
#### [Made with Scribe](https://scribehow.com/shared/Analyzing_Viral_Genome_Assembly_Using_BV-BRC_Tools_Tutorial__A-fXajgCQi-bD-Wzs4rmXw)




