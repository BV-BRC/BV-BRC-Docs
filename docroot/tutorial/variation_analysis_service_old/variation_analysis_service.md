# Submitting a Variant Analysis Job

The Variation Analysis Service can be used to identify and annotate sequence variations, including SNPs, SNVs, and indels. 

**Keywords:** Variation analysis, SNP analysis, SNPs, SNVs, Indels, Variant calling, Variant analysis, Variant annotation. 

## I. Locating the Variant Service App
1. At the top of any PATRIC page, find the Services tab. Click on Variant analysis.
![Step 1](./images/image1.png)

2. This will open up the Variant Analysis landing page where researchers can submit single or paired read files.
![Step 2](./images/image2.png)

## II. Loading the Reads-Paired end
1. Information on any page is available by clicking on the blue icon (red arrow). This will open an information box 
![Step 3](./images/image3.png)

2. To upload paired reads for analysis, click on the down arrow that follows the text box (red arrow). This will open a drop down box where reads that have been uploaded to PATRIC can be selected (black arrow).
![Step 4](./images/image4.png)

3. Once selected, the name will appear under the read file. To load the second half of the pair, repeat the process for Read File 2.
![Step 5](./images/image5.png)

4. Once both halves are selected, click on the arrow icon in the Paired read library box (red arrow). This will load the reads (shown together in the same line for paired reads) into the Selected libraries panel.
![Step 6](./images/image6.png)

## III. Loading the Reads-Single read
1. To upload single reads for analysis, click on the down arrow that follows the text box (red arrow). This will open a drop down box where reads that have been uploaded to PATRIC can be selected (black arrow).
![Step 7](./images/image7.png)

2. Once selected, the name will appear under the read file. Click on the arrow icon in the Single read library box (red arrow). This will load the reads into the Selected libraries panel.
![Step 8](./images/image8.png)

3. Repeat to add additional files to the analysis.
![Step 9](./images/image9.png)

## IV. Filling in parameters
1. PATRIC offers several types of aligners and SNP callers that can be used for comparison. The Variant analysis service has BWA-mem as the default. To see the other choices of aligners that can be used, click on the down arrow at the end of the Aligner text box (red arrow). This will open a drop down box that shows all the available programs. A description of each program is provided below the screenshot.
![Step 10](./images/image10.png)

- **BWA-MEM** is a new alignment algorithm for aligning sequence reads or long query sequences against a large reference genome such as human. It automatically chooses between local and end-to-end alignments, supports paired-end reads and performs chimeric alignment. The algorithm is robust to sequencing errors and applicable to a wide range of sequence lengths from 70bp to a few megabases. For mapping 100bp sequences, BWA-MEM shows better performance than several state-of-art read aligners to date(1).
- **BWA-mem-strict** is BWA-mem with the default parameters plus "-B9 -O16" to increase the gap extension and clipping penalty. These strict mapping parameters are recommended for cases where contigs and references are known to be very close to each other.
- **Bowtie2**, a method that combines the advantages of the full-text minute index and SIMD dynamic programming, achieves very fast and memory-efficient gapped alignment of sequencing reads. It improves on the previous Bowtie method in terms of speed and fraction of reads aligned and is substantially faster than non–full-text minute index–based approaches while aligning a comparable fraction of reads.  Bowtie 2 performs sensitive gapped alignment without incurring serious computational penalties(2).
- **LAST** can handle big sequence data, like comparing two vertebrate genomes. It can align billions of DNA reads to a genome, and will indicate reliability of each aligned column. In addition, it can compare DNA to proteins, with frameshifts, compare PSSMs to sequences, calculates the likelihood of chance similarities between random sequences, does split and spliced alignment, and can be trained for unusual kinds of sequences (like nanopore)(4).

2. PATRIC also offers a choice of SNP callers. The default selection is for FreeBayes. To see the other available choices, click on the down arrow that follows the SNP Caller text box (red arrow). This will open a drop down box that shows all the available programs. A description of each program is provided below the screenshot.
![Step 11](./images/image11.png)

- **FreeBayes** is an accurate method for sequence organization that includes fragment clustering, paralogue identification and multiple alignment. It calculates the probability that a given site is polymorphic and has an automated evaluation of the full length of all sequences, without limitations on alignment depth(5).
- **The Sequence Alignment/Map (SAM)** format is a generic alignment format for storing read alignments against reference sequences. SAMtools implements various utilities for post-processing alignments in the SAM format, such as indexing, variant caller and alignment viewer, and thus provides universal tools for processing read alignments(6). The SAMtools option invokes the BCFtools' SNP calling algorithm on top of SAMtools' mpileup result.

