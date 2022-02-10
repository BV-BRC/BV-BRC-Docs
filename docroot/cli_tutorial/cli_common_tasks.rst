.. _cli-common-tasks:

Common Tasks With P3 Scripts
============================

Here we present examples of common tasks and show how
to accomplish them with the :doc:`command-line interface <index>`



Working with Taxonomic Groupings
--------------------------------

List Roles that are Found in One Species but not Another
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For our example, we will compare Vibrio campbellii with Vibrio
alginolyticus.

To answer this question, we need a file of roles from Vibrio
alginolyticus and use it to filter out roles from Vibrio campbellii.
The following pipe gets all the roles from Vibrio alginolyticus
genomes and puts them in the file **aRoles.tbl**.

    ::

        p3-all-genomes --eq "genome_name,Vibrio alginolyticus" | p3-get-genome-features --attr product | p3-function-to-role | p3-sort --count feature.role >aRoles.tbl

There are a lot of pieces to this pipe. First, :ref:`cli::p3-all-genomes`
gets all the genome IDs for Vibrio alginolyticus. Then
:ref:`cli::p3-get-genome-features` finds all the features for those genomes
and outputs the functional assignment (product).
:ref:`cli::p3-function-to-role` converts the functions to roles and
eliminates the hypotheticals. Finally, :ref:`cli::p3-sort` with the
``--count`` option counts the number of occurrences of each role. It
takes a while, but the output looks something like this.

    ::

        feature.role    count
        (2E,6E)-farnesyl diphosphate synthase (EC 2.5.1.10) 34
        (3R)-hydroxymyristoyl-[ACP] dehydratase (EC 4.2.1.-)    34
        1,4-alpha-glucan (glycogen) branching enzyme, GH-13-type (EC 2.4.1.18)  37
        1,4-alpha-glucan branching enzyme (EC 2.4.1.18) 34
        1,4-dihydroxy-2-naphthoate polyprenyltransferase (EC 2.5.1.74)  34
        1,4-dihydroxy-2-naphthoyl-CoA hydrolase (EC 3.1.2.28) in menaquinone biosynthesis   34
        1,6-anhydro-N-acetylmuramyl-L-alanine amidase   35
        1-deoxy-D-xylulose 5-phosphate reductoisomerase (EC 1.1.1.267)  34
        1-deoxy-D-xylulose 5-phosphate synthase (EC 2.2.1.7)    35
        1-hydroxy-2-methyl-2-(E)-butenyl 4-diphosphate synthase (EC 1.17.7.1)   38
        1-phosphofructokinase (EC 2.7.1.56) 34

Now we perform the same exercise with Vibrio campbellii.

    ::

        p3-all-genomes --eq "genome_name,Vibrio campbellii" | p3-get-genome-features --attr product | p3-function-to-role | p3-sort --count feature.role >cRoles.tbl

    ::

        feature.role    count
        (2E,6E)-farnesyl diphosphate synthase (EC 2.5.1.10) 25
        1,4-alpha-glucan (glycogen) branching enzyme, GH-13-type (EC 2.4.1.18)  27
        1,4-alpha-glucan branching enzyme (EC 2.4.1.18) 25
        1,4-dihydroxy-2-naphthoate polyprenyltransferase (EC 2.5.1.74)  27
        1,4-dihydroxy-2-naphthoyl-CoA hydrolase (EC 3.1.2.28) in menaquinone biosynthesis   28
        1,6-anhydro-N-acetylmuramyl-L-alanine amidase   25
        1-deoxy-D-xylulose 5-phosphate reductoisomerase (EC 1.1.1.267)  30
        1-deoxy-D-xylulose 5-phosphate synthase (EC 2.2.1.7)    27
        1-hydroxy-2-methyl-2-(E)-butenyl 4-diphosphate synthase (EC 1.17.7.1)   26
        1-phosphofructokinase (EC 2.7.1.56) 33
        16 kDa heat shock protein A 25

Now we filter **cRoles.tbl** by removing records that match
**aRoles.tbl**. Note that we are matching on the key column ONLY. We
don't care about the counts, only which roles are in campbellii but
not alginolyticus. The :ref:`cli::p3-file-filter` command performs this
task.

    ::

        p3-file-filter --reverse --col=feature.role aRoles.tbl <cRoles.tbl

The ``--reverse`` option tells us we want roles that are in the
standard input file (**cRoles.tbl**) but not the filter file
(**aRoles.tbl**). The ``--col`` option tells us we are comparing
values in the *feature.role* column. Both files are the same format;
if the formats were different, we could specify a different key
column identifier for the filter file by appending it as a
positional parameter. So, another way to code the same thing would
be

    ::

        p3-file-filter --reverse --col=feature.role aRoles.tbl feature.role <cRoles.tbl

The output looks something like this

    ::

        feature.role    count
        2,3-dihydroxybenzoate-AMP ligase (EC 2.7.7.58) of siderophore biosynthesis  33
        2-octaprenyl-3-methyl-6-methoxy-1,4-benzoquinol hydroxylase (EC 1.14.13.-)  1
        2-pyrone-4,6-dicarboxylic acid hydrolase (EC 3.1.1.57)  14
        23S ribosomal RNA rRNA prediction is too short  1
        3-polyprenyl-4-hydroxybenzoate carboxy-lyase UbiX (EC 4.1.1.-)  1
        4-amino-4-deoxy-L-arabinose transferase 26
        4-carboxy-2-hydroxymuconate-6-semialdehyde dehydrogenase    17
        4-carboxy-4-hydroxy-2-oxoadipate aldolase (EC 4.1.3.17) 16
        4-hydroxy-2-oxovalerate aldolase (EC 4.1.3.39)  7
        4-oxalmesaconate hydratase (EC 4.2.1.83)    14
        4-oxalocrotonate tautomerase    1


