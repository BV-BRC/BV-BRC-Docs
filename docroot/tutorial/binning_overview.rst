:orphan:

Reconstructing Genomes from Metagenomic Samples Using the RAST Binning Service (RBS)
====================================================================================

The ability to reconstruct fairly complete genomes from metagenomic
samples is almost certainly a key technology that will accelerate our
characterization of the tree of life. A number of research groups have
now generated valuable reconstructions of genomes from metagenomic
samples, and this is having an impact on estimating genomic sequences
for unculturable organisms. For background we particularly recommend

         Recovery of nearly 8,000 metagenome-assembled genomes
         substantially expands the tree of life.

         Parks DH, Rinke C, Chuvochina M, Chaumeil PA, Woodcroft BJ, Evans PN,
         Hugenholtz P, Tyson GW. Nat Microbiol. 2017
         PMID: 28894102

but there have been several other excellent efforts that have been
reported over the last few years.

RBS is a server that grew out of the RAST annotation project; it is now
supported and maintained as part of the PATRIC project. In this tutorial
we will discuss what RBS does. For a discussion of how to use it see
:doc:`/tutorial/metagenomic_binning/metagenomic_binning`.

The Server: an Overview
-----------------------

As input to the server, a user supplies a metagenomic sample in one of
the following forms:

#. two files containing paired-end reads,
#. a file of contigs representing an assembled sample. Note that RBS
   is able to function without coverage data; however, if coverage
   information is present in the FASTA sequence identifier or comment,
   RBS will find it and use this information to improve the binning.


The output is a set of *Genome Packages*. Each genome package is a
*Rast Genome* along with an *Evaluation Report* which estimates the
quality of the RAST genome.

The goal is to reconstruct complete (or near-complete) genomes from the
sample data. Reconstructing a complete genome including the
large repeats is usually quite difficult, so we instead try to reconstruct the
regions between large repeats.

It should be noted that the number of genomes that we expect to extract
will depend on the samples we use as input. If we wish to explore this
proposed technology, it would make sense to begin with a very limited
collection of samples. On the other hand, if the goal were to extract as
many new genomes as possible, one might select hundreds (or even
thousands) of samples as input. You should carefully note that this
document describes one approach to extracting genomes from samples.
There are a number of approaches emerging, and it is likely that aspects
of the process we describe may well turn out to be non-optimal. We do
hope that you will explore the approach and have fun in the process.

Here then is basically how we build the reconstructed genomes.

Preparation: Construct a Representative Collection of a Universal Protein
-------------------------------------------------------------------------

We sought a functional role that satisfies the following criteria:

#. Exactly one gene encodes the role in all (or at least most)
   prokaryotic genomes.
#. A role encoded by a long gene is preferred.


We picked

::

      Phenylalanyl-tRNA synthetase alpha chain (EC 6.1.1.20)

but there are other good choices.
Once we selected a role, which we call the *seed role*, we
constructed a blast database containing a representative collection of
protein sequences that implement the seed role.
A crude version of this database can be built using the PATRIC command line tools,
described in :doc:`/cli_tutorial/cli_getting_started`. The following sequence
does the trick.

::

    p3-echo "Phenylalanyl-tRNA synthetase alpha chain (EC 6.1.1.20)" | p3-find-features --attr genome_id,genome_name,patric_id,aa_sequence product | p3-tbl-to-fasta --comment=genome_id --comment=genome_name patric_id aa_sequence


The output is then filtered to exclude proteins from low-quality genomes. The resulting
FASTA database currently contains over 170,000 proteins.

Step 1: For Each Sample, Construct a set of Contig Bins
-------------------------------------------------------

The first step of the actual binning process is to find all instances of the seed role in
the submitted sample. This is done using BLAST, comparing the sequences in each sample to
a selected representative set of instances of the seed role.  The tool filters out hits
which do not adequately cover the known seed role instance. Similarly,
it removes hits against contigs that have less that 4-fold average
coverage or are less than 400 base pairs in length. Each hit that remains represents
a **bin** that will eventually be expanded into a reconstructed genome. A bin is normally
thought of as containing a single genome, but when the binning service cannot resolve two
genomes, it may merge them into a single bin; such bins will usually receive a low quality
score (see section 5 below), and should be set aside for further processing.

Step 2: For Each Sample, Compute a Set of Reference Genomes
-----------------------------------------------------------

At this point, RBS has computed a set of bins, where each bin conceptually contains a
single *seed role* and the contig that contains that seed role. Our
overall objective is to determine which contigs from the cross-assembly
associated with the sample should be placed into each bin. That is, RBS
needs to split the contig pool into subsets that go with each bin, and an
extra set of contigs that could not be placed (there may be many of
these coming from the non-abundant organisms included in the sample, as
well as those contigs whose placement would be ambiguous). There are
several possible strategies for placing contigs into
bins. RBS uses *reference genomes*. This involves
associating a known, sequenced reference genome with each of the bins.
These reference genomes play a central role in the next step, which
involves actually splitting up the pool of contigs in the
sample.

