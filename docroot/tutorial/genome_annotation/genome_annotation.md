# Annotating a genome in BV-BRC

Genome annotation is the process of identifying functional elements along the sequence of a genome.  In 2008, the RAST server (Rapid Annotation using Subsystem Technology) was developed to annotate microbial genomes<sup>1</sup>. It works by projecting manually curated gene annotations from the SEED database onto newly submitted genomes<sup>2,3</sup>. The key to the consistency and accuracy of the RAST algorithm has been the carefully structured annotation data in the SEED, which are organized into subsystems (sets of logically related functional roles<sup>2</sup>). RAST has become one of the most popular sources for consistent and accurate annotations for microbial genomes. 

![Figure 1](./images/Picture1.png "Figure 1")

The annotation service available in PATRIC4 and BV-BRC uses a modular, updated version of RAST that is called the RAST toolkit (RASTtk)<sup>5</sup>, which is depicted above. It includes algorithms that were developed by the RAST team<sup>5</sup> and some that were developed by others and incorporated into the overall pipeline (seen in red in the figure above). tRNAscan-SE<sup>6</sup> is used to call the tRNA genes.  BLASTN<sup>7</sup> is used to identify repeat regions within the genome, and tools by Croucher<sup>8</sup> are used to identify Streptococcus repeat regions.  After repeat regions are identified, Prodigal<sup>9</sup>, followed by Glimmer<sup>10</sup>, are used to call coding sequences (CDS). Antimicrobial resistance is projected for a select group of genera based on a Adaboost machine learning<sup>11</sup>, followed by an initial protein annotation event that involves taking every protein called in a genome and using BLAT<sup>12</sup> and BLASTP<sup>13</sup> to identify CDSs that have homology to proteins in specialty databases.  Possible virulence factors are identified by blasting against a database containing proteins collected from the Virulence Factor Database<sup>14</sup>, Violins<sup>15</sup>, and a special curation effort by the PATRIC team<sup>6</sup>. Genes with homology to those identified as being involved in antimicrobial resistance are BLATed against proteins from the Comprehensive Antibiotic Resistance Database<sup>16</sup>, the National Database of Antibiotic Resistant Organisms (NDARO - https://www.ncbi.nlm.nih.gov/pathogens/antimicrobial-resistance/), the Antibiotic Resistance Database (ARDB)<sup>17</sup> and a special curation of relevant proteins by PATRIC curators<sup>18</sup>.  Genes with homology to transporters are identified by searching against proteins from the Transporter Classification Database (TCDB)19, and those similar to genes that have been identified as potential drug targets by comparison to proteins from DrugBank20 and the Therapeutic Target Database (TTD)21.  Protein families22 are assigned, and then hypotheticals being identified.  All proteins are then mapped to subsystems2,3.  PubMLST (www.pubmlst.org) is used to assign sequence types, and then PhiSpy23 is used to find prophages in bacterial genomes.

Every bacterial or archaeal genome annotated in BV-BRC, either public or private, are annotated with this pipeline, and many of the other services (ex. Phylogenetic tree, Genome Alignment, Protein Family Sorter, Comparative Pathway Viewer, Similar Genome Finder) rely of these annotations. A recent update is the inclusion of bacteriophage genome annotation pipeline(PHANOTATE)24,25, which opens up the same tools to bacteriophage researchers.  The source code for RASTtk is available on Github (https://github.com/SEEDtk/RASTtk), as is the source code for PHANOTATE (https://github.com/deprekate/PHANOTATE). 

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


![Figure 65](./images/Picture65.png "Figure 65")


![Figure 66](./images/Picture66.png "Figure 66")


![Figure 67](./images/Picture67.png "Figure 67")


![Figure 68](./images/Picture68.png "Figure 68")


![Figure 69](./images/Picture69.png "Figure 69")


![Figure 70](./images/Picture70.png "Figure 70")


![Figure 71](./images/Picture71.png "Figure 71")


