# Protein Family Sorter

## Overview
The Protein Family Sorter (PFS) allows users to select a set of genomes of interest and examine distribution of the superset of protein families across the genomes, commonly referred to as the “pan genome." The PFS provides various filtering options to quickly locate protein families that are conserved across all the genomes (“core genome”), conserved only in asubset of the selected genomes (“accessory genome”) or that match a specified function. A tabular view shows protein families matching filtering criteria and an interactive heatmap viewer provides a bird’s-eye (“pan genome”) view of the distribution of the protein families across multiple genomes, with clustering andanchoring functions to show relative conservation of synteny and identify areas of possible horizontal transfer. 

### See also
  * [Comparative Systems Service](https://www.bv-brc.org/app/ComparativeSystems)
  * [Comparative Systems Service Tutorial](../../tutorial/comparative_systems/comparative_systems.html)
  * [Protein Families]

## Accessing the Protein Family Sorter
The PFS can be accessed by clickging the **Families** icon at the top right of the results page from a [Comparative Systems Service](https://www.bv-brc.org/app/ComparativeSystems) analysis job.

![Families Icon](./images/protein_families_icon.png)

Results are presented in tabular and heatmap views, as described below.

### Tabular View

![Filter-Tabular View](./images/pfs_filter_table.png)

**Dynamic Filter Panel**

![Filter Panel](./images/pfs_filter_panel.png)

The dynamic filter on the left side panel allows inclusion or exclusion of genomes based on their presence or absence in the pan genome protein families. 

The first option selects between **genus-specific families (PLFams)** and **cross-genus families (PGFams)**.

Next, options are provided for limiting families to those with the following critieria:

* *Present* in all families
* *Absent* in all families
* *Either/mixed*

All of the options result in immediate updates the table of Protein Families in the right-hand panel.

Filter options are also provided for filtering by keyword, Protein Family membership (*Perfect*, *Non-perfect*, *All*) and specification of a numeric range of *Proteins per Family* and *Genomes per Family*.

For these options, clicking the **Filter** button applies these filter options to the table of protein families in the right-hand panel. The **Reset** button clears all of the keyword, Family Membership, and numeric range filters.  

**Protein Family Table**

![Table View](./images/pfs_table.png)

In the Tabular View, the right panel displays a list of the protein families based on the criteria specified in the left-hand filter panel. Fields (columns) in the table include the following:

* **ID**: BV-BRC identifier for the protein family
* **Proteins**: Number of proteins in the protein family   
* **Genomes**: Number of genomes containing proteins in the protein family  
* **Description**: Functional description of the proteins in the family  
* **Min AA Length**: Length (number of amino acids) of shortest protein in the family  
* **Max AA Length**: Length (number of amino acids) of longest protein in the family
* **Mean**: Average length of proteins in the family
* **Std Dev**: Standard deviation of lengths of proteins in the family. 


### Heatmap View
![](./images/)

## Features and Functionality

The visualization has 3 main components:
  1. 
  2. 
  3. 