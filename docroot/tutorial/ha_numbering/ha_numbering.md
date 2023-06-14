# HA Subtype Numbering Conversion Service

## Overview

The HA Subtype Numbering Conversion tool takes influenza HA protein sequence(s) and converts their existing HA position numbering to a different HA numbering scheme using David Burke and Derek Smith’s method that uses both sequence and structure information to propose positions of functional equivalence across different HA subtypes. The analysis starts with the user inputting protein sequence(s). The sequence(s) are BLASTed against the Burke Reference sequences, which will determine the best reference subtype to use in the HA numbering pipeline. The HA numbering pipeline will generate a pairwise multiple sequence alignment using the reference protein sequence selected and the user inputted protein sequence(s). This alignment will generate a mapping between the user input sequence(s) and the BLAST reference sequence. Then this mapping is used to align the input sequence(s) to the selected HA subtype positions.

### Burke Reference Sequences

| Subtype Common Name | Strain Name        |
| ------------------- | ------------------ |
| H1_PR34             | A/Puerto/Rico/8/34 |
| H1_1993             | A/United/Kingdom/1/1933 |
| H1post1995          | A/NewCaledonia/20/1999 |
| H1pdm | A/California/04/2009 |
| H2	| A/Singapore/1/1957 |
| H5mEA-nonGsGD	| A/mallard/Italy/3401/2005 (LPAI) |
| H5	| A/Vietnam/1203/04 (HPAI) |
| H5c221	| A/chicken/Egypt/0915-NLQP/2009 (HPAI) |
| H6	| A/chicken/Taiwan/0705/99 |
| H8	| A/turkey/Ontario/6118/1968 |
| H9	| A/Swine/HK/9/98 |
| H11	| A/duck/England/1/1956 |
| H12	| A/Duck/Alberta/60/1976 |
| H13	| A/gull/Maryland/704/1977 |
| H16	| A/black-headedgull/Turkmenistan/13/76 |
| B/Hong Kong/8/73	| B/HONGKONG/8/73 |
| B/Florida/4/2006	| B/FLORIDA/4/2006 |
| B/Human/Brisbane/60/2008	| B/HUMAN/BRISBANE/60/2008 |
| H3	| A/AICHI/2/68 |
| H14	| A/mallard/Astrakhan/263/1982 |
| H15	| A/duck/Australia/341/1983 |
| H10	| A/mallard/bavaria/3/2006 |
| H4	| A/swine/Ontario/01911-1/99 |
| H7N3	| A/Turkey/Italy/220158/02/H7N3 |
| H7N7	| A/Netherlands/219/03/H7N7 |
| H17	| A/little-yellowshoulderedbat/Guatemala/060/2010 |
| H18	| A/flat-faced/bat/Peru/033/2010 |

### See Also
  * [HA Subtype Numbering Conversion Service](https://www.bv-brc.org/app/HASubtypeNumberingConversion)
  * [HA Subtype Numbering Conversion Quick Reference](../../quick_references/ha_numbering/ha_numbering.html)

## Locating the service

The HA Subtype Numbering Conversion submenu option under the **TOOLS & SERVICES** main menu (Protein tools category) opens the HA Subtype Numbering Conversion input form. *Note: You must be logged into BV-BRC to use this service.*
 
![Figure 1](./images/img1.png "Figure 1")

This will open up the HA Subtype Numbering Conversion job landing page.

![Figure 2](./images/img2.png "Figure 2")


![Figure 3](./images/img3.png "Figure 3")


![Figure 4](./images/img4.png "Figure 4")


![Figure 5](./images/img5.png "Figure 5")


![Figure 6](./images/img6.png "Figure 6")


![Figure 7](./images/img7.png "Figure 7")


![Figure 8](./images/img8.png "Figure 8")


![Figure 9](./images/img9.png "Figure 9")


![Figure 10](./images/img10.png "Figure 10")


![Figure 11](./images/img11.png "Figure 11")


![Figure 12](./images/img12.png "Figure 12")


![Figure 13](./images/img13.png "Figure 13")


![Figure 14](./images/img14.png "Figure 14")


![Figure 15](./images/img15.png "Figure 15")


![Figure 16](./images/img16.png "Figure 16")


![Figure 17](./images/img17.png "Figure 17")


