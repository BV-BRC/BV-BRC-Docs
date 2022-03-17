.. _rasttk-getting-started:

RASTtk: Getting Started With The Default Pipeline
=================================================

`RAST <http://rast.nmpdr.org/rast.cgi>`_ is a web-based environment that
allows users to upload a genome, annotate the genome, edit the
annotations and compare the genome with other sequenced genomes in the
SEED database. Since the initial publication of `The RAST Server: rapid
annotations using subsystems
technology <http://www.ncbi.nlm.nih.gov/pubmed/18261238>`_ in 2008, over
150,000 requests for genome annotations have been processed, at a
current rate of 1,200 jobs per week.

As demand for ever more accurate annotations and the number of
newly-sequenced genomes increases, there is a growing demand for "the
next generation" of the RAST technology (RASTtk). This new version of
the architecture makes it possible to construct custom pipelines,
integrate new bioinformatic tools, and make the developed pipelines
easily accessible by a large user community.

In essence, RASTtk is an updated version of the RAST pipline which users
can modify and customize, but it is not intended to replace the RAST web
environment.

Getting Started
~~~~~~~~~~~~~~~

In order to run the RASTtk tools, you will need to install the BV-BRC 
command line utilities package. This is available for the macOS and Ubuntu or Debian 
Linux `here <https://github.com/TheSEED/RASTtk-Distribution/releases/>`_.

If you want to step through the tutorial, you can download the *E. coli*
K-12 contig in fasta format from BV-BRC using the following command::

         p3-genome-fasta --contig 511145.12 > E_coli.contig    

511145.12 is the BV-BRC genome identifier for E. coli K-12.
The ``p3-genome-fasta`` command returns the DNA data for the contigs 
of the given genome. 

The Default RASTtk Pipeline
~~~~~~~~~~~~~~~~~~~~~~~~~~~

The RASTtk environment is designed so that users can compose annotation
pipelines, and then run those pipelines to annotate genomes. There is a
rich and growing body of annotation tools that we have either built or
imported from other groups, and these offer a framework for
incrementally constructing annotations.

In some cases users would rather execute a minimal set of commands
representing the currently recommended annotation pipeline. This
pipeline is composed of three easy scripts that:

1. Format the contigs file

2. Annotate the genome

3. Export the genome

The Concept of the *Genome Typed Object*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

All of the individual commands available in the RASTtk pipeline add data
to a special file type called a genome typed object (GTO). A GTO is a
JSON file that is compatible with KBase. Annotations are incrementally
appended to this file until it is ready for export. By creating the GTO
and adding annotation data to it, it is possible to export the data in
multiple file formats without having to reannotate the genome.

To create a GTO from scratch we will use the ``rast-create-genome`` command::

        rast-create-genome 

        options:
            -o --output            file to which the output is to be written
            -h --help              print usage message and exit
               --url               URL for the genome annotation service
               --genome-id         Genome identifier
               --scientific-name   Scientific name (Genus species strain) for the genome
               --domain            Domain (Bacteria/Archaea/Virus/Eukaryota) for the genome
               --genetic-code      Genetic code for the genome (usually 11 for most organisms or 4 Mycoplasmas etc.)
               --source            Source (external database) name for this genome
               --source-id         Identifier for this genome in the source (external source)
               --contigs           Fasta file containing DNA contig data

We will use this command to create a GTO for the *E. coli* contig that
we downloaded previously by typing::

    rast-create-genome --scientific-name "Escherichia coli K-12" --genetic-code 11 --domain Bacteria --contigs E_coli.contig > E_coli.gto 

Some processes in the pipeline require that you declare the scientific
name, domain and genetic code, so these are required fields.

To run the default RASTtk pipeline tool, type::

          rast-process-genome < E_coli.gto > E_coli.gto2 

Here, "E\_coli.gto2" is a second genome typed object with all of the
RAST annotation data.

This is the RASTtk Default Pipeline:

#.  Calls rRNAs with a custom BLAST-based tool
#.  Calls tRNAs with tRNAscan
#.  Calls large repeat regions
#.  Calls seleno proteins
#.  Calls pyrrolysyl proteins
#.  Finds Streptococcus repeat regions (only if the genus is Streptococcus)
#.  Calls CRISPRs
#.  Calls the protein-encoding genes with Prodigal and Glimmer3
#.  Annotates protein-encoding genes with k-mers (version 2),
#.  Annotates remaining hypothetical proteins with k-mers (version 1),
#.  Attempts to annotate remaining hypothetical proteins by blasting against close relatives (if possible)
#.  Performs a basic gene overlap removal

To export the genome in a desired format we will use the ``rast-export-genome`` command::

    rast-export-genome 
      
        options:
        -i --input           file from which the input is to be read
        -o --output          file to which the output is to be written
        -h --help            print usage message and exit
        --url                URL for the genome annotation service
        --feature-type       Include this feature type in output. If no
                             feature-types specified, include all feature
                             types
                           
        Supported formats: 
          genbank         Genbank format
          genbank_merged  Genbank format as single merged locus, suitable for Artemis
          feature_data    Tabular form of feature data
          protein_fasta   Protein translations in fasta format
          contig_fasta    Contig DNA in fasta format
          feature_dna     Feature DNA sequences in fasta format
          gff             GFF format
          embl            EMBL format

To illustrate how ``rast-export-genome`` is used, we will export our
genome in genbank format. Type::

    rast-export-genome genbank < E_coli.gto2 > E_coli.gbk

Using the ``--feature-type`` option, it is possible to filter the output.
For instance if we wanted a fasta file of RNA sequences we would type::

    rast-export-genome feature_dna --feature-type rna < E_coli.gto2 > E_coli.rna.fasta

Other feature types include "CDS", "repeat", "crispr\_array",
"crispr\_repeat", and "crispr\_spacer". We anticipate that the number of
features will continue to grow as we add new functionality.

That's it! Three basic commands -- ``rast-create-genome``,
``rast-process-genome`` and ``rast-export-genome`` --give you the RASTtk
default pathway. However, this is only a subset of the available RASTtk
functions. We have designed RASTtk so that it is modular and users can
build custom annotation pipelines. In order to tap into this capability
and to learn about individual steps please read the tutorial :ref:`rasttk-incremental-commands`.