Compute How Many Genomes we have in a Particular Genus
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For Streptococcus:

    ::

        p3-all-genomes --equal genus,Streptococcus --count

    ::

        genome.count
        11836

Note the use of the ``--count`` command-line option to produce a
count of the results instead of the results themselves.

List the Genomes we have in a Particular Genus
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For Streptococcus:

    ::

        p3-all-genomes --equal genus,Streptococcus --attr genome_name

    ::

        genome.genome_id    genome.genome_name
        1302.21 Streptococcus gordonii strain DD07
        1303.76 Streptococcus oralis strain DD05
        1303.77 Streptococcus oralis strain DD14
        1303.78 Streptococcus oralis strain DD15
        1303.79 Streptococcus oralis strain DD16
        1303.80 Streptococcus oralis strain DD20
        1303.81 Streptococcus oralis strain DD21
        1303.82 Streptococcus oralis strain DD27
        1303.83 Streptococcus oralis strain DD30

:ref:`cli::p3-all-genomes` always includes the ID, so all we need for the
``--attr`` parameter is the name field. If you intend to pipe the
results into another script, specify the attributes in the order you
want them to appear.

::

        p3-all-genomes --equal genus,Streptococcus --attr genome_name --attr genome_id

::

        genome.genome_name  genome.genome_id
        Streptococcus gordonii strain DD07  1302.21
        Streptococcus oralis strain DD05    1303.76
        Streptococcus oralis strain DD14    1303.77
        Streptococcus oralis strain DD15    1303.78
        Streptococcus oralis strain DD16    1303.79
        Streptococcus oralis strain DD20    1303.80
        Streptococcus oralis strain DD21    1303.81
        Streptococcus oralis strain DD27    1303.82
        Streptococcus oralis strain DD30    1303.83

Compute the  Fraction of the Genomes in a Genus that are Resistant to a Particular Drug
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In our example, we will look for Staphylococcus genomes resistant to methicillin.

This is a two-step process, since we need two numbers-- the total number of
Staphylococcus genomes and the number that are methicillin-resistant.

    ::

        p3-all-genomes --equal genome_name,Staphylococcus --count

We isolate the genus by doing a string match on the genome name,
since equality for string fields matches if the value is a
substring. We could also use ``--equal genus,Staphylococcus`` and
get an equivalent result.

    ::

        genome.count
        10716

To get the count of resistant genomes, we need to pipe the drug name
into :ref:`cli::p3-get-drug-genomes`. Here we don't have the option of using
the *genus* field, since only the genome name is present in the
drug-genome records, not the entire taxonomy.

    ::

        p3-echo -t antibiotic methicillin | p3-get-drug-genomes --resistant --equal genome_name,Staphylococcus --count

    ::

        antibiotic   genome_drug.count
        methicillin  1064

The answer is 1064 \* 100 / 10716 or 9.93%.



Working with Genomes
--------------------

Find a Genome from an Accession Number or Project ID
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Genomes in BV-BRC are stored with four alternate IDs, any of which
can be used to search for the genomes.

#. ncbi\_project\_id. The NCBI project number
#. refseq\_project\_id. The REFSEQ project number
#. genbank\_accessions. The accession string from GENBANK
#. refseq\_accessions. The accession string from REFSEQ

The following commands all return the genome *Streptococcus mutans
UA159*.

.. code::

    p3-all-genomes --eq genbank_accessions,AE014133

.. code::

    p3-all-genomes --eq refseq_accessions,NC_004350

.. code::

    p3-all-genomes --eq ncbi_project_id,333

.. code::

    p3-all-genomes --eq refseq_project_id,57947

Because no attributes were specified, the output in each case is
solely the genome ID, a single output record in a single column.

.. code::

    genome.genome_id
    210007.7




Given a Genome ID, Find the Name
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The genome name is in an attribute called *genome\_name*. You can
get it from the genome ID using :ref:`cli::p3-all-genomes` as shown here.

.. code::

    p3-all-genomes --eq genome_id,210007.7 --attr genome_name

.. code::

    genome.genome_id    genome.genome_name
    210007.7    Streptococcus mutans UA159

Alternatively, you can use :ref:`cli::p3-get-genome-data` and use
:ref:`cli::p3-echo` to pipe in the ID.

.. code::

    p3-echo 210007.7 | p3-get-genome-data --attr genome_name

.. code::

    id  genome.genome_name
    210007.7    Streptococcus mutans UA159


Find a Gene by Name in a Particular Genome
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here you want to use :ref:`cli::p3-find-features` with a genome\_id filter.

.. code::

    p3-echo coaA | p3-find-features --attr patric_id,product --eq genome_id,210007.7 gene

.. code::

    id  feature.patric_id   feature.product
    coaA    fig|210007.7.peg.1009   Pantothenate kinase (EC 2.7.1.33)


Display the CDS and RNA features for A Genome Sorted by Location on the Chromosome
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For the genome 1313.7001 (Streptococcus pneumoniae P210774-233).

    ::

        p3-echo -t genome_id 1313.7001 | p3-get-genome-features --in feature_type,CDS,rna --attr patric_id --attr sequence_id --attr start --attr strand --attr product | p3-sort feature.sequence_id feature.start/n feature.strand

