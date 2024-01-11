# Data Groups

## Overview
In BV-BRC, "Groups" are custom collections of selected genomes or features. They are particularly useful for organizing and managing data sets of interest for further exploration and analysis.

## See also:
  * [Workspace](/quick_references/workspaces/workspace)
  * [Tables](/quick_references/tables)
  * [Action Bar](/quick_references/action_bar)

## Creating and Accessing Groups
A group can created by selecting a set of desired items genomes or features in a table and clicking the Group button on the vertical green Action Bar on the right side of the table. This will open a pop-up window to enable creating a new group containing the selected items or to add the selected items to an existing group in the Workspace.

![Creating a Group](../images/create_group.png)

Once created, the new group will appear in the home Workspace. By default, Genome Groups will appear in the "Genome Groups" folder, and likewise, Feature Groups will appear in the "Feature Groups" folder.

![Genome Group](../images/genome_group.png)

## Using Workspace Groups
Many BV-BRC website features are available to work with data in groups, including analyzing the items in the group with BV-BRC tools and services. For example, after creating a Genome Group, you could use the Phylogenetic Tree Building Service to build a phylogenetic tree using the genomes in the group by selecting the group from the "select genome group" dropdown list. All the genome groups you have created will appear in this list.

![Phylogenetic Tree Using Genome Group](../images/phylo_tree_genome_group.png)

## Managing Groups in the Workspace
An initial set of directory folders are provided as default locations for groups based on data type, incluidng Genome Groups and Feature Groups. Double-clicking the folder displays a list of the groups in that folder. Clicking the group name selects it, and information about the group is provided in the Information Panel on the right-hand side. See [Workspace](/quick_references/workspaces/workspace) for more information.

### Group Comparison
The Workspace provides Venn Diagram tool for comparison of membership of items in a groups. Selecting 2 or 3 groups (using <control>, <command>, or <shift> click) enables the Venn Diagram button in the vertical green Action Bar on the right side of the table. 

![Venn Diagram Button](../images/venn_diagram_action.png)

Clicking the Venn Diagram button displays an interactive Venn Diagram showing the selected groups and the counts of items from each group in the intersecting and non-intetersecting sections. Clicking one of the sections (or multi-selecting using <command> click) displays a table on the right side listing the genomes matching the selection(s) and a Boolean statement defining the selected section(s). Using the options at the top left above the Venn Diagram, the colors can be changed, an SVG image file can be created, and a new group can be created from the selection(s).

![Venn Diagram](../images/venn_diagram.png)

### Action Bar
After selecting one or more groups in the Workspace, a set of options becomes available in the vertical green Action Bar on the right side of the table.  These include

* **Hide:** Toggles (hides) the right-hand side Details Pane.
* **Genomes:** Displays the Genomes Table, listing the genomes that correspond to the selected group.
* **Venn Diagram:** Displays an interactive Venn diagram showing the intersection of up to 3 genome groups. *Available only when more than one group is selected.*
* **Download:** Downloads the selected item.
* **Delete:** Deletes the selected items (rows).
* **Rename:** Allows renaming the selected item.
* **Copy:** Creates copies the selected items and allows the copies to be put into another folder in the Workspace.
* **Move:** Allows moving of the selected item(s) into another folder in the Workspace.