Either SNP caller is run with the default parameters. The raw SNPs are then filtered by SNP quality (QUAL>10) and read depth (DP>5) to keep only the high-quality SNPs.

3. Researchers must select a Target Genome to align the reads against. If this genome is a private genome, the search can be narrowed by clicking on the filter icon under the words Target Genome (red arrow). This will open the filter where Public Genomes can be de-selected (blue arrow).
![Step 12](./images/image12.png)

4. To select a reference genome, start typing the name of a genome. A box below Target Genome will show the closest matches that can be selected.
![Step 13](./images/image13.png)

5. Researchers that have used PATRIC before can click on the down arrow at the end of the Output Folder text box. This will open a dropdown box that will show the folders that exist in the workspace (red arrow).
![Step 14](./images/image14.png)

6. Finally, researchers must name the Variant analysis job (red arrow).
![Step 15](./images/image15.png)

## V. Submitting the Variant Service Job
1. To submit the completed job, click the Submit button (red arrow).
![Step 16](./images/image16.png)

2. If the job was submitted successfully, a message will appear that indicates that the job has entered the queue.
![Step 17](./images/image17.png)

3. To check the status of the variation job, click on the Jobs indicator at the bottom of the PATRIC page.
![Step 18](./images/image18.png)

4. Clicking on Jobs opens the Jobs Status page, where researchers can see the progression of the variation job as well as the status of all the previous service jobs that have been submitted.
![Step 19](./images/image19.png)

## VI. Viewing the Variant analysis 
1. From the jobs page, click on a row to select the variant analysis job of interest. Once selected, the downstream processes available for the selection appear in the vertical green bar. Each variant analysis job will only have one option, which is View (red arrow). Clicking on the View icon will open the variant analysis job summary page.
![Step 20](./images/image20.png)

2. The variant analysis job summary page provides researchers with a cornucopia of files that can be downloaded, viewed, and examined for further analysis.
![Step 21](./images/image21.png)

3. **Bam files**. The Binary Alignment/Map (BAM) is the companion format of the Sequence Alignment/Map (SAM) format(6). A SAM file (.sam) is a tab-delimited text file that contains sequence alignment data. The .bam format is compact in size and supports fast retrieval of alignments in specified regions. It is optimal for viewing in a genome browser. The PATRIC variant analysis service provides a .bam file for each of the read libraries that were loaded.
![Step 22](./images/image22.png)

4a. **Tab Separated Values (tsv)**. The PATRIC variant analysis service provides a .tsv file for each of the read libraries that were loaded. It summaries the locations of the variants, shows the nucleotide change, and identifies if it was a synonymous or nonsynonymous substitution, or an indel. It also identifies the gene, or intergenic region, where the variation occurred.
![Step 23](./images/image23.png)

4b. These files can be opened using excel to easily see the different variants.
![Step 24](./images/image24.png)

5. The **libs.txt** file. This is a text file that describes the libraries used in the comparison.
![Step 25](./images/image25.png)

6. The **summary.txt** files. This file provides a summary of the analysis. For each library it shows the number of reads, those that mapped to the reference, the number of bases in the reference, the median base coverage, bases with zero coverage, bases with less than (or equal to) 10 reads coverage, the raw variants that are detected by the variation calling tool, and those variants that have a high quality score.
![Step 26](./images/image26.png)

7. The **var.snpEFF.vcf** files. SnpEff rapidly categorizing the effects of variants in genome sequences. Once a genome is sequenced, SnpEff annotates variants based on their genomic locations and predicts coding effects. Annotated genomic locations include intronic, untranslated region, upstream, downstream, splice site, or intergenic regions. Coding effects such as synonymous or non-synonymous amino acid replacement, start codon gains or losses, stop codon gains or losses, or frame shifts can be predicted(7). Below is an example, with the effects highlighted in the red boxes. The PATRIC variant analysis service provides a .var.snpEFF.vcf file for each of the read libraries that were loaded.
![Step 27](./images/image27.png)

8. The **var.snp.vcf** files. These files show the location of the snp on the genome. The PATRIC variant analysis service provides a .var.snp.vcf file for each of the read libraries that were loaded.
![Step 28](./images/image28.png)

9. The **.html** file. The HyperText Markup Language (HTML) file will open a webpage that shows the same data available in the .tsv file. This table can be sorted by clicking on the column headers.
![Step 29](./images/image29.png)

