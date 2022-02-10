.. _rasttk-incremental-commands:

==================================
 RASTtk, The Incremental Commands
==================================

In the previous tutorial, we demonstrated how to run the RASTtk default
pipeline. In this tutorial, we will step through the individual
commands, discuss available options and show how to add data to a genome
typed object. We will also show some of the additional scripts that are
not part of the standard pipeline. As before, these commands will work
in the IRIS environment or in the RASTtk app.

To start this tututorial we will retrieve the *E. coli* K-12 contig from the BV-BRC database. To do this type::

    p3-genome-fasta --contig 511145.12 > E_coli.contig    


RASTtk Incremental Commands
---------------------------

The power of RASTtk lies in ability to chose custom annotation scripts
or to add your own. To provide an illustration, we will step through the
incremental steps and at the end we use an additional script that
annotates prophages using a program called PhiSpy.

The Concept of the *Genome Typed Object*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

All of the individual commands available in the RASTtk pipeline add data
to a special file type called a genome typed object (GTO). A GTO is a
JSON file that is compatible with KBase. Annotations are incrementally
appended to this file until it is ready for export. Thus, one might
start with an empty GTO, add the contigs, run a command that identifies
genes, run another command that assigns functions to the genes, and so
forth.

To create a GTO from scratch we will use the ``rast-create-genome`` command::

        rast-create-genome 

        options:
            -o --output            file to which the output is to be written
            -h --help              print usage message and exit
               --url               URL for the genome annotation service
               --genome-id         Genome identifier
               --scientific-name   Scientific name (Genus species strain) for the genome
               --domain            Domain (Bacteria/Archaea/Virus/Eukaryota) for the genome
               --genetic-code      Genetic code for the genome (usually 11 for most 
                                   organisms or 4 Mycoplasmas etc.)
               --source            Source (external database) name for this genome
               --source-id         Identifier for this genome in the source (external source)
               --contigs           Fasta file containing DNA contig data

We will use this command to create a GTO for the *E. coli* contig that
we downloaded previously by typing the following::

    rast-create-genome --scientific-name "Escherichia coli K-12" --genetic-code 11 --domain Bacteria --contigs E_coli.contig > E_coli.gto 

In the above examples, we have built the GTO in one step. However, for
more complex jobs, it is possible to start with an empty GTO and add or
alter metadata (contigs, source database, scientific name, etc.) using
the scripts::

         rast-set-metadata < input GTO > output GTO
         rast-add-contigs  < input GTO > output GTO

Individual Analysis Tools
~~~~~~~~~~~~~~~~~~~~~~~~~

The default RASTtk pipeline performs the following steps which are
described in detail below, but in this tutorial we will call each step
individually.

         1.  Calls rRNAs with a custom BLAST-based tool
         2.  Calls tRNAs with tRNAscan
         3.  Calls large repeat regions
         4.  Calls seleno proteins
         5.  Calls pyrrolysyl proteins
         6.  Finds Streptococcus repeat regions (only if the genus is Streptococcus)
         7.  Calls CRISPRs
         8.  Calls the protein-encoding genes with Prodigal and Glimmer3
         9.  Annotates protein-encoding genes with k-mers (version 2),
         10.  Annotates remaining hypothetical proteins with k-mers (version 1),
         11.  Attempts to annotate remaining hypothetical proteins by blasting against close relatives (if possible)
         12.  Performs a basic gene overlap removal

The tools that we list below represent a growing collection that can be
invoked to alter/enhance the annotations for a genome represented by a
GTO. Note that the output of one command, which creates a GTO can be
piped into the next.

Calling RNA Genes
~~~~~~~~~~~~~~~~~

For the rRNA genes use::

          rast-call-features-rRNA-SEED  < E_coli.gto > GTO.2 

If you look at "GTO.2" you will see that it is the same as the original
gto file except that the rRNA calls have been appended. All scripts work
this way until the gto is exported in a designated format.
"rast-call-feautures-rRNA-SEED" is a specialty script developed by Gary
Olsen that finds rRNA genes uisng BLAST.

For the tRNA genes use::

        
          rast-call-features-tRNA-trnascan < GTO.2 > GTO.3 

`Citation <http://www.ncbi.nlm.nih.gov/pubmed/9023104?dopt=Abstract>`__

Calling Repeat Regions
~~~~~~~~~~~~~~~~~~~~~~

We use the following command to call repeat region features::

     rast-call-features-repeat-region-SEED < GTO.3 > GTO.4 

    options:
            --min-identity
            --min-length

This program uses BLAST to search within the genome to find repeat
regions. The minimum nucleotide identity and mininimum length for the
match can be specified.

Identification of Genes Related to Selenocysteine and Pyrrolysine
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In some genomes, machinery exists to support inclusion of unusual amino
acids. In the case of selenocysteine and pyrrolysine you can use a tools
created by Gary Olsen to locate and annotate genes related to
selenocysteine and pyrolysine usage::

            rast-call-features-selenoprotein < GTO.4 > GTO.5 
            rast-call-features-pyrrolysoprotein  < GTO.5 > GTO.6 

Finding Streptococcus repeat elements
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Since we are using *E. coli* to demonstrate how to annotate a genome, we
will not look for Streptococcus repeat elements. If you were annotating
a Strep genome, you would use::

       rast-call-features-strep-pneumo-repeat < input.GTO > output.GTO
       
       rast-call-features-strep-suis-repeat   < input.GTO > output.GTO

