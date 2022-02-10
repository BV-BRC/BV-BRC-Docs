.. _cli::p3-generate-clusters:


####################
p3-generate-clusters
####################

.. highlight:: perl


*****************************************************
Generate Clusters From Pairs Using Transitive Closure
*****************************************************



.. code-block:: perl

     p3-generate-clusters.pl [options] col1 col2


This script reads in a tab-delimited file representing pairs of objects and generates a transitive closure to
create clusters.

The clusters will be output one per line, with a specified delimiter between elements. The default delimiter is \ ``::``\ ,
but you can specify a tab, a space, or any character sequence that doesn't appear in any element of the pair.

Parameters
==========


The positional parameters are the names or 1-based indices of the two columns containing the object names. So, an invocation of


.. code-block:: perl

     p3-generate_clusters 1 2


would indicate the first two columns contain the paired object names. An invocation of


.. code-block:: perl

     p3-generate-clusters role1 role2


would process the output from :ref:`cli::p3-generate-close-roles`.

The standard input can be overriddn using the options in :ref:`cli-input-options`. Use the options in :ref:`cli-delimiter-options` to
specify the delimiter.

Additional command-line options are as follows.


title
 
 Title to give to the output column. The default is <cluster>.
 