We start by using :ref:`cli::p3-echo` to create a file that has our single
genome ID in it. The bulk of the retrieval work is performed by
:ref:`cli::p3-get-genome-features`. The ``--in`` parameter allows us to
specify a list of values for a specific field. In this case, we want
*feature\_type* to equal either ``CDS`` or ``rna``. To sort by
location, we need the contig ID (*sequence\_id*) and the start
location (*start*). The start location is always the leftmost
location on the contig, so it is perfect for sorting. Finally, we
add the strand (``+`` or ``i``) and then the functional assignment
(*product*) so we can see what the feature does. The :ref:`cli::p3-sort`
gets the file records in the proper order. Because one of the fields
is numeric, we put a ``/n`` after the field name. This tells the
sorter that for the *feature.start* column, the value ``20`` comes
before, not after, the value ``100``. The output will look something
like this.

    ::

        genome_id   feature.patric_id   feature.sequence_id feature.start   feature.strand  feature.product
        1313.7001   fig|1313.7001.peg.1 1313.7001.con.0001  40  -   Mobile element protein
        1313.7001   fig|1313.7001.peg.2 1313.7001.con.0001  540 -   Mobile element protein
        1313.7001   fig|1313.7001.peg.3 1313.7001.con.0001  994 -   Mobile element protein
        1313.7001   fig|1313.7001.peg.4 1313.7001.con.0002  1   +   Streptococcal histidine triad protein
        1313.7001   fig|1313.7001.peg.5 1313.7001.con.0003  1   +   Endo-beta-N-acetylglucosaminidase (EC 3.2.1.96)
        1313.7001   fig|1313.7001.peg.6 1313.7001.con.0003  1120    -   Fibronectin/fibrinogen-binding protein
        1313.7001   fig|1313.7001.peg.7 1313.7001.con.0003  2880    +   Metal-dependent hydrolase YbeY, involved in rRNA and/or ribosome maturation and assembly
        1313.7001   fig|1313.7001.peg.8 1313.7001.con.0003  3358    +   Diacylglycerol kinase (EC 2.7.1.107)
        1313.7001   fig|1313.7001.peg.9 1313.7001.con.0003  3770    +   GTP-binding protein Era
        1313.7001   fig|1313.7001.peg.10    1313.7001.con.0003  4684    +   Formamidopyrimidine-DNA glycosylase (EC 3.2.2.23)
        1313.7001   fig|1313.7001.peg.11    1313.7001.con.0003  5541    +   Dephospho-CoA kinase (EC 2.7.1.24)
        1313.7001   fig|1313.7001.peg.12    1313.7001.con.0003  6133    +   Multidrug resistance efflux pump PmrA
        1313.7001   fig|1313.7001.peg.13    1313.7001.con.0003  7521    +   Protein translocase membrane subunit SecG
        1313.7001   fig|1313.7001.peg.14    1313.7001.con.0003  7856    +   3'-to-5' exoribonuclease RNase R
        1313.7001   fig|1313.7001.peg.15    1313.7001.con.0003  10173   +   tmRNA-binding protein SmpB
        1313.7001   fig|1313.7001.peg.16    1313.7001.con.0003  10656   +   Tellurite methyltransferase (EC 2.1.1.265)

Compute the Upstream Regions for the Protein-Encoding Genes in a Genome
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For the genome 1313.7001 (Streptococcus pneumoniae P210774-233).

We get upstream regions from the :ref:`cli::p3-feature-upstream` script, but
to use it we need an input list of feature IDs. We will produce
feature IDs and functional assignments, then append the upstream
sequences.

    ::

        p3-echo -t genome_id 1313.7001 | p3-get-genome-features --eq feature_type,CDS --attr patric_id --attr product | p3-feature-upstream --col=feature.patric_id

The ``-eq feature_type,CDS`` ensures we only see protein-encoding
features. Because we are not putting the feature ID in the last
column, we use ``--col=feature.patric_id`` to direct
:ref:`cli::p3-feature-upstream` to the correct input column. The output will
look something like this. Note the upstream DNA is in the last
column.

    ::

        genome_id   feature.patric_id   feature.product upstream
        1313.7001   fig|1313.7001.peg.1182  beta-glycosyl hydrolase      ttgtcatctcctcttgactctcgttaatataagaaataaaataagggcgttgatttatataatcgctatcaatataacaatgcaatcaggaggttttgca
        1313.7001   fig|1313.7001.peg.1189  IMP cyclohydrolase (EC 3.5.4.10) / Phosphoribosylaminoimidazolecarboxamide formyltransferase (EC 2.1.2.3)   gatcaatatcttaggtatgcttagccttggttttgcttatcttgttttactgttactgcatttaattggtgtttaactaatgattaaaaaggagaatata
        1313.7001   fig|1313.7001.peg.1191  Phosphoribosylglycinamide formyltransferase (EC 2.1.2.2)      tcagccctgaaaatgtagagcgtgtaaaagaattgttggatgaagcagtctatgaaattggtcgcatcgtcaagaaagaaaacgaaagtgtcattatcaa
        1313.7001   fig|1313.7001.peg.1192  Phosphoribosylformylglycinamidine cyclo-ligase (EC 6.3.3.1)   tctctatgactacgaagaagactatcgtagaagtttggaagaaaagaccagtttttacaagtaggcgacagattctccattaaagaaaaggaaaaaacaa
        1313.7001   fig|1313.7001.peg.1199  hypothetical protein    aaggtggcggatgcaattggggagattttgccaaagcaggtgttggaggaggagctatacttggaggtgtggcctatgcagcgacatgttggtggtaatt
        1313.7001   fig|1313.7001.peg.1211  hypothetical protein    ttggcgattaccaacaatggacaggaaaaccatctggttaagatggcattcttggaattaaaaaatacagagaaaccagcaaagacaaggttcgcaagcc
        1313.7001   fig|1313.7001.peg.1259  Acetyl xylan esterase 1; Cephalosporin-C deacetylase (EC 3.1.1.41)  aaagaatctaaattcactttctatttacccttctttcttgcattgattacatagatatgctacagttgtggtaacgattacaaaataaaaggagcatgct
        1313.7001   fig|1313.7001.peg.1278  Helicase loader DnaB    acgttttgctagtgtctatcgtagttttaaggatgtcagtgagttagagagcttgctccaacaaatcacccagtcctctaaaaagaaaaaggaaagataa
        1313.7001   fig|1313.7001.peg.1288  Fructokinase (EC 2.7.1.4)   ttattagatagtaagatttacagaggaaaatctaaaaaatagagacatttagactttcgaagtatgctataataaagaaaataaaaacaagaggtttatc

