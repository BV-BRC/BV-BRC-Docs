# SARS-Cov-2 Wastewater Analysis Service

The SARS-CoV-2 Wastewater Analysis service is a comprehensive analysis of wastewater aimed at detecting and quantifying lineages and variants of concern (VOC) of the SARS-CoV-2 virus. 

The service analyzes raw short amplicon reads by aligning them to the reference genome (Wuhan-Hu-1) and then performs variant analysis using Freyja.  Freyja is a tool to identify and recover relative lineage abundances from mixed SARS-CoV-2 samples from a sequencing dataset (BAM aligned to the Hu-1 reference).  The method uses lineage-determining mutational "barcodes” with information from the UShER global phylogenetic tree.  We manage updating the barcodes to provide you up to date variant and lineage assignments. The results of this analysis workflow include sample processing status, key variant calling and alignment statistics, and sequencing depth coverage plots. It also provides lineage and VOC abundance plots by sample, date, week, and month for tracking the prevalence and distribution of different variants over time to aid public health response.
![An overview of the analysis pipeline](images/image_1_workflow_image.png "An overview of the analysis pipeline") 

How to access the SARS-CoV-2 Wastewater Analysis service under the Services menu at the top of the any BV-BRC page. Click the link to launch the service.

The landing page for the SARS-CoV-2 Wastewater Analysis service has two parts. Start with paired or single reads uploaded to the workspace or directly access Sequence Read Archive (SRA). For each read you must also select the primer during sequencing.  If you are using the sequence read archive the primer information maybe available with the BioSample in information.  The sample date is optional to the service. If provided, the service will show the data organized by day, week, and month.  This service is designed to analyze short amplicon sequences

![An image of the submission pag](images/image_2_submission_page.png "An image of the submission page")