The list below shows the title and information about each column, from left to right.
* Samples - internal library read name. The corresponding user library read name can be found in libs.txt
* Contig - contig name
* Pos - position of the variation
* Ref - reference nucleotide(s) at the variation position
* Var - variant nucleotide(s) at the variation position
* Score - quality score from the variant caller tool
* Var_cov - variant coverage (the average read depth of the variant)
* Var_frac - variant fraction (the fraction of the variant read depth among the all the reads that cover this region)
* Type - variant type
* Ref_nt - reference nucleotide(s)
* Var_nt - variant nucleotide(s)
* Ref_nt_pos_change - nucleotide change
* Ref_aa_pos_change - amino acid change
* Frameshift - frameshift variant
* Gene_ID - PATRIC feature (peg) id
* Locus_tag - RefSeq locus tag
* Gene_name - gene name
* Function - function description
* Upstream_feature - upstream feature
* Downstream_feature - downstream feature
* snpEff_type - snpEFF variant type
* snpEff_impact - snpEFF variant impact

10.The **var.vcf.gz.tbi** file. This is a file that can be uploaded into a genome browser for viewing. The PATRIC variant analysis service provides a .var.vcf.gz.tbi file for each of the read libraries that were loaded.

## VII. Viewing snps on the genome browser
1. To get to the Jobs page, click on Jobs in the lower right corner.
![Step 30](./images/image30.png)

2. This will open the jobs page. Click on the Variation job of interest.
![Step 31](./images/image31.png)

3. Once a job is selected, click on the View icon that has appeared in the vertical green bar.
![Step 32](./images/image32.png)

4. This will open the landing page for that particular job. To see the genome browser, where the results of the variation job can be summarized, click on the Browser icon that is visible in the upper right corner of the page.
![Step 33](./images/image33.png)

5. This will open the genome browser for the genome that was selected as the reference. There is a box on the left of the browser that shows the available tracks. To see the location of the particular snps, mnps or indels, click on the check boxes before in front of the names that end in var.vcf.gz.
![Step 34](./images/image34.png)

6. This will add tracks that show the snps that were called, although scrolling down the length of the genome may be required to see them.
![Step 35](./images/image35.png)

7. To zoom in and see the six-frame translation and nucleotides, find the magnifying glass icons immediately above the browser. Click on the one that has a plus side in it. Zooming will need to take place in steps.
![Step 36](./images/image36.png)

8. After several clicks of the magnifying icon, the six-frame translation and nucleotides will be visible.
![Step 37](./images/image37.png)

9. To see how predictive the individual calls are, click on the track that ends in aln.bam. This will show the individual reads. Where the snp was called, the column in the bam file will show, by indication of color, what the variation pipeline called. Red corresponds to T, yellow to G, blue to C and green to A.
![Step 38](./images/image38.png)

## References
1. Li, H. (2014) Towards better understanding of artifacts in variant calling from high-coverage samples. Bioinformatics, btu356.
2. Langmead, B. and Salzberg, S.L. (2012) Fast gapped-read alignment with Bowtie 2. Nat Methods, 9, 357-359.
3. Lee, W.P., Stromberg, M.P., Ward, A., Stewart, C., Garrison, E.P. and Marth, G.T. (2014) MOSAIK: a hash-based algorithm for accurate next-generation sequencing short-read mapping. PLoS One, 9, e90581.
4. Frith, M.C., Hamada, M. and Horton, P. (2010) Parameters for accurate genome alignment. BMC bioinformatics, 11, 1.
5. Marth, G.T., Korf, I., Yandell, M.D., Yeh, R.T., Gu, Z., Zakeri, H., Stitziel, N.O., Hillier, L., Kwok, P.-Y. and Gish, W.R. (1999) A general approach to single-nucleotide polymorphism discovery. Nature genetics, 23, 452-456.
6. Li, H., Handsaker, B., Wysoker, A., Fennell, T., Ruan, J., Homer, N., Marth, G., Abecasis, G., Durbin, R. and Genome Project Data Processing, S. (2009) The Sequence Alignment/Map format and SAMtools. Bioinformatics, 25, 2078-2079.
7. Cingolani, P., Platts, A., Wang, L.L., Coon, M., Nguyen, T., Wang, L., Land, S.J., Lu, X. and Ruden, D.M. (2012) A program for annotating and predicting the effects of single nucleotide polymorphisms, SnpEff: SNPs in the genome of Drosophila melanogaster strain w1118; iso-2; iso-3. Fly, 6, 80-92.

