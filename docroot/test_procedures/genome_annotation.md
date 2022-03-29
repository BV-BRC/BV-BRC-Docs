# Genome Annotation Service Test Procedure

This Test Procedure is intended to confirm proper operation and returned results for the Genome Annotation Service.  

## See Also:
* [Genome Annotation Service](https://www.bv-brc.org/app/Annotation)
* [Genome Annotation Service Quick Reference Guide](../quick_references/services/genome_annotation_service.html)
* [Genome Annotation Service Tutorial](../tutorial/genome_annotation/genome_annotation.html)
* [Genome Annotation Protocol](../data_protocols/genome_annotation.html)

## Prerequisites
Test contigs available in workspace. 

## Procedure
*Note: The [Genome Annotation Service Tutorial](../tutorial/genome_annotation/genome_annotation.html) provides detailed step-by-step instructions and screenshots for using the Genome Annotation Service.*

1. Sign in to BV-BRC.


2. Select **'Annotation'** from the **'Tools & Services'** top menu (<https://www.bv-brc.org/app/Annotation>)


3. In the **'Parameters'** section of the Genome Annotation Service input form, use the following:

   * CONTIGS: Use 'Brucella_suis_test__contigs.fasta', available in the [BV-BRC Test Data / Genome Annotation / Bacteria](https://www.bv-brc.org/workspace/rkenyon@patricbrc.org/BV-BRC%20Test%20Data/Genome%20Annotation/Bacteria) public workspace. Public workspaces are available from the **'Workspaces'** top menu.
  
   * ANNOTATION RECIPE: Choose 'BACTERIA/ARCHAEA.'

   * TAXONOMY NAME: Type "Brucella suis" and select "[species] Brucella suis" from the dropdown list. TAXONOMY ID should automatically display "29461."
   
   * MY LABEL: Enter a name for the genome of your own choosing, e.g., "annotation test." This name will be concatenated with the TAXONOMY NAME and displayed in the OUTPUT NAME box, e.g., "Brucella suis annotation test."

   * OUTPUT FOLDER: Choose or create a folder in the workspace to where you want the results of the annotation job to be stored.

4. The **'Annotate'** button at the bottom of the input form should now be activated. Click it to start the annotation job. 

5. View the completed annotation job from the [Job List](https://www.bv-brc.org/job/). 

6. Verify correct output by comparing your job results (which will be a private genome) with the ["Brucella suis 7121680725-test" validated job results<sub>1</sub>](https://www.bv-brc.org/workspace/rkenyon@patricbrc.org/BV-BRC%20Test%20Data/Genome%20Annotation/Bacteria/Brucella%20suis%207121680725-test) in the public workspace:

   * Click the **'VIEW'** icon at the top right of your job results page and compare your private genome to the corresponding annotated [Brucella suis 7121680725](https://www.bv-brc.org/view/Genome/29461.119) genome in BV-BRC. Check Annotation Statistics, Genome Quality, Genome Features, Protein Features, and Specialty Genes in the Overview page.  Results should be nearly identical (some variation may occur over time due to updates in the service or underlying data). 

   * Click the **'CDS'** icon from the top right of your job results page and review counts of predicted CDS. Spot check results via keyword and filters. 

   * Double-click the GenomeReport.html in the list of files at the bottom of your job results page and compare results with the validated<sub>1</sub> [Genome Report](https://www.bv-brc.org/workspace/rkenyon@patricbrc.org/BV-BRC%20Test%20Data/Genome%20Annotation/Bacteria/.Brucella%20suis%207121680725-test/GenomeReport.html). 

## Notes
1\. Results have been validated via comparison with output from the RASTtk computational service that is used to annotate all BV-BRC bacterial and archaeal genomes:

* Brettin, T. et al. RASTtk: a modular and extensible implementation of the RAST algorithm for building custom annotation pipelines and annotating batches of genomes. Scientific reports 5, 8365 (2015). PMID: [25666585](https://pubmed.ncbi.nlm.nih.gov/25666585/) PMCID: [PMC4322359](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4322359/) DOI: [10.1038/srep08365](https://www.nature.com/articles/srep08365).