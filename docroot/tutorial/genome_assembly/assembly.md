# Genome Assembly Service

A genome assembly is the sequence produced after chromosomes from the organism have been fragmented, those fragments have been sequenced, and the resulting sequences have been put back together. This is currently needed as DNA sequencing technology cannot read whole genomes in one go, but rather can read small pieces of between 20 and 30,000 bases, depending on the technology used. Typically, the short fragments, called reads, result from shotgun (random) sequencing of genomic DNA.

De novo sequence assemblers are a type of program that assembles short nucleotide sequences into longer ones without the use of a reference genome. These are commonly used in bioinformatic studies to assemble genomes or transcriptomes.

Different assemblers are designed for different type of read technologies. Second generation sequencing technologies like Illumina (called “short-read” technologies) produce short reads on the order of 50-200 base pairs and have low error rates of around 0.5-2%, with the errors chiefly being substitution errors. Third generation technologies like PacBio and fourth generation technologies like Oxford Nanopore (called “long-read” technologies) provide read lengths in the thousands or tens of thousands but have much higher error rates of around 10-20%, with errors being chiefly insertions and deletions. These differences necessitate different algorithms for assembly from short and long read technologies.

What follows is a tutorial showing how to submit reads of various types for assembly and selecting parameters for the assembly algorithm.  Note that reads from different sequencing platforms of the same organism can be submitted in one job. If PacBio and Illumina reads are available, both would be combined to generate the best assembly.

## Files accepted by BV-BRC Assembly Service

The assembly service accepts read files in either fastq, fasta, fastq.gz, or fasta.gz format. 

FASTQ is a text-based format for storing both a nucleotide sequence and its corresponding quality scores. Both the sequence letter and quality score are each encoded with a single ASCII character.  A FASTQ file normally uses four lines per sequence.
•	Line 1 begins with a ‘@’ character and is followed by a sequence identifier and an optional description (like a FASTA title line).
•	Line 2 is the raw sequence letters.
•	Line 3 begins with a ‘+’ character and is optionally followed by the same sequence identifier (and any description) again.
•	Line 4 encodes the quality values for the sequence in Line 2 and must contain the same number of symbols as letters in the sequence.

1. At the top of any BV-BRC page, find the Services tab and click on it
![Figure 1](./images/Picture1.png)


![Figure 2](./images/Picture2.png)



![Figure 3](./images/Picture3.png)



![Figure 4](./images/Picture4.png)



![Figure 5](./images/Picture5.png)



![Figure 6](./images/Picture6.png)



![Figure 7](./images/Picture7.png)



![Figure 8](./images/Picture8.png)



![Figure 9](./images/Picture9.png)



![Figure 10](./images/Picture10.png)



![Figure 11](./images/Picture11.png)



![Figure 12](./images/Picture12.png)



![Figure 13](./images/Picture13.png)



![Figure 14](./images/Picture14.png)



![Figure 15](./images/Picture15.png)



![Figure 16](./images/Picture16.png)



![Figure 17](./images/Picture17.png)



![Figure 18](./images/Picture18.png)



![Figure 19](./images/Picture19.png)



![Figure 20](./images/Picture20.png)



![Figure 21](./images/Picture21.png)



![Figure 22](./images/Picture22.png)



![Figure 23](./images/Picture23.png)



![Figure 24](./images/Picture24.png)



![Figure 25](./images/Picture25.png)



![Figure 26](./images/Picture26.png)



![Figure 27](./images/Picture27.png)



![Figure 28](./images/Picture28.png)



![Figure 29](./images/Picture29.png)



![Figure 30](./images/Picture30.png)



![Figure 31](./images/Picture31.png)



![Figure 32](./images/Picture32.png)



![Figure 33](./images/Picture33.png)



![Figure 34](./images/Picture34.png)



![Figure 35](./images/Picture35.png)



![Figure 36](./images/Picture36.png)



![Figure 37](./images/Picture37.png)



![Figure 38](./images/Picture38.png)



![Figure 39](./images/Picture39.png)



![Figure 40](./images/Picture40.png)



![Figure 41](./images/Picture41.png)



![Figure 42](./images/Picture42.png)



![Figure 43](./images/Picture43.png)



![Figure 44](./images/Picture44.png)



![Figure 45](./images/Picture45.png)



![Figure 46](./images/Picture46.png)



![Figure 47](./images/Picture47.png)



![Figure 48](./images/Picture48.png)



![Figure 49](./images/Picture49.png)



![Figure 50](./images/Picture50.png)



![Figure 51](./images/Picture51.png)



![Figure 52](./images/Picture52.png)



![Figure 53](./images/Picture53.png)



![Figure 54](./images/Picture54.png)



![Figure 55](./images/Picture55.png)



![Figure 56](./images/Picture56.png)



![Figure 57](./images/Picture57.png)