You can use the ``--len`` parameter of :ref:`cli::p3-feature-upstream` to
change the number of base pairs displayed (the default is 100). If
the feature is at the edge of the contig, you may see less than the
specified length or even nothing at all, since the script stops at
the contig boundary. To see downstream regions instead, use the
``--downstream`` option. This pipe shows the 10 base pairs
downstream of each gene.

    ::

        p3-echo -t genome_id 1313.7001 | p3-get-genome-features --eq feature_type,CDS --attr patric_id --attr product | p3-feature-upstream --col=feature.patric_id --downstream --len=10

    ::

        genome_id   feature.patric_id   feature.product downstream
        1313.7001   fig|1313.7001.peg.1182  beta-glycosyl hydrolase    gtcttttcga
        1313.7001   fig|1313.7001.peg.1189  IMP cyclohydrolase (EC 3.5.4.10) / Phosphoribosylaminoimidazolecarboxamide formyltransferase (EC 2.1.2.3)   gaagataaaa
        1313.7001   fig|1313.7001.peg.1191  Phosphoribosylglycinamide formyltransferase (EC 2.1.2.2)    ctttttgatg
        1313.7001   fig|1313.7001.peg.1192  Phosphoribosylformylglycinamidine cyclo-ligase (EC 6.3.3.1)     aaaaaatagc
        1313.7001   fig|1313.7001.peg.1199  hypothetical protein    tcaaaactat
        1313.7001   fig|1313.7001.peg.1211  hypothetical protein    tcaactacat
        1313.7001   fig|1313.7001.peg.1259  Acetyl xylan esterase 1; Cephalosporin-C deacetylase (EC 3.1.1.41)  ggagtcgact
        1313.7001   fig|1313.7001.peg.1278  Helicase loader DnaB    atggaaagtg

Compute the Codon Usage in a Genome
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Our example genome is 186497.12 (Pyrococcus furiosus DSM 3638).

The :ref:`cli::p3-sequence-profile` script counts the number of occurrences
of each letter in a sequence field. To use it, we need to create a
file that has the sequences we want to analyze in the last column.
We start with the genome ID, then use :ref:`cli::p3-get-genome-features` to
get the feature data. The *aa\_sequence* field contains the protein
sequences, which are then processed by :ref:`cli::p3-sequence-profile`.

    ::

        p3-echo -t genome_id 186497.12 | p3-get-genome-features --attr aa_sequence | p3-sequence-profile

By default, :ref:`cli::p3-sequence-profile` works on the last input column,
which in this case is the amino acid sequence. The output will look
something like this.

    ::

        letter  count
        L   58114
        E   51852
        I   50270
        K   46874
        V   45417
        G   41210
        A   38057
        R   30791
        S   28102
        F   25399
        T   25375
        D   25340
        P   24706
        Y   23048
        N   19998
        M   12966
        Q   10045
        H   8653
        W   7104
        C   3359

Note that the output is sorted from most common to least. The same
trick works for DNA sequences, which are in the *na\_sequence*
field.

    ::

        p3-echo -t genome_id 186497.12 | p3-get-genome-features --attr na_sequence | p3-sequence-profile

    ::

        letter  count
        A   597286
        T   465185
        G   440197
        C   305118



Extract a Fasta File of a Genome's Contigs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Our example is 1302.21 (Streptococcus gordonii strain DD07).

    ::

        p3-genome-fasta 1302.21

    ::

        >1302.21.con.0001 contig
        agctcagttggtagtagcgcatgactgttaatcatgatgtcgtaggttcgagtcctactg
        ccggagttatatctataagtaagacaagaaattcttgtctttttatatttattgtgtttt
        tgcaatttaatttttaagttcttatttaataaaaagcttgaagattattcttcaagcttt
        ttatgtttattaaagaatgcttcatagagggctttaatagctgctttttcttgttcagag
        tttactacgagcatgatagaaacttcgctagatccttgagagatcatttgaatattaatt
        ttgctgtctgatagagcctttgtagccgtagcagtcagaccgatatgacttttcatttgc

List the Protein Sequences for the Genes in a Genome
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Our example is 1302.21 (Streptococcus gordonii strain DD07).

    ::

        p3-genome-fasta --protein 1302.21

    ::

        >fig|1302.21.peg.966 putative Zn-dependent protease
        MRFLLNLFRFIWRMFWRLVWAGIVAFIILVSVLYLTNPSQTGLTAVRQAVQTAVNQLDTF
        LDQQGIHTGLGQNVQNLGEHLTDQHVASSDGARWENARATVYIETENSTFRAAYQEAIKS
        WNATGAFTFQLVEDKSQANIIATEMNDSTITAAGEAESQTNVLTKRFTKVTVRLNAYYLL
        NNYYGYSHERIVNTASHELGHAIGLDHNESESVMQSAGSFYSIQPIDIQAVKELYQD
        >fig|1302.21.peg.969 Putative metallopeptidase (Zinc) SprT family
        MNLNEYIKQVSLEDFGWEFRHQAFWNKRLRTTGGRFFPKDGHLDFNPKIYETFGLETFRK
        IVRHELAHYHLYYQGKGYRHKDRDFKELLKQVGGLRYAPGLPAKKLKLHYQCRSCCTDFY
        RQRRIEIKKYRCGRCKGKLRLLKQER

