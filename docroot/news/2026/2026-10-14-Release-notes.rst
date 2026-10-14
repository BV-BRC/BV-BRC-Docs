BV-BRC Web Update: New Influenza Search Features, Expanded Viral Analysis, and Improved Workflows
=================================================================================================

**October 2026 | BV-BRC Web Version 3.59.7**

The Bacterial and Viral Bioinformatics Resource Center (BV-BRC) has introduced several updates to improve how researchers search, analyze, and visualize pathogen genomic data. The latest web release includes new influenza search capabilities, expanded Sequence Feature Variant Type (SFVT) analysis, improvements to protein structure prediction workflows, and updates to outbreak and surveillance maps.

These enhancements are designed to make BV-BRC tools more accessible, flexible, and efficient for researchers working with bacterial and viral genomic data.

New Influenza Search Capabilities
---------------------------------

A dedicated **Influenza Search** interface provides researchers with additional options for exploring influenza genomic data. Users can now search across multiple influenza viruses and genome segments, use multiple taxonomy keywords, and more easily organize their results.

The updated interface also includes improved options for customizing search results. Using the **Select Columns** button above the results table, researchers can choose which data fields are displayed, allowing them to focus on information most relevant to their analysis. Selected search options can also appear as default columns in the results.

Additional interface improvements provide better support for different screen sizes and web browsers.

Expanded Sequence Feature Variant Type (SFVT) Analysis
-------------------------------------------------------

BV-BRC has expanded its **Sequence Feature Variant Type (SFVT)** functionality to include data for **Ebola virus**.

SFVT analysis helps researchers examine combinations of amino acid variations within defined sequence features. The expanded coverage provides additional opportunities to investigate viral sequence variation and compare biologically relevant features across sequences.

Researchers can explore the expanded functionality through the `BV-BRC SFVT Search <https://www.bv-brc.org/searches/SFVTSearch>`_, which provides access to sequence feature variation data across supported viruses.

The newly available Ebola virus data can be explored directly through the `Ebola SFVT page <https://www.bv-brc.org/view/Taxonomy/3044781?#view_tab=sfvt>`_, where users can investigate sequence feature variation within the available Ebola virus datasets.

The SFVT interface has also received improvements to gene-product selection, data loading, and overall responsiveness, making it easier to navigate available data.

Updates to Protein Structure Prediction
----------------------------------------

The **Predict Structure** service submission form has been redesigned to provide a clearer and more intuitive experience when configuring structure prediction jobs.

Updates include improved ligand input options, controls for selecting multiple sequence alignment (MSA) sources, and a new **Job Name** field that previews the output location before submission.

The prediction tool selection has also been updated to include **ESMFold2**, while AlphaFold 2 has been removed from the available options. Additional guidance has been added to help users understand runtime expectations, MSA settings, and submission requirements.

Improved Outbreak and Surveillance Maps
----------------------------------------

BV-BRC has updated its outbreak and surveillance maps by transitioning from Google Maps to **Leaflet**, an open-source mapping library.

The transition includes refreshed map styling, improved legend organization, and updates to the underlying mapping components. These changes support a more consistent experience when exploring geographic and surveillance information associated with pathogen outbreaks.

.. image:: ../images/2026/new_map.png
   :width: 500
   :alt: Updated BV-BRC outbreak and surveillance map using Leaflet
   :align: center


Additional Updates and Improvements
-----------------------------------

This release also includes several other enhancements across BV-BRC:

* **Influenza B Subspecies Classification:** Additional Influenza B
  options are now available in the
  `Subspecies Classification Service <https://www.bv-brc.org/app/SubspeciesClassification>`_.

* **Influenza Vaccine Strain Information:** A new
  `Influenza Vaccine Strain page <https://www.bv-brc.org/view/VaccineStrain>`_
  provides access to influenza vaccine strain information and
  feature highlights.

.. image:: ../images/2026/vaccine_strain.png
   :width: 500
   :alt: BV-BRC Influenza Vaccine Strain page
   :align: center


* **Workspace Improvements:** Fixes to workspace selection, output
  folder navigation, and favorites management. Users can access
  their files through the
  `BV-BRC Workspace <https://www.bv-brc.org/workspace>`_.

* **Homology and BLAST:** Improvements to metadata retrieval, large
  result handling, and workspace navigation. Explore the
  `BLAST Search <https://www.bv-brc.org/app/BLAST>`_
  tool for sequence similarity analysis.

* **Search and Filtering:** Corrections to Collection Year filtering,
  results display, and data retrieval.

* **Platform Reliability:** Security updates, dependency upgrades,
  and infrastructure improvements to support a more stable user
  experience.


Explore the Latest Updates
--------------------------

These updates reflect BV-BRC's continued commitment to providing accessible bioinformatics resources for the infectious disease research community.

Researchers are encouraged to explore the updated tools and features at `www.bv-brc.org <https://www.bv-brc.org/>`_.

For questions, feedback, or assistance with BV-BRC services, please contact the **BV-BRC Help Desk** through the website.

