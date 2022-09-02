.. _cli::P3Utils:


#######
P3Utils
#######


***********************
PATRIC Script Utilities
***********************


This module contains shared utilities for PATRIC 3 scripts.

Constants
=========


These constants define the sort-of ER model for PATRIC.

OBJECTS
-------


Mapping from user-friendly names to PATRIC names.


FIELDS
------


Mapping from user-friendly object names to default fields.


IDCOL
-----


Mapping from user-friendly object names to ID column names.


DERIVED
-------


Mapping from objects to derived fields. For each derived field name we have a list reference consisting of the function name followed by a list of the
constituent fields.


RELATED
-------


Mapping from objects to fields in related records. For each related field we have a list reference consisting of the key field name, the
target table, the target table key, and the target field.



Methods
=======


data_options
------------



.. code-block:: perl

     my @opts = P3Utils::data_options();


This method returns a list of the `Getopt::Long::Descriptive <Getopt::Long::Descriptive>`_ specifications for the common data retrieval
options. These options include `/delim_options </delim_options>`_ plus the following.


- attr
 
 Names of the fields to return. Multiple field names may be specified by coding the option multiple times or
 separating the field names with commas.  Mutually exclusive with \ ``--count``\ .
 


- count
 
 If specified, a count of records found will be returned instead of the records themselves. Mutually exclusive with \ ``--attr``\ .
 


- equal
 
 Equality constraints of the form \ *field-name*\ \ ``,``\ \ *value*\ . If the field is numeric, the constraint will be an
 exact match. If the field is a string, the constraint will be a substring match. An asterisk in string values
 is interpreted as a wild card. Multiple equality constraints may be specified by coding the option multiple
 times.
 


- lt, le, gt, ge, ne
 
 Inequality constraints of the form \ *field-name*\ \ ``,``\ \ *value*\ . Multiple constrains of each type may be specified
 by coding the option multiple times.
 


- in
 
 Multi-valued equality constraints of the form \ *field-name*\ \ ``,``\ \ *value1*\ \ ``,``\ \ *value2*\ \ ``,``\ \ *...*\ \ ``,``\ \ *valueN*\ .
 The constraint is satisfied if the field value matches any one of the specified constraint values. Multiple
 constraints may be specified by coding the option multiple times.
 


- required
 
 Specifies the name of a field that must have a value for the record to be included in the output. Multiple
 fields may be specified by coding the option multiple times.
 


- keyword
 
 Specifies a keyword or phrase (in quotes) that should be included in any field of the output. This performs a
 text search against entire records.
 


- debug
 
 Display debugging information on STDERR.
 



col_options
-----------



.. code-block:: perl

     my @opts = P3Utils::col_options($batchSize);


This method returns a list of the `Getopt::Long::Descriptive <Getopt::Long::Descriptive>`_ specifications for the common column specification
options. These options are as follows.


- col
 
 Index (1-based) of the column number to contain the key field. If a non-numeric value is specified, it is presumed
 to be the value of the header in the desired column. The default is \ ``0``\ , which indicates the last column.
 


- batchSize
 
 Maximum number of lines to read in a batch. The default is \ ``100``\ .
 


- nohead
 
 Input file has no headers.
 


The method takes as a parameter a default batch size to override the normal
default of 100.


delim_options
-------------



.. code-block:: perl

     my @options = P3Utils::delim_options();


This method returns a list of options related to delimiter specification for multi-valued fields.


- delim
 
 The delimiter to use between object names. The default is \ ``::``\ . Specify \ ``tab``\  for tab-delimited output, \ ``space``\  for
 space-delimited output, \ ``semi``\  for a semicolon followed by a space, or \ ``comma``\  for comma-delimited output.
 Other values might have unexpected results.
 



delim
-----



.. code-block:: perl

     my $delim = P3Utils::delim($opt);


Return the delimiter to use between the elements of multi-valued fields.


- opt
 
 A `Getopts::Long::Descriptive::Opts <Getopts::Long::Descriptive::Opts>`_ object containing the delimiter specification.
 



undelim
-------



.. code-block:: perl

     my $undelim = P3Utils::undelim($opt);


Return the pattern to use to split the elements of multi-valued fields.


- opt
 
 A `Getopts::Long::Descriptive::Opts <Getopts::Long::Descriptive::Opts>`_ object containing the delimiter specification.
 



get_couplets
------------



