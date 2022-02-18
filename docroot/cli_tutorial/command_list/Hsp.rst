.. _cli::Hsp:


###
Hsp
###

.. highlight:: perl


********************************
High-scoring Segment Pair Object
********************************


Introduction
============


The HSP object provides access by name to the fields of a BLAST result.
Unlike a standard object, the similarity object is stored as a list
reference, not a hash reference. The HSP fields are pulled from the
appropriate places in the list.

A blast takes a sequence called the \ *query*\  and matches it against a
\ *database*\ . When describing the data in an HSP, we will
refer repeatedly to the query sequence and the database sequence. Often,
the query and database sequences will be given by peg IDs. In some cases,
however, they will be contig IDs. In both cases, the match is represented
by an alignment between portions of the sequences. Gap characters may
be required to get the alignments to match, and the number of gaps is
part of the data in the HSP.


new
===



.. code-block:: perl

     my $hsp = Hsp->new(  @data );
     my $hsp = Hsp->new( \@data );


Create an HSP object from an array of fields.


data
 
 An array of data in fields:
 
 
 .. code-block:: perl
 
     0   qid        query sequence id
     1   qdef       query sequence comment
     2   qlen       total query sequence length
     3   sid        subject sequence id
     4   sdef       subject sequence comment
     5   slen       total subject sequence length
     6   scr        match score
     7   e_val      match e-value (probability match is a coincidence)
     8   p_n        the p-number
     9   p_val      the Poisson value
    10   n_mat      match length
    11   n_id       identity count
    12   n_pos      positive count
    13   n_gap      gap count
    14   dir        frame direction or shift
    15   q1         start position of match in the query sequence
    16   q2         end position of match in the query sequence
    17   qseq       query alignment sequence
    18   s1         start position of match in the subject sequence
    19   s2         end position of match in the subject sequence
    20   sseq       subject alignment sequence
 
 


RETURN
 
 Returns an HSP object that allows the values to be accessed by name.
 


qid
---



.. code-block:: perl

     my $qid = $hsp->qid


Return the query sequence id.


qdef
----



.. code-block:: perl

     my $qdef = $hsp->qdef


Return the query sequence comment.


qlen
----



.. code-block:: perl

     my $qlen = $hsp->qlen


Return the total query sequence length.


sid
---



.. code-block:: perl

     my $sid = $hsp->sid


Return the subject sequence id.


sdef
----



.. code-block:: perl

     my $sdef = $hsp->sdef


Return the subject sequence comment.


slen
----



.. code-block:: perl

     my $slen = $hsp->slen


Return the total subject sequence length.


scr
---



.. code-block:: perl

     my $scr = $hsp->scr


Return the match score.


e_val
-----



.. code-block:: perl

     my $e_val = $hsp->e_val


Return the match e-value (probability match is a coincidence).


p_n
---



.. code-block:: perl

     my $p_n = $hsp->p_n


Return the the p-number.


p_val
-----



.. code-block:: perl

     my $p_val = $hsp->p_val


Return the the Poisson value.


n_mat
-----



.. code-block:: perl

     my $n_mat = $hsp->n_mat


Return the match length.


n_id
----



.. code-block:: perl

     my $n_id = $hsp->n_id


Return the identity count.


pct
---



.. code-block:: perl

     my $pct = $hsp->pct;


Return the percent identity.


n_pos
-----



.. code-block:: perl

     my $n_pos = $hsp->n_pos


Return the positive count.


n_gap
-----



.. code-block:: perl

     my $n_gap = $hsp->n_gap


Return the gap count.


dir
---



.. code-block:: perl

     my $dir = $hsp->dir


Return the frame direction or shift.


q1
--



.. code-block:: perl

     my $q1 = $hsp->q1


Return the start position of match in the query sequence.


q2
--



.. code-block:: perl

     my $q2 = $hsp->q2


Return the end position of match in the query sequence.


qseq
----



.. code-block:: perl

     my $qseq = $hsp->qseq


Return the query alignment sequence.


s1
--



.. code-block:: perl

     my $s1 = $hsp->s1


Return the start position of match in the subject sequence.


s2
--



.. code-block:: perl

     my $s2 = $hsp->s2


Return the end position of match in the subject sequence.


sseq
----



.. code-block:: perl

     my $sseq = $hsp->sseq


Return the subject alignment sequence.


sloc
----



.. code-block:: perl

     my $sloc = $hsp->sloc;


Return the match region of the subject sequence as a `BasicLocation <BasicLocation>`_ object.


qloc
----



.. code-block:: perl

     my $qloc = $hsp->qloc;


Return the match region of the query sequence as a `BasicLocation <BasicLocation>`_ object.



