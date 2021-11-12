---
title: 'Network analysis of specimen co-collection'
tags:
  - Bionomia
  - biodiversity
  - recording behaviour
authors:
  - name: Sofie Meeus
    orcid: 0000-0003-0715-8647
    affiliation: 1
  - name: Tom August
    orcid: 0000-0003-1116-3385
    affiliation: 2
  - name: Lien Reyserhove
    orcid: 0000-0001-7484-9267
    affiliation: 3
  - name: Maarten Trekels
    orcid: 0000-0001-8282-8765
    affiliation: 1
  - name: Quentin Groom
    orcid: 0000-0002-0596-5376
    affiliation: 1

affiliations:
 - name: Meise Botanic Garden, Nieuwelaan 38, 1860 Meise, Belgium
   index: 1
 - name: UK Centre of Ecology and Hydrology, Maclean Building, Crowmarsh Gifford, Wallingford OX10 8BB, UK
   index: 2
 - name: Instituut voor Natuur- en Bosonderzoek, Team Oscibio, Havenlaan 88, 1000 Brussel
   index: 3
date: 09 November 2021
bibliography: paper.bib
authors_short: Last et al. (2021) BioHackrXiv  template
group: BioHackrXiv
event: BioHackathon Europe 2021
---

# Introduction
Biodiversity data are collected by people, and those people often work in teams. Those teams may be large, particular when they are part of an expedition, though they maybe as small as two people. Data of who works together can help refine biodiversity data in many ways. It can help us cross-reference data to ensure it is consistent and valid. It helps us acknowledge the contribution to science of all of the participants. It helps us understand how scientific collection, learning and communication operates and this can give us insights into the biases and effectiveness of the collection process. Also, the relationships between people, and the organisations they are members of, are interesting from a historic and sociological perspective.