So, how should we go about assigning a sequenced reference genome to
each bin? RBS attempts to find a reference genome that is
phylogenetically close to each bin. To be useful, the reference genome
needs to be substantially closer to the genome represented by the
bin than to any of the genomes represented by other bins. A *blastn* is
used to compare the seed role instance in the bin contig to all of the
seed roles from the PATRIC database as computed in the preparation step
above. If the seed roles in two bins appear to belong to the same species,
they are combined into a single bin.

Once we have chosen the reference genomes, we look for protein 12-mers that
discriminate those genomes; that is, 12-mers which occur in one bin's reference
genomes but not in the reference genomes for any other bins. These discriminating
kmers are put into a temporary database to be used in the next step.


Step 4: For Each Sample, Place Contigs Into Bins
------------------------------------------------

Once reference genomes have been determined for each bin, we can
partition the contigs from the sample into the
bins. Each contig is examined for protein 12-mers in all 6 frames. In
particular, we select for the discriminating kmers computed above.  If a
contig has 10 or more such kmers belonging to a single bin's reference genomes, it is
placed into that bin. In particular, a contig **C** should be copied into bin **B** if and only if
the similarity of **C** against the contigs of the reference genomes
for **B** exceeds the specified threshold (10 discriminating kmers), and it is greater than the
similarity to other reference genomes. That is, **C** is put into the
bin belonging to reference genome **G** if **C** is most similar to
**G** and the similarity exceeds the threshold.

Step 5: Evaluate the Quality of Each Bin
----------------------------------------

At this point, each bin contains a set of contigs that have tentatively
been labeled as coming from a single clonal population. There are
numerous possible sources of error, so how might we evaluate the quality
of a bin? Fortunately, several such tools exist. The most notable is
`checkM <http://genome.cshlp.org/content/early/2015/05/14/gr.186072.114>`__
(which we have found extremely useful):

        Parks DH, Imelfort M, Skennerton CT, Hugenholtz P, Tyson GW.
        2014.  Assessing the quality of microbial genomes recovered from
        isolates, single cells, and metagenomes.  Genome Research, 25:
        1043-1055.

We also annotate the bin using PATRIC RAST, and perform a consistency check
on the annotation as a second check on the quality. The consistency-checking
tool maintains a database of which functional roles tend to occur in the presence
of others and which should not appear in the presence of others. This database
is applied to the annotations from RAST to produce a coarse score (percentage of
roles that are correctly present or absent) and a fine score (percentage of roles
that are correctly absent or present in the correct number).

The RBS output displays the high-quality bins separately from the bins of more
dubious quality.


Summary
-------

In this document, we sketch out the operation of a tool for reconstructing thousands of
genomes from metagenomic samples. There are several alternative plans
being developed by the research community. Here is a brief summary of a
plan implemented by a European team that included Bjorn Nielsen, Dusko
Ehrlich and Peer Bork (see `"Identification and Assembly of Genomes and
Genetic Elements in Complex Metagenomic Samples Without Using Reference
Genomes" <https://www.researchgate.net/publication/264156295_Identification_and_assembly_of_genomes_and_genetic_elements_in_complex_metagenomic_samples_without_using_reference_genomes>`__).

          DNA from a series of independent biological samples from
          microbial communities, here originating from the human gut
          microbiome, is extracted and shotgun sequenced. Genes assembled
          and identified in individual samples are then integrated to form
          a cross-sample, nonredundant gene catalog. The abundance profile
          of each gene in the catalog is assessed by counting the matching
          sequence reads in each sample. To facilitate co-abundance
          clustering of large gene catalogs, we used random seed genes as
          'baits' for identifying groups of genes that correlate (PCC >
          0.9) to the abundance profile of the bait genes. The fixed PCC
          distance threshold is called a canopy. To
          center the canopy on a co-abundance gene group (CAG), the median
          gene abundance profile of the genes within the original seed
          canopy (or subsequent canopies) is used
          iteratively to recapture a new canopy until it settles on a
          particular profile. The gene content of a
          settled canopy is named a metagenomic
          species (MGS) if it contains 700 or more genes. The smaller
          groups remain referred to as CAGs. Sequence reads from
          individual samples that map to the MGS genes and their contigs
          are then extracted and used to assembly a draft genome sequence
          for an MGS; we refer to this process as MGS-augmented genome
          assembly. The use of sample-specific sequence reads in the
          assemblies helps discriminate between closely related strains.

It seems likely that we will be able to harvest thousands of genomes
from metagenomic samples. The number of potentially useful samples is
growing exponentially, the desire to gain genomes for unculturable
organisms is growing, and our ability to extract reconstructed genomes
is improving. Further improvements to the existing algorithms
will inevitably increase the fraction of bins that can be salvaged.
