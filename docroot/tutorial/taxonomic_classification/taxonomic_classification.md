# Taxonomic Classification Service

*Revision: 02/29/2024*

Metagenomics is the study of genomic sequences obtained directly from an environment. For many metagenomic samples, the species, genera and even phyla present in the sample are largely unknown at the time of sequencing, and the goal of sequencing is to determine the microbial composition as precisely as possible. The BV-BRC Taxonomic Classification service can be used to identify the microbial composition of metagenomic samples, but it can also be used to verify the purity of an isolated sample. **Researchers can submit metagenomic samples that are short reads (paired end or single end) as well as submissions to the Sequence Read Archive via accession run numbers.** 

![Figure 1](./images/Picture1.png "Figure 1")

The BV-BRC Taxonomic Classification service can be used to identify species (Species Identification) and metagenomes (Microbiome) using whole genome sequencing reads.  It has also been recently updated to classify 16S ribosomal RNA reads.  The first step of the service estimates the quality of the reads using FastQC [1].  After this it follows the pipeline established by Lu, et al. [2].  If desired, a researcher can separate the host reads from the microbial ones using HiSAT2 [3],  but if this is not enabled, all reads are classified using Kraken2 [4].  This is the central feature of the pipeline and uses exact-match database queries of k-mers, rather than inexact alignment of sequences. Sequences are classified by querying the database for each k-mer in a sequence, and then using the resulting set of lowest common ancestor (LCA) taxa to determine an appropriate label for the sequence.  The results from Karken2 are used to generate a Krona [5] plot, are used by Pavian [6] to generate a Sankey plot as well as Summary and Interactive Multi-sample Comparison tables.  The 16S rRNA and microbiome pipelines also include Bracken [7] where abundances of reads mapping to different taxa are estimated.  The abundance estimates from Bracken are combined with the Kraken2 and FastQC results to aggregate results using MultiQC [8], and also to provide alpha and beta estimates of diversity.  The MultiQC report is not included in the Species Identification pipeline.

The BV-BRC service recently expanded to include analysis of reads from 16S ribosomal RNA. The workflow is similar, but does not include read mapping using HiSAT2 and instead, trims the submitted reads using TrimGalore [9].



![Figure 2](./images/Picture2.png "Figure 2")


![Figure 3](./images/Picture3.png "Figure 3")


![Figure 4](./images/Picture4.png "Figure 4")


![Figure 5](./images/Picture5.png "Figure 5")


![Figure 6](./images/Picture6.png "Figure 6")


![Figure 7](./images/Picture7.png "Figure 7")


![Figure 8](./images/Picture8.png "Figure 8")


![Figure 9](./images/Picture9.png "Figure 9")


![Figure 10](./images/Picture10.png "Figure 10")


![Figure 11](./images/Picture11.png "Figure 11")


![Figure 12](./images/Picture12.png "Figure 12")


![Figure 13](./images/Picture13.png "Figure 13")


![Figure 14](./images/Picture14.png "Figure 14")


![Figure 15](./images/Picture15.png "Figure 15")


![Figure 16](./images/Picture16.png "Figure 16")


![Figure 17](./images/Picture17.png "Figure 17")


![Figure 18](./images/Picture18.png "Figure 18")


![Figure 19](./images/Picture19.png "Figure 19")


![Figure 20](./images/Picture20.png "Figure 20")


![Figure 21](./images/Picture21.png "Figure 21")


![Figure 22](./images/Picture22.png "Figure 22")


![Figure 23](./images/Picture23.png "Figure 23")


![Figure 24](./images/Picture24.png "Figure 24")


![Figure 25](./images/Picture25.png "Figure 25")


![Figure 26](./images/Picture26.png "Figure 26")


![Figure 27](./images/Picture27.png "Figure 27")


![Figure 28](./images/Picture28.png "Figure 28")


![Figure 29](./images/Picture29.png "Figure 29")


![Figure 30](./images/Picture30.png "Figure 30")


![Figure 31](./images/Picture31.png "Figure 31")


![Figure 32](./images/Picture32.png "Figure 32")


![Figure 33](./images/Picture33.png "Figure 33")


![Figure 34](./images/Picture34.png "Figure 34")


![Figure 35](./images/Picture35.png "Figure 35")


![Figure 36](./images/Picture36.png "Figure 36")


![Figure 37](./images/Picture37.png "Figure 37")


![Figure 38](./images/Picture38.png "Figure 38")


![Figure 39](./images/Picture39.png "Figure 39")


![Figure 41](./images/Picture41.png "Figure 41")


![Figure 42](./images/Picture42.png "Figure 42")


![Figure 43](./images/Picture43.png "Figure 43")


![Figure 44](./images/Picture44.png "Figure 44")


![Figure 45](./images/Picture45.png "Figure 45")


![Figure 46](./images/Picture46.png "Figure 46")


![Figure 47](./images/Picture47.png "Figure 47")


![Figure 48](./images/Picture48.png "Figure 48")


![Figure 49](./images/Picture49.png "Figure 49")


![Figure 50](./images/Picture50.png "Figure 50")


![Figure 51](./images/Picture51.png "Figure 51")


![Figure 52](./images/Picture52.png "Figure 52")


![Figure 53](./images/Picture53.png "Figure 53")



