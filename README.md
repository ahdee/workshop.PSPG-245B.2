# workshop

** please remember to set the working directory to your source direcotry by clicking Sesssion-> Set working directory -> to source file location

This workshop requires R > 3.5, Rstudio and the following packages. 

* use BiocManager::install() when possible. 
    + cgdsr
    + ggplot2
    + knitr
    + kableExtra
    + dplyr
    + VennDiagram
    + reshape2
    + gridExtra
    + ggrepel
    + DT
    + ggpub
    + clusterProfiler
    + DOSE
    + org.Hs.eg.db
---
if knitr does not work try installing it from a non standard repo. 

install.packages('knitr', repos = c('https://xran.yihui.name', 'https://cran.r-project.org')


Finally if kableExtra is having issues install the devtools packages first then try to compile it yourself. 

devtools::install_github("haozhu233/kableExtra")

Moroever you may have some issues with install org.Hs.eg.db, clusterProfiler or DOSE if so please ignore it since it is recommended but not required. 
---

In this workshop you will learn about the fundamentals of how to download and utilize cancer genomic data. By the end of the course you should be able to generate your own full R markdown for your assigned TCGA ID, including plots and identification of actionable mutations and/or gene.

1. Basic bioinformatic workflow: from sample to identifying potentially targetable mutations. 
Types of sequencing, e.g. WES and WGS, and also DNA vs RNA
Standard pipelines to go from reads to actionable information
The size of modern data sets (TCGA) and their current applications, e.g. in healthcare
What does a standard genome look like? For example, 4-5 million variants in an average genome compared to the reference human genome. Then this can lead in to talking about germline vs somatic mutations, and how this is crucial for studying cancer 

2. Basic vocabulary and concepts. 
* Classes of somatic mutations

# Breast Cancer
  * Breast cancer is an ideal dataset for study, as there is a sufficient amount of knowledge available to validate our results, yet there remains ample opportunity for interesting and valuable discoveries.
  * This workshop will be entirely focused on the analysis of public datasets. The data will be collected and analyzed in the context of current knowledge.
  * The primary GOAL of this workshop is to provide you with the foundation to pursue further research projects. While there are two main goals, we hope that you will be able to use and expand upon what you learn here. In this 2-3 hour works shop we will attempt to: 
    + "discover" a general molecular profile for the TCGA Breast Cancer dataset.  
    + https://pubmed.ncbi.nlm.nih.gov/26451490/
    + Each participant has been assigned a TCGA patient identifier for this dataset, and your task is to use the tools provided in this workshop to gather as much information as possible. Atthe end of the workshop you should have a complete report for your assigned sample. 

## Wile the assignment is an important aspect of this workshop, the primary objective is to spark your enthusiasm for bioinformatics and illustrate the depth of information that can be obtained even with a cursory examination of data. The potential is limitless, so feel free to ask questions and embrace the learning experience. We encourage you to fully participate and take advantage of this. Contact information in class notes. 
  

# Pt mutations
* Coding 
* Silent
* Missense
* Nonsense
* Noncoding ( UTR ) 
* Intronic
* Intergenic
* Splice site variants?

# Small regional mutations
* Insertion
* Deletions
* Duplications

3. Deciphering nomenclature of sequence variations.

What is his section? Is this deciphering single letter vs three letter mutatioion codes etc.?


4. Identifying functionally relevant mutations - passenger vs driver
How RNA and DNA sequencing data can be integrated to find functional variants?
Variant prediction tools – e.g. CADD scores, and other methods
Comparison to known cancer genes or even known cancer causing variants
Pathway analysis – how this leads in to the design/search of drugs
Structural biology for coding variants


Workshop ( this will constitute the bulk of the time spent )

* We will start off with basic data mining.  To begin with will learn how to directly download mutation data from R.  There are many sources and API's however here will be using  cbioportal. 
* Although this is not a course in R per se, but you will learn how to manipulate/wrangle a the mutation data.frame.  
* Subset type of mutations.  
* Aggregate by attributes such as types of mutations. 
* Query ( eg. for specific variants ) 
* Tabulate mutations ( eg. frequency tables ) . 
* How to identify what could be potentially be pathogenic and cross reference it with existing data. 
* How to take existing mutation data and predict possible actionable targets for either druggability, diagnostic or prognosis. 
* You will also learn a few ways to plot the data. 
* Basic plotting of your mutation table. 
* How to generate figures to look for total burden across different chromosome/regions.
* Potentially – how to analyse mutational signatures (if there is time)



