# Taxonomic Classification Service
Metagenomics is the study of genomic sequences obtained directly from an environment. For many metagenomic samples, the species, genera and even phyla present in the sample are largely unknown at the time of sequencing, and the goal of sequencing is to determine the microbial composition as precisely as possible. The BV-BRC Taxonomic Classification service can be used to identify the microbial composition of metagenomic samples. Researchers can submit metagenomic samples that are short reads (paired end or single end) as well as submissions to the Sequence Read Archive via accession numbers. This service follows the analyses outlined in [Lu et al., 2022](https://doi.org/10.1038/s41596-022-00738-y) for metagenomic analysis with the Kraken software suite.  There are two pipelines, one is a standard approach called species identification. The other is called microbiome analysis which includes additional steps specifically for microbiome samples. Kraken [1], first released in 2014, has been shown to provide exceptionally fast and accurate classification for shotgun metagenomics sequencing projects. Kraken 2, which matches the accuracy and speed of Kraken 1, and,supports 16S rRNA databases.  Kraken2 uses exact-match database queries of k-mers, rather than inexact alignment of sequences.  Sequences are classified by querying the database for each k-mer in a sequence, and then using the resulting set of lowest common ancestor (LCA) taxa to determine an appropriate label for the sequence. The service uses a [Snakemake](https://snakemake.readthedocs.io/en/stable/) to manage the pipeline.
![Figure 1, a overview of the analysis pipeline](images/detailed_output_overview.png "Figure 1, a overview of the analysis pipeline") 

This is an overview of the FASTQ processing steps. Each sample (either a single read or paired read files) is run through the pipeline. Then the kraken2 results for each sample are compared against each other.

The steps of the pipeline are as follows:
1\. User input: If users submit Sequence Read Archive values (SRAs) and the BV-BRC will input the corresponding FASTQ files to the service.  Users can also submit short reads (paired or single end) to the service. Users can input multiple read files in the same job. If only one sample is submitted to the job any multisample comparison outputs will not be available.  The pipeline begins with FASTQ processing. The single and paired samples are run separately but go though the same steps. 
![Figure 2, a schematic of FASTQ processing](./images/fastq_processing_overview.png "Figure 2, a schematic of FASTQ processing") 

2\. The aim of this step is to align reads to the host genome and remove them from the sample [Hisat2](http://daehwankimlab.github.io/hisat2/) is a fast and sensitive alignment program for mapping next-generation sequencing reads.

3\. FastQC is run on both the raw files and host removed files. These results are available in the output directory, in each sample directory under FastQC_results. These results are also available in the multiQC.HTML report in landing output directory.

4\. The reads are classified with Kraken2. The minimum hit groups threshold is set to 3. The confidence interval is set to 0.1. We also use the 16 threads.  This requires that overlapping k-mers share a common minimizer before a sequence is classified. Kraken 2 uses minimizers to compress the input genomic sequences, thereby reducing storage memory needed and run time [3]. This is the last step in FASTQ processing. 

5\. The Kraken results for all samples, regardless of single and paired input files are analyzed in the remainder of the pipeline. Users can either select pathogen or microbiome. The microbiome pipeline includes the steps of the species identification pipeline with additional microbiome specific steps (Bracken abundance, alpha diversity and beta diversity). 

![Figure 3](./images/final_step_processing_overview.png "Figure 3, a schematic of the microbiome analysis  and and species identification pipelines")

6\. Sunburst plots displaying every taxa level are created using [kreport2krona](https://github.com/jenniferlu717/KrakenTools/blob/master/kreport2krona.py) and [Krona](https://github.com/marbl/Krona/wiki). A plot containing all samples in your analysis is available in the output directory. Individual plots are available in each sample directory.

7\. Sankey plots are created for each sample using functions from [Pavian](https://rdrr.io/github/fbreitwieser/pavian/).

8\. If multiple samples are submitted, functions from [Pavian](https://rdrr.io/github/fbreitwieser/pavian/) create an interactive mutisample comparison table.

9\. Results are compiled into a [MultiQC](https://multiqc.info/docs/) report.

10\. If microbiome analysis is selected, a companion program to Kraken2 and the other tools in the Kraken suite, [Bracken](https://github.com/jenniferlu717/Bracken).  Bracken recreates the report file using the new Bracken numbers. This is available in the user input sample id subdirectory under bracken_output. Any levels whose reads were below the threshold of 10 are not included. Percentages will be re-calculated for the remaining levels. Unclassified reads are not included in the report.

11\. Bracken functions calculate alpha and beta diversity. The statstics displayed with plotly in .HTML files as well as for downstream analysis as .CSV.

## I. Locating the Taxonomic Classification Service App

1\. At the top of any BV-BRC page, find the Services tab. 
![Figure 4](./images/tools_and_services_toolbar.png "Figure 4") 

2\. Click on Taxonomic Classification in the Metagenomics group. 
![Figure 5](./images/taxonomic_classification_service_menu.png "Figure 5") 

3\. This will open the Taxonomic Classification landing page where researchers can submit single or paired short read files, an SRA run accession number to the service. 
![Figure 6](./images/taxonomic_classification_service_page.png "Figure 6") 


## II. Uploading paired end reads

Paired read libraries are usually given as file pairs, with each file containing the forward or reverse half of each read pair. Paired read files are expected to be sorted in such a way that each read in a pair occurs in the same Nth position as its mate in their respective files. These files are specified as READ FILE 1 and READ FILE 2. For a given file pair, the selection of which file is READ 1 or READ 2 does not matter.

1\. To upload a FASTQ file that contains paired reads, locate the box called “Paired read library.” 
![Figure 7](./images/paired_reads_input.png "Figure 7") 

2\. The reads must be saved in the workspace as file type reads to submit them to a BV-BRC service.
To initiate the upload, first click on the folder icon. 
![Figure 8](./images/paired_input_read_1.png "Figure 8") 

3\. This opens a pop-up window where the files for upload can be selected.  Click on the icon with the arrow pointing up.  
![Figure 9](./images/upload_button.png "Figure 9") 

4\. This opens a new pop-up window where the file can be selected.  Click on the “Select File” in the blue bar.
![Figure 10](./images/upload_blue_bar.png "Figure 10") 

5\. This will open a window that allows you to choose files that are stored on your computer.  Select the file where you stored the FASTQ file and click “Open”.
![Figure 11](./images/file_viewer.png "Figure 11") 

6\. Once selected, it will autofill the name of the file. You can see it in the screenshot below. Click on the Start Upload button.
![Figure 12](./images/start_upload.png "Figure 12") 

7\. This will auto-fill the name of the document into the text box as seen below.
![Figure 13](./images/upload_file_1.png "Figure 13") 

8\. Pay attention to the upload monitor in the lower right corner of the BV-BRC page. It will show the progress of the upload. Do not submit the job until the upload is 100% complete. 

![Figure 14](./images/file_uploading.png "Figure 14") 

9\. Repeat steps 2-5 to upload the second pair of reads.
![Figure 15](./images/upload_file_2.png "Figure 15") 

10\. The SAMPLE ID field will auto populate with the file name. Edit the field by clicking into the text box. The text entered to this text box will be used to identify this sample throughout the output files for the service. This documentation refers to this field as a sample id.

11\. To finish the upload, click on the icon of an arrow within a circle. This will move your file into the Selected libraries box.
![Figure 16](./images/libaries_box_button.png "Figure 16") 

## III. Uploading single reads

1\. To upload a FASTQ file that contains single reads, locate the text box called “Single read library.”
![Figure 17](./images/single_read_box.png "Figure 17") 

2\. If the reads have previously been uploaded, click the down arrow next to the text box below Read File.
![Figure 18](./images/read_drop_down.png "Figure 18") 

3\. This opens up a drop-down box that shows the all the reads that have been previously uploaded into the user account. Click on the name of the reads of interest.
![Figure 19](./images/select_read_from_drop_down.png "Figure 19") 

4\. This will auto-fill the name of the document into the text box as seen below.
![Figure 20](./images/single_read_autofill.png "Figure 20") 

5\. The SAMPLE IDENTIFIER Field will auto populate with the file name. Edit the field by clicking into the text box. The text entered to this text box will be used throughout the output files for the service. This documentation refers to this field as a sample id.

6\. To finish the upload, click on the icon of an arrow within a circle. This will move your file into the Selected libraries box.
![Figure 21](./images/single_read_selected_libaries.png "Figure 21") 

## IV. Submitting reads that are present at the Sequence Read Archive (SRA)
1\. BV-BRC also supports analysis of existing datasets from SRA. To submit this type of data, locate the Run Accession number and copy it.
![Figure 22](./images/SRA_site.png "Figure 22") 

2\. Paste the copied accession number in the text box underneath SRA Run Accession, then click on the icon of an arrow within a circle.
![Figure 23](./images/sra_box.png "Figure 23") 

3\. The SAMPLE IDENTIFIER Field will auto populate with the SRA value. Edit the field by clicking into the text box. The text entered to this text box will be used throughout the output files for the service. This documentation refers to this field as a sample id.

4\. This will move the file into the Selected libraries box.
![Figure 24](./images/SRA_selected_libaries.png "Figure 24") 

## IV. Selecting parameters

![final step options](./images/final_step_processing_overview.png "final step options")

Parameters must be selected prior to job submission. The algorithm used for Taxonomic Classification is Kraken2, which uses exact alignment of k-mers for classification accuracy. The Kraken2 software package was downloaded from the developer source: https://ccb.jhu.edu/software/kraken2/
![Figure 25](./images/parameters_box.png "Figure 25")  

1\. An analysis type must be selected for the Taxonomic Classification job. Click on the Analysis Type drop down arrow to choose between Species Identification or Microbiome Analysis. For a detailed description of both outlines please review the [quick reference guide](https://www.bv-brc.org/docs/quick_references/services/taxonomic_classification_service.html).
![Figure 26](./images/select_analysis_type.png "Figure 26")

2\. A reference database must be selected for the Taxonomic Classification job.  Click on the Database dropdown arrow to choose between Kraken2 Standard Database and the BV-BRC Database. For a detailed description of both the databases please review the [quick reference guide](https://www.bv-brc.org/docs/quick_references/services/taxonomic_classification_service.html).
![Figure 27](./images/select_database.png "Figure 27")

3\. Choose the host genome that will be removed from the reads. Click on the Host Genome dropdown arrow to and click on the host genome for your samples. For metagenomic samples, homo sapiens is the most common host genome.
![Figure 28](./images/select_host_genome.png "Figure 28") 

2\. An output folder must be selected for the Taxonomic Classification job. Clicking on the down arrow at the end of the text box underneath Output Folder will show recent folders that have been used. Clicking on the folder icon at the end of the text box will open a pop-up window where all folders can be viewed, or new folders created. You can also start typing the name of a folder in the text box.  A drop-down box will appear that shows folders that match what you entered.
![Figure 29](./images/write_output_dir.png "Figure 29") 

3\. Click on the desired folder.
![Figure 30](./images/select_output_folder.png "Figure 30") 

4\. The name of the folder will now appear in the box.  
![Figure 31](./images/output_folder.png "Figure 31") 

5\. A name for the job must be entered in the text box under Output Name. At this point, the Submit button turns blue and the job will be submitted once clicked.  
![Figure 32](./images/output_name.png "Figure 32") 

6\. After clicking the submit button, your job will be launched.  A successful submission will generate a message indicating that the job has been queued.  
![Figure 33](./images/job_queued.png "Figure 33") 

The bottom of each BV-BRC page has an indicator that shows the number of jobs that are queued, running or completed. Clicking on the word Jobs will rewrite the page to show the Job status. Researchers can monitor the Jobs Status page to see the status of their job, which is indicated in the first column (Queued, Running, Complete, Failed).
![Figure 34](./images/job_status_tool_bar.png "Figure 34") 

## V. Viewing the Taxonomic Classification job – Output files

1\. To access your job, you can click on the Jobs part of your Jobs monitor.
![Figure 35](./imagesjob_status_tool_bar_w_arrow.png "Figure 35") 

2\. This will open your Jobs page.
![Figure 36](./images/jobs_page.png "Figure 36") 

3\. Clicking on the row that contains the job of interest will open two icons in the vertical green bar.  To report an issue with a job, click on the Report Issue icon.
![Figure 37](./images/report_job.png "Figure 37") 

4\. This will open a pop-up window where jobs can be reported. Please provide a detailed description of the problem.  Clicking the submission button will generate a message to BV-BRC team members, notifying them that there is a problem. We encourage researchers to report all failed jobs, or those that have confusing results. In addition, researchers should report long waits that they are experiencing in the queue.
![Figure 38](./images/report_job_window.png "Figure 38") 

5\. A job that has been successfully completed can be viewed by clicking on the row (which will turn the row blue) and then clicking on the View icon in the vertical green bar.
![Figure 39](./images/view_job_button.png "Figure 39") 

6\. This will open a page for the selected job. The top box has the job ID number and gives pertinent information about the time it took to complete and the selected parameters. The lower table will have the output files. The landing directory will have files and sub directories for each sample. A summary_table.csv provides a summary for the Kraken2 results. The MultiQC report contains the FastQC, Kraken The sample_key.csv displays the user input file names and the sample ids. A Sankey diagram for each sample.  If multiple samples were run there will be a multisample table, multisample krona file, and summary table.
![Taxonomic Classification Output Files](../images/output_results.png)

7\. A subdirectory is available for each sample. The contents are described below at step 13.

For *microbiome analyses* alpha diversity results for each sample are collated as .CSV and .HTML. 
*If multiple samples were run* the beta diversity results as .CSV and .HTML.

8\. multiqc_report.html will display a compilation of sample results from various analyses into one place. If you are new to MultiQC, an introductory [video walkthrough](https://www.youtube.com/watch?v=BbScv9TcaMg) also available above General Statistics. Use the toolbox to interact with the contents of the report. ![MultiQC video walkthrough](./images/MultiQC_video_walkthrough.png "MultiQC video walkthrough")

9\. multisample_comparison.html *This file is only generated if multiple samples are submitted with this job* Click to view a table of the taxa compared across samples according to z-score Note: this information is also available in multisample_comparison.csv for convient use in downstream analysis and visualzation. Refer to the [quick reference guide](https://www.bv-brc.org/docs/quick_references/services/taxonomic_classification_service.html) for a detailed explaination of how to interpret the data.
![Multicomparison table](./images/multi_cmp.png "Multicomparison table")

10\. multisample_krona.html *This file is only generated if multiple samples are submitted with this job* Click to view krona plots of each sample included in your analysis. Toggle between all the samples included in your analysis by clicking on the sample names or up and down arrows in the upper left hand corner of the report underneath the Krona logo. For more details about interacting with the Krona chart please view the sample level details at number 20 in this list.
![multisample krona plot toggle](./images/multisample_krona_plot_toggle.png "multisample krona plot toggle")

11\. summary_table.csv *This file is only generated if multiple samples are submitted with this job* Click to view a summary of kraken results across all the samples submitted in this job.

12\. sample_key.csv Click to view the user input SAMPLE IDENTIFIER used in the output files and the user input file name.

13\. Click into a sample specific subdirectory. Each sample directory is formatted the same way and contains files for an individual sample.

14\.	Click FastQC_results directory. This directory contains two subdirectories, host_removed_reads and raw_reads. Click into a subdirectory to view here is FastQC reports and directory with related files for each sample.  If you are unfamiliar with reviewing FastQC report review this [detailed video walkthrough](https://www.youtube.com/watch?v=bz93ReOv87Y) from the creators of FastQC at [Babraham Bioinformatics](https://www.bioinformatics.babraham.ac.uk/).  Note: These results are also available in the MultiQC report which contains these files for every sample included in this job. The files that support the FastQC report are available zipped into FastQC.zip for the specific FASTQ (or both read one and read two FASTQs). Click the up arrow next to *parent folder* to return to the sample specific subdirectory.

15\. Click the Hisat2_results subdirectory to view the contents. This folder contains the host removed FASTQ read files. A SAM file with the aligned reads is also located in this directory.Click the up arrow next to *parent folder* once to return to the sample specific subdirectory.

16\. Click kraken_output directory to find the standard Kraken2 result report and output files. These are text files that can be viewed by clicking on them. Click the up arrow next to *parent folder* once to return to the sample specific subdirectory.

17\. [*user sample id*]_sankey.html Sankey diagram This is another view of the taxa across every domain level at the same time. The key to reading and interpreting Sankey Diagrams is remembering that the width is proportional to the quantity represented. If features are overlapping, click and drag bars up and down. Specifically, the archaea feature may populate over the sample name. Simply click and drag down to view. 
![Sankey Diagram](../images/sankey_diagram.png "Sankey Diagram")

18\. Click the [*analysis sample name*]_krona.html to view an interactive display of the taxa and their domain level.

19\. This view has a search box at the top left of the page.  Entering any text will search the graph results for text that matches the entry.
![Krona Search Box](./images/search_box_krona_plot.png "Krona Search Box") 

20\. Click on a section of interest. Note that the breakdown along the righthand side changes.
![subsection stats krona plot](./images/subsection_stats.png "subsection stats krona plot") 

21\. Double click on the exterior of the section to show only that section.
![subsection view krona plot](./images/subsection_view_krona_plot_action.png "subsection view krona plot") 

22\. At the top of the view, there are several controls that can be used to change the visualization. For a detailed explaination of viewing, interpreting and interacting with Krona plots please visit the [developer's guide](https://github.com/marbl/Krona/wiki/Browsing%20Krona%20charts).
  * Max depth changes the phylogeny levels shown
  * Font size changes the size of the font
  * Chart size will zoom in the plotin and out
  * Collapse removes the other phylogeny levels from view and only shows the current phylogeny level
  * Link and snapshot are not supported
  * The "?" question mark icon will take you to the Krona plot [developer's guide](https://github.com/marbl/Krona/wiki/Browsing%20Krona%20charts) to browsing Krona charts.

23\. The entire report can be downloaded by clicking on the Download icon at the top of this page.
![Figure 47](./images/Picture47.png "Figure 47") 

24\. Navigate to landing directory for the job output.  Click the file, multisample_comparison.html.
Interact with the table by clicking the up and and down arrows next to the sample ID. This will sort the results for the taxa with the highest z-score at the. top of the table. Set a range for the values in  a column inthe "All" text box. Click the "Prev", "Next", and page numbers to sort through pages of the table.

The robust z-score is the median absolute deviation. This method is chosen to reduce impact from outliers in the data, providing a more reliable measure of relative position within the data distribution. 

If the positive robust z-score indicates that t the number of fragments assigned to that taxa was above the median or central tendancy of the data. 

Conversly, a negitive robust z-score indicates that the number of fragments assigned to that taxa was below the median or central tendancy of the data. 

The magnitude (represented as the value of the z-score) indicates the distance of the data point from the central tendency in terms of the robust measure of dispersion. 

The intensity of the red for each cell is calculated by putting the read scores into quantiles probabilites ranging from 0.05 to 0.95 with an increment of 0.05. This means that the intensity of the color represents the relative position in the datasets disribution for that datapoint. A darker color indicates that value is more likely to be an outlier.

![Example Muliple Sample Comparison Table](./images/multi_cmp.png "Example Muliple Sample Comparison Table")

### Microbiome Analysis specific outputs
#### Alpha Diversity
This is a table with the various measures of output diveristy. For a detailed explaination about each alpha diversity please review the [quick reference guide](https://www.bv-brc.org/docs/quick_references/services/taxonomic_classification_service.html). The data displayed in the .HTML file is also available as .CSV.
![Example Alpha Diversity Table](./images/alpha_stats_table.png "Example Alpha Diversity Table")

#### Beta Diversity Heatmap
This is a heatmap displaying the beta-diversity value between each sample. Beta-diversity is quantified as the variability in community composition (the identity of taxa observed) between samples within a group of samples (Anderson et al., 2006). The data displayed in the .HTML file is also available as .CSV. For a detailed explaination about how this is calculcated, please, review the [quick reference guide](https://www.bv-brc.org/docs/quick_references/services/taxonomic_classification_service.html).
![Beta Diversity Heatmap](./images/beta_diversity.png "Beta Diversity Heatmap") 


## References
1. Anderson MJ, Ellingsen KE, McArdle BH. Multivariate dispersion as a measure of beta diversity. Ecol Lett. 2006. June;9(6):683–93. 10.1111/j.1461-0248.2006.00926.
2. Andrews, S. (2010). FastQC:  A Quality Control Tool for High Throughput Sequence Data [Online]. Available online at: http://www.bioinformatics.babraham.ac.uk/projects/fastqc/
3. Breitwieser FP, Salzberg SL. Pavian: interactive analysis of metagenomics data for microbiome studies and pathogen identification. Bioinformatics. 2020 Feb 15;36(4):1303-1304. doi: 10.1093/bioinformatics/btz715. PMID: 31553437; PMCID: PMC8215911.
4. Ewels, P., Magnusson, M., Lundin, S., &amp; Käller, M. (2016). MultiQC: Summarize analysis results for multiple tools and samples in a single report. Bioinformatics, 32(19), 3047–3048. https://doi.org/10.1093/bioinformatics/btw354 
5. Fisher, R. A., Corbet, A. S. & Williams, C. B. The relation between the number of species and the number of individuals in a random sample of an animal population. J. Anim. Ecol. 12, 42–58 (1943)
6. Kim, D., Langmead, B., & Salzberg, S.L. (2015). HISAT: A afstq spliced aligner with low memory requirements. Nature Methods, 12(4), 357-360. https://doi.org/10.1038/nmeth.3317
7. Lu, J. & Salzberg, S. L. Ultrafast and accurate 16S rRNA microbial community analysis using Kraken 2. Microbiome 8, 1-11 (2020).
8. Lu, J., Rincon, N., Wood, D. E., Breitwieser, F. P., Pockrandt, C., Langmead, B., Salzberg, S. L., &amp; Steinegger, M. (2022). Metagenome analysis using the Kraken Software Suite. Nature Protocols, 17(12), 2815–2839. https://doi.org/10.1038/s41596-022-00738-y
9. Maidak, Bonnie L., et al. "The RDP (ribosomal database project)." Nucleic acids research 25.1 (1997): 109-110.
10. Ondov BD, Bergman NH, and Phillippy AM. Interactive metagenomic visualization in a Web browser. BMC Bioinformatics. 2011 Sep 30; 12(1):385.
11. Wood DE, Salzberg SL: Kraken: ultrafast metagenomic sequence classification using exact alignments. Genome Biology 2014, 15:R46.
12. Shannon, C. E. A mathematical theory of communication. Bell Syst. Tech. J. 27, 379–423 (1948).
13. Simpson, E. H. Measurement of diversity. Nature 163, 688–688 (1949)
14. Yilmaz P, Parfrey LW, Yarza P, Gerken J, Pruesse E, Quast C, Schweer T, Peplies J, Ludwig W, Glöckner FO. The SILVA and “All-species Living Tree Project (LTP)” taxonomic frameworks. Nucleic Acids Res. 2014; 42(Database issue):643–8.
