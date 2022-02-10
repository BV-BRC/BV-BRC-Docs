.. _cli-common-options:

=========================================
 Common Options to Command Line Programs
=========================================

The BV-BRC scripts accept a large number of options to control their action. 
There are a number of options that are common to many scripts. We describe these options here.

.. _cli-input-options:

Input Options
=============

The following option can be used to change where the input for the script is taken.

.. option:: --input

    Name of the main input file. If omitted and an input file is
    required, the standard input is used.

.. _cli-column-options:

Column Options
==============

The following options can be used to specify the column used for input data processing:

.. option:: --col

    Index (1-based) of the column number to contain the key field. If
    a non-numeric value is specified, it is presumed to be the value
    of the header in the desired column. This option is only present
    if the $colFlag parameter is TRUE. The default is 0, which
    indicates the last column.

.. option:: --batchSize

    Maximum number of lines to read in a batch. The default is 100. This option is only present if the $colFlag parameter is TRUE.

.. option:: --nohead

    Input file has no headers.

.. _cli-data-options:

Data Options
============

The following options can be used to specify data to be retrieved from lookup routines.

.. option:: --attr

    Names of the fields to return. Multiple field names may be
    specified by coding the option multiple times or separating the
    field names with commas. Mutually exclusive with --count.


.. option:: --count

    If specified, a count of records found will be returned instead of
    the records themselves. Mutually exclusive with --attr.


.. option:: --equal

    Equality constraints of the form field-name,value. If the field is
    numeric, the constraint will be an exact match. If the field is a
    string, the constraint will be a substring match. An asterisk in
    string values is interpreted as a wild card. Multiple equality
    constraints may be specified by coding the option multiple times.


.. option:: --lt
.. option:: --le
.. option:: --gt
.. option:: --ge
.. option:: --ne

    Inequality constraints of the form field-name,value. Multiple
    constrains of each type may be specified by coding the option
    multiple times.


.. option:: --in
    
    Multi-valued equality constraints of the form
    field-name,value1,value2,...,valueN. The constraint is satisfied
    if the field value matches any one of the specified constraint
    values. Multiple constraints may be specified by coding the option
    multiple times.

.. option:: --required

    Specifies the name of a field that must have a value for the
    record to be included in the output. Multiple fields may be
    specified by coding the option multiple times.


.. _cli-delimiter-options:

Delimiter Options
=================

The following option may be use to affect the delimiter used in
writing output columns.

.. option:: --delim

    The delimiter to use between object names. The default is
    ``::``. Specify ``tab`` for tab-delimited output, ``space`` for
    space-delimited output, ``semi`` for a semicolon followed by a space,
    or ``comma`` for comma-delimited output. Other values might have
    unexpected results.

