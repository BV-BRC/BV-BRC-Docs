<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
  padding: 10px;
}
</style>

# IRD/ViPR to BV-BRC Terminology and Feature Mapping
## Guide for IRD/ViPR Users

BV-BRC integrates key IRD and ViPR viral data and tools with bacterial data and tools from PATRIC. The BV-BRC system is built on the PATRIC system infrastructure (database, services, and website). As a result, the interfaces for accessing and using data and tools differ substantially from IRD and ViPR. To aid researchers in making this transition, the table below provides a mapping of IRD and ViPR features to the corresponding BV-BRC features. Links to relevant BV-BRC help documentation are provided as well.

<table style="width:100%">
  <tr>
    <th>IRD/ViPR Feature</th>
    <th>BV-BRC Feature</th>
    <th>Documentation</th>
  </tr>
  <tr>
    <td><b>DATA SEARCHES</b></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>
      <a href="https://www.fludb.org/brc/search_landing.spg?decorator=influenza">Quick Search</a> (upper right)
    </td>
    <td><a href="https://beta.bv-brc.org/view/Taxonomy/10239">Global Search</a> (top right)</td>
    <td><a href="../quick_references/global_search.html">Quick Reference</a></td>
  </tr>
  <tr>
    <td>
      <a href="https://www.fludb.org/brc/influenza_sequence_search_segment_display.spg?method=ShowCleanSearch&decorator=influenza">Nucleotide Search (IRD)</a><br>
      <a href="https://www.fludb.org/brc/influenza_sequence_search_segment_display.spg?method=ShowCleanSearch&decorator=influenza">Genome Search (ViPR)</a>
    </td>
    <td><a href="https://beta.bv-brc.org/searches/GenomeSearch">Genome Search</a></td>
    <td></td>
  </tr>
  <tr>
    <td>
      <a href="https://www.fludb.org/brc/influenza_surveillanceRecord_search.spg?method=ShowCleanSearch&decorator=influenza">Animal Surveillance Search (IRD)</a><br>
      <a href="https://www.fludb.org/brc/influenza_humanSurveillanceData_search.spg?method=ShowCleanSearch&decorator=influenza">Human Surveillance Records (IRD)</a>
    </td>
    <td><a href="https://beta.bv-brc.org/searches/SurveillanceSearch">Surveillance Search</a></td>
    <td></td>
  </tr>
  <tr>
    <td><a href="https://www.fludb.org/brc/influenza_surveillanceRecord_search.spg?method=ShowCleanSearch&decorator=influenza">3-D Protein Structure Search</a></td>
    <td><a href="https://beta.bv-brc.org/searches/ProteinStructureSearch">Protein Structure Search</a></td>
    <td></td>
  </tr>
  <! --- Insert Anti-Viral Drugs Search when available --->
  <tr>
    <td><a href="https://www.fludb.org/brc/serology_experiment_search.spg?method=ShowCleanSearch&decorator=influenza">Serology Experiment Search (IRD)</a></td>
    <td><a href="https://beta.bv-brc.org/searches/SerologySearch">Serology Search</a></td>
    <td></td>
  </tr>
  <tr>
    <td><a href="https://www.fludb.org/brc/hostFactorExperiments.spg?method=SubmitForm&decorator=influenza&navRoot=true">Host Factor Experiments</a></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td><a href="https://www.fludb.org/brc/influenza_epitope_search.spg?method=ShowCleanSearch&decorator=influenza">Immune Epitope Search</a></td>
    <td><a href="https://beta.bv-brc.org/searches/EpitopeSearch">Epitope Search</a></td>
    <td></td>
  </tr>
  <! --- Insert Phenotypes Search if/when available --->
  <! --- Insert PCR Primer Probe Search if/when available --->
  <! --- Insert Sequence Feature Variant Type Search if/when available --->
  <! --- Insert Human Clinical Studies Search if/when available --->
  <! --- Insert ORFeome Plasmid Data Search if/when available --->
  <tr>
    <td><a href="https://www.viprbrc.org/brc/vipr_virusDomain_search.spg?method=ShowCleanSearch&decorator=corona">Protein Domains Search</a></td>
    <td><a href="https://beta.bv-brc.org/searches/ProteinFeatureSearch">Domain and Motif Search</a></td>
    <td></td>
  </tr>
  <tr>
    <td><b>ANALYSIS TOOLS</b></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>
      <a href="https://www.fludb.org/brc/blast.spg?method=ShowCleanInputPage&decorator=influenza">Identify Similar Sequences (BLAST)</a><br>
      <a href="https://www.fludb.org/brc/sssearch.spg?method=ShowCleanInputPage&decorator=influenza&preSelectDB=true">Identify Short Peptides in Proteins</a>
    </td>
    <td><a href="https://beta.bv-brc.org/app/Homology">BLAST (Homology)</a></td>
    <td>
      <a href="../quick_references/services/blast.html">Quick Reference</a><br>
      <a href="../tutorial/blast/blast.html">Tutorial</a>
    </td>  
  </tr>
  <tr>
    <td><a href="https://www.fludb.org/brc/tree.spg?method=ShowCleanInputPage&decorator=influenza">Generate Phylogenetic Tree</a></td>
    <td><a href="">Phylogenetic Tree (Gene Tree)</a></td>
    <td>
      <a href="../quick_references/services/genetree.html">Quick Reference</a><br>
      <a href="../tutorial/genetree/genetree.html">Tutorial</a>
    </td>  
  </tr>
  <tr>
    <td>
      <a href="https://www.fludb.org/brc/msa.spg?method=ShowCleanInputPage&decorator=influenza">Align Sequences (MSA)</a><br>
      <a href="https://www.fludb.org/brc/snpAnalysis.spg?method=ShowCleanInputPage&decorator=influenza">Analyze Sequence Variation</a><br>
      <a href="https://www.fludb.org/brc/jalviewUsingFasta.spg?method=ShowCleanInputPage&decorator=influenza">Visualize Aligned Sequences</a>
    </td>
    <td><a href="https://beta.bv-brc.org/app/MSA">MSA and SNP/Variation Analysis</a></td>
    <td>
      <a href="../quick_references/services/msa_snp_variation_service.html">Quick Reference</a><br>
      <a href="../tutorial/msa_snp_variation/msa_snp_variation.html">Tutorial</a>
    </td>  
  </tr>
  <tr>
    <td><a href="https://www.viprbrc.org/brc/vigorAnnotator.spg?method=ShowCleanInputPage&decorator=corona">Genome Annotation (VIGOR4)</a></td>
    <td><a href="https://beta.bv-brc.org/app/Annotation">Genome Annotation</a></td>
    <td>
      <a href="../quick_references/services/genome_annotation_service.html">Quick Reference</a><br>
      <a href="../tutorial/genome_annotation/genome_annotation.html">Tutorial</a>
    </td>  
  </tr>
  <tr>
    <td><a href=""></a></td>
    <td><a href=""></a></td>
    <td>
      <a href="../quick_references/">Quick Reference</a><br>
      <a href="../tutorial/">Tutorial</a>
    </td>  
  </tr>
  <tr>
    <td><a href=""></a></td>
    <td><a href=""></a></td>
    <td>
      <a href="../quick_references/">Quick Reference</a><br>
      <a href="../tutorial/">Tutorial</a>
    </td>  
  </tr>
  <tr>
    <td><a href=""></a></td>
    <td><a href=""></a></td>
    <td>
      <a href="../quick_references/">Quick Reference</a><br>
      <a href="../tutorial/">Tutorial</a>
    </td>  
  </tr>
  <tr>
    <td><a href=""></a></td>
    <td><a href=""></a></td>
    <td>
      <a href="../quick_references/">Quick Reference</a><br>
      <a href="../tutorial/">Tutorial</a>
    </td>  
  </tr>
  <tr>
    <td><a href=""></a></td>
    <td><a href=""></a></td>
    <td>
      <a href="../quick_references/">Quick Reference</a><br>
      <a href="../tutorial/">Tutorial</a>
    </td>  
  </tr>
  <tr>
    <td><a href=""></a></td>
    <td><a href=""></a></td>
    <td>
      <a href="../quick_references/">Quick Reference</a><br>
      <a href="../tutorial/">Tutorial</a>
    </td>  
  </tr>
  <tr>
    <td><a href=""></a></td>
    <td><a href=""></a></td>
    <td>
      <a href="../quick_references/">Quick Reference</a><br>
      <a href="../tutorial/">Tutorial</a>
    </td>  
  </tr>
  <tr>
    <td><a href=""></a></td>
    <td><a href=""></a></td>
    <td>
      <a href="../quick_references/">Quick Reference</a><br>
      <a href="../tutorial/">Tutorial</a>
    </td>  
  </tr>
  <tr>
    <td><b>WORKBENCH</b></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
  </tr>
</table>