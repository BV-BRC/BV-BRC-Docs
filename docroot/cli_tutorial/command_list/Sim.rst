.. _cli::Sim:


###
Sim
###

.. highlight:: perl


*****************
Similarity Object
*****************


Introduction
============


The similarity object provides access by name to the fields of a similarity
list. Unlike a standard object, the similarity object is stored as a list
reference, not a hash reference. The similarity fields are pulled from the
appropriate places in the list.

A blast takes a sequence called the \ *query*\  and matches it against a
\ *database*\ . When describing the data in a similarity, we will
refer repeatedly to the query sequence and the database sequence. Often,
the query and database sequences will be given by peg IDs. In some cases,
however, they will be contig IDs. In both cases, the match is represented
by an alignment between portions of the sequences. Gap characters may
be required to get the alignments to match, and the number of gaps is
part of the data in the similarity.


new
===



.. code-block:: perl

     my $sim = Sim->new(  @data );
     my $sim = Sim->new( \@data );


Create a similarity object from an array of fields.


data
 
 An array of data in fields:
 
 
 .. code-block:: perl
 
     0   id1        query sequence id
     1   id2        subject sequence id
     2   iden       percentage sequence identity
     3   ali_ln     alignment length
     4   mismatches  number of mismatch
     5   gaps       number of gaps
     6   b1         query seq match start
     7   e1         query seq match end
     8   b2         subject seq match start
     9   e2         subject seq match end
    10   psc        match e-value
    11   bsc        bit score
    12   ln1        query sequence length
    13   ln2        subject sequence length
    14   tool       tool used to produce similarities
 
 
 The following fields may vary by tool:
 
 
 .. code-block:: perl
 
    15   loc1       query seq locations string (b1-e1,b2-e2,b3-e3)
    16   loc2       subject seq locations string (b1-e1,b2-e2,b3-e3)
    17   dist       tree distance
 
 


RETURN
 
 Returns a similarity object that allows the values to be accessed by name.
 



new_from_hsp
============



.. code-block:: perl

     my $sim = Sim->new_from_hsp(  @hsp );
     my $sim = Sim->new_from_hsp( \@hsp );
     my $sim = Sim->new_from_hsp( \@hsp, $tool );


Create a similarity object from a gjoparseblast hsp.


hsp
 
 An array of data on a blast hsp as returned by gjoparseblast::blast_hsp_list()
 or gjoparseblast::next_blast_hsp().
 


RETURN
 
 Returns a similarity object that allows the values to be accessed by name.
 



as_string
=========



.. code-block:: perl

     my $simString = "$sim";


or


.. code-block:: perl

     my $simString = $sim->as_string;


Return the similarity as a descriptive string, consisting of the query peg,
the similar peg, and the match score.


new_from_line
=============



.. code-block:: perl

     my $sim = Sim->new_from_line($line);


Create a similarity object from a blast output line. The line is presumed to have
the complete list of similarity values in it, tab-separated.


line
 
 Input line, containing the similarity values in it delimited by tabs. A line terminator
 may be present at the end.
 


RETURN
 
 Returns a similarity object that allows the values to be accessed by name.
 



validate
========



.. code-block:: perl

     my $okFlag = $sim->validate();


Return TRUE if the similarity values are valid, else FALSE.


as_line
=======



.. code-block:: perl

     my $line = $sim->as_line;


Return the similarity as an output line. This is exactly the reverse of
/new_from_line_.


id1
===



.. code-block:: perl

     my $id = $sim->id1;


Return the ID of the query sequence that was blasted against the database.


id2
===



.. code-block:: perl

     my $id = $sim->id2;


Return the ID of the sequence in the database that matched the query sequence.


iden
====



.. code-block:: perl

     my $percent = $sim->iden;


Return the percentage identity between the query and database sequences.


ali_ln
======



.. code-block:: perl

     my $chars = $sim->ali_ln;


Return the length (in characters) of the alignment between the two similar sequences.


mismatches
==========



.. code-block:: perl

     my $count = $sim->mismatches;


Return the number of alignment positions that do not match.


gaps
====



.. code-block:: perl

     my $count = $sim->gaps;


Return the number of gaps required to align the sequences.


b1
==



.. code-block:: perl

     my $beginOffset = $sim->b1;


Return the position in the query sequence at which the alignment begins.


e1
==



.. code-block:: perl

     my $endOffset = $sim->e1;


Return the position in the query sequence at which the alignment ends.


b2
==



.. code-block:: perl

     my $beginOffset = $sim->b2;


Position in the database sequence at which the alignment begins.


e2
==



.. code-block:: perl

     my $endOffset = $sim->e2;


Return the position in the database sequence at which the alignment ends.


psc
===



.. code-block:: perl

     my $score = $sim->psc;


Return the similarity score as a floating-point number. The score is the computed
probability that the similarity is a result of random chance. A score of 0 indicates a
perfect match. A higher score indicates a less-perfect match. Values of \ ``1e-10``\  or
less are considered good matches.


bsc
===



.. code-block:: perl

     my $score = $sim->bsc;


Return the bit score for this similarity. The bit score is an estimate of the
search space required to find the similarity by chance. A higher bit score
indicates a better match.


bsc
===



.. code-block:: perl

     my $score = $sim->bit_score;


Return the bit score for this similarity. The bit score is an estimate of the
search space required to find the similarity by chance. A higher bit score
indicates a better match.


nbsc
====



.. code-block:: perl

     my $score = $sim->nbsc;


Return the normalized bit score for this similarity. This is the bit score
divided by the length of the matching sequence regions.  It is a better
summary of the overall sequence similarity than is the percentage identity.
Typically identical sequences have a value close to 2, and it goes down to
0 as the similarity decreases (values less than 0 are possible, but are never
significant and hence are never reported in a local similarity search).


ln1
===



.. code-block:: perl

     my $length = $sim->ln1;


Return the number of characters in the query sequence.


ln2
===



.. code-block:: perl

     my $length = $sim->ln2;


Return the length of the database sequence.


tool
====



.. code-block:: perl

     my $name = $sim->tool;


Return the name of the tool used to find this similarity.


usage
=====



.. code-block:: perl

     my $pod_as_text = Module::usage;
     my $pod_as_text = Module->usage;
     my $pod_as_text = Package->usage;
     my $pod_as_text = $object->usage;


Returns the module's pod documentation as text.


