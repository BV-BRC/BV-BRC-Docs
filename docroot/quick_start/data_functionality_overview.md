# Data and Functionality Overview (for PATRIC Users) 

BV-BRC has been developed by starting with the legacy PATRIC data, tools, services, website, and infrastructure, and augmenting it with integrated viral data, tools, and features from the legacy IRD (influenza) and ViPR (other pathgenic viruses) BRCs. PATRIC users Will be able to do all of the same searches, analyses, workspace that they have used at PATRIC. In BV-BRC, there are additional data, tools, and services at their disposal for more comprehensive review and analyses. A few changes in website layout and terminology have been made to assist IRD/ViPR users in make the transition to BV-BRC. In summary, the changes with respect to PATRIC are the following:

* Addition of [Viral Genomes and Other Data](/system_documentation/data)
* Addition of [Specialized Searches](#searches)
* Addition of and enhancements to [Tools and Services](#tools)
* Addition of new [Data Visualizations](#visualizations)

Additional details are presented below. 

(data)=
## Data 

### Organisms

In addition to bacterial pathogens and other bacterial and archaeal species (as in PATRIC), BV-BRC includes viral genomes and other data for influenza and other pathogenic viruses. The ORGANISMS top menu reflects these new options (see below). Website pages, searches, services, and tools can also access, display, and use these data. 

![Organisms Menu, Viruses](./images/bv_organisms_menu_virus2.png)

As in PATRIC, eukaryotic host genomes are included as well. 

### Genomes

Bacterial genomes (~500K annotated bacterial genomes and associated data) have been augmented with a comparable volume of **viral genomes** (~5M viral genomes and associated data). Many of the viral genomes have **additional metadata attributes**, which have be been added to the overall set of genome metadata fields. A summary of available genome metadata fields and how to access them is available in the [Genome Metadata Quick Reference Guide](/quick_references/organisms_taxon/genome_metadata).

In response to the COVID epidemic, a custom resource for tracking associated genomic variants and lineages of concern (VoCs/LoCs) has been created and is available in BV-BRC at [SARS-CoV-2 Variants and Lineages of Concern](https://bv-brc.org/view/VariantLineage/#view_tab=overview).

### Other Data

Along with the viral genomes, corresponding **genes/proteins**, **protein domains and motifs**, and **protein structure** data have been integrated with the bacterial data.

The viral data brings with it two unique data types, not formerly available in PATRIC: **surveillance** and **serology**. Information regarding these data types is available from the following user documentation:

* [Surveillance Data Quick Reference Guide](/quick_references/organisms_taxon/surveillance_data)

* [Serology Data Quick Reference Guide](/quick_references/organisms_taxon/serology_data)

*Note: The DATA top menu that is in PATRIC has been deprecated for BV-BRC.  It will be replaced with documentation that describes data processing protocols used in BV-BRC for both bacteria and viruses.*

(searches)=
## Searches

The Global Search has been augmented with specialized **Advanced Searches** for each of the major data types including Taxa, Genomes, Strains, Proteins, Specialty Genes, Domains and Motifs, Epitopes, Protein Structures, Pathways, Surveillance data, and Serology data.  These searches are available from the **SEARCHES** top menu. 

![Searches Menu](./images/bv_searches_menu.png)

(tools)=
## Tools and Services

Analysis tools from IRD/ViPR have been integrated with the PATRIC bacterial analysis service infrastructure. Where practical, complementary tools from both resources have been merged into one, or the tool has been extended (if necessary) to support the other data type. These are available from the TOOLS & SERVICES TOP menu, shown below. The letter "B" or "V" beside the service name indicates that the service is only available for bacterial *(B)* or viral *(V)* data.

![Tools and Services Menu](./images/bv_services_menu_updated2.png)

Summaries for the new and extended tools and services are below, with links to corresponding quick reference guides and tutorials: 

**Genome Annotation Service** - extended to support annotation of viral genomes ([Quick Reference Guide](/quick_references/services/genome_annotation_service),  [Tutorial](/tutorial/genome_annotation/genome_annotation)). 

**BLAST (Homology Search) Service** - extended to include viral sequences and short sequence search ([Quick Reference Guide](/quick_references/services/blast), [Tutorial](/tutorial/blast/blast)).

**SARS-CoV-2 Genome Assembly and Annotation Service** - new service designed to support assembly and annotation of SARS-CoV-2 genomes from sequence reads. ([Quick Reference Guide](/quick_references/services/sars_cov_2_assembly_annotation_service), [Tutorial](/tutorial/sars_cov_2_assembly_annotation/sars_cov_2_assembly_annotation)).

**Metadata-driven Comparative Analysis Tool (Meta-CATS)** - new service tha looks for positions that significantly differ between user-defined groups of sequences ([Quick Reference Guide](/quick_references/services/metacats), [Tutorial](/tutorial/metacats/metacats)).

**Primer Design Service** - new service that designs primers from a given input sequence under a variety of temperature, size, and concentration constraints ([Quick Reference Guide](/quick_references/services/primer_design_service), [Tutorial](/tutorial/primer_design/primer_design)).

**MSA and SNP Analysis Service** - new service that constructs a multiple sequence analysis (MSA) and computes single nucleotide polymorphisms (SNPs) for a given set of nucleotide or protein sequences ([Quick Reference Guide](/quick_references/services/msa_snp_variation_service), [Tutorial](/tutorial/msa_snp_variation/msa_snp_variation)).

**Gene Tree Service** - constructs custom phylogenetic trees built from user-selected genomes, genes, or proteins ([Quick Reference Guide](/quick_references/services/genetree), [Tutorial](/tutorial/genetree/genetree)).

**Taxonomic Classification** - extended to include viruses ([Quick Reference Guide](/quick_references/services/taxonomic_classification_service), [Tutorial](/tutorial/taxonomic_classification/taxonomic_classification)).

**Metagenomic Binning** - extended to include viruses ([Quick Reference Guide](/quick_references/services/metagenomic_binning_service), [Tutorial](/tutorial/metagenomic_binning/metagenomic_binning)).

(visualizations)=
## Visualization Tools

The *archaeopterix.js Phylogenetic Tree Viewer* has been integrated and displays trees generated by the **Phylogenetic Gene Tree Service** [Quick Reference Guide](/quick_references/services/genetree), [Tutorial](/tutorial/genetree/genetree).

A new *3-D Protein Structure Viewer* has been integrated that displays structures for bacterial and viral proteins, where available. See [Protein Structure Data Quick Reference](/quick_references/organisms_taxon/protein_structures) for more information.  

![3-D Protein Structure Viewer](./images/bv_protein_structure_viewer.png)

