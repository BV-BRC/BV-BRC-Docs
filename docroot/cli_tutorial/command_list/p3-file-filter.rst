.. _cli::p3-file-filter:


##############
p3-file-filter
##############


***********************************************
Filter a File Against Contents of a Second File
***********************************************



.. code-block:: perl

     p3-file-filter.pl [options] filterFile filterCol1 filterCol2 ...


Filter the standard input using the contents of a file. The output will contain only those rows in the input file whose key value
matches a value from the specified column of the specified filter file. To have the output contain only those rows in the input
file that do NOT match, use the \ ``--reverse``\  option. This is similar to :ref:`cli::p3-merge`, except that script operates on whole
lines instead of a set of key fields.

Parameters
==========


The positional parameters are the name of the filter file and the indices (1-based) or names of the key columns in the filter file.
If the latter parameter is absent, the value of the \ ``--col``\  parameter will be used (same name or index as the input file).

The standard input can be overridden using the options in :ref:`cli-input-options`.

Additional command-line options are the following.


- reverse
 
 Instead of only keeping input records that match a filter record, only keep records that do NOT match.
 


- col
 
 The name or index of the key column in the input file. If more than one value is specified, the columns are matched one-for-one
 with the corresponding filter file columns.
 


Example
-------


This command is shown in the tutorial p3-common-tasks.html;

p3-file-filter --reverse --col=feature.role aRoles.tbl feature.role &lt;cRoles.tbl

feature.role    count
2,3-dihydroxybenzoate-AMP ligase (EC 2.7.7.58) of siderophore biosynthesis  33
2-octaprenyl-3-methyl-6-methoxy-1,4-benzoquinol hydroxylase (EC 1.14.13.-)  1
2-pyrone-4,6-dicarboxylic acid hydrolase (EC 3.1.1.57)  14
23S ribosomal RNA rRNA prediction is too short  1
...