.. code-block:: perl

     my $couplets = P3Utils::get_couplets($ih, $colNum, $opt);


Read a chunk of data from a tab-delimited input file and return couplets. A couplet is a 2-tuple consisting of a
key column followed by a reference to a list containing all the columns. The maximum number of couplets returned
is determined by the batch size. If the input file is empty, an undefined value will be returned.


- ih
 
 Open input file handle for the tab-delimited input file.
 


- colNum
 
 Index of the key column.
 


- opt
 
 A `Getopts::Long::Descriptive::Opts <Getopts::Long::Descriptive::Opts>`_ object containing the batch size specification.
 


- RETURN
 
 Returns a reference to a list of couplets.
 



get_col
-------



.. code-block:: perl

     my $column = P3Utils::get_col($ih, $colNum);


Read an entire column of data from a tab-delimited input file.


- ih
 
 Open input file handle for the tab-delimited input file, positioned after the headers.
 


- colNum
 
 Index of the key column.
 


- RETURN
 
 Returns a reference to a list of column values.
 



process_headers
---------------



.. code-block:: perl

     my ($outHeaders, $keyCol) = P3Utils::process_headers($ih, $opt, $keyless);


Read the header line from a tab-delimited input, format the output headers and compute the index of the key column.


- ih
 
 Open input file handle.
 


- opt
 
 Should be a `Getopts::Long::Descriptive::Opts <Getopts::Long::Descriptive::Opts>`_ object containing the specifications for the key
 column or a string containing the key column name. At a minimum, it must support the \ ``nohead``\  option.
 


- keyless (optional)
 
 If TRUE, then it is presumed there is no key column.
 


- RETURN
 
 Returns a two-element list consisting of a reference to a list of the header values and the 0-based index of the key
 column. If there is no key column, the second element of the list will be undefined.
 



find_column
-----------



.. code-block:: perl

     my $keyCol = P3Utils::find_column($col, \@headers, $optional);


Determine the correct (0-based) index of the key column in a file from a column specifier and the headers.
The column specifier can be a 1-based index or the name of a header.


- col
 
 Incoming column specifier.
 


- headers
 
 Reference to a list of column header names.
 


- optional (optional)
 
 If TRUE, then failure to find the header is not an error.
 


- RETURN
 
 Returns the 0-based index of the key column or \ ``undef``\  if the header was not found.
 



form_filter
-----------



.. code-block:: perl

     my $filterList = P3Utils::form_filter($opt);


Compute the filter list for the specified options.


- opt
 
 A `Getopt::Long::Descriptive::Opts <Getopt::Long::Descriptive::Opts>`_ object containing the command-line options that constrain the query (\ ``--equal``\ , \ ``--in``\ ).
 


- RETURN
 
 Returns a reference to a list of filter specifications for a call to `P3DataAPI/query <P3DataAPI/query>`_.
 



select_clause
-------------



.. code-block:: perl

     my ($selectList, $newHeaders) = P3Utils::select_clause($p3, $object, $opt, $idFlag, \@default);


Determine the list of fields to be returned for the current query. If an \ ``--attr``\  option is present, its
listed fields are used. Otherwise, a default list is used.


- p3
 
 The :ref:`cli::P3DataAPI` object used to access PATRIC.
 


- object
 
 Name of the object being retrieved-- \ ``genome``\ , \ ``feature``\ , \ ``protein_family``\ , or \ ``genome_drug``\ .
 


- opt
 
 `Getopt::Long::Descriptive::Opts <Getopt::Long::Descriptive::Opts>`_ object for the command-line options, including the \ ``--attr``\  option.
 


- idFlag
 
 If TRUE, then only the ID column will be specified if no attributes are explicitly specified. and if attributes are
 explicitly specified, the ID column will be added if it is not present.
 


- default
 
 If specified, must be a reference to a list of field names.  The named fields will be returned if no \ ``--attr``\  option
 is passed in.  This overrides the normal default fields.
 


- RETURN
 
 Returns a two-element list consisting of a reference to a list of the names of the
 fields to retrieve, and a reference to a list of the proposed headers for the new columns. If the user wants a
 count, the first element will be undefined, and the second will be a singleton list of \ ``count``\ .
 



clean_value
-----------



.. code-block:: perl

     my $cleaned = P3Utils::clean_value($value);


Clean up a value for use in a filter specification.


