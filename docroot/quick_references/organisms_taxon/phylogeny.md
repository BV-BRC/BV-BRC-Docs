# Phylogeny

## Overview
The Phylogeny Tab and Phylogenetic Tree Viewer allow you to visualize and interact with genome trees. This tab is currently only displayed for bacterial genomes.

## See also
* [Phylogenetic Tree Service](https://bv-brc.org/app/PhylogeneticTree)
* [Phylogenetic Tree Service Tutorial](/tutorial/phylogenetic_tree/phylogenetic_tree)
* [Phylogenetic Tree Service Quick Reference Guide](/quick_references/services/phylogenetic_tree_building_service)
* [Archaeopteryx.js Phylogenetic Tree Viewer Quick Reference Guide](/quick_references/services/archaeopteryx)


## Accessing Phylogenetic Trees 
Phylogenetic trees can be viewed by either of the following methods:

* **Clicking the Phylogeny Tab in a Taxon View:** Displays an interactive tree corresponding to the *order* in which the taxon or genome exists.

* **Launching the Phylogenetic Tree Building Service:** Returns, among other files, a Newick file for the tree.  Clicking on the (tree) View button opens the tree in the Phylogenetic Tree Viewer.

### Phylogenetic Tree Viewer
![Phylogenetic Tree Viewer](../images/phylogeny_viewer_page2.png)

Phylogenetic trees in BV-BRC are rendered using Archaeopteryx.js (Zmasek and Eddy, 2001). By default, the trees are presented in a Phylogram view with genome names as node labels. Archaeopteryx provides controls for changing node labels, node appearance, alternate views, zooming, and others. A detailed description of all features and functionality is provided in the [Archaeopteryx.js Phylogenetic Tree Viewer Quick Reference Guide](/quick_references/services/archaeopteryx).  

## Phylogenetic Tree Construction
The trees are obtained by extracting subtrees from the global phylogenetic tree of bacteria provided by the Genome Taxonomy Database project (GTDB, https://gtdb.ecogenomic.org).
Version 214 of this tree (available at https://data.gtdb.ecogenomic.org/releases/) contains 80,789 genomes. The tree is built on a concatenated alignment of 120 conserved proteins using maximum likelihood described by (Parks et al., 2018) and here with additional methods described here: https://gtdb.ecogenomic.org/methods.

The python module DendroPy (https://dendropy.org/) was used to write to extract subtrees of the overall GTDB bacterial tree as described below. Of the 80789 genomes on the GTDB tree, 60746 could be matched to bacterial genomes in BVBRC by joining on the assembly accession field. This subset was drawn on for taxon trees. 

To extract a representative tree for a given NCBI taxon, we identified all BVBRC genomes classified as that taxon (using the NCBI taxonomy fields of the GTDB metadata table). Then we followed the path toward the root for all such genomes on the BVBRC subset of the GTDB tree to find where they converge, yielding the most recent common ancestor (mrca). We then extract all genomes descended from this mrca, which can include genomes not classified within the target taxon (due to the NCBI taxonomy being imperfectly phylogenetic). We consider displaying such deviations between taxonomy and phylogeny, however rare, to be useful. 

Because the number of genomes identified by this approach for a given taxon is frequently too large for convenient display, we impose an upper limit and filter out genomes to reach it, typically limiting to 40 genomes. For the filtering process, we eliminate tips in approximately the order of their branch lengths to the immediate ancestral node. This results in trees with fewer nearly identical tips and better representation of diversity.

To provide phylogenetic context for the taxon being illustrated, outgroups are selected from deeper nodes in the tree. For a selected number of nodes (typically 3) immediately ancestral to the mrca, a given number of descendant tips are selected (typically 2). This provides a reasonable chance of obtaining context to appreciate the ingroup taxon. The ingroup/outgroup identities are stored in the phyloxml format (Han and Zmasek, 2009) to allow them to be visualized in the Archaeopteryx.js tree viewer (Zmasek and Eddy, 2001).


1.	Parks, DH; Chuvochina, M; Waite, DW; Rinke, C; Skarshewski, A; Chaumeil, PA; Hugenholtz, P (November 2018). "A standardized bacterial taxonomy based on genome phylogeny substantially revises the tree of life". Nature Biotechnology. 36 (10): 996–1004. bioRxiv 10.1101/256800. doi:10.1038/nbt.4229. PMID 30148503. S2CID 52093100.

2.	Han, Mira V.; Zmasek, Christian M. (2009). "phyloXML: XML for evolutionary biology and comparative genomics". BMC Bioinformatics. United Kingdom: BioMed Central. 10: 356. doi:10.1186/1471-2105-10-356. PMC 2774328. PMID 19860910.
