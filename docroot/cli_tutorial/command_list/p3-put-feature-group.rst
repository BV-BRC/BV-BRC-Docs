.. _cli::p3-put-feature-group:


####################
p3-put-feature-group
####################

.. highlight:: perl


*********************************
Push ids to a Patric genome-group
*********************************



.. code-block:: perl

     p3-put-feature-group groupname [options] < feature-ids


Push ids to a Patric feature-group. The standard input should be a tab-delimited file containing feature IDs.
The standard input can be specified using :ref:`cli-input-options` and the input column using :ref:`cli-column-options`.
Specify \ ``--show-error``\  to get verbose error messages. The specified feature IDs will be replace whatever is in the
named group. If the group does not exist, it will be created.

