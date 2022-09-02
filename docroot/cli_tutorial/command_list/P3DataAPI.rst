.. _cli::P3DataAPI:


#########
P3DataAPI
#########


set_raw
-------



.. code-block:: perl

     $d->set_raw($mode);


Turn raw mode on or off.  If raw mode is on, the incoming parameters are not url-encoded before submission.


- mode
 
 TRUE to turn on raw mode; FALSE to turn it off.
 



query
-----



.. code-block:: perl

     my @rows = $d->query($core, @query);


Run a query against the PATRIC database. Automatic flow control is used to reduce the possibility of timeout or overrun
errors.


- core
 
 The name of the PATRIC object to be queried.
 


- query
 
 A list of query specifications, consisting of zero or more tuples. The first element of each tuple is a specification type,
 which must be one of the following.
 
 
 - select
  
  Specifies a list of the names for the fields to be returned. There should only be one \ ``select``\  tuple. If none is present,
  all the fields will be returned.
  
 
 
 - eq
  
  Specifies a field name and matching value. This forms a constraint on the query. If the field is a string field, the
  constraint will be satisfied if the value matches a substring of the field value. If the field is a numeric field, the
  constraint will be satisfied if the value exactly matches the field value. In the string case, an interior asterisk can
  be used as a wild card.
  
 
 
 - in
  
  Specifies a field name and a string containing a comma-delimited list of matching values enclosed in parentheses. This forms
  a constraint on the query. It works much like \ ``eq``\ , except the constraint is satisfied if the field value matches any one of
  the specified values. This is the only way to introduce OR-like functionality into the query.
  
 
 
 - sort
  
  Specifies a list of field names, each prefixed by a \ ``+``\  or \ ``-``\ . The output will be sorted in the fashion indicated by
  the field names, ascending for \ ``+``\ , descending for \ ``-``\ .
  
 
 
 Note that parentheses must be manually removed from field values and special characters in the database are frequently
 ignored during string matches.
 


- RETURN
 
 Returns a list of tuples for the records matched, with one value per field.
 



query_cb
--------



.. code-block:: perl

     $d->query($core, $callback, @query);


Run a query against the PATRIC database. Automatic flow control is used to reduce the possibility of timeout or overrun
errors.

The callback provided is invoked for each chunk of data returned from the database.


- core
 
 The name of the PATRIC object to be queried.
 


- callback
 
 A code reference which will be invoked for each chunk of data returned from the database.
 
 The callback is invoked with two parameters: an array reference containing the data returned, and a
 hash reference containing the following metadata about the lookup:
 
 
 - start
  
  The starting index in the overall result set of the first item returned.
  
 
 
 - next
  
  The starting index for the next result set at the server.
  
 
 
 - count
  
  The number of items in the entire result set.
  
 
 
 - last_call
  
  A value which will be true if this invocation of the callback is the final one.
  
 
 
 The return value of the callback is used to determine if the query will continue to be executed.
 A true value will cause the next page of results to be requested; a false value will
 terminate the query, resulting in the query_cb call to return.
 


- query
 
 A list of query specifications, consisting of zero or more tuples. The first element of each tuple is a specification type,
 which must be one of the following.
 
 
 - select
  
  Specifies a list of the names for the fields to be returned. There should only be one \ ``select``\  tuple. If none is present,
  all the fields will be returned.
  
 
 
 - eq
  
  Specifies a field name and matching value. This forms a constraint on the query. If the field is a string field, the
  constraint will be satisfied if the value matches a substring of the field value. If the field is a numeric field, the
  constraint will be satisfied if the value exactly matches the field value. In the string case, an interior asterisk can
  be used as a wild card.
  
 
 
 - in
  
  Specifies a field name and a string containing a comma-delimited list of matching values enclosed in parentheses. This forms
  a constraint on the query. It works much like \ ``eq``\ , except the constraint is satisfied if the field value matches any one of
  the specified values. This is the only way to introduce OR-like functionality into the query.
  
 
 
 - sort
  
  Specifies a list of field names, each prefixed by a \ ``+``\  or \ ``-``\ . The output will be sorted in the fashion indicated by
  the field names, ascending for \ ``+``\ , descending for \ ``-``\ .
  
 
 
 Note that parentheses must be manually removed from field values and special characters in the database are frequently
 ignored during string matches.
 