Network analysis has been used for some time to explore the relationships between people, but the connections analysed maybe strong, as in the case of citation networks (ref), or weak in the case of Twitter analytics. Here we specifically analyse the co-collection of biological specimens by people. Co-collecting a specimen requires that those people involved in the collection process travel, organise and explore together. One could argue that such a connection could be stronger than co-authoring a publication together, though doubtlessly the degree of engagement varies considerable. Networks based upon co-collection have been creating before for specific groups, for example for the botanical exchange clubs in the United Kingdom [@groom2014herbarium] and for a specific herbarium [@de2020new]. However, in this paper we approach the co-collection networks from a global perspective using the data from [Bionomia](https://bionomia.net/). Bionomia is a community based project that allows users to associate stable identifiers for people, such as [ORCID](https://orcid.org/) and [Wikidata Q numbers](https://www.wikidata.org/wiki/Q43649390), to the anonymous text strings transcribed from specimens in museum and herbaria.

## Subsection level 2

Please keep sections to a maximum of three levels, even better if only two levels.


# Methods

Data on collectors were downloaded from the Bionomia website (2021-11-06). This comma separated file contains three columns (Subject,Predicate,Object), the URI of the GBIF id of the specimen, the identifier of the Darwin Core term (recordedBy or identifiedBy) and the person identifier (ORCID or Wikidata Q number). This file was imported into a table in an SQLite database [@sqlite2020hipp]. All rows referring to identifications of specimens were deleted, leaving only those related to specimen collection. A query was then run using a self-join on specimen ID to create a new table containing two rows with pairs of collectors that collected with each other. This table was then exported and the number of specimens was calculated per collector pair, to create a file of network edges with the pairs of collectors and a weight based on the number of specimens they had in common.

Demographic and gender information on the collectors was retrieved from Wikidata using the notebook 'get_collector_gender.ipynb'. Using the SPARQL endpoint of wikidata, the script is collecting the relevant information if it is available. ORCiD ids are not containing gender or demographic information tat can be queried. Therefor we can only retrieve the information if those people are represented in wikidata and their ORCiD is present in the Wikidata entry. The output of the script creates a nodes file containing the ID of the person and columns for the gender and demographic information.

Using the nedwork edges and the nodes list, the Jupyter notebook 'age_differences.ipynb' starts with filtering out the unique interactions between people. Using the demographic information, it was possible to derive the age differences between the interacting people. This can serve as a metric to filter out wrong connections between people. As such it is possible to detect wrong assignments of people to specimens and can help in cleaning the data. Since in many cases gender could be retrieved from the identifiers, it also enabled the analysis of gender as parameter in the network of people.

To visualize the network the nodes and edges file was imported into Gephi [@ICWSM09154].

# Results
Table 1: The top three men and women with the largest number of co-collectors, ordered alphabetically by their surnames


|Wikipedia|Wikidata|
|---|---|
|[Elizabeth Gertrude Britton](https://en.wikipedia.org/wiki/Elizabeth_Gertrude_Britton)|[Q2567402](https://www.wikidata.org/wiki/Q2567402)|
|[Merritt Lyndon Fernald](https://en.wikipedia.org/wiki/Merritt_Lyndon_Fernald)|[Q2656885](https://www.wikidata.org/wiki/Q2656885)|
|[Johannes Lid](https://en.wikipedia.org/wiki/Johannes_Lid)|[Q94522](https://www.wikidata.org/wiki/Q94522)|
|[Alicia Lourteig](https://en.wikipedia.org/wiki/Alicia_Lourteig)|[Q454806](https://www.wikidata.org/wiki/Q454806)|
|[Elisa G. Nicora](https://en.wikipedia.org/wiki/Elisa_G._Nicora)|[Q5829538](https://www.wikidata.org/wiki/Q5829538)|
|[William Alfred Weber](https://en.wikipedia.org/wiki/William_Alfred_Weber)|[Q4105706](https://www.wikidata.org/wiki/Q4105706)|

![The absolute (left) and relative (right) number of collaborations for women and men who collected specimens identified in Bionomia (https://bionomia.net/)](./figures/abs_rel_links.png)

![The network of collector collaborations for specimens identified in Bionomia (https://bionomia.net/). This was created in Gephi [@ICWSM09154] and the colours of the nodes is determined by a community detection algorithm and coloured for the largest modules within the network [@blondel2008fast]](./figures/CollectorsNetwork_Degree-final.png)

![Histogram of the age difference between peeple. The results are shown for each of the different gender combinations that could be derived from the data](./figures/histogram_agediff.png)

After analysis through the age differences notebook, a histogram of the age differences could be constructed for the different gender combinations (figure XX). The distribution of age differences suggests that the cut-off of realistic differences in ages is around 50 years. Also intuitively it seems reasonable to assume that it is worthwhile checking the records that show a bigger differnce in age. The fraction of edges that should be investigated further is around 5.5%. This is a significant number of records that could be fed back to Bionomia to be checked and/or corrected by the community.

![Number of specimems collected as a function of birth date of one of the people. The colors are indicating the combination of genders](./figures/period_gender_specimens.png)

The number of specimens collected shows a clear increase during the course of time. The beginning of the records shows a pure male-male gender combination in the collection of the specimens. In the late 18th century the first specimens were collected by mixed gender teams and it takes until the beginning of the 19th century that female only collecting teams are showing up in the data. In the 20th century, the pure male collecting teams are dropped below 70% and still decreasing.

# Discussion and/or Conclusion

![An infographic illustrating Alicia Lourteig and her place in the collecting network together with a biographical vignette.](./figures/Alicia_Lourteig.png)
![An infographic illustrating Hanna Resvoll-Holmsen and her place in the collecting network together with a biographical vignette.](./figures/Hanna_Resvoll_Holmsen.png)
![An infographic illustrating Mary Agnes Chase and her place in the collecting network together with a biographical vignette.](./figures/Mary_Agnes_Chase.png)

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
