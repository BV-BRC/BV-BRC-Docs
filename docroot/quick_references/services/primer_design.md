# Primer Design Service

## Overview
The Primer Design Service utilizes Primer3[1-5] to design primers from a given input sequence under a variety of temperature, size, and concentration constraints. Primer3 can be used to design primers for several uses including, PCR (Polymerase Chain Reaction) primers, hybridization probes, and sequencing primers. The service accepts a nucleotide sequence (pasted in, or select a FASTA formatted file from the workspace) and allows users to specify design. After specifying an appropriate output folder and clicking “submit”, the primer design is queued as a “job” to process in the Jobs information box on the bottom right of the page. Once the job has successfully completed, the output file will appear in the workspace, allowing the user to choose from a list of appropriate primers. 

### See also
* [Primer Design Service](https://beta.bv-brc.org/app/PrimerDesign)
* [Primer Design Service Tutorial](../tutorial/primer_design.html)

## Using the Primer Design Service

The **Primer Design** submenu option under the **"SERVICES"** main menu (Viral Services category) opens the MSA and SNP/Variation Service input form. *Note: You must be logged into BV-BRC to use this service.*

![Primer design menu option](../images/bv_services_menu.png) 

### Parameters

Once the primer design service has been selected, users will be directed to the Primer Design landing page as shown below. 

![Figure 1](../images/primer_Picture1.png "Figure 1") 

Users may select one of three input options. 
1. *Pasting in a relevant sequence:* 

   * **Sequence Identifier:** The user-provided name to identify the input sequence. If using a FASTA formatted file, this field will automatically be populated with the sequence name. 

   * **Paste Sequence:** Choosing this option allows users to paste in an input sequence. 

![Figure 2](../images/primer_Picture2.png "Figure 2")

2. *Choosing a workspace sequence:*

   * **Workspace FASTA:** Choosing this option allows users to specify the FASTA file from their workspace. 

![Figure 3](../images/primer_Picture3.png "Figure 3")

3. *Choosing a BV-BRC record:* 

   * **BV-BRC ID:** Choosing this option allows users to specify the BV-BRC identifier for an input sequence. 
  
![Figure 4](../images/primer_Picture4.png "Figure 4")

*Users will also need to select appropriate target, inclusion and exclusion positions using options shown below.* 

![Figure 5](../images/primer_Picture5.png "Figure 5")

   * **Excluded Regions:** Values should be one or a space-separated list of start, length pairs. Primers will not overlap these regions. These values will be denoted with “< >” symbols.

   * **Targets:** Values should be one or a space-separated list of start, length pairs. Primers will flank one or more regions. These values will be denoted with “[ ]” symbols.

   * **Included Regions:** Values should be a single start, length pair. Primers will be picked within this range. These values will be denoted with “{ }” symbols.

   * **Primer Overlap Positions:** Values should be space separated list of positions, The forward OR reverse primer will overlap one of these positions. These values will be denoted with “-” symbol. 

   * **Output Folder:** The workspace folder where results will be placed.

   * **Output Name:** The name users specify for the completed job. 

  *Users may also choose to specify one or more “Advanced Options” as shown below.*

![Figure 6](../images/primer_Picture6.png "Figure 6")


![Figure 7](../images/primer_Picture7.png "Figure 7")


![Figure 8](../images/primer_Picture8.png "Figure 8")


![Figure 9](../images/primer_Picture9.png "Figure 9")


![Figure 10](../images/primer_Picture10.png "Figure 10")


![Figure 11](../images/primer_Picture11.png "Figure 11")


![Figure 12](../images/primer_Picture12.png "Figure 12")


![Figure 13](../images/primer_Picture13.png "Figure 13")

