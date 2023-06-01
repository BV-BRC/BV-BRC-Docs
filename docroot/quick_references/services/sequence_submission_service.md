# Sequence Submission Service

## Overview
The Sequence Submission service allows user to validate and submit virus sequences to NCBI Genbank. User-provided metadata and FASTA sequences are validated against the Genbank data submission standards to identify any sequence errors before submission. Sequences are also annotated using the VIGOR4 and FLAN annotation tools for internal use by users. The Sequence Submission service provides a validation report that should be reviewed by the user before submitting the sequences to the Genbank. 

Note: Current pipeline only supports Influenza A, B, or C virus family.

### See also
  * [Sequence Submission Service](https://bv-brc.org/app/SequenceSubmission)
  * [Sequence Submission Service Tutorial](../../tutorial/sequence_submission/sequence_submission.html)

## Using the Sequence Submission Service

The **Seqeuence Submission** submenu option under the **"TOOLS & SERVICES"** main menu (Genomics category) opens the Sequence Submission Service input form. *Note: You must be logged into BV-BRC to use this service.*

![Sequence Submission menu option](../images/bv_services_menu.png) 

## Parameters

Below is a screenshot of the Sequence Submission input form, as well as a summary of customizable parameters.  

![Sequence Submission Input Form](../images/sequence_submission/Picture2.png "Input Form") 

## Submitter Information

* **First Name:** The first name of the submitter (Required)
* **Last Name:** The last name of the submitter (Required)
* **Email:** The email id of the submitter (Required)
* **Institution/Affiliation:** The institution/affiliation information of the submitter (Required)
* **Country:** The country information of the submitter (Required)
* **Phone Number:** The phone number of the submitter
* **Consortium:** The consortium information of the submitter

## Sequence FASTA File

* **Enter Sequence:** Paste the custom sequence in FASTA format.
* **Select FASTA File:** Choose FASTA file that has been uploaded to the Workspace.

## Metadata File

Choose Metadata file (CSV Format) that has been uploaded to the Workspace.

Output Folder

Folder in the Workspace where you want the results stored.
Output Name

Name you provide to identify the results in the Workspace.


Buttons

Reset: Resets the input form to default values

Annotate and Validate Sequence(s): 
•	Validates input data and launches the job if there is no error. A message will appear below the box to indicate that the job is now in the queue.

![image](https://github.com/rkenyon/bvbrc_docs/assets/3188570/ae235993-5db3-4646-a0a2-cf6278df4068)
