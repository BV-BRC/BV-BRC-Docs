# Genome Annotation Service Test Procedure

This Test Procedure is intended to confirm proper operation and returned results for the Genome Annotation Service.  

## See Also:
* [Genome Annotation Service](https://www.bv-brc.org/app/Annotation)
* [Genome Annotation Service Quick Reference Guide](../quick_references/services/genome_annotation_service.html)
* [Genome Annotation Service Tutorial](../tutorial/genome_annotation/genome_annotation.html)
* [Genome Annotation Protocol](../data_protocols/genome_annotation.html)

## Prerequisites
Test contigs available in workspace 

## Procedure
*Note: The [Genome Annotation Service Tutorial](../tutorial/genome_annotation/genome_annotation.html) provides detailed step-by-step instructions and screenshots for using the Genome Annotation Service.*

1. Sign in to BV-BRC.


2. Select **'Annotation'** from the **'Tools & Services'** top menu (<https://www.bv-brc.org/app/Annotation>)


3. In the **'Parameters'** section of the Genome Annotation Service input form, use the following:

   * CONTIGS: Use 'Bucella_pinnipedials_strain_B-REFBPIN-ST25-B2-94_contigs.fasta', available in the [BV-BRC Test Data](https://www.bv-brc.org/workspace/public/rkenyon@patricbrc.org/BV-BRC%20Test%20Data/Genome%20Annotation) public workspace. Public workspaces are available from the **'Workspaces'** top menu. 
  
   * ANNOTATION RECIPE: Choose 'BACTERIA/ARCHAEA.'

   * TAXONOMY NAME: Enter "Brucella" and select "[genus] Brucella" from the dropdown list. TAXONOMY ID should automatically display "234."
   
   * MY LABEL: Enter a name for the genome of your own choosing, e.g., "annotation test." This name will be concatenated with the TAXONOMY NAME and displayed in the OUTPUT NAME box, e.g., "Brucella annotation test."

   * OUTPUT FOLDER: Choose or create a folder in the workspace to where the results of the annotation job will be stored.

4. The **'Annotate'** button at the bottom of the input form should now be activated. Click it to start the annotation job. 

5. View the completed annotation job from the [Job List](https://www.bv-brc.org/job/). 

6. Verify correct output by comparing the results with the [validated results](https://www.bv-brc.org/workspace/rkenyon@patricbrc.org/home/Test%20-%20Genome%20Annotation/Brucella%20annotation%20test) in the BV-BRC Test Data public workspace:

   a. Click the **'VIEW'** icon and compare annotated results with Annotation Statistics, Genome Quality, Genome Features, Protein Features, and Specialty Genes in the Overview page.

   b. Click the **'CDS'** icon and review counts of predicted CDS and spot check results via keyword and filters. 

   c. Double-click the GenomeReport.html in the list of files at the bottom of the job results page and compare results with the validated [Genome Report](https://www.bv-brc.org/workspace/rkenyon@patricbrc.org/BV-BRC%20Test%20Data/Genome%20Annotation/.Brucella%20annotation%20test/GenomeReport.html). 