Given a List of Genomes, Produce a List of Pairs of Roles that are Implemented by Genes that are Close on the Chromosome, Sorted by Number of Occurrences
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here we assume our list of genomes is in the file **genomes.tbl**.
The content of this file is shown below.

    ::

        genome_id
        1310696.14
        66976.17
        91890.5
        316273.25
        186497.12
        1353158.3
        135461.13
        1173954.3
        1176728.3

We use :ref:`cli::p3-get-genome-features` to get the feature and location
data, :ref:`cli::p3-function-to-role` to convert the functions to roles, and
:ref:`cli::p3-generate-close-roles` to compute the physically close roles.
Because we only want protein-encoding genes (pegs), we filter the
genome features by type. (If we didn't do this, the output would
start with a whole bunch of generic roles involving ribosomes and
CRISPR repeats.) The output is automatically sorted by decreasing
number of occurrences.

    ::

        p3-get-genome-features --eq feature_type,CDS --attr sequence_id --attr location --attr product <genomes.tbl | p3-function-to-role | p3-generate-close-roles

    ::

        role1   role2   count
        Transposase, IS3/IS911 family   Mobile element protein  33
        Mobile element protein  Mobile element protein  29
        Lead, cadmium, zinc and mercury transporting ATPase (EC 3.6.3.3) (EC 3.6.3.5)   Copper-translocating P-type ATPase (EC 3.6.3.4) 25
        Potassium efflux system KefA protein    Small-conductance mechanosensitive channel  13
        Cobalt-zinc-cadmium resistance protein CzcA Cation efflux system protein CusA   13
        Gamma-glutamyltranspeptidase (EC 2.3.2.2)   Glutathione hydrolase (EC 3.4.19.13)    13
        Efflux ABC transporter, ATP-binding protein Efflux ABC transporter, permease protein    11

Note that the occurrence counts are shown in the last column of the
output.

Extract the Genomes in a List that have GC Content Values Greater Than a Certain Percentage
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For this exercise we will use the **genomes.tbl** file as input and look for a
GC content over 60%.

    ::

        genome_id
        1310696.14
        66976.17
        91890.5
        316273.25
        186497.12
        1353158.3
        135461.13
        1173954.3
        1176728.3

The GC content percentage is found in the *gc\_content* attribute,
as shown in the example below (we use :ref:`cli::p3-sort` to sort the
results by the content percentage).

    ::

        p3-get-genome-data --attr gc_content --attr genome_name <genomes.tbl | p3-sort gc_content/n

    ::

        genome_id       genome.gc_content       genome.genome_name
        91890.5 38.19   Legionella pneumophila subsp. pascullei strain D-7158
        66976.17        38.28   Legionella pneumophila serogroup 1 strain Lp01_666
        186497.12       40.8    Pyrococcus furiosus DSM 3638
        1353158.3       43.41   Methanococcoides vulcani strain SLH 33
        135461.13       43.88   Bacillus subtilis subsp. subtilis strain BSD-2
        1173954.3       45.1    Vibrio parahaemolyticus O4:K12 str. K1203
        1176728.3       50.67   Escherichia coli K71
        316273.25       64.56   Xanthomonas campestris pv. vesicatoria str. 85-10

As you can see, there is only one genome in this set with a GC
content over 60%. To get only that genome, we use the ``--gt``
parameter to filter for specific values of that field.

    ::

        p3-get-genome-data --attr gc_content --attr genome_name --gt gc_content,60 <genomes.tbl

    ::

        genome_id   genome.gc_content   genome.genome_name
        316273.25   64.56   Xanthomonas campestris pv. vesicatoria str. 85-10


Compute how Close Two Features are on the Chromosome
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We will ask this question for features fig|1302.21.peg.966 and fig|1302.21.peg.1019.

The script :ref:`cli::p3-feature-gap` gives us this information. Since
it expects two feature IDs on the same input line, we use a
:ref:`cli::p3-echo` with two titles to put its two parameters on a single
line.

    ::
        p3-echo -t f1.patric_id -t f2.patric_id "fig|1302.21.peg.966" "fig|1302.21.peg.1019" | p3-feature-gap

    ::

        f1.patric_id    f2.patric_id    gap
        fig|1302.21.peg.966 fig|1302.21.peg.1019    55253

Note that if the features are on different contigs, we get a very
high number.

    ::

        p3-echo -t f1.patric_id -t f2.patric_id "fig|1313.7001.peg.1159" "fig|1313.7001.peg.1384" | p3-feature-gap

    ::

        f1.patric_id    f2.patric_id    gap
        fig|1313.7001.peg.1159  fig|1313.7001.peg.1384  2000000000

The very high number makes it easier to simply compare the distance
outputs from :ref:`cli::p3-feature-gap`. Features on different contigs will
always sort as further apart than features on the same contig.