## Submitting Reads to the Service
1. Submitting paired or single reads uploaded to the workspace: Click the folder icon at the end of the text box.
![An image of selecting the paired reads directory icon](images/image_3_paired_reads_select_directory.png "An image of selecting the paired reads directory icon")
2. If your reads are already on the workspace then navigate to your reads and select the read file from the workspace. If you must upload your reads, click the upload icon.
![An image with an arrow pointing to the upload icon](images/image_2_2_upload_icon.png "An image with an arrow pointing to the upload icon")
3. Click the blue box with ‘Select files’ or drag and drop your files into the upload box.
![An image of the file upload space](images/image_4_upload_window.png "An image of the file upload space")
4. Clicking selected files will open a window that allows you to choose files that are stored on your computer. Select the file where you stored the fastq file on your computer and click “Open”
![An image of an example file being selected for upload.](images/image_5_select_file.png "An image of an example file being selected for upload.")
5. Once selected, it will autofill the name of the file. Click on the Start Upload button.
![An image of the upload window with a file staged for upload](images/image_6_start_upload.png "An image of the upload window with a file staged for upload")
6. This will auto-fill the sample identifier. If using a paired read, repeat for Read 2. Edit the sample identifier If you would like to.
![An image of two paired reads in the paired read submission box.](images/image_7.png "An image of two paired reads in the paired read submission box.")
7. Do not submit your job or leave the page until the read upload is 100% complete.
![An image of the upload status bar](images/image_8_upload_status.png "An image of the upload status bar")
8. Select the primer and version of the primer used when sequencing your sample.
![An image of primer and version drop down](images/image_9_primer_selection.png "An image of primer and version drop down")
9. Then add a sample date if it is available to you. Take caution to format your date as Month, Day, Year, MM/DD/YYYY. You must type the “/” between Month and Day / Day and Year. For SRA samples it may be challenging the find the sample date. This may be available in the Biosample data.
![An image of the date being entered](images/image_10_date.png "An image of the date being entered")
10. If you add a non-numeric value an error will be given.
![An image of the error message when the data format is incorrect.](images/image_11_date_error.png "An image of the error message when the data format is incorrect.")
11. Finally, click the arrow button at the top to send this read and metadata to the “Selected Libraries” box.
![An image of the selected reads button.](images/image_11_select_reads_button.png "An image of the selected reads button.")
12. 12.	To review your read and metadata over the ‘I’ icon.
![An image of the 'i' icon displaying the read information.](images/image_13_read_i_icon.png "An image of the 'i' icon displaying the read information.")
13. Now your read is in the selected libraries box. Notice the Sample ID and Date fields clear but the primer field remains the same. Take caution if you are uploading reads with different primer sequences.
![An image of the input form after sending reads to the selected reads sample.](images/image_14_reads_selected.png "An image of the input form after sending reads to the selected reads sample.")
14. In the parameters section you will select an output folder and output name. Currently, we only offer one alignment and variant calling strategy.
![An image of the strategy drop down.](images/image_15_missing_outputs.png "An image of the strategy drop down.")
15. Select or create an output folder by clicking the folder icon at the end of the text field.
![An image of the output directory submission box.](images/image_16_select_output_directory.png "An image of the output directory submission box.")
16. Create a new folder by clicking the folder icon with the plus in the upper right hand corner of the “Select an Output Folder” window that will pop up.
![An image of the new folder icon.](images/image_17_output_dir_new_dir.png "An image of the new folder icon.")
17. Give your folder an informative name. Then click “Create folder”.
![An image of the create folder button.](images/image_18_creating_new_output_dir.png "An image of the create folder button.")
18. Your new folder should be available in the workspace. Select your directory. When selected it should highlight in blue. Then click “OK” in the bottom right and corner.
![An image of the okay button.](images/image_19_selecting_new_output_dir.png "An image of the okay button.")
19. The output folder field will populate with the name of your selected folder. Note: the submission page will guide you with warnings if a field is missing.
![An image of the alert that populates when the output name is missing.](images/image_20_missing_output_name.png "An image of the alert that populates when the output name is missing.")
20. Our final task is to write an informative name for the job results.
![An image of the submit button.](images/image_21_submitting.png "An image of the submit button.")
21. Once the “Submit” button turns blue, click “Submit” and your job will be sent to the “Job List”.
![An image of](images/image_22_job_submitted.png "e")
## Finding the SARS-CoV-2 Wastewater Analysis results
1. The SARS-CoV2 job can be located from three places on any BV-BRC page. Clicking on the Workspace tab will reveal two of the places where the workspace or jobs folder can be located, and also from the Jobs monitor located at the lower right of any BV-BRC page.
![An image of the workspace and jobs buttons with the word or between them.](images/image_23_my_jobs.png "An image of the workspace and jobs buttons with the word or between them.") 
2. Access the job though the workspace. Click on the Workspace tab, and then on the “home” in the drop-down box
![An image of the workspace shortcut.](images/image_24_my_jobs_workspace.png "An image of the workspace shortcut.")
3. This will take you to your home workspace. Scroll down until you find the folder where you stored the job, and then click on that.
![An image of an example workspace.](images/image_25_my_jobs_home.png "An image of an example workspace.")
4. This will open the contents that folder. Completed jobs are indicated by a checkered flag in the first column. Clicking on the row, or the flag, that contains the job, will rewrite the page.
![An image of the job icon.](images/image_27_select_job_result.png "An image of the job icon.")
5. The new page will show all the files produced by the job that was submitted.
![An image of the top of the job results landing page.](images/image_28_job_results_stats.png "An image of the top of the job results landing page.")
6. Each job submitted to the SARS-CoV-2 Wastewater Analysis service will return a report that summarizes the results. To view this report, click on the row that contains the words “SARS2Wastewater_report.html”.
![An image selecting the report html file.](images/image_29_select_report.png "An image selecting the report html file.")
7. The report begins with a detailed description of the service and analysis workflow.
![An image of the top of the report file.](images/image_30_report_1.png "An image of the top of the report file.")
8.The sample processing section shows the status of each sample at different steps of the workflow. If a sample fails a step, please scroll down to the ‘warnings’ sample of the report. We strive to capture the errors that cause the sample to fail.
![An image of the sample processing status table.](images/image_31_report_2.png "An image of the sample processing status table.")
9. The Primer Trimming and Alignment Statistics give details about each sample. A description of the columns is available below this table in the report.
![An image of the stats table in the report.](images/image_32_report_3.png "An image of the stats table in the report.")
10. Coverage plots are available for each sample. Graph that shows the coverage depth for the assembly at the specific positions in the genome. The plots in the report are all capped at the depth of 250. Each sample has sample specific directory with files that support the reports in the landing directory. Inside each sample specific directory is a sub directory, ‘assembly’. The ‘assembly’ directory will have two more views of this data. One, <sample_id>.png will show the same information without capping the y-axis. <sample_id>.log.png will display the same data with the where the depth has undergone a long transformation. If you want to save these plots, right click the plot inside of the report and click ‘save as’.
![An image of the coverage plots.](images/image_33.png "An image of the coverage plots.") 
11. The Lineage and Variant Abundance by Sample section displays all the samples. The graphs on the left show the data at the variant level and the graphs on the right shows the data at the linage level. These plots cannot be saved from the report. Instead, they are available in the ‘plots’ directory.
![An image of the lineage and variant plots.](images/image_34.png "An image of the lineage and variant plots.") 
12.The time series plots are only generated if dates are provided. The Lineage and Variant Abundance by date  show the data smoothed and ordered by date.
![An image of the date plots.](images/image_35.png "An image of the date plots.")
13.Lineage and Variant Abundance by Week will show the data compiled into weeks. This table shows the dates according to epiweek.  An "epiweek," short for epidemiological week, is a standard method of grouping days into weeks for the purposes of public health and epidemiological tracking.
![An image of the date plots.](images/image_36.png "An image of the date plots.")
14. As the week above does, Lineage and Variant Abundance by Month shows the data compiled by month.
![An image of the month plots.](images/image_37.png "An image of the month plots.")
15. Your results will be impacted by the barcodes. As described above, the method uses lineage-determining mutational "barcodes” with information from the UShER global phylogenetic tree. As the barcodes are updated the variants and linages are updated . If you were to rerun the samples, your results might be impacted. For this reason it is important for you to be familiar with the barcode version.
![An image of the where to find the barcode version.](images/image_38.png "An image of the where to find the barcode version.")
16.	The analysis warnings field will populate with warnings from the analysis. Warnings are captured when a sample fails analysis step which will be displayed in the sample processing table above.
![An image of the warnings header.](images/image_39.png "An image of the warnings header.")
17.	Please remember to cite the BV-BRC and  the authors of the tools we host.
![An image of the reference section. Please remember to include us in your citations!](images/image_40.png "An image of the reference section. Please remember to include us in your citations!")
18. Return to the job landing page by clicking on your job name in the file path at the top of the page.
19. View the raw Freyja results by highlight the file ‘freyja_results.tsv’ and click the ‘view’ eye icon on the green action bar.
![An image of the job results with the raw Freyja results selected.](images/image_41_select_raw_freyja_results.png "An image of the job results with the raw Freyja results selected.")
20.	The relative variant and lineage abundances created from VARIANTS and DEPTHS files using the Freyja demix command. The file Freyja_result.tsv has these results from each sample compiled into one report. The columns are as follows:
* Summarized – Describes the variants and the percentage of the assigned to those variants in the sample.
* Lineages - Describes the variants and the percentage of the assigned to those variants in the sample.
* Abundances - the abundances that correspodn to the lineages listed in the lineages column.
* Resid – Corresponds to the **residual** of the weighted abundances.
* Coverage – Provides the 10x coverage estimate (percent of sites with 10 or greater reads).
![An image of raw Freyja results.](images/image_42_raw_freyja_results.png "An image of raw Freyja results.")
21. The MultiQC report provides the compiled FastQC statistics  for the FASTQ and BAM files. Note: as this service is designed for short amplicon reads which are designed to capture a target sequence multiple times, these reports will show a high number of duplicates. For this sequencing type you can ignore these warnings.
![An image of MultiQC report.](images/image_43_multiqc.png "An image of MultiQC report.")
