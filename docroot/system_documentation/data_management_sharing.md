# Data Management and Sharing 

As a NIAID-funded resource, BV-BRC complies with the [NIH Policy for Data Management and Sharing](https://grants.nih.gov/grants/guide/notice-files/NOT-OD-21-013.html) (Notice Number: NOT-OD-21-013), which promotes the management and sharing of scientific data generated from NIH-funded or conducted research. 

## Data Types
BV-BRC is an integrated data and analysis resource designed to support genomic and related infectious disease research for viral and bacterial pathogens. As such, the primary data type is genomic sequences, primarily ingested from public repositories such as NCBI GenBank. BV-BRC reannotates genomes with curated subsystem data for consistency, curates and standardizes metadata, and formats the data to enable the integrated tools to perform comparative analysis computations. BV-BRC also annotates genomes from assembled reads collected from SRA for specialized phenotypic characteristics, such as antimicrobial resistance (AMR). Annotations may be derived from computations such as gene and other feature prediction algorithms, subsystem and other functional groupings, and phenotype prediction such as AMR. Appropriate references to the computations performed are available in the user documentation.

Data from expression studies have also been curated and structured for comparative analyses. Additional data are incorporated from various resources, such as protein structures from PDB as well as computed structures, e.g., from AlphaFold, to augment annotations and comparative analyses. Further, BV-BRC has integrated data sets from other NIAID programs, such as the Systems Biology Centers (SBCs). Additional metadata from serology and surveillance efforts may also be associated with genome sequences and other data types. Data from these resources has appropriate provenance information to enable traceability to the source.

The table below summarizes the BV-BRC data types and their primary sources.

<table>
  <tr>
    <th>Primary Data Types</th>
    <th>Related and Derived Data Types</th>
    <th>Data Resources</th>
  </tr>
  <tr>
    <td>Taxonomy</td>
    <td>Reference organisms</td>
    <td>NCBI Taxonomy, ICTV</td>
  </tr>
  <tr>
    <td>Genomes</td>
    <td>Clinical and environmental metadata, AMR / AVR phenotypes, QC results</td>
    <td>GenBank, SRA</td>
  </tr>
  <tr>
    <td>Genomic Features</td>
    <td>Genes, RNAs, misc. features, GO terms, EC numbers, Pathways, Protein families, Subsystems, Virulence factors, AMR genes, Drug targets, essential genes</td>
    <td>GenBank, PATRIC and IRD/ViPR (legacy BRC resources), GO, KEGG, Reactome, SEED, VFDB, Victors, CARD, NDARO, DrugBank, TTD</td>
  </tr>
  <tr>
    <td>Comparative Genomics</td>
    <td>Protein families, Orthologs, MSA, Gene trees, Metabolic pathways, Subsystems, Phylogenetic trees</td>
    <td>PATRIC and IRD/ViPR (legacy BRC resources), KEGG, SEED</td>
  </tr>
  <tr>
    <td>Protein Domains and Sequence Features</td>
    <td>Variant types</td>
    <td>UniProt, IRD/ViPR (legacy BRC resources)</td>
  </tr>
  <tr>
    <td>Antimicrobial / Antiviral Agents</td>
    <td>Drug targets</td>
    <td>PubChem, DrugBank, ATC, PDB</td>
  </tr>
  <tr>
    <td>Antimicrobial / Antiviral Resistance Data</td>
    <td>Standardized AMR/AVR phenotypes</td>
    <td>NIAID Genomics Centers for Infectious Diseases (GCIDs), BioSamples, publications</td>
  </tr>
  <tr>
    <td>Clinical Studies</td>
    <td>Clinical metadata, AMR/AVR phenotypes</td>
    <td>NIAID GCIDs / Systems Biology Centers (SBCs), publications, others</td>
  </tr>
  <tr>
    <td>Transcriptomics and Proteomics</td>
    <td>BAM / WIG files, gene expression, differential expression, gene clusters, enrichment analysis</td>
    <td>GEO, ArrayExpress, PRIDE, SBCs</td>
  </tr>
  <tr>
    <td>Protein-Protein Interactions</td>
    <td>Protein interaction networks, protein-drug interaction networks</td>
    <td>IntAct, BIND, MINT, DIP, STRING, others</td>
  </tr>
  <tr>
    <td>Protein 3D Structures</td>
    <td>Sequence conservation location, immune epitope location</td>
    <td>PDB, MMDB, NIAID Structural Genomics Centers (SGCs)</td>
  </tr>
  <tr>
    <td>Phenomics</td>
    <td>Organism attributes</td>
    <td>Publications</td>
  </tr>
  <tr>
    <td>Host Response and Host-Pathogen Interactions</td>
    <td>BAM / WIG files, gene expression, differential expression, gene clusters, enrichment analysis</td>
    <td>SRA, ArrayExpress, NIAID SBCs, IntAct, BIND, MINT, DIP, others</td>
  </tr>
  <tr>
    <td>Epidemiology and Surveillance</td>
    <td>MLST, SNP / SNV / in-del annotation, SNP / transmission trees</td>
    <td>SRA, MLST, PubMLST, CDC, CEIRR DPCC, JCVI
</td>
  </tr>
  <tr>
    <td>Immunology and Serology</td>
    <td>Organism attributes, phenotypes, epitopes</td>
    <td>ImmPort, CEIRR</td>
  </tr>
</table>

In addition to ingested and processed data, users may elect to assemble and annotate their own sequenced genomes and make them publicly available through the BV-BRC resource. In these cases, BV-BRC team members work with the user to assess genome quality, verify metadata, and include appropriate attribution.

Related Tools, Software and/or Code
The data in BV-BRC are available through the website user interface and integrated searches and tools [BV-BRC website](https://www.bv-brc.org/), through the [command line interface (CLI)](https://www.bv-brc.org/docs/cli_tutorial/index.html), [data API](https://www.bv-brc.org/api/doc/), and from the [FTP site](ftp://ftp.bvbrc.org/). These are all provided freely to all users. All software developed by the project team in the system is available as open source in the [BV-BRC GitHub repository](https://github.com/BV-BRC). 

In the event of discontinuation of the resource, the databases, systems, and software code will be archived and transferred to NIAID or its designee. 

## Standards
Where available, BV-BRC uses established standards with wide adoption in the target research communities. These include common file formats for sequence data (fasta in .fa, .fasta, .faa, .fna, .afa, .xmfa, .embl), aligned sequence data (.bai, .bam), tabular, e.g., expression, data (.csv, .txt, .xls, .xlsx), genome features (.gff, .gtf), phylogenetic trees (Newick, PhyloXML), variant calls (.vcf, .vcf.gz), structured data (.xml, .json), and others. 

BV-BRC uses metadata standards and ontologies to sufficiently characterize corresponding data to enable comparison, integration, and reuse in multiple analysis environments. The BV-BRC provides services and tools that accept and produce data using standard data formats, thus enabling data exchange and reuse among resources. We also provide open APIs that allow programmatic access to data and models within the resource, facilitate scripting of workflows that can programmatically interact with BV-BRC services, and can be used to by the community to develop new approaches for data analysis.

For example, the genome metadata schema used in BV-BRC is based on the NIAID Human Pathogen and Vector Sequencing Metadata Standards, which include Project and Sample Application Standards and Clinical Metadata Standards. These standards were derived from the metadata standards used by Genomic Standards Consortium’s minimal information (MIxS) and NCBI’s BioSample/BioProjects checklists. We use The Systems Biology Metadata Standard developed to capture consistent metadata about experiments designed to assess host responses to pathogen infection. The BV-BRC team collaborated with the other BRCs and with the NIAID sponsored Systems Biology for Infectious Diseases program through the Data Dissemination Working Group to ensure that the standard covered the key experimental metadata.

Data Preservation, Access, and Associated Timelines
BV-BRC is, in essence, a knowledgebase for bacterial and viral genomic and related data associated with infectious diseases. It pulls, integrates, and adds value to data from other public databases and repositories, as described in the Data Types section above. 

Except for data that users have uploaded or generated in their private workspaces, all data in BV-BRC are publicly available. Data in private workspaces are entirely under the control of the user who owns the workspace. The user is responsible for complying with any NIAID policies for data release and deposition in public repositories for their private data.  

All genomes and other primary data types have persistent unique identifiers. The data in BV-BRC are retained for the life of the resource. Exceptions include replacement of outdated genomes from GenBank.

## Access, Distribution, or Reuse Considerations
All public data in BV-BRC is freely available without restriction on its use. The resource does not include any PHI, PII, or other data covered by HIPAA. 

## Oversight of Data Management and Sharing
The BV-BRC Principal Investigators have primary responsibility for data management and sharing. Their designees, including Systems Leads and Database Administrators, perform the day-to-day maintenance and monitoring of the data stores and their content. All data integrated into the resource are stored and backed up on hardware and associated systems at the Argonne National Laboratory (ANL) facility. ANL has established and NIAID-approved procedures for data storage, backup, recovery, and security.  