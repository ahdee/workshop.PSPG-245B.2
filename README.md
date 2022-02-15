# workshop

** please remember to set the working directory to your source by clicking Sesssion-> Set working directory -> to source file location

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
---
if knitr does not work try installing it from a non standard repo. 

install.packages('knitr', repos = c('https://xran.yihui.name', 'https://cran.r-project.org')


Finally if kableExtra is having issues install the devtools packages first then try to compile it yourself. 

devtools::install_github("haozhu233/kableExtra")

---

In this workshop you will learn about the fundamentals of mutation identification in cancer.  This will include the following. 

1. Basic bioinformatic workflow: from sample to identifying potentially targetable mutations. 
Types of sequencing, e.g. WES and WGS, and also DNA vs RNA
Standard pipelines to go from reads to actionable information
The size of modern data sets (TCGA) and their current applications, e.g. in healthcare
What does a standard genome look like? For example, 4-5 million variants in an average genome compared to the reference human genome. Then this can lead in to talking about germline vs somatic mutations, and how this is crucial for studying cancer 

2. Basic vocabulary and concepts. 
* Classes of somatic mutations

# Breast Cancer
  * breast cancer is the perfect dataset to study because there are a lot that is known so that we can check our results, however there is still a lot more unknown for some interesting mining. 
  * we will start with first principle by studying public data and see what we can find that matches with what is known. 
  * for now pretend we are the only people in the world with these dataset and there are 2 goals. 
    + figure a general molecular profile 
    + study the TCGA sample you were given. 
    + https://pubmed.ncbi.nlm.nih.gov/26451490/

## the goal is to get you excited about bioinformatics and show you first hand how even just a couple of hours of digging around can yield very relevant results. Have fun and feel free to reach out for questions. 
  + Alex: alex.lee2@ucsf.edu 
  + Henry: henry.martell@ucsf.edu

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