Understanding the New Influenza Search Functionality
----------------------------------------------------

Learn how to filter and retrieve specific genomic data for H5N1 avian influenza strains using the BV-BRC platform. This example shows how to narrow results by host group, subtype, H5 clade, and location, then export DNA FASTA sequences for research.

You can also follow the `illustrated step-by-step guide <https://scribehow.com/o/B2SvvvDxRYevUXP7yx12ig/viewer/Searching_and_Exporting_Avian_Influenza_Data_on_BV-BRC__9jHW4v4KRbS4tdbS4Bn_tg>`_.

Configure Search Filters
~~~~~~~~~~~~~~~~~~~~~~~~

1. Open **Influenza (BETA)** in BV-BRC.

   .. image:: https://colony-recorder.s3.us-west-1.amazonaws.com/files/2026-10-14/b505a8ce-6482-4b6f-a15a-67d0ec51c4cc/action-d595daa5c71d4a87b96bf12d6ee21f7d_38c8644436094cb6a231ef8ebcad070f_text_export.jpeg
      :alt: Influenza (BETA) search entry
      :width: 650px

2. In **Host Group**, enter ``av`` and select **Avian**.

   .. image:: https://colony-recorder.s3.us-west-1.amazonaws.com/files/2026-10-14/f86f7cbd-b3e4-4d17-83d7-07868d743989/action-ab92a2a70d2e435ab8776f5bac9b4695_cfcf645470ac4fe8831f8a93fd244e79_text_export.jpeg
      :alt: Select Avian as the host group
      :width: 650px

3. In **H Subtype**, select **H5**.

   .. image:: https://colony-recorder.s3.us-west-1.amazonaws.com/files/2026-10-14/1a3f981f-43c3-426a-8844-76c6896c084b/action-b5dbe49236bd450b8863c9b9b7fc2165_10af712065ea4638a51310d2ed916e4a_text_export.jpeg
      :alt: Select H5 subtype
      :width: 650px

4. In **N Subtype**, select **N1**.

   .. image:: https://colony-recorder.s3.us-west-1.amazonaws.com/files/2026-10-14/d61449ab-a243-4c68-a36e-bbcd916ccabf/action-f5a04850ea7743dca3fd42885b18bf98_1aa09b20768148aeb49c00d8343187fe_text_export.jpeg
      :alt: Select N1 subtype
      :width: 650px

5. In **H5 Clade**, select **2.3.4.4b**.

   .. image:: https://colony-recorder.s3.us-west-1.amazonaws.com/files/2026-10-14/63b90218-3d76-4484-81f2-e313ad950d86/action-fddfe0d398194c4498720f515bb9e291_7130a4527e0a4a06827b39c1b4a84d71_text_export.jpeg
      :alt: Select H5 clade 2.3.4.4b
      :width: 650px

6. In **State**, select **California**.

   .. image:: https://colony-recorder.s3.us-west-1.amazonaws.com/files/2026-10-14/9cd32f9d-23ce-4606-b2de-306c7fb6b893/action-9ea40b54f49e450580050de1897985bd_07a695b530b647ba92d6d7d621c797e0_text_export.jpeg
      :alt: Select California as the state
      :width: 650px

7. Click **Search** to retrieve matching records.

   .. image:: https://colony-recorder.s3.us-west-1.amazonaws.com/files/2026-10-14/3d075739-a633-4158-b529-9131ec497f8a/action-67b7095d051448ad8deb8238c74ffc9e_66069730bb9d420e8fb9aceab2277a21_text_export.jpeg
      :alt: Run the influenza search
      :width: 650px

Review and Download Results
~~~~~~~~~~~~~~~~~~~~~~~~~~~

8. Review the search results and select the records to export using the checkbox in the results table.

   .. image:: https://colony-recorder.s3.us-west-1.amazonaws.com/files/2026-10-14/bd0dd631-dccb-4917-b4af-a6abaee17957/action-6bda08f6defd48b5bf1c62267f9bd856_f0ce76aabb414a37b02f41797e7924ef_text_export.jpeg
      :alt: Select a record in the results table
      :width: 650px

9. Open the export or download menu for the selected records.

   .. image:: https://colony-recorder.s3.us-west-1.amazonaws.com/files/2026-10-14/14522604-fdbe-490c-b57a-0fce4601d3c6/action-39ebec04a8934eaa97489d90b3a51d78_0d8d6882fe374c7ea01baac4cf2f49b7_text_export.jpeg
      :alt: Open the sequence export options
      :width: 650px

10. Choose **DNA FASTA** to export the selected nucleotide sequences.

    .. image:: https://colony-recorder.s3.us-west-1.amazonaws.com/files/2026-10-14/60cb6205-305e-4d93-92ba-6d0dde070563/action-42f2ccadf3284cc1b242ddc9c2a1e585_3b96ce550b474ab89dfa152ab192876c_text_export.jpeg
       :alt: Choose DNA FASTA as the export format
       :width: 650px
