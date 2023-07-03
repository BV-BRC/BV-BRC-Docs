# AMR Phenotypes

## Overview
The AMR Phenotypes Tab provides a tabular view of all of the bacterial AMR phenotype data for the selected taxon level, including the resistance phenotype (Resistant, Susceptible, Intermediate) and/or the minimum inhibitory concentration (MIC) value as measured by antibiogram (AMR panel) assay.

## See also

## Accessing AMR Phenotypes
Clicking the AMR Phenotypes Tab in a Taxon View displays a table with rows for each genome/antibiotic combination for which there is an AMR phenotype designation or MIC value in that taxonomic level, as shown below:

### AMR Phenotypes Table
![AMR Phenotypes Table](../images/amr/amr_phenotypes_tab.png)
The table provides a listing of Resistance Phenotype (Susceptible, Resistant, Intermediate) for each of the tested antibiotics/chemicals associated with each genome. Where available, additional panel data are provided such as MIC information (Measurement Sign, Measurement Value, Measurement Units, Testing Standard, Testing Standard Year). Additional fields for Lab Typing information (Method, Platform, Vendor, Version) and Source are also available.

### Predicted AMR Phenotypes
![Predicted AMR Phenotypes](../images/amr/predicted_amr_phenotypes.png)
The Bacterial Genome Annotation Service provides predictions of AMR Phenotypes for genomes for which AMR classifiers have been built For these predicted phenotypes, the Lab Typing Method will be "Computational Prediction", the Lab Typing Platform will show the classifier type (e.g., "AdaBoost Classifier"), The Lab Typing Vendor will show the source of the classifier producer, and the Lab Typing Version will show the accuracy and other scores associated with the prediction (e.g., "Accuracy:0.995, F1 scroe:0.995, AUC:0.991"). 

See [Davis, JJ, et al. 2016](https://www.nature.com/articles/srep27930) and [AdaBoost Classification Software](http://tutorial.theseed.org/AdaBoost_Installation_Tutorial.htm) for more information on how AMR classifiers are constructed and used. 

### AMR Phenotypes Table Tools
Within this table you may do the following:

* **Download** the entire contents of the table in text, CSV, or Excel format by clicking the Download button above the table on the left side.

* **Rearrange and narrow** the list of genomes in the table via sorting (using column headers), keywords (using the Keyword box), and filtering (using the Filters tool).

### Filter Tool

As with all tables, the Filters tool is available to narrow the display of the items in the table, show below:
  
![AMR Phenotypes Filter Panel](../images/amr/amr_phenotypes_filter_panel.png)

Clicking on the Filters button at the top right of the table opens the Filter Panel above the table, displaying column names from the table and values for those columns with counts of occurence.  Clicking on the filter values narrows the genomes displayed in the table to those matching the chosen filter values.  Clicking the Hide button closes the Filter Panel.  More details are available in the [Tables and Filters](../tables.html) Quick Reference Guide.

### Action buttons

After selecting one or more of the genomes by clicking the checkbox beside the Genomes Name in the table, a set of options becomes available in the vertical green Action Bar on the right side of the table.  These include

* **Hide/Show:** Toggles (hides) the right-hand side Details Pane.
* **Download:**  Downloads the selected items (rows).
* **Copy:** Copies the selected items to the clipboard.
* **Genome:** Loads the Genome View Overview page for the selected genome (if only one genome selected).
* **Antibiotic:** Loads the Antibiotic Overview for the corresponding antibiotic selected (available only if one genome/antibiotic row is selected). The Antibiotic Overview provides detailed information regarding the antibiotic.
* **Group:** Opens a pop-up window to enable adding the selected genome/antibiotic records to an existing or new group in the private workspace.

More details are available in the [Selection Action Bar](../action_bar.html) Quick Reference Guide.
