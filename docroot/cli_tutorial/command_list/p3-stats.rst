.. _cli::p3-stats:


########
p3-stats
########

.. highlight:: perl


**************************************
Statistically Analyze Numerical Values
**************************************



.. code-block:: perl

     p3-stats.pl [options] statCol


This script divides the input into groups by the key column and analyzes the values found in a second column (specified by the
parameter). It outputs the mean, standard deviation, minimum, maximum, and count.

Parameters
==========


The positional parameter is the name of the column to be analyzed. It must contain only numbers.

The standard input can be overriddn using the options in :ref:`cli-input-options`.

Additional command-line options are those given in :ref:`cli-column-options` (to specify the key column).


