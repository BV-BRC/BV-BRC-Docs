Command Line Interface
==================================

`BV-BRC <https://www.bv-brc.org>`_ is an integration of different
types of data and software tools that support research on bacterial and viral
pathogens. The typical biologist seeking access to the BV-BRC data and
tools will usually explore the web-based user interface. However, there
are many instances in which programatic or command-line interfaces are
more suitable. For users that wish command-line access to BV-BRC, we
provide the tools described in this document. We call these tools the
*P3-scripts*. They are intended to run on your machine, going over the
network to access the services provided by BV-BRC.

Installing the CLI Release
--------------------------

Since the CLI tools run on your computer, to use them you will need to
download and install a software package in order to use them.

We currently have Windows, macOS and Debian/Ubuntu releases of the BV-BRC Command Line
Interface.

The releases are available at the `BV-BRC github
site <https://github.com/PATRIC3/PATRIC-distribution/releases>`_. Full installation
instructions are available in :ref:`cli-installation`.

Tutorials and Reference Documentation
-------------------------------------

In order to enable users to make the most of the BV-BRC command line interface
we have collected a number of tutorials and reference materials. This collection
is linked below.

.. toctree::
   :maxdepth: 1
   :caption: Tutorials:

   cli_installation
   cli_getting_started
   cli_services
   cli_common_tasks
   cli_clustering
   cli_signature_clusters

.. toctree::
   :maxdepth: 1
   :caption: Reference documentation:

   command_list/index

RAST Tutorials
--------------

We are also making available here a set of tutorials that relate to the RAST
and RASTtk projects. The RAST technology underlies the genome annotation
services provided by BV-BRC.

.. toctree::
    :maxdepth: 1
    :caption: RAST tutorials:

    rasttk_getting_started
    rasttk_incremental_commands
    rasttk_batch_mode
