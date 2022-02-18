.. _cli::p3-format-results:


#################
p3-format-results
#################

.. highlight:: perl


***************************************
Format Raw Data for Conversion to HTML.
***************************************



.. code-block:: perl

      p3-format-results -d DataDirectory > condensed Output


This tool takes as input an Output Directory created by p3-related-by-clusters.
It produces a condensed text for of the computed clusters.

These text-forms can be run through p3-clusters-to-html to get versions
that can be perused by a biologist.

Parameters
==========


There are no positional parameters.

Standard input is not used.

The additional command-line options are as follows.


d DataDirectory



q
 
 no STDOUT, output is in DataDirectory/labeled.
 