List the Drugs to which a Genome is Resistant
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The drug name is in the *antibiotic* attribute of the genome-drug
table. We start with a genome ID and use :ref:`cli::p3-get-genome-drugs`.
Our example is genome 46170.310 (Staphylococcus aureus subsp. aureus strain VB4283.

    ::

        p3-echo -t genome_id 46170.310 | p3-get-genome-drugs --resistant --attr antibiotic

    ::

        genome_id   genome_drug.antibiotic
        46170.310   ciprofloxacin
        46170.310   erythromycin
        46170.310   gentamicin
        46170.310   methicillin
        46170.310   penicillin
        46170.310   trimethoprim/sulfamethoxazole

Working with Anti-Microbial Drugs
---------------------------------

Find Genomes that are Resistant to a Particular Drug
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here we start with a drug name (our example is erythromycin) and
use :ref:`cli::p3-get-drug-genomes` to
get the genome data.

    ::

        p3-echo -t antibiotic erythromycin | p3-get-drug-genomes --resistant --attr genome_id --attr genome_name

    ::

        antibiotic  genome_drug.genome_id   genome_drug.genome_name
        erythromycin    1280.4920   Staphylococcus aureus P210110-35
        erythromycin    1280.4930   Staphylococcus aureus P210184-226
        erythromycin    1280.4940   Staphylococcus aureus P210369-10
        erythromycin    1280.4960   Staphylococcus aureus P210464-28
        erythromycin    1280.4970   Staphylococcus aureus P310372-198
        erythromycin    1280.4990   Staphylococcus aureus P311202-207
        erythromycin    1313.6942   Streptococcus pneumoniae P110340-157
        erythromycin    1313.7001   Streptococcus pneumoniae P210774-233
        erythromycin    1313.7002   Streptococcus pneumoniae P210824-213
        erythromycin    1313.7006   Streptococcus pneumoniae P310010-154
        erythromycin    1313.7013   Streptococcus pneumoniae P310795-191

Working with Protein Families
-----------------------------

Compute the Average Length of Proteins in A Particular Family
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If we had a file of protein family names with the amino acid length
of each protein in the family, we can use the script :ref:`cli::p3-stats` to
output the mean length as well as the minimum, count, maximum, and
standard deviation. The following pipe does the trick, using
global family PGF_00112374 as an example.

    ::

        p3-echo -t family PGF_00112374 | p3-get-family-features --ftype=global --attr aa_length | p3-stats --col=family feature.aa_length

    ::

        family  count   average min max stdev
        PGF_00112374    3414    818.125659050967    31  901 193.491091039707

The :ref:`cli::p3-echo` command creates a one-line file with the family ID
in it. We use :ref:`cli::p3-get-family-features` to get all the features in
this family. The ``--ftype=global`` parameter indicates that this is
a global protein family (there are also families of type *local* and
*figfam*). For each feature, we want the amino acid length. This
value is stored in the *aa\_length* attribute. Finally, we have
:ref:`cli::p3-stats`. The ``--col=family`` parameter tells us the input file
records are to be grouped by the content of the *family* column. The
positional ``feature.aa_length`` parameter tells us the numbers to
analyze can be found in the *aa\_length* column from the *feature*
record. The output tells us there are 3414 pegs in the family. The
average length is a little over 818 amino acids with a standard
deviation of well over 193. The total range is 31 amino acids to 901
amino acids.

List the Genome and Feature ID for Each Feature in a Protein Family
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following pipe does the trick, using
global family PGF_00112374 as an example.

    ::

        p3-echo -t family PGF_00112374 | p3-get-family-features --ftype=global --attr genome_id,genome_name,patric_id

    ::

        family  feature.genome_id       feature.genome_name     feature.patric_id
        PGF_00112374    1311.851        Streptococcus agalactiae strain AB-22   fig|1311.851.peg.1591
        PGF_00112374    1311.879        Streptococcus agalactiae strain BE-PW-162       fig|1311.879.peg.755
        PGF_00112374    1311.871        Streptococcus agalactiae strain CZ-NI-016       fig|1311.871.peg.1197
        PGF_00112374    1311.841        Streptococcus agalactiae strain AB-11   fig|1311.841.peg.728
        PGF_00112374    1311.903        Streptococcus agalactiae strain ES-PW-083       fig|1311.903.peg.1321
        PGF_00112374    1311.908        Streptococcus agalactiae strain GB-PW-024       fig|1311.908.peg.1397
        PGF_00112374    1311.960        Streptococcus agalactiae strain DE-PW-196       fig|1311.960.peg.1275
        PGF_00112374    1311.964        Streptococcus agalactiae strain IT-PW-086       fig|1311.964.peg.1518
        PGF_00112374    1311.965        Streptococcus agalactiae strain IT-PW-097       fig|1311.965.peg.1342
        PGF_00112374    1311.860        Streptococcus agalactiae strain AB-70   fig|1311.860.peg.746


Working with Features
---------------------

Find the Global Protein Family Containing a Particular Feature
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For fig|446170.310.peg.738:

    ::

        p3-echo -t patric_id "fig|46170.310.peg.738" | p3-get-feature-data --attr pgfam_id

There are a couple of important things here. We use the *pgfam\_id*
field to get the global protein family (*plfam\_id* would be used to
get the local protein family). Also, the feature ID is enclosed in
double quotes on the command line so that the vertical bar doesn't
confuse the command-line shell.

    ::

        patric_id feature.pgfam_id
        fig|46170.310.peg.738 PGF_00040464



Find the Function a Particular Feature implements
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The function is stored in the feature table's *product* attribute. We
will use fig|46160.310.peg.738 as an example.

    ::

        p3-echo -t patric_id "fig|46170.310.peg.738" | p3-get-feature-data --attr product

    ::

        patric_id      feature.product
        fig|46170.310.peg.738   Putative cysteine desulfurase, associated with tRNA 4-thiouridine synthase

Of course, you could ask this question of several features with a
single pipe.

    ::

        p3-echo -t patric_id "fig|46170.310.peg.738" "fig|1313.7001.peg.1189" "fig|66976.18.peg.131" | p3-get-feature-data --attr product

    ::

        patric_id   feature.product
        fig|46170.310.peg.738   Putative cysteine desulfurase, associated with tRNA 4-thiouridine synthase
        fig|1313.7001.peg.1189  IMP cyclohydrolase (EC 3.5.4.10) / Phosphoribosylaminoimidazolecarboxamide formyltransferase (EC 2.1.2.3)
        fig|66976.18.peg.131    hypothetical protein

The :ref:`cli::p3-echo` command uses the ``--title`` command-line option to
determine how many parameters to put on each output line. Since our
example has only one title, the output file has only a single
column, and it can be easily piped to :ref:`cli::p3-get-feature-data`.


Find a Feature from an Alternate Feature ID
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Features in BV-BRC are stored with four alternate IDs, all of which
are indexed for fast retrieval.

#. gene. The common gene name (e.g. ``ciaR``). Not all features will
   have a common gene ID
#. gene\_id. The gene number
#. refseq\_locus\_tag. The locus tag from REFSEQ

The command :ref:`cli::p3-find-features` is used to retrieve features based
on an alternate ID. The alternate IDs are piped in through the
standard input. Note that in some cases (e.g. the field ``gene``),
there may be a lot of features with the same ID. The following pipes
return the ID and functional assignment using alternate IDs.

.. code::

    p3-echo coaA | p3-find-features --attr patric_id,product gene

.. code::

    id  feature.patric_id   feature.product
    coaA    fig|996634.5.peg.916    Pantothenate kinase (EC 2.7.1.33)
    coaA    fig|944560.4.peg.377    Pantothenate kinase (EC 2.7.1.33)
    coaA    fig|992133.3.peg.4201   Pantothenate kinase (EC 2.7.1.33)
    coaA    fig|992141.3.peg.4166   Pantothenate kinase (EC 2.7.1.33)
    coaA    fig|992132.3.peg.4176   Pantothenate kinase (EC 2.7.1.33)
    coaA    fig|992136.3.peg.3951   Pantothenate kinase (EC 2.7.1.33)
    coaA    fig|992139.3.peg.4173   Pantothenate kinase (EC 2.7.1.33)
    coaA    fig|992131.3.peg.3905   Pantothenate kinase (EC 2.7.1.33)
    coaA    fig|992142.3.peg.3915   Pantothenate kinase (EC 2.7.1.33)
    coaA    fig|992137.3.peg.4122   Pantothenate kinase (EC 2.7.1.33)
    coaA    fig|992135.3.peg.3895   Pantothenate kinase (EC 2.7.1.33)
    coaA    fig|99287.12.peg.4355   Pantothenate kinase (EC 2.7.1.33)
    coaA    fig|996306.3.peg.645    Pantothenate kinase (EC 2.7.1.33)
    coaA    fig|992175.3.peg.3998   Pantothenate kinase (EC 2.7.1.33)
    coaA    fig|992179.3.peg.3888   Pantothenate kinase (EC 2.7.1.33)
    coaA    fig|992177.3.peg.4127   Pantothenate kinase (EC 2.7.1.33)
    coaA    fig|992178.3.peg.4122   Pantothenate kinase (EC 2.7.1.33)
    coaA    fig|992180.3.peg.4094   Pantothenate kinase (EC 2.7.1.33)
    coaA    fig|992172.3.peg.3873   Pantothenate kinase (EC 2.7.1.33)
    coaA    fig|992181.3.peg.3864   Pantothenate kinase (EC 2.7.1.33)

.. code::

    p3-echo 1029377 | p3-find-features --attr patric_id,product gene_id

.. code::

    id  feature.patric_id   feature.product
    1029377 fig|210007.7.peg.1009   Pantothenate kinase (EC 2.7.1.33)

.. code::

    id  feature.patric_id   feature.product
    24379558    fig|210007.7.peg.1009   Pantothenate kinase (EC 2.7.1.33)

.. code::

    p3-echo SMU.1126 | p3-find-features --attr patric_id,product refseq_locus_tag

.. code::

    id  feature.patric_id   feature.product
    SMU.1126    fig|210007.7.peg.1009   Pantothenate kinase (EC 2.7.1.33)

Given a Feature ID, Find the Amino Acid Sequence
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The amino acid sequence is in the attribute *aa\_sequence*. You use
:ref:`cli::p3-get-feature-data` to access it.

.. code::

    p3-echo "fig|210007.7.peg.1009" | p3-get-feature-data --attr aa_sequence

.. code::

    id  feature.aa_sequence
    fig|210007.7.peg.1009   MANEFINFEKISRKTWQHLHQESQPPLNENELNSIKSLNDRISIKDVTDIYLPLISLIQIYKKSQENLSFSKSIFLQKNISNRPFIIGVSGSVAVGKSTTSRLLQLLLARTFKDSSVELMTTDGFLYPNAVLSSRHMLNKKGFPESYDMERLLDFLDTIKNGQSAEIPVYSHEIYDIVPNKSQIIEVPDFLIIEGINVFQNPQNNRLYMSDFFDFSIYIDADSDYIENWYLERFATLLDLAKNDKQNYYNRFLKLGEKGALDFARDIWKDINLVNLEKYIEPTRSRAELILHKTKNHKIDEIYLKK

Find How many Genomes have an Identical Protein to a Given Feature
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The individual protein sequences are not indexed, but the BV-BRC
database contains an MD5 signature for each protein that is indexed,
in the feature attribute *aa\_sequence\_md5*. The following pipe
finds out how many times the protein sequence for
*fig\|210007.7.peg.1009* occurs in the database.

.. code::

    p3-echo "fig|210007.7.peg.1009" | p3-get-feature-data --attr aa_sequence_md5 | p3-find-features aa_sequence_md5 --count

.. code::

    id      feature.aa_sequence_md5 feature.count
    fig|210007.7.peg.1009   6400069a6f7f32515c3a584ade0588d0        150

The answer is 150, but that is not quite the question that was
asked. If the protein occurs more than once in a genome, then the
above count will be too high. To get the correct answer we need to
extract genome IDs and then count the number of distinct ones with
:ref:`cli::p3-count`.

.. code::

    p3-echo "fig|210007.7.peg.1009" | p3-get-feature-data --attr aa_sequence_md5 | p3-find-features aa_sequence_md5 --attr genome_id | p3-count genome_id

.. code::

    count
    149


Given a Feature ID, Find the Features in the Same Protein Family
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The family ID is in the *pgfam\_id* attribute, and we use
:ref:`cli::p3-get-family-features` with the ``--ftype=global`` to find the
other features.

.. code::

    p3-echo "fig|210007.7.peg.1009" | p3-get-feature-data --attr pgfam_id | p3-get-family-features --ne "patric_id,fig|210007.7" --ftype global --attr patric_id,genome_name,product

Note that we use the ``--ne`` operator to keep the original feature
from appearing in the output. Even so, the resulting file has over
67,000 results, the first few of which are shown below.

.. code::

    id  feature.pgfam_id    feature.patric_id   feature.genome_name feature.product
    fig|210007.7.peg.1009   PGF_00029921    fig|1341640.3.peg.2368  Yersinia sp. WP-930601  Pantothenate kinase (EC 2.7.1.33)
    fig|210007.7.peg.1009   PGF_00029921    fig|1341642.3.peg.3368  Yersinia sp. WP-931205  Pantothenate kinase (EC 2.7.1.33)
    fig|210007.7.peg.1009   PGF_00029921    fig|1344012.3.peg.2066  Tatumella sp. NML 06-3099   Pantothenate kinase (EC 2.7.1.33)
    fig|210007.7.peg.1009   PGF_00029921    fig|984229.3.peg.2006   Salmonella enterica subsp. enterica serovar Enteritidis str. 653049 13-19   Pantothenate kinase (EC 2.7.1.33)
    fig|210007.7.peg.1009   PGF_00029921    fig|984228.3.peg.4305   Salmonella enterica subsp. enterica serovar Enteritidis str. 648905 5-18    Pantothenate kinase (EC 2.7.1.33)
    fig|210007.7.peg.1009   PGF_00029921    fig|984226.3.peg.4289   Salmonella enterica subsp. enterica serovar Enteritidis str. 648903 1-6 Pantothenate kinase (EC 2.7.1.33)
    fig|210007.7.peg.1009   PGF_00029921    fig|984227.3.peg.3102   Salmonella enterica subsp. enterica serovar Enteritidis str. 648904 3-6 Pantothenate kinase (EC 2.7.1.33)
    fig|210007.7.peg.1009   PGF_00029921    fig|984224.3.peg.642    Salmonella enterica subsp. enterica serovar Enteritidis str. 648901 39-2    Pantothenate kinase (EC 2.7.1.33)
    fig|210007.7.peg.1009   PGF_00029921    fig|984225.3.peg.4221   Salmonella enterica subsp. enterica serovar Enteritidis str. 648902 6-8 Pantothenate kinase (EC 2.7.1.33)

Alternatively, you can use local protein families (*plfam\_id* for
the field name, and ``--ftype=local`` for the family type). This
will restrict the output to features for genomes in the same genus.

.. code::

    p3-echo "fig|210007.7.peg.1009" | p3-get-feature-data --attr plfam_id | p3-get-family-features --ne "patric_id,fig|210007.7" --ftype local --attr patric_id,genome_name,product

.. code::

    id  feature.plfam_id    feature.patric_id   feature.genome_name feature.product
    fig|210007.7.peg.1009   PLF_1301_00006228   fig|1579339.3.peg.1420  Streptococcus sp. 449_SSPC  Pantothenate kinase (EC 2.7.1.33)
    fig|210007.7.peg.1009   PLF_1301_00006228   fig|511691.3.peg.905    Streptococcus mutans NN2025 Pantothenate kinase (EC 2.7.1.33)
    fig|210007.7.peg.1009   PLF_1301_00006228   fig|1404260.3.peg.1014  Streptococcus mutans PKUSS-LG01 Pantothenate kinase (EC 2.7.1.33)
    fig|210007.7.peg.1009   PLF_1301_00006228   fig|1403829.3.peg.1035  Streptococcus mutans PKUSS-HG01 Pantothenate kinase (EC 2.7.1.33)
    fig|210007.7.peg.1009   PLF_1301_00006228   fig|857136.3.peg.247    Streptococcus mutans A19    Pantothenate kinase (EC 2.7.1.33)
    fig|210007.7.peg.1009   PLF_1301_00006228   fig|857135.3.peg.392    Streptococcus mutans U138   Pantothenate kinase (EC 2.7.1.33)
    fig|210007.7.peg.1009   PLF_1301_00006228   fig|857134.3.peg.201    Streptococcus mutans G123   Pantothenate kinase (EC 2.7.1.33)
    fig|210007.7.peg.1009   PLF_1301_00006228   fig|857133.3.peg.623    Streptococcus mutans M21    Pantothenate kinase (EC 2.7.1.33)
    fig|210007.7.peg.1009   PLF_1301_00006228   fig|857132.3.peg.561    Streptococcus mutans T4 Pantothenate kinase (EC 2.7.1.33)
    fig|210007.7.peg.1009   PLF_1301_00006228   fig|857138.3.peg.734    Streptococcus mutans N29    Pantothenate kinase (EC 2.7.1.33)
    fig|210007.7.peg.1009   PLF_1301_00006228   fig|857137.3.peg.82 Streptococcus mutans NMT4863    Pantothenate kinase (EC 2.7.1.33)
    fig|210007.7.peg.1009   PLF_1301_00006228   fig|1313.8640.peg.2062  Streptococcus pneumoniae strain B16827  Pantothenate kinase (EC 2.7.1.33)

