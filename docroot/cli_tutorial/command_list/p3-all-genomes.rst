.. _cli::p3-all-genomes:


##############
p3-all-genomes
##############

.. highlight:: perl


****************************
Return All Genomes in BV-BRC
****************************



.. code-block:: perl

     p3-all-genomes [options]


This script returns the IDs of all the genomes in the BV-BRC database. It supports standard filtering
parameters and the specification of additional columns if desired.

Parameters
==========


There are no positional parameters.

The command-line options are those given in :ref:`cli-data-options` plus the following.


fields
 
 List the names of the available fields.
 


public
 
 Only include public genomes. If this option is NOT specified and you are logged in (via :ref:`cli::p3-login`), your own private
 genomes will also be included in the output.
 


private
 
 Only include private genomes. If this option is specified and you are not logged in, there will be no output. It is mutually
 exclusive with public.
 


You can peruse


.. code-block:: perl

      https://github.com/BV-BRC3/patric_solr/blob/master/genome/conf/schema.xml


to gain access to all of the supported fields.  There are quite a

few, so do not panic.  You can use something like


.. code-block:: perl

     p3-all-genomes -a genome_name -a genome_length -a contigs -a genome_status


to get some commonly sought fields.


