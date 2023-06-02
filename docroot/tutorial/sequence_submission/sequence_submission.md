# Sequence Submission Service
The Sequence Submission service allows user to validate and submit virus sequences to NCBI Genbank. User-provided metadata and FASTA sequences are validated against the Genbank data submission standards to identify any sequence errors before submission. Sequences are also annotated using the VIGOR4 and FLAN annotation tools for internal use by users. The Sequence Submission service provides a validation report that should be reviewed by the user before submitting the sequences to the Genbank. 

Note: Current pipeline only supports Influenza A, B, or C virus family.

## Locating the Sequence Submission Service

1\. At the top of any BV-BRC page, find the Tools & Services tab and click on it.
 
![Figure 1](./images/fig1.png "Figure 1")

2\. In the drop-down box, underneath Genomics, click on Sequence Submission.

![Figure 2](./images/fig2.png "Figure 2")

3\. This will open the Sequence Submission landing page where researchers can submit submitter information, sequence data or FASTA file and metadata file.

![Figure 3](./images/fig3.png "Figure 3")

## Specifying Sequence Submission Parameters

1\. Provide submitter information. All fields marked with asterisks are required.

![Figure 4](./images/fig4.png "Figure 4")

2\. Select the desired input files/sequences in FASTA format. FASTA definition line must begin with a carat (“>”), followed by a unique sample identifier (Unique_Sample_Identifier) and a unique sequence identifier (Unique_Sequence_Identifier) separated by a pipe (“|”). 
Example defline: “>Unique_Sample_Identifier: yourSampleID| Unique_Sequence_Identifier: yourSampleID-segmentNumber”

There are two ways to select input sequences for analysis: 
* Use Enter Sequence option to paste one or more protein sequence in FASTA format.

![Figure 5](./images/fig5.png "Figure 5")

* Select FASTA File: This option allows users to select custom sequence(s) file in a FASTA format. Users can select FASTA files which are already uploaded in the workspace [2a] or they can upload their own [2b].

![Figure 6](./images/fig6.png "Figure 6")

![Figure 7](./images/fig7.png "Figure 7")

3\. Provide a metadata file in CSV format. You can find the metadata template, field definitions, data types and formats [here](https://www.bv-brc.org/workspace/mkuscuog@bvbrc/BV-BRC Templates/).

4\. To specify output parameters, select an output folder in their workbench or create one if an appropriate folder is not available (red arrow). Users will also be prompted to specify an “Output Name” (red box) for the job result, before the job can be submitted.

![Figure 8](./images/fig8.png "Figure 8")

## Submitting a job for Sequence Submission

After the parameters and input file selections have been made, the “Annotate and Validate Sequence(s)” button will become available.

![Figure 9](./images/fig9.png "Figure 9")



![Figure 10](./images/fig10.png "Figure 10")



![Figure 11](./images/fig11.png "Figure 11")



![Figure 12](./images/fig12.png "Figure 12")



![Figure 13](./images/fig13.png "Figure 13")



![Figure 14](./images/fig14.png "Figure 14")



![Figure 15](./images/fig15.png "Figure 15")



![Figure 16](./images/fig16.png "Figure 16")



![Figure 17](./images/fig17.png "Figure 17")