\ **lookup_sequence_data**\ 
----------------------------


Given a list of MD5s, retrieve the corresponding sequence data.
Invoke the callback for each one.


\ **lookup_sequence_data_hash**\ 
---------------------------------


Like `lookup_sequence_data <lookup_sequence_data>`_ but return a hash mapping md5 => sequence data.


\ **retrieve_protein_features_in_genomes**\ 
--------------------------------------------


Looks up and returns all protein features from the genome.

Unique proteins by MD5 checksum are written to \ ``$fasta_file``\  and a mapping from
MD5 checksum to list of feature IDs is written to \ ``$id_map_file``\ .


compute_reference_pin
---------------------



.. code-block:: perl

     my @fids = $api->compute_reference_pin($focus_peg, $n_genomes, $distance_class)


Compute a pin for the given \ ``$focus_peg``\  from the PATRIC reference database.


- focus_peg
 
 The feature ID to pin from.
 


- pin_size
 
 Number of features to return in the pin.
 


- distribution_mode
 
 A string denoting the distribution of returned genomes based on their
 computed similarity. Values are "top", "spread_unique", "spread_proportional".
 



find_protein_in_genome_by_product
---------------------------------



.. code-block:: perl

     my $aa_seq = $d->find_protein_in_genome_by_product($genome_id, $product_name)


Look for a protein with the given product in the given genome.


get_pin
-------



.. code-block:: perl

     my $pin = $d->get_pin($fid, $family_type, $max_size, $genome_filter);



expand_fids_to_pin
------------------



.. code-block:: perl

     my $pin = $d->expand_fids_to_pin($fid_list);


Given a list of fids, expand with data from the API.


compute_pin_alignment
---------------------



.. code-block:: perl

     my $enhanced_pin = $d->compute_pin_alignment($pin, $n_genomes, $truncation_mechanism)


Given a basic pin, compute the BLAST similarities between the
first member and the rest, order the pin by the similarities, and
truncate to the desired size. The truncation mechanism may either be
'best_match' in which case the best N matches are kept, or 'stratify' in which
case N matches stratified through the list are kept.

Each element in $pin is a hash with the following keys:
    patric_id		Feature ID
    aa_sequence 	Amino acid sequence for the protein


get_taxon_metadata
------------------



.. code-block:: perl

   my $md = get_taxon_metadata($taxon_id)


Compute basic taxon metadat for a given \ ``$taxon_id``\ . Returns a hash
with keys \ ``domain``\ , \ ``taxon_name``\ , \ ``taxon_id``\ , \ ``genetic_code``\ , \ ``taxon_lineage``\ .


gto_of
------



.. code-block:: perl

     my $gto = $d->gto_of($genomeID);


Return a :ref:`cli::GenomeTypeObject` for the specified genome.


- genomeID
 
 ID of the source genome.
 


- RETURN
 
 Returns a blessed :ref:`cli::GenomeTypeObject` for the genome, or \ ``undef``\  if the genome was not found.
 



fasta_of
--------



.. code-block:: perl

     my $triples = $d->fasta_of($genomeID);


Return a set of contig triples for the specified genome. Each triple is [id, comment, sequence].


- genomeID
 
 ID of the source genome.
 


- RETURN
 
 Returns a reference to a list of 3-tuples, one per contig in the genome. Each tuple consists of (0) an ID, (1)
 an empty string (comment), and (2) the contig DNA sequence.
 



debug_on
--------



.. code-block:: perl

     $p3->debug_on($logH);


Turn on debugging to the specified log file.


- logH
 
 Open file handle for debug messages.
 



_log
----



.. code-block:: perl

     $p3->_log($message);


Write the specified message to the log file (if any). If there has been no prior call to `debug_on <debug_on>`_ nothing will happen.