- value
 
 Value to clean up. Cleaning involves removing parentheses, illegal characters, and leading and
 trailing spaces.
 


- RETURN
 
 Returns a usable version of the incoming value.
 



get_data
--------



.. code-block:: perl

     my $resultList = P3Utils::get_data($p3, $object, \@filter, \@cols, $fieldName, \@couplets);


Return all of the indicated fields for the indicated entity (object) with the specified constraints.
It should be noted that this method is simply a less-general interface to `P3DataAPI/query <P3DataAPI/query>`_ that handles standard
command-line script options for filtering.


- p3
 
 :ref:`cli::P3DataAPI` object for accessing the database.
 


- object
 
 User-friendly name of the PATRIC object whose data is desired (e.g. \ ``genome``\ , \ ``genome_feature``\ ).
 


- filter
 
 Reference to a list of filter clauses for the query.
 


- cols
 
 Reference to a list of the names of the fields to return from the object, or \ ``undef``\  if a count is desired.
 


- fieldName (optional)
 
 The name of the field in the specified object that is to be used as the key field. If an all-objects query is desired, then
 this parameter should be omitted.
 


- couplets (optional)
 
 A reference to a list of 2-tuples, each tuple consisting of a key value followed by a reference to a list of the values
 from the input row containing that key value.
 


- RETURN
 
 Returns a reference to a list of tuples containing the data returned by PATRIC, each output row appended to the appropriate input
 row from the couplets.
 



get_data_batch
--------------



.. code-block:: perl

     my $resultList = P3Utils::get_data_batch($p3, $object, \@filter, \@cols, \@couplets, $keyField);


Return all of the indicated fields for the indicated entity (object) with the specified constraints.
This version differs from `/get_data </get_data>`_ in that the couplet keys are matched to a true key field (the
matches are exact).


- p3
 
 :ref:`cli::P3DataAPI` object for accessing the database.
 


- object
 
 User-friendly name of the PATRIC object whose data is desired (e.g. \ ``genome``\ , \ ``feature``\ ).
 


- filter
 
 Reference to a list of filter clauses for the query.
 


- cols
 
 Reference to a list of the names of the fields to return from the object, or \ ``undef``\  if a count is desired.
 


- couplets
 
 A reference to a list of 2-tuples, each tuple consisting of a key value followed by a reference to a list of the values
 from the input row containing that key value.
 


- keyfield (optional)
 
 The key field to use. If omitted, the object's ID field is used.
 


- RETURN
 
 Returns a reference to a list of tuples containing the data returned by PATRIC, each output row appended to the appropriate input
 row from the couplets.
 



get_data_keyed
--------------



.. code-block:: perl

     my $resultList = P3Utils::get_data_keyed($p3, $object, \@filter, \@cols, \@keys, $keyField);


Return all of the indicated fields for the indicated entity (object) with the specified constraints.
The query is by key, and the keys are split into batches to prevent PATRIC from overloading.


- p3
 
 :ref:`cli::P3DataAPI` object for accessing the database.
 


- object
 
 User-friendly name of the PATRIC object whose data is desired (e.g. \ ``genome``\ , \ ``feature``\ ).
 


- filter
 
 Reference to a list of filter clauses for the query.
 


- cols
 
 Reference to a list of the names of the fields to return from the object, or \ ``undef``\  if a count is desired.
 


- keys
 
 A reference to a list of key values.
 


- keyfield (optional)
 
 The key field to use. If omitted, the object's ID field is used.
 


- RETURN
 
 Returns a reference to a list of tuples containing the data returned by PATRIC.
 



script_opts
-----------



.. code-block:: perl

     my $opt = P3Utils::script_opts($parmComment, @options);


Process the command-line options for a P3 script. This method automatically handles the \ ``--help``\  option.


- parmComment
 
 A string indicating the command's signature for the positional parameters. Used for the help display.
 


- options
 
 A list of options such as are expected by `Getopt::Long::Descriptive <Getopt::Long::Descriptive>`_.
 


- RETURN
 
 Returns the options object. Every command-line option's value may be retrieved using a method
 on this object.
 
 If invoked in array context, returns the options object, usage object pair so that
 the calling code may emit detailed usage messages if needed.
 



print_cols
----------



.. code-block:: perl

     P3Utils::print_cols(\@cols, %options);


Print a tab-delimited output row.


- cols
 
 Reference to a list of the values to appear in the output row.
 


