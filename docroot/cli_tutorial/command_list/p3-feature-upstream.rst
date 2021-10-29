.. _cli::p3-feature-upstream:


###################
p3-feature-upstream
###################


*************************
Find Upstream DNA Regions
*************************



.. code-block:: perl

     p3-feature-upstream.pl [options] parms


This script takes as input a file of feature IDs. For each feature, it appends the upstream region on the input record.
Use the \ ``--downstream``\ ) option to get the downstream regions instead.

Parameters
==========


There are no positional parameters.

The standard input can be overridden using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-column-options` plus the following.


- downstream
 
 Display downstream instead of upstream regions.
 


- length
 
 Specifies the length to display upstream. The default is \ ``100``\ .
 


- in
 
 Specifies the length to display inside the feature.  The default is \ ``0``\ , indicating none.
 


- verbose
 
 Show data API trace messages on STDERR.
 


Example
-------


This command is shown in the tutorial p3_common_tasks.html

p3-echo -t genome_id 1313.7001 | p3-get-genome-features --eq feature_type,CDS --attr patric_id --attr product | p3-feature-upstream --col=feature.patric_id

genome_id   feature.patric_id   feature.product upstream
1313.7001   fig|1313.7001.peg.1182  beta-glycosyl hydrolase ttgtcatctcctcttgactctcgttaatataagaaataaaataagggcgttgatttatataatcgctatcaatataacaatgcaatcaggaggttttgca
1313.7001   fig|1313.7001.peg.1189  IMP cyclohydrolase (EC 3.5.4.10) / Phosphoribosylaminoimidazolecarboxamide formyltransferase (EC 2.1.2.3)   gatcaatatcttaggtatgcttagccttggttttgcttatcttgttttactgttactgcatttaattggtgtttaactaatgattaaaaaggagaatata
...



