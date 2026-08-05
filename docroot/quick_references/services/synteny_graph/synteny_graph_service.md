# Pan-Synteny Graph Service

## Overview
The Pan-Synteny Graph Service accepts annotated genomes or contigs and constructs a topological graph representing the conserved genomic architecture and structural variation across a population. By tracking protein families (e.g., PGFams, PLfams) as k-mers, the algorithm establishes unique "anchors" to resolve complex biological events. This approach provides a reference-free whole-genome comparison, explicitly identifying translocations, mobile element insertions, paralog expansions, and assembly gaps. 

## See also
  * [Pan-Synteny Graph Service](https://bv-brc.org/app/PanSyntenyGraph)
  * [Pan-Synteny Graph Service Tutorial](/tutorial/pan_synteny/pan_synteny_graph)

## Using the Pan-Synteny Graph Service
The **Pan-Synteny Graph** submenu option under the **Services** main menu (Genomics category) opens the Pan-Synteny Graph input form. *Note: You must be logged into BV-BRC to use this service.*

![Pan-Synteny Graph Menu](../images/bv_services_menu.png)

## Options
![Pan-Synteny Graph Input Form](../images/pan_synteny_service_images/pan_synteny_input_form.png)

## Input Data
This service is designed to process groups of annotated genomes.

## Selected Genomes
Genomes placed here will be submitted to the service. You may select individual genomes or predefined Genome Groups from your BV-BRC workspace. 

## Parameters
The Pan-Synteny algorithm requires a few fundamental parameters to define how genomic conservation and variation are evaluated.

### Protein Family Type
The alphabet used to construct the graph. You can choose between **PGFams** (global cross-genus families), **PLfams** (local genus-specific families), or **FIGfams**.

### K-mer Size
The size of the continuous block of genes (k-mer) required to establish a syntenic neighborhood. The default is 3. Larger k-mers require longer stretches of perfect conservation to build the graph backbone.

### Minimum Sequence Support
The minimum number of genome sequences that must traverse a specific path for it to be included in the final graph output. The default is 1.

### Synteny Context
The tracking resolution used by the algorithm to evaluate structural conflicts:
*   **Genome:** (Default) Evaluates structural variations across the entire organism. Ideal for identifying plasmids, multi-replicon gene sharing, and whole-chromosome rearrangements.
*   **Contig:** Evaluates variations strictly within individual replicons. Ideal for studying purely intra-chromosomal events or circularization.
*   **Feature:** A purely topological A-Bruijn graph where all homologous genes collapse together, ignoring broader genomic context.

## Output Folder
The workspace folder where results will be placed.

## Output Name
Name used to uniquely identify results.

## Output Results
![Pan-Synteny Output Files](../images/pan_synteny_service_images/output_results.png)

The Pan-Synteny Graph Service generates visualization-ready graph files alongside several tabular reports that catalog the exact topological phenomena discovered in the population.

### All Jobs Will Output
* **ps_graph.gexf** - The primary graph file, formatted for viewing and layout in [Gephi](https://gephi.org/). Contains all rich metadata and boolean overlays.
* **ps_graph.gfa** - A Graphical Fragment Assembly (v1.1) file, ideal for viewing the linear path topology in tools like [Bandage](https://rrwick.github.io/Bandage/).
* **synteny_similarity.tsv** - A pairwise similarity matrix scoring genomes based on shared syntenic edges.
* **scaffold_recommendations.tsv** - A catalog of suggested connections to stitch together broken contigs based on population consensus.
* **mobilized_gene_families.tsv** - A catalog of gene families found distributed across multiple replicons or dispersed throughout the genome.
* **structural_variants.tsv** - A log of all specific edge junctions where the population diverges (insertions, translocations, etc.).
* **superbubbles.tsv** - A catalog of highly variable regions bounded by conserved core genes.

## Overall Concept: Graph Topology and Anchors

The Pan-Synteny graph is constructed using **Nodes** to represent unique protein families and **Edges** to represent physical adjacencies (genes sitting next to each other on a contig). 

The algorithm explores this graph using a "Thread-First Search." It identifies **Anchors**—unique, unambiguous blocks of genes—and pushes those structural signals through the graph. When different genomes present conflicting structural realities (or when the assembler fails), the algorithm dynamically resolves these topologies and tags the nodes and edges with specific biological classifications. 

The resulting topological phenomena are detailed below.

### Syntenic Blocks (Core Backbone)
![Syntenic Blocks](../images/pan_synteny_service_images/syntenic_blocks.png)

The algorithm calculates "momentum" along the heaviest paths in the graph to identify the **Core Backbone**. Nodes and edges that form a continuous, uninterrupted consensus across the majority of genomes are grouped into specific Blocks (e.g., `Block_1`, `Block_2`). Regions that fall below a minimum density threshold are isolated as `Fragment`. 

### Superbubbles (Variation Hotspots)
![Superbubbles](../images/pan_synteny_service_images/superbubbles.png)

A superbubble is a topologically bounded region where the graph diverges from a single "Entry" core gene into multiple different structural paths, before cleanly reconverging at a single "Exit" core gene. It isolates regions of high localized diversity bounded by strict synteny. 
*   *For example:* A capsular polysaccharide (cps) locus where different strains in the population swap entirely distinct cassettes of biosynthesis genes between the same two flanking housekeeping genes.
*   **Graph Attributes:** Tagged with the boolean overlay `variation_hotspot = True` and assigned a `superbubble_id`.

### Paralogs & Repeats (CNVs)
![Paralogs and Repeats](../images/pan_synteny_service_images/paralogs_repeats.png)

This encompasses any gene family that exists in multiple copies within a single genome. The algorithm handles these mathematically based on their genomic context:
*   **Repeat Ambiguity (Tandem Repeats):** When a genome possesses adjacent copies of a gene, the graph emits side-by-side nodes to prevent illogical topological loops. The edge routing between these nodes is an algorithmic artifact and is flagged as a `repeat_ambiguity_detour`.
*   **Fragmented Families (Dispersed/Multi-Replicon):** When a multi-copy gene is scattered across different contigs or replicons.
    *   *For example:* An antimicrobial resistance (AMR) gene that exists on both the main chromosome and a mobile plasmid within the same strain.
*   **Graph Attributes:** Paralog families share a `cnv_cluster_id`. Individual nodes are classified as `repeat_ambiguity` or flagged with `is_fragmented_family = True`. 

### Alternative Paths (Accessory Insertions)
![Alternative Paths](../images/pan_synteny_service_images/alternative_paths.png)

An alternative path is a contiguous sequence of genes that bypasses the consensus backbone. The algorithm uses "dominance shielding" to flag minority routes without disrupting the primary highway. 
*   *For example:* A prophage or genomic island that is present in only 10% of the population. The 10% take the alternative path, while the 90% take the direct consensus edge.
*   **Graph Attributes:** Internal nodes and edges are tagged with `alternative_path = True` and assigned an `alt_path_event_id`. The specific edges connecting the insertion to the backbone are classified as an `alt_path_junction`.

### Structural Rearrangements (Synteny Breakpoints)
![Structural Rearrangements](../images/pan_synteny_service_images/structural_rearrangements.png)

A true structural rearrangement occurs when the continuous anchors from the same genome actively contradict each other, forcing the algorithm to declare a severe structural clash. This verifies that an intact chromosome dramatically disagrees with the population's adjacent gene order.
*   *For example:* A major chromosomal arm swap resulting from non-allelic homologous recombination (NAHR), or a massive chimeric misassembly produced by the sequencing assembler.
*   **Graph Attributes:** The focal node is classified as a `synteny_breakpoint`. The edges reflecting the severed or novel linkages are tagged as a `breakpoint_junction` or `repeat_fragmentation_junction`.

### Inverted Blocks
![Inverted Blocks](../images/pan_synteny_service_images/inverted_blocks.png)

An inverted block represents a contiguous segment of genes that exists in both the forward orientation and the reverse-complement orientation in the population. The algorithm identifies this by tracking the bidirectional traversal of edges within a bounded subgraph.
*   *For example:* A 50-gene segment that reads `Gene 1 -> 2 -> 3` in Strain A, but is physically flipped to `Gene 3 -> 2 -> 1` in Strain B.
*   **Graph Attributes:** Edges involved in the inversion are tagged with the boolean `inverted_block = True`.

### Assembly Breaks & Scaffolds
![Assembly Breaks and Scaffolds](../images/pan_synteny_service_images/assembly_breaks.png)

The graph identifies technical artifacts where a genome sequence shattered due to assembler limitations, and utilizes the unbroken synteny of other genomes in the population to provide a bridge across the gap.
*   **Assembly Repeat Break:** A node where the terminal ends of two different contigs from the same genome collapse together, lacking the necessary anchors to separate them.
*   **Scaffolds:** When the algorithm discovers that an unbroken genome provides a perfect sequence bridge (either a direct edge or a multi-gene path) between two broken contigs of another genome. 
*   **Graph Attributes:** The shattered nodes are classified as `assembly_repeat_break`. The continuous nodes and edges that can be used to fix the break are tagged with the overlay `is_scaffold_path = True`.

## Action buttons

After selecting one of the output files by clicking it, a set of options becomes available in the vertical green Action Bar on the right side of the table. These include

* **Hide/Show:** Toggles (hides) the right-hand side Details Pane.
* **Guide** Link to the corresponding Quick Reference Guide.
* **Download:** Downloads the selected item.
* **View** Displays the content of the file, typically as plain text or rendered html, depending on filetype.
* **Delete** Deletes the file.
* **Rename** Allows renaming of the file.
* **Copy:** Copies the selected items to the clipboard.
* **Move** Allows moving of the file to another folder.

More details are available in the [Action Bar](/quick_references/action_bar) Quick Reference Guide.

## References
* Warren, A. S., Davis, J. J., Wattam, A. R., Machi, D., Setubal, J. C., & Heath, L. S. (2017). Panaconda: Application of pan-synteny graph models to genome content analysis. *bioRxiv*, 215988.
* Bastian M., Heymann S., Jacomy M. (2009). Gephi: an open source software for exploring and manipulating networks. *International AAAI Conference on Weblogs and Social Media*.
* Wick, R. R., Schultz, M. B., Zobel, J., & Holt, K. E. (2015). Bandage: interactive visualization of de novo genome assemblies. *Bioinformatics*, 31(20), 3350-3352.
