.. _gui-tasks:

Common Tasks Using the Web Interface
====================================

In this tutorial, we will present examples of common tasks and show how
to accomplish them using the BV_BRC Web Interface.  To keep this page
manageable, we link to instructions on separate pages.

Working with Sequences
----------------------


Assemble a Set of Reads into Contigs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

BV_BRC provides an assembly service that allows you to choose between multiple assemblers,
using either single-read libraries, paired-end reads, or reads stored online in the
`NCBI Sequence Read Archive <https://www.ncbi.nlm.nih.gov/sra/>`_.  We have an
:doc:`introductory tutorial </tutorial/genome_assembly/assembly>` and
a :doc:`more detailed guide </user_guides/services/genome_assembly_service>`.

Create an Annotated Genome from a set of contigs and Estimate its Quality
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

BV_BRC provides an annotation service that constructs a private genome from
contigs and produces a quality report.  See :doc:`/tutorial/genome_annotation/annotation`
for instructions on submitting the contigs, and :doc:`/tutorial/genome_quality_report/genome_quality_report`
to read the quality report.  A sample contigs input file and the resulting job output
can be seen here: `Annotation Sample <https://patricbrc.org/workspace/rastuser25@patricbrc.org/Common.Task.Examples/Annotation>`_.
Note that most of the links in the Genome Report will not work because all annotated genomes are private
to the annotating user.

Extract as Many Complete Genomes as Possible from a Meta-Genomic Sample
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The :doc:`/user_guides/services/metagenome_binning_service` provides this function.  For a tutorial,
see :doc:`/tutorial/metagenomic_binning/metagenomic_binning`.  Example input files for binning and
their results can be found here: `Binning Example <https://patricbrc.org/workspace/public/PATRIC@patricbrc.org/PATRIC%20Workshop/Metagenome%20Binning/ICU%20Metagenome>`_.

Annotate a New Genome and Compare it to Similar Genomes in BV_BRC
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
This combines several of the tasks listed elsewhere on this page.  The
Comprehensive Genome Analysis service takes either reads or contigs and
creates a private genome integrated into the BV_BRC database. It also
creates a web page describing the genome and places it into a phylogenetic
tree.  There is a tutorial on how to use this service
:doc:`here </tutorial/comprehensive-genome-analysis/comprehensive-genome-analysis>`.
In :doc:`/tutorial/comprehensive-genome-analysis/cga-results` we show how to
look at the results, find the closest genomes, and compare the protein families.


Working with Taxonomic Groups
-----------------------------

Find Representative Genomes for a Taxon
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

NCBI identifies
`Reference and Representative genomes for each clade and species <https://www.ncbi.nlm.nih.gov/refseq/about/prokaryotes/#representative_genomes>`_.
To these lists, BV_BRC adds UniProt reference genomes, and additional genomes selected by manual
curation.  Because of their high quality, they are a useful subset for doing certain types of
analysis.

For the procedure to list the genomes in a taxonomic grouping, see :doc:`/tutorial/searching_and_sorting/genomes_by_taxonomy`.
Instructions for isolating the Reference and Representative genomes are given on the same page under the heading
:ref:`rep-ref-taxon-section`.

Find Genomes in a Taxon with Specific Attributes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For the procedure to list the genomes in a taxonomic grouping, see :doc:`/tutorial/searching_and_sorting/genomes_by_taxonomy`.
Instructions for filtering the list are given on the same page under the heading
:ref:`taxon-exotic-filtering-section`.


Working with Genomes
---------------------

Find the Roles Present in a Genome
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is described at :doc:`/tutorial/searching_and_sorting/features_with_roles`.

Compare the Proteomes for a Set of Genomes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is described at :doc:`/tutorial/proteome_comparison/proteome_comparison`.

Visually Compare the Protein Families in a Set of Genomes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is described at :doc:`/tutorial/protein_family_sorter/protein_family_sorter`.  A description of
the output and how to manipulate it can be found `here <../user_guides/organisms_taxon/protein_families.html#protein-family-sorter-heatmap>`_

Determine the Evidence of Quality for a Genome
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A quality analysis is performed on every private genome created using :doc:`/tutorial/genome_annotation/annotation`.
The analysis results are stored
in a file called *GenomeReport.html* in the annotation service output folder.  A description of how to read this
file is in the tutorial :doc:`/tutorial/genome_quality_report/genome_quality_report`.

Find the Closest N Genomes to a Particular Genome
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use the :doc:`/tutorial/similar_genome_finder/similar_genome_finder`.  For more information
read :doc:`/user_guides/services/similar_genome_finder_service`.


Working with Protein Families
-----------------------------

List the Features in a Protein Family and the Genomes Containing Them
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This procedure is described in :ref:`feature-protein-family-id`.

Find the Function of a Protein Family
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

First, get a list of the features in the protein family using :ref:`feature-protein-family-id`
or :ref:`feature-protein-family-list`.  Then use the procedure in :ref:`feature-protein-family-function`.


Working with Features
---------------------


Find the Sequence, Protein Translation, and Other Known Attributes of a Gene
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The many attributes of a feature are displayed on the :doc:`/user_guides/organisms_gene/overview`.

Find the Upstream Region of a Gene
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The upstream region can be seen most clearly using the :doc:`/user_guides/organisms_gene/compare_region_viewer`.  The
upstream region is shown to the left of the red arrow.

Find All the Genes in the Same Protein Family As A Feature
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This procedure is described in :ref:`feature-protein-family-list`.


Create an Alignment and the Associated Phylogenetic Tree from a Set of Features
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is described in :doc:`/tutorial/alignments/multiple_sequence_alignment`.

Find the Papers Relating to a Specific Feature
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This information is displayed in the right-hand column of the :doc:`/user_guides/organisms_gene/overview`.

