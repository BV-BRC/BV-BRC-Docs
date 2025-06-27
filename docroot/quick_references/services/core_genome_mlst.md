# Core Genome MLST Analysis Service

## Overview
The Core Genome Multi-Locus Sequence Typing (MLST) pipeline allows you to characterize bacterial and viruses based on the presence and absence of specific loci. These loci are defined in a schema.  This service defines a schema as a list of locus names and collection of allele sequences.  There are 32 schemas for priority pathogen species curated by species experts at [Ridom]( https://www.ridom.de/seqsphere/cgmlst/) 
Typical MLST schemas used 5-7 genes that are conserved and essential for basic cellular functions and are expected to be present in all strains of a species even as they evolve.  This service uses schemas with predefined sets of species-specific loci including both core and accessory genes.  This allows for finger resolution of bacterial strain differences and consistent tracking across labs.

This service used Chewbbaca 3.3.10.  Elements of this tutorial are based on their documentation. The full documentation is available [here]( https://chewbbaca.readthedocs.io/en/latest/index.html) The pipeline begins with the alle call step which finds alleles in the genomes that are also listed in the schema. Thus identifying known and novel alleles in the input genomes. An allele is a specific sequence variant that occurs at a given locus.  The initial allele call can be considered as cgMLST including all alleles. Later, we will rerun this step to identify the core genome. The allele call uses the following tools:
  
  * Pyrodigal predicts the coding sequences (CDSs) and generates predicted protein-coding genes which are used for allele matches.
  
  * BLAST Score Ratio (BSR) screening for each locus in the schema.  The predicted CDSs are compared to the known alleles. A match is accepted if the BSR to a known allele is les than or greater than the global threshold of 0.6. The resulting alleles are classified according to the match. Scroll down to Reading "The Allele Call Classification Counts" section for definitions of each classification type.
Then the service runs chewBBACA’s remove genes command to remove paralogous loci (if any) identified in the initial allele call. This is followed by the extract cgMLST command which determines the set of loci that constitute the core genome loci from the allele call results. The following steps take place:
  
  *  Masking: Converts less stable allele calls, INF- (inferred) allele labels and special classifications to 0 to standardize the data.
  
  * Presence-absence matrix: Builds a loci presence-absence matrix and tracks missing/special calls per sample.
  
  * Core Loci Selection: Determines which loci are “core” based on how often they appear across the genomes – providing results for default thresholds 95%, 99% and 100%. 
This service uses 95% as the threshold. A second allele call is performed with the allelic profiles meeting the 95% threshold. Followed by the allele call evaluator. This generates an interactive report, called "allelecall_report.html" that provides summary statistics to evaluate results per sample and per loci. This is available in your job results. The report includes a presence-absence matrix heatmap, a distance matrix based on the allelic differences and a Neighbor-Joining (NJ) tree based on the multiple sequence alignment (MSA) of the core genome loci.

## See also
* [Whole Genome SNP Analysis Service](https://bv-brc.org/app/CoreGenomeMLST)
* [Whole Genome SNP Analysis Service Tutorial](../../tutorial/core_genome_mlst/core_genome_mlst.html)

## Using the Whole Genome SNP Analysis Service
The **Whole Genome SNP Analysis** submenu option under the **Services** main menu (Genomics category) opens the Whole Genome SNP Analysis Service input form (*shown below*). *Note: You must be logged into BV-BRC to use this service.*

## Select a Genome Group
This service accepts assembled genomes that are collected into one Genome Group. For more information about creating a genome group please visit our [documentation](https://www.bv-brc.org/docs/quick_references/workspaces/groups.html) or our [video tutorial](https://www.youtube.com/watch?v=BDCUyhX9brA&t=36s)

## Select Reference Schema
The schemas are species-specific.  Selecting a schema built from a different species will not allow the service to correctly match your loci to the target genome. This could lead to inaccurate allele calls. 

## Parameters
In the parameters section you will select an output folder and output name.

See the core genome MLST tutorial for a detailed guide to reviewing the job results.
