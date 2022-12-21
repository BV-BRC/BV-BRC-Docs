# Genome Annotation

The Genome Annotation Service in PATRIC [1] uses the RAST tool kit (RASTtk) [2] to provide annotation of genomic features. All genomes in PATRIC have been annotated with this service, and researchers can submit their own private genome to the annotation service, where it will be deposited into their private workspace for their perusal.

**Keywords:** Bacterial genome annotation, Genome annotation, Automated annotation, Annotation service, Annotation pipeline, Annotation server, Bacteria, Archaea, Plasmid, Phage.

## Locating the Annotation Service App
1. At the top of any PATRIC page, find the Services tab and then click on Genome Annotation
![Step 1](./images/image1.png "Step 1")

2. This will open up the Annotation Service landing page.

![Step 2](./images/image2.png "Step 2")

## Using contigs from an assembly that has been uploaded
1.  Researchers can upload contigs from an assembly job completed in PATRIC or from an external source (see Assembling a genome in PATRIC, parts VII and VIII). Once contigs have been uploaded to the workspace, they need to be submitted to the annotation service. To do this, click on the down arrow that follows the text box underneath Contigs (Red arrow).

    ![Step 3](./images/image3.png "Step 3")

2. This will open up a drop-down box that will show all the assemblies that currently in the researcher's private workspace. Click on the one of interest to upload it. The name will then appear in the text box beneath the word Contigs.

    ![Step 4](./images/image4.png "Step 4")

## Uploading contigs from an assembly to the PATRIC workspace
1. Reads that have been assembled into contigs can be uploaded to the PATRIC workspace, even if those assemblies occurred outside of PATRIC. To upload a contig file, click on the upload button at the bottom of any PATIC page (red arrow below).

    ![Step 5](./images/image5.png "Step 5")

2. This will open a pop-up window that allow you to select files for upload. Do upload contigs, first click on the arrow at the end of the text box with the word Unspecified in it. Then click on Contigs.

    ![Step 6](./images/image6.png "Step 6")

3. Once contigs have been selected, click on the Select Files bar.

    ![Step 7](./images/image7.png "Step 7")

4. This will open a pop-up window where one or more files can be selected. Highlight the files of interest and then click the Open button at the bottom of the window.

    ![Step 8](./images/image8.png "Step 8")

5. The selected files will appear in the upload window. Click on Upload Files to place those files in the workspace.

    ![Step 9](./images/image9.png "Step 9")

6. The Uploads information bar at the bottom of every PATRIC page will show the progress of the upload. The three columns show completed jobs (first column), jobs in progress (second), and the percent completion of the jobs in progress (third).

    ![Step 10](./images/image10.png "Step 10")

7. Mousing over the word "Uploads" will show a list of recent uploads. This indicates that the uploads are complete.

    ![Step 11](./images/image11.png "Step 11")

## Submitting an assembly for annotation
1. The taxonomy must be assigned.  To do this, begin typing the genus and species name in the text box below TAXONOMY NAME (red arrow).  This will start open a box that shows the closest matches to what have been typed.  Clicking on the closest match (blue highlight) will autofill the taxonomy id (red box).

    ![Step 12](./images/image12.png "Step 12")

2. A specific name that will identify the genome in the workspace must be entered (red arrow). As the name is being entered under MY LABEL, the OUTPUT NAME will show the selected genus, species and identifier.

    ![Step 3](./images/image13.png "Step 13")

3. The default genetic code is 11, for Archaea and most Bacteria. The other option is genetic code 4, which should be used if Mycoplasma, Spiroplasma or Ureaplasma are the organisms used.

    ![Step 14](./images/image14.png "Step 14")

4. An Output Folder needs to be assigned. Click on the down arrow that follows the text box underneath Output folder (Red Arrow) and then select (or create) a folder where the annotation will be placed.

    ![Step 15](./images/image15.png "Step 15")

5. Start the annotation job by clicking on the Annotate button (Red arrow).

    ![Step 16](./images/image16.png "Step 16")

6. A message will appear below the box to indicate that the job is now in the queue.

    ![Step 17](./images/image17.png "Step 17")

## Checking the status of the annotation job
1. Click on the Jobs indicator at the bottom of the PATRIC page.

    ![Step 18](./images/image18.png "Step 18")

2. This will open the Jobs Status page where researchers can see the status of their annotation job.  The statuses of all the service jobs that have been submitted to PATRIC are also available.

    ![Step 19](./images/image19.png "Step 19")

3. Once the job is completed, you can select the job by clicking on it and click the "View"
button on the right-hand bar to see the results.

    ![Step 20](./images/image20.png "Step 20")

4. The results page will consist of a header describing the job and a list of output files,
as shown below.

    ![Step 21](./images/image21.png "Step 21")

5. The first file is *GenomeReport.html*, which is described in [Analyzing Genome Quality](/tutorial/genome_quality_report/genome_quality_report.html).
This file contains a link to the genome's pages in the PATRIC Genome Browser as well as
information about the general quality of the genome. The remaining files shown are as
follows.

*   **contigs.fasta** contains the assembled contigs of the genome in DNA FASTA format.
*   **embl** contains an EMBL dump of the annotated genome.
*   **feature_dna.fasta** contains all the feature sequences of the genome in DNA FASTA format.
*   **feature_protein.fasta** contains all the protein sequences of the genome in protein
    FASTA format.
*   **features.txt** is a tab-delimited text file listing all the features of the genome.
    For each feature, it contains the PATRIC ID, the location string, the feature type,
    the functional assignment, any alternated IDs found, and (for protein-coding genes)
    the protein MD5 checksum.
*   **gb** contains the annotated genome in GENBANK format.
*   **genome** contains a special "Genome Typed Object (GTO)" JSON-format file that encapsulates all the data from the annotated genome. See [Extracting and Mining Genome Typed Objects](https://docs.patricbrc.org/cli_tutorial/cli_getting_started.html#extracting-and-mining-genome-typed-objects-gtos) for more information.
*   **gff** lists all the features of the genome in General Feature Format.


## References

1. Wattam AR, Davis JJ, Assaf R, Boisvert S, Brettin T, Bun C, Conrad N, Dietrich EM, Disz T, Gabbard JL, Gerdes S, Henry CS, Kenyon RW, Machi D, Mao C, Nordberg EK, Olsen GJ, Murphy-Olson DE, Olson R, Overbeek R, Parrello B, Pusch GD, Shukla M, Vonstein V, Warren A, Xia F, Yoo H, Stevens RL. (2017) Improvements to PATRIC, the all-bacterial Bioinformatics Database and Analysis Resource Center. Nucleic Acids Res. 45(D1): D535-D542.

2. Brettin T, Davis JJ, Disz T, Edwards RA, Gerdes S, Olsen GJ, Olson R, Overbeek R, Parrello B, Pusch GD, Shukla M, Thomason JA 3rd, Stevens R, Vonstein V, Wattam AR, Xia F. (2015). RASTtk: a modular and extensible implementation of the RAST algorithm for building custom annotation pipelines and annotating batches of genomes. Scientific reports 5: 8365.