`Citation <http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3049150>`__

Calling CRISPRs
~~~~~~~~~~~~~~~

To call CRISPR regions use::

      rast-call-features-crispr < GTO.6  > GTO.7 

Calling Protein-encoding Genes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For Prodigal use::

         rast-call-features-CDS-prodigal < GTO.7 > GTO.8 

`Citation <http://www.ncbi.nlm.nih.gov/pubmed/?term=20211023>`__

For Glimmer use::

         rast-call-features-CDS-glimmer3 < GTO.8 > GTO.9 

`Citation <http://www.ncbi.nlm.nih.gov/pubmed/?term=17237039>`__

Annotating Protein-encoding Genes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For kmer based annotations we suggest::

            rast-annotate-proteins-kmer-v2 < GTO.9 > GTO.10 

This scripts assigns functions to protein-encoding genes by performing a
kmer-based search against the CoreSEED. That is, GTO.10 will be the
updated GTO with the functions of the protein-encoding genes added.

Next, we will attempt to annotate the remaining unannotated genes using
the version 1 k-mer collection which is built from FigFams. In the
previous step, any protein-encoding gene that did not have a solid
k-mer-based match was assigned the annotation, "hypothetical protein".
In this step we annotate using the "-H" option, which means "annotate
only hypothetical proteins"::

          rast-annotate-proteins-kmer-v1 -H < GTO.10 > GTO.11 

Finally, if no annotation can be found using the v1 and v2 k-mers, it
may be possible to find an annotation by searching against close
genomes. This script performs a combination of BLAST and BLAT searching
against an NR comprised of genes closely related to the target organism.
Note that an NR will not always be available for all organisms.

::

         rast-annotate-proteins-similarity -H < GTO.11 > GTO.12 

Removing Overlapping Features
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The basic strategy used by RASTtk is to offer a diverse set of tools for
annotating a genome. This includes the ability to use different gene
callers and tools to call different features. Since any combination of
these scripts could be called in a custom pipeline, it is necessary to
merge the results of these sets of proposed features into a single "best
estimate". We use a scoring algorithm to form this best estimate by
looking at the entire collection of calls for a given location and
choosing those that are most likely. That is, you would not want
protein-encoding genes to be called where the 16S rRNA should be.

::

      rast-resolve-overlapping-features < GTO.12 > GTO.13 

Let's add Prophage
~~~~~~~~~~~~~~~~~~

Now that we have performed the standard steps in the RASTtk pipleine, we
will add prophage elements to the GTO.

::

     rast-call-features-prophage-phispy < GTO.13 > GTO.14 

This command may take a few minutes to run. When it completes we have
have a GTO that is customized with phage elements as a feature type.

`Citation <http://www.ncbi.nlm.nih.gov/pubmed/?term=22584627>`__

Exporting the Annotated Genome in a Desired Format
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now that we have gone through all of the individual steps, we will want
to export our genome. We will export the data as a feature table. To do
this type:

::

        rast-export-genome feature_data < GTO.14 > E_coli.table    

    Program Options include:

        -i --input           file from which the input is to be read
        -o --output          file to which the output is to be written
        -h --help            print usage message and exit
        --url                URL for the genome annotation service
        --feature-type       Include this feature type in output. If no
                             feature-types specified, include all feature
                            types

    Available export formats include:
            genbank         Genbank format
            genbank_merged  Genbank format as single merged locus, suitable for Artemis
            feature_data    Tabular form of feature data
            protein_fasta   Protein translations in fasta format
            contig_fasta    Contig DNA in fasta format
            feature_dna     Feature DNA sequences in fasta format
            gff             GFF format
            embl            EMBL format

You can export your genome in many different formats, or if you want
only one feature type (such as RNA) you can get that by using the
--feature-type option. Some feature types include "CDS", "rna",
"repeat", "crispr\_array", "crispr\_repeat", "crispr\_spacer", and in
this case "prophage". We anticipate that the number of features will
continue to grow as we add new functionality.

It is also possible to create combinations of output types. For instance
if we wanted a fasta file of RNA and protein-encoding genes we would
type:

::

    rast-export-genome  --feature-type rna  --feature-type CDS feature_dna < GTO.14 > E_coli.fasta    

Adding Additional Features From and External Source/Program
-----------------------------------------------------------

If you have speciality scripts or annotations that you would prefer to
add to your GTO before exporting, you can use the following::

        rast-add-features features-file < input GTO  > output GTO

            The features file is tab-delimited and must contain the following fields:

            id           ID of the feature. A new feature ID will be assigned for this feature
            location     Location of the feature on the contig, in the format ContigID_[+=]
            feature-type The type of feature (CDS, rna, etc.)
            function     Function assigned to the feature.
            aliases  (optional)  Comma-separated list of aliases for this feature

Summary
-------

The RASTtk Toolkit being developed at Argonne National Laboratory will
offer a framework for constructing customized annotation pipelines. This
is useful for at least two purposes:

#. Customized pipelines offer a means of incorporating genus-specific
   algorithms like the tools for recognizing *Streptococcus*-specific
   repeats. These specialized tools offer the ability to rapidly
   propagate advances in tools to immediately impact the rapidly
   emerging collections of genomes.
#. The second major use of the RASTtk Toolkit will be to evaluate
   alternative approaches to annotations. We anticipate introducing a
   number of feature-calling algorithms, and RASTtk offers a framework
   for evaluating alternative approaches.