- options
 
 A hash of options, including zero or more of the following.
 
 
 - oh
  
  Open file handle for the output stream. The default is \\*STDOUT.
  
 
 
 - opt
  
  A `Getopt::Long::Descriptive::Opts <Getopt::Long::Descriptive::Opts>`_ object containing the delimiter option, for computing the delimiter in multi-valued fields.
  
 
 
 - delim
  
  The delimiter to use in multi-valued fields (overrides \ ``opt``\ ). The default, if neither this nor \ ``opt``\  is specified, is a comma (\ ``,``\ ).
  
 
 



ih
--



.. code-block:: perl

     my $ih = P3Utils::ih($opt);


Get the input file handle from the options. If no input file is specified in the options,
opens the standard input.


- opt
 
 `Getopt::Long::Descriptive::Opts <Getopt::Long::Descriptive::Opts>`_ object for the current command-line options.
 


- RETURN
 
 Returns an open file handle for the script input.
 



ih_options
----------



.. code-block:: perl

     my @opt_specs = P3Utils::ih_options();


These are the command-line options for specifying a standard input file.


- input
 
 Name of the main input file. If omitted and an input file is required, the standard
 input is used.
 



oh
--



.. code-block:: perl

     my $oh = P3Utils::oh($opt);


Get the output file handle from the options. If no output file is specified in the options,
opens the standard output.


- opt
 
 `Getopt::Long::Descriptive::Opts <Getopt::Long::Descriptive::Opts>`_ object for the current command-line options.
 


- RETURN
 
 Returns an open file handle for the script output.
 



oh_options
----------



.. code-block:: perl

     my @opt_specs = P3Utils::oh_options();


These are the command-line options for specifying a standard output file.


- output
 
 Name of the main output file. If omitted and an input file is required, the standard
 output is used.
 



match
-----



.. code-block:: perl

     my $flag = P3Utils::match($pattern, $key, %options);


Test a match pattern against a key value and return \ ``1``\  if there is a match and \ ``0``\  otherwise.
If the key is numeric, a numeric equality match is performed. If the key is non-numeric, then
we have a match if any subsequence of the words in the key is equal to the pattern (case-insensitive).
The goal here is to more or less replicate the SOLR \ **eq**\  operator.


- pattern
 
 The pattern to be matched.  If \ ``undef``\ , then any nonblank key matches.
 


- key
 
 The value against which to match the pattern.
 


- options
 
 Zero or more of the following keys, which modify the match.
 
 
 - exact
  
  If TRUE, then non-numeric matches are exact.
  
 
 


- RETURN
 
 Returns \ ``1``\  if there is a match, else \ ``0``\ .
 



protein_fasta
-------------



.. code-block:: perl

     P3Utils::protein_fasta($p3, $genome, $fileName);


Create a FASTA file for the proteins in a genome.


- p3
 
 A :ref:`cli::P3DataAPI` object for downloading from PATRIC.
 


- genome
 
 The ID of the genome whose proteins are desired.
 


- fileName
 
 The name of a file to contain the FASTA data, or an open output file handle to which the data should be written.
 



find_headers
------------



.. code-block:: perl

     my (\@headers, \@cols) = P3Utils::find_headers($ih, $fileType => @fields);


Search the headers of the specified input file for the named fields and return the list of headers plus a list of
the column indices for the named fields.


- ih
 
 Open input file handle, or a reference to a list of headers.
 


- fileType
 
 Name to give the input file in error messages.
 


- fields
 
 A list of field names for the desired columns.
 


- RETURN
 
 Returns a two-element list consisting of (0) a reference to a list of the headers from the input file and
 (1) a reference to a list of column indices for the desired columns of the input, in order.
 



get_cols
--------



.. code-block:: perl

     my @values = P3Utils::get_cols($ih, $cols);


This method returns all the values in the specified columns of the next line of the input file, in order. It is meant to be used
as a companion to `/find_headers </find_headers>`_. A list reference can be used in place of an open file handle, in which case the columns will
be used to index into the list.


- ih
 
 Open input file handle, or alternatively a list reference.
 


- cols
 
 Reference to a list of column indices.
 


- RETURN
 
 Returns a list containing the fields in the specified columns, in order.
 



get_fields
----------



.. code-block:: perl

     my @fields = P3Utils::get_fields($line);


Split a tab-delimited line into fields.


- line
 
 Input line to split, or an open file handle from which to get the next line.
 


