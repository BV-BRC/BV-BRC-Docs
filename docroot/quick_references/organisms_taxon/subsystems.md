# Subsystems Protocol

Bacterial subsystems are co-curated sets of biologically related functional roles across a reference set of genomes. They are units of expert knowledge about a single biological process like a whole metabolic pathway (Glycolysis), or a piece of a pathway (L-2-amino-adipate to lysine module), the subunits of a multi-unit enzyme (Urease) or the pieces of a structural unit like the ribosome. While building a subsystem the curator becomes an expert in this process, studying the literature and encoding the variants of such processes that occur in the reference genomes. 

A very substantial cleanup of data can be achieved during this process, i.e. consistent spelling of functional roles (Biotin sulfoxide reductase vs. biotin sulfoxide reductase), better gene calls (clean up of start positions or omissions and mistakes introduced by the automatic ORF callers), and finally subsystems support the resolution of paralogous genes. As functionally coupled genes tend to cluster on the bacterial chromosome, the occurrence of paralogs in different chromosomal clusters allows for their disambiguation.
We distinguish between “active” and “likely” variants of the presence of a given subsystem in a given genome. A “likely” variant asserted to a genome within a subsystem means that one or more functional roles needed for a subsystem to be “active” are missing. It can point researchers to new, unknown biochemistry or can help with the prediction of candidates for “missing functions”. 

Note that not all functional roles are always needed for a functional variant of a subsystem. Depending on a given genome one specific functional role or another can be present (non orthologous gene displacement). Another case are subsystems that represent a collection of similar functional roles for the purpose of disambiguation of paralogous genes.

The functional roles curated via subsystems are used in the construction of "Local" and "Global" Protein Families. We will periodically add new subsystems, compute new Local and Global families and project them to all bacterial genomes. Those updates will also be reflected in the bacterial annotation services to support proper functionality of associated comparative genomics tools.

## See also
  * [Subsystems Data](../organisms_taxon/subsystems_tab.html)
  * [Protein Families](../organisms_taxon/protein_families.html)

