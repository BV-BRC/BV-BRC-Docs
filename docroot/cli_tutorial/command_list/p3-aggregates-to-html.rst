.. _cli::p3-aggregates-to-html:


#####################
p3-aggregates-to-html
#####################


************************************************************
Aggregates-to-html Produces readable summaries of Aggregates
************************************************************



.. code-block:: perl

      p3-aggregates-to-html < aggregated.clusters > readable.aggregates


This tool is part of a pipeline used to compute and display
signature clusters (clusters that characterize one subset of genomes
from another).

Parameters
==========


There are no positional parameters.

Standard input is not used.

Example
-------


This command is used in the tutorial "p3_signature_clusters.html ";


.. code-block:: perl

     p3-format-results -d Strep | p3-aggregates-to-html &gt;clusters.html