- RETURN
 
 Returns a list of the fields in the line.
 



list_object_fields
------------------



.. code-block:: perl

     my $fieldList = P3Utils::list_object_fields($p3, $object);


Return the list of field names for an object. The database schema is queried directly.


- p3
 
 The :ref:`cli::P3DataAPI` object for accessing PATRIC.
 


- object
 
 The name of the object whose field names are desired.
 


- RETURN
 
 Returns a reference to a list of the field names.
 




Internal Methods
================


_process_entries
----------------



.. code-block:: perl

     P3Utils::_process_entries($p3, $object, \@retList, \@entries, \@row, \@cols, $id, $keyField);


Process the specified results from a PATRIC query and store them in the output list.


- p3
 
 The :ref:`cli::P3DataAPI` object for querying derived fields.
 


- object
 
 Name of the object queried.
 


- retList
 
 Reference to a list into which the output rows should be pushed.
 


- entries
 
 Reference to a list of query results from PATRIC.
 


- row
 
 Reference to a list of values to be prefixed to every output row.
 


- cols
 
 Reference to a list of the names of the columns to be put in the output row, or \ ``undef``\  if the user wants a count.
 


- id (optional)
 
 Name of an ID field that should not be zero or empty. This is used to filter out invalid records.
 


- keyField (optional)
 
 Name of an ID field whose value should be put at the beginning of every output row.
 



_related_field
--------------



.. code-block:: perl

     my $relatedMap = P3Utils::_related_field($p3, $linkField, $table, $tableKey, $dataField, $entries);


Extract the values for a related field from a list of entries produced by
a query. The link field value is taken from the entry and used to find a
record in a secondary table. The actual desired value for the related
field is taken from the data field in the secondary-table record having
the link field value as key. The return value is a hash mapping link
field values to a data values.


- p3
 
 The :ref:`cli::P3DataAPI` object used to query the database.
 


- linkField
 
 The name of the field in the incoming entries containing the key for the secondary table.
 


- table
 
 The name of the secondary table containing the actual values.  This is the real SOLR table name.
 


- tableKey
 
 The name of the key field to use in the secondary table to find the desired record(s).
 


- dataField
 
 The name of the field in the secondary table containing the actual values. This cannot be a derived or related field.
 


- entries
 
 A reference to a list of the results from the base query.  Each result is a hash keyed on field name.
 


- multi
 
 If TRUE, then the related field will return multiple values.
 


- RETURN
 
 Returns a reference to a hash mapping link field values to data field values.
 



_execute_query
--------------



.. code-block:: perl

     P3Utils::_execute_query($p3, $core, $keyField, $dataField, \@keys, \%retHash, $multi);


Execute a query to get the data values associated with a key. The mapping
from keys to data values is added to the specified hash.


- p3
 
 The :ref:`cli::P3DataAPI` object for accessing the database.
 


- core
 
 The real name of the table containing the data.
 


- keyField
 
 The real name of the table's key field.
 


- dataField
 
 The real name of the associated data field.
 


- keys
 
 A reference to a list of the keys whose data values are desired.
 


- multi
 
 If TRUE, then the related field will return multiple values.
 


- retHash
 
 A reference to a hash into which results should be placed.
 



_apply
------



.. code-block:: perl

     my $result = _apply($function, @values);


Apply a computational function to values to produce a computed field value.


- function
 
 Name of the function.
 
 
 - altName
  
  Pass the input value back unmodified.
  
 
 
 - concatSemi
  
  Concatenate the sub-values using a semi-colon/space separator.
  
 
 
 - md5
  
  Compute an MD5 for a DNA or protein sequence.
  
 
 


- values
 
 List of the input values.
 


- RETURN
 
 Returns the computed result.
 



_ec_parse
---------



.. code-block:: perl

     my @ecNums = P3Utils::_ec_parse($product);


Parse the EC numbers out of the functional assignment string of a feature.


- product
 
 The functional assignment string containing the EC numbers.
 


- RETURN
 
 Returns a list of EC numbers.
 



_select_list
------------



.. code-block:: perl

     my $fieldList = _select_list($object, $cols);


Compute the list of fields required to retrieve the specified columns. This includes the specified normal fields plus any derived fields.


- object
 
 Name of the object being retrieved.
 


- cols
 
 Reference to a list of field names.
 


- RETURN
 
 Returns a reference to a list of field names to retrieve.
 




