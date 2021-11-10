---
title: '# Network analysis of specimen co-collection'
tags:
  - Bionomia
  - biodiversity
  - recording behaviour
authors:
  - name: Sofie Meeus
    orcid: 0000-0003-0715-8647
    affiliation: 1
  - name: Lien Reyserhove
    orcid: 0000-0001-7484-9267
    affiliation: 2
  - name: Maarten Trekels
    orcid: 0000-0001-8282-8765
    affiliation: 1
  - name: Quentin Groom
    orcid: 0000-0002-0596-5376
    affiliation: 1

affiliations:
 - name: Meise Botanic Garden, Nieuwelaan 38, 1860 Meise, Belgium
   index: 1
 - name: Instituut voor Natuur- en Bosonderzoek, Team Oscibio, Havenlaan 88, 1000 Brussel
   index: 2
date: 09 November 2021
bibliography: paper.bib
authors_short: Last et al. (2021) BioHackrXiv  template
group: BioHackrXiv
event: BioHackathon Europe 2021
---

# Introduction
Biodiversity data are collected by people, and those people often work in teams. Those teams may be large, particular when they are part of an expedition, though they maybe as small as two people, even a married couple. Data of who works together can help refine biodiversity data in many ways. It can help us cross-reference data to ensure it is consistent and valid. It helps us acknowledge the contribution to science of all of the participants. It helps us understand how scientific collection operates and that can give us insights into the biases and effectiveness of the collection process. Also, the relationships between people, and the organisations they are members of, are interesting from a historic and sociological perspective.

[@groom2014herbarium]

## Subsection level 2

Please keep sections to a maximum of three levels, even better if only two levels.

### Subsection level 3

Please keep sections to a maximum of three levels.

## Tables, figures and so on

Please remember to introduce tables (see Table 1) before they appear on the document. We recommend to center tables, formulas and figure but not the corresponding captions. Feel free to modify the table style as it better suits to your data.

Table 1
| Header 1 | Header 2 |
| -------- | -------- |
| item 1 | item 2 |
| item 3 | item 4 |

Remember to introduce figures (see Figure 1) before they appear on the document. 

![BioHackrXiv logo](./biohackrxiv.png)
 
Figure 1. A figure corresponding to the logo of our BioHackrXiv preprint.

# Methods

Data on collectors waere downloaded from the Bionomia website (2021-11-06). This comma separated file contains three columns (Subject,Predicate,Object), the URI of the GBIF id of the specimen, the identifier of the Darwin Core term (recordedBy or identifiedBy) and the person identifier (ORCID or Wikidata Q number). This file was imported into a table in an SQLite database [@sqlite2020hipp]. All rows refering to identifictions of specimens were deleted, leaving only those related to specimen collection. A query was then run using an self-join on specimen ID to create a new table containing two rows with pairs of collectors that collected with each other. This table was then exported and the number of specimens was calculated per collector pair, to create a file of network edges with the pairs of collectors and a weight based on the number of specimens they had in common.

# Discussion and/or Conclusion

We recommend to include some discussion or conclusion about your work. Feel free to modify the section title as it fits better to your manuscript.

# Future work

And maybe you want to add a sentence or two on how you plan to continue. Please keep reading to learn about citations and references.

For citations of references, we prefer the use of parenthesis, last name and year. If you use a citation manager, Elsevier – Harvard or American Psychological Association (APA) will work. If you are referencing web pages, software or so, please do so in the same way. Whenever possible, add authors and year. We have included a couple of citations along this document for you to get the idea. Please remember to always add DOI whenever available, if not possible, please provide alternative URLs. You will end up with an alphabetical order list by authors’ last name.

# Jupyter notebooks, GitHub repositories and data repositories

* Please add a list here
* Make sure you let us know which of these correspond to Jupyter notebooks. Although not supported yet, we plan to add features for them
* And remember, software and data need a license for them to be used by others, no license means no clear rules so nobody could legally use a non-licensed research object, whatever that object is

# Acknowledgements
The authors thank the organizers BioHackathon-Europe for their support and the smoothrunning of the event. This work was also facilitated by the Research Foundation – Flanders research infrastructure under grant number FWO I001721N and the BiCIKL project of the European Union's Horizon 2020 Research and Innovation action under grant agreement No 101007492.



# References

Leave thise section blank, create a paper.bib with all your references.
