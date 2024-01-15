# Requirements
  * It is important that you have the following installed on your computer before the workshop. 
    * R > 4.0 
      + note in Windows please also install on windows please also install RTools: https://cran.r-project.org/bin/windows/Rtools/
    * Rstudio
    * And the following packages
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
      + ggpubr
      + clusterProfiler
      + DOSE
      + org.Hs.eg.db

    <details>
      <summary>Please expand the following code block for instructions as to how to install R packages.</summary>
      
      ```
        
        if(!require(devtools)) { install.packages("devtools") }
        if(!require(BiocManager)) { install.packages("BiocManager") }
        devtools::install_github("cBioPortal/cgdsr")
        
        BiocManager::install(c("ggplot2", "knitr", "kableExtra", "dplyr", "VennDiagram", "reshape2", 
                              "gridExtra", "ggrepel", "DT", "ggpubr", 
                              "clusterProfiler", "DOSE", "org.Hs.eg.db"))
    ```
    </details>




  * Also remember to set the working directory to your source direcotry by clicking Sesssion-> Set working directory -> to source file location
---

# Overview
In this workshop, you will be introduced to the fundamentals of downloading and utilizing cancer genomic data. Upon completion of the course, you will be able to produce your own comprehensive R Markdown for your assigned TCGA ID, featuring plots and the identification of impactful mutations and/or genes. We will be covering the following concepts. 

## 1. Basic bioinformatic workflow: from sample to identifying potentially targetable mutations. 

* Types of sequencing, e.g. WES and WGS, and also DNA vs RNA
* Standard pipelines to go from reads to actionable information
* The size of modern data sets (TCGA) and their current applications, e.g. in healthcare
* What does a standard genome look like? For example, 4-5 million variants in an average genome compared to the reference human genome. Then this can lead in to talking about germline vs somatic mutations, and how this is crucial for studying cancer 


## 2. Basic vocabulary and concepts. 

* Classes of somatic mutations

## 3. Mutations 
* Coding 
* Silent
* Missense
* Nonsense
* Noncoding ( UTR ) 
* Intronic
* Intergenic
* Splice site variants?

## 4. Small regional mutations

* Insertion
* Deletions
* Duplications

## 5. Deciphering nomenclature of sequence variations.

## 6. Identifying functionally relevant mutations - passenger vs driver
How RNA and DNA sequencing data can be integrated to find functional variants?
Variant prediction tools – e.g. CADD scores, and other methods
Comparison to known cancer genes or even known cancer causing variants
Pathway analysis – how this leads in to the design/search of drugs
Structural biology for coding variants

## 7. We will also do a quick overview of RNAseq and how to utilize it to find genes of interests as well as go over the fundamentals of pathway analysis. 

# Breast Cancer
  * Breast cancer is an ideal dataset for study, as there is a sufficient amount of knowledge available to validate our results, yet there remains ample opportunity for interesting and valuable discoveries.
  * This workshop will be entirely focused on the analysis of public datasets. The data will be collected and analyzed in the context of current knowledge.
  * The primary GOAL of this workshop is to provide you with the foundation to pursue further research projects. While there are two main goals, we hope that you will be able to use and expand upon what you learn here. In this 2-3 hour works shop we will attempt to: 
    + "discover" a general molecular profile for the TCGA Breast Cancer dataset.  
    + https://pubmed.ncbi.nlm.nih.gov/26451490/
    + Each participant has been assigned a TCGA patient identifier for this dataset, and your task is to use the tools provided in this workshop to gather as much information as possible. Atthe end of the workshop you should have a complete report for your assigned sample. 

## Wile the assignment is an important aspect of this workshop, the primary objective is to spark your enthusiasm for bioinformatics and illustrate the depth of information that can be obtained even with a cursory examination of data. The potential is limitless, so feel free to ask questions and embrace the learning experience. We encourage you to fully participate and take advantage of this. Contact information in class notes. 
  

# Hands on Workshop ( this will constitute the bulk of the time spent )

* We will start with basic data mining. To kick off, we will learn how to directly download public datasets using R. There are various sources and APIs available, but in this workshop, we will be utilizing cBioPortal
* Although this workshop is not an R course, we will cover the basics of the language and how to handle datasets, as well as create basic plots such as, 

    + Subset type of mutations.  
    + Aggregate by attributes such as types of mutations. 
    + Query ( eg. for specific variants ) 
    + Tabulate mutations ( eg. frequency tables ) . 
    + How to identify what could be potentially be pathogenic and cross reference it with existing data. 
    + How to take existing mutation data and predict possible actionable targets for either druggability, diagnostic or prognosis. 
    + You will also learn a few ways to plot the data. 
    + Basic plotting of your mutation table. 
    + How to generate figures to look for total burden across different chromosome/regions.
    + In addition we will cover the basics of RNAseq and how to do basic comparisons, pathway analysis, correlations as well identify outliers for single sample. 



