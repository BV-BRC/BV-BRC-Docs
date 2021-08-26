# Variation - SNP Analysis Service

SNP genotyping is the measurement of genetic variations of single nucleotide polymorphisms (SNPs) between members of a species. It is a form of genotyping, which is the measurement of more general genetic variation. SNPs are one of the most common types of genetic variation. A SNP is a single base pair mutation at a specific locus, usually consisting of two alleles. SNP calling require the reads of target isolates and a reference genome as input and execute an external mapping tool and variant caller, followed by some filtering steps to remove low-quality SNPs. The BV-BRC Variation Analysis Service can be used to identify and annotate sequence variations, including SNPs, SNVs, and indels.

## Creating a folder to hold the variation job and related data

Please refer to the Assembly service tutorial for instructions on creating a folder in the BV-BRC or PATRIC (https://alpha.bv-brc.org/docs/tutorial/genome_assembly/assembly.html).

## Locating the Variation Analysis Service

1.	Click on the Services tab at the top of the page, and then click on Variation. 
![Figure 1](./images/Picture1.png "Figure 1")

2.	This will open the landing page for the service. 
![Figure 2](./images/Picture2.png "Figure 2")

## Read files for target isolates

### Uploading paired end reads

Please refer to the Assembly service tutorial for instructions on uploading paired-end reads in the BV-BRC or PATRIC (../genome_assembly/assembly.html).

### Uploading single reads

Please refer to the Assembly service tutorial for instructions on uploading single-end reads in the BV-BRC or PATRIC (../genome_assembly/assembly.html).

### Submitting reads that are present at the Sequence Read Archive (SRA)

Please refer to the Assembly service tutorial for instructions on submitting reads from the SRA (../genome_assembly/assembly.html).

S## etting Parameters 

1. BV-BRC offers several types of aligners that can be used in the service. BWA-mem is set as the default aligner, but there are several options. 
    * **BWA-mem**[1] is a new alignment algorithm for aligning sequence reads or long query sequences against a large reference genome such as human. It automatically chooses between local and end-to-end alignments, supports paired end reads and performs chimeric alignment. The algorithm is robust to sequencing errors and applicable to a wide range of sequence lengths from 70bp to a few megabases. BWA-MEM is implemented as a component of BWA, which is available at https://github.com/lh3/bwa.
    * **BWA-mem-strict** is BWA-mem with the default parameters plus “-B9 -O16” to increase the gap extension and clipping penalty. These strict mapping parameters are recommended for cases where contigs and references are known to be very close to each other.
    * **Bowtie2**[2] improves on the previous Bowtie method in terms of speed and fraction of reads aligned and is substantially faster than non–full-text minute index–based approaches while aligning a comparable fraction of reads. Bowtie 2 performs sensitive gapped alignment without incurring serious computational penalties. The code for Bowtie2 is available at https://github.com/BenLangmead/bowtie.
    * **LAST**[3] is a long read sequence aligner. It can align billions of DNA reads to a genome and will indicate reliability of each aligned column. In addition, it can compare DNA to proteins, with frameshifts, compare PSSMs to sequences, calculates the likelihood of chance similarities between random sequences, does split and spliced alignment, and can be trained for unusual kinds of sequences (like nanopore).  The code for Last is available at https://gitlab.com/mcfrith/last.

2. To see the other choices of aligners that can be used, click on the down arrow at the end of the Aligner text box. This will open a drop-down box that shows all the available programs. Clicking on the desired aligner will autofill the text box with that selection. 
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


![Figure 40](./images/Picture40.png "Figure 40")

