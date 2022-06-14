Database
=========

Data Types
----------

See **Data Section** for list and description of data types supported.

Database Schema
----------------

The primary data store for BV-BRC is a distributed SolrCloud database. The SolrCloud configuration allows "collections" to be defined using xml schema files. These collection definitions, combined with the data indexes are deployed on one or more SolrCloud hosts. Multiple machines can utilize the same set of collections and/or indexes to address scalability, high availability and higher throughput and query performance by allowing more concurrent queries. 

Below is a list of the collections and the main fields/attributes available in each collection. Refer to https://github.com/PATRIC3/patric_solr_cloud for the most updated configurations and schemas.

**Solr Cores/Collections:**

- antibiotics
- enzyme_class_ref
- feature_sequence
- gene_ontology_ref
- genome
- genome_amr
- genome_feature
- genome_sequence
- id_ref
- misc_niaid_sgc
- model_complex_role
- model_compound
- model_reaction
- model_template_biomass
- model_template_reaction
- pathway
- pathway_ref
- ppi
- protein_family_ref
- sp_gene
- sp_gene_evidence
- sp_gene_ref
- structured_assertion
- subsystem
- subsystem_ref
- taxonomy
- transcriptomics_experiment
- transcriptomics_gene
- transcriptomics_sample

Data Dictionaries
-----------------

BV-BRC uses several data dictionaries to support controlled vocabularies for certain biological entities and annotations, which provide consistent naming across data from heterogenous sources for more efficient search and query. 

The following Collections store such data dictionaries and related information. 

- **enzyme_class_ref**: Information about EC numbers, enzyme names, and their hirarchical classification. 
- **gene_ontology_ref**: Information about Gene Ontology terms, their description, and their hirarchical classification. 
- **id_ref**: External database identified references, obtained from UniProt ID Mapping service. 
- **model_complex_role**: Relationships between molecular complexes and their functinal roles. Part of the Biochemistry Database from ModelSEED.
- **model_compound**: Information about compounds associated with metabolic pathways. Part of the Biochemistry Database from ModelSEED.
- **model_reaction**: Information about reactions involved in metabolic pathways. Part of the Biochemistry Database from ModelSEED.
- **model_template_biomass**: Model template biomass. Part of the Biochemistry database from ModelSEED and used for metabolic modeling and FBA.  
- **model_template_reaction**: Model template reactions. Part of the Biochemistry database from ModelSEED and used for metabolic modeling and FBA.  
- **pathway_ref**: Relationship between EC numbers and metabolic pathways and their location on the pathway maps from KEGG. 
- **protein_family_ref**: Information about the PATRIC Global and Local Protein Families and their functauional roles. 
- **sp_gene_ref**: Specialty gene refernece datasets, collected and curated from external sources as described in the Data Section. 
- **subsystem_ref**: Information about the Subsystems, their classification, and corresponding functinal roles. 
- **taxonomy**: Information about taxoinomnic classification from NCBI Taxonomy database. 
