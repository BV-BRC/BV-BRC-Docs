.. _cli::p3-put-genome-group:


###################
p3-put-genome-group
###################

.. highlight:: perl


*********************************
Push ids to a Patric genome-group
*********************************



.. code-block:: perl

     p3-put-genome-group groupname [options] < genome-ids


Push ids to a Patric genome-group. The standard input should be a tab-delimited file containing genome IDs.
The standard input can be specified using :ref:`cli-input-options` and the input column using :ref:`cli-column-options`.
Specify \ ``--show-error``\  to get verbose error messages. The specified genome IDs will be replace whatever is in the
named group. If the group does not exist, it will be created.

