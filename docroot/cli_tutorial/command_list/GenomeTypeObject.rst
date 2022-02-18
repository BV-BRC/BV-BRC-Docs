.. _cli::GenomeTypeObject:


################
GenomeTypeObject
################

.. highlight:: perl


****
NAME
****


GenomeTypeObject - a helper class for manipulating GenomeAnnotation service genome objects.


********
SYNOPSIS
********



.. code-block:: perl

   $obj = GenomeTypeObject->new()
 
   $obj = GenomeTypeObject->initialize($raw_genome_object)



***********
DESCRIPTION
***********


The \ ``GenomeTypeObject``\  class wraps a number of common operations to be performed
against the genome object as defined in the KBase GenomeAnnotation service.

To use the methods here it is sufficient to just bless the JSON object containing
the genome data into the GenomeTypeObject class, but it is more efficient to initialize
it using the initialize method:


.. code-block:: perl

   $obj = GenomeTypeObject->initialize($raw_json)


Doing this will create internal indexes on the feature and contig data structures
to accelerate access to individual data items.

Before using the genome object as a raw JSON object again, however, you must invoke
the \ ``prepare_for_return()``\  method which strips these indexes out of the data object.

$obj = GenomeTypeObject->new()
==============================


Create a new empty genome object.


$obj = GenomeTypeObject->create_from_file($filename)
====================================================


Load the given file, assumed to contain the JSON form of a genome object, and
return as a GenomeTypeObject instance.

The resulting object has not had the \ ``initialize``\  method invoked on it.


$obj->destroy_to_file($filename)
================================


Write the given object in JSON form to the specified file.
The object will be rendered unusable (i.e., unblessed)


$obj->set_metadata({ ... });
============================


Set the metadata fields on this genome object based on a metadata
object as defined in the GenomeAnnotation typespec:


.. code-block:: perl

  typedef structure
  {
   genome_id id;
   string scientific_name;
   string domain;
   int genetic_code;
   string source;
   string source_id;
   int ncbi_taxonomy_id;
   string taxonomy;
   string owner;
  } genome_metadata



$obj->add_contigs($contigs)
===========================


Add the given set of contigs to this genome object. \ ``$contigs``\  is a list of contig
objects, which we add to the genome object without further inspection.


$obj->add_features_from_list($features)
=======================================


Add the given features to the genome. Features here are instances of the compact_tuple type:


.. code-block:: perl

  typedef tuple <string id, string location, string feature_type, string function, string aliases> compact_feature;


used in the importation of features from an external source via a tab-separated text file.

We create an event for this import so that the source of the features so added is tracked.

Returns a hash mapping from the feature ID in the list to the allocated feature ID.


$obj->add_feature($params)
==========================


Add a new feature. The details of the feature are defined in the parameters hash. It has the following
keys:


-id
 
 Identifier for this feature. If not provided, a new identifier will be
 created based on the genome id, the type of the feature and the current largest identifier for
 that feature type.
 



$obj->write_protein_translations_to_file($filename)
===================================================


Write the protein translations to a FASTA file.


$obj->write_contigs_to_file($filename)
======================================


Write the contigs to a FASTA file.

metrics
-------



.. code-block:: perl

     my $metricHash = $gto->metrics();


Return a hash of metrics about this GTO. The metrics returned will include N50, N70, N90, total DNA length, and
probable completeness.


RETURN
 
 Returns a reference to a hash with the following keys.
 
 
 N50
  
  The N50 of the contig lengths (see /n_metric_).
  
 
 
 N70
  
  The N70 of the contig lengths.
  
 
 
 N90
  
  The N90 of the contig lengths.
  
 
 
 totlen
  
  The total DNA length.
  
 
 
 complete
  
  \ ``1``\  if the genome is mostly complete, else \ ``0``\ .

n_metric
--------



.. code-block:: perl

     my $length = $gto->n_metric($thresh);


Compute the N\ *XX*\  metric for the contig lengths, where \ *XX*\  is a percentage (usually 50, 70, or 90). A higher value
for the metric indicates a higher-quality assembly. The N70 metric is the length of the shortest contig in the set of
longest contigs comprising 70% of the total contig lengths. Similarly, the N50 metric is the length of the shortest contig
in the set of longest contigs comprising 50% of the total contig lengths.


thresh
 
 The threshold to use for the desired metric. For example, specify \ ``70``\  for an N70 metric.
 


RETURN
 
 Returns the length of the contig at the desired metric level.
 




