# Phylogenetic Tree Service 

A phylogenetic tree or evolutionary tree is a branching diagram or “tree” showing the evolutionary relationships among various biological species or other entities. The Codon Tree service in BV-BRC allows researchers to build trees that contain private and public genomes, adjusting for the number of genes that will be used to generate the tree.

The Codon Tree pipeline generates bacterial phylogenetic trees. It uses the amino acid and nucleotide sequences from defined number of the BV-BRC global Protein Families (PGFams)[1], which are picked randomly, to build an alignment, and then generate a tree based on the differences within those selected sequences. This tutorial deals with the Codon Trees pipeline. Both the protein (amino acid) and gene (nucleotide) sequences are used for each of the selected genes from the PGFams. Protein sequences are aligned using MUSCLE[2], and the nucleotide coding gene sequences are aligned using the Codon_align function of BioPython[3]. A concatenated alignment of all proteins and nucleotides were written to a PHYLIP formatted file, and then a partitions file for RaxML[4] is generated, describing the alignment in terms of the proteins and then the first, second and third codon positions. Support values are generated using 100 rounds of the “Rapid” bootstrapping option[5] of RaxML. The resulting newick file can be viewed in BV-BRC, and we also suggest that researchers download it and view it in FigTree[6] to generate a publication quality image.
Source code for algorithms

* The source code for RaxML can be found at: https://github.com/stamatak/standard-RAxML
* The source code for MUSCLE can be found at: https://www.drive5.com/muscle/downloads.htm
* The source code for BioPython can be found at: https://github.com/biopython/biopython

## Creating a folder to hold the phylogenetic tree job and related data

Please refer to the [Genome Assembly Service tutorial](../genome_assembly/assembly.html) for instructions on creating a folder in the workspace.

## Locating the Phylogenetic Tree App

1.	At the top of any BV-BRC page, find the Services tab and click on Phylogenetic Tree. 
![Figure 1](./images/Picture1.png "Figure 1")


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


![Figure 40](./images/Picture40.png "Figure 40")


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


![Figure 54](./images/Picture54.png "Figure 54")


![Figure 55](./images/Picture55.png "Figure 55")


![Figure 56](./images/Picture56.png "Figure 56")


![Figure 57](./images/Picture57.png "Figure 57")


![Figure 58](./images/Picture58.png "Figure 58")


![Figure 59](./images/Picture59.png "Figure 59")


![Figure 60](./images/Picture60.png "Figure 60")


![Figure 61](./images/Picture61.png "Figure 61")


![Figure 62](./images/Picture62.png "Figure 62")


![Figure 63](./images/Picture63.png "Figure 63")


![Figure 64](./images/Picture64.png "Figure 64")

