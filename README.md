# PSPG 245B: Requirements
  * It is important that you have the following installed on your computer before the workshop:
    * R > 4.0 
      + Note in Windows, please also install RTools: <a href="https://cran.r-project.org/bin/windows/Rtools/">link</a>
    * Rstudio
      <details>
        <summary>The following R packages </summary>
        
        ### Bioinformatics and Genomics
        1. **cBioPortalData** ~cgdsr~: An API interface to the Cancer Genomics Data Server (CGDS) which provides functions for accessing and retrieving data from the CGDS.
        2. **clusterProfiler**: Statistical analysis and visualization of functional profiles for genes and gene clusters.
        3. **DOSE**: package for Disease Ontology Semantic and Enrichment analysis.
        4. **org.Hs.eg.db**: Genome wide annotation for Human, primarily based on mapping using Entrez Gene identifiers.
        5. **qpcR**: functions for qPCR.  
        
        ### Data Visualization
        1. **ggplot2**: creating graphics, based on The Grammar of Graphics.
        2. **VennDiagram**: Generates Venn and Euler plots.
        3. **gridExtra**: Provides functions to arrange multiple grid-based plots on a page.
        4. **ggrepel**: Provides geoms for ggplot2 to repel overlapping text labels.
        5. **ggpubr**: 'ggplot2' Based Publication Ready Plots.
        6. **ggpval**: Add statistical test directly onto ggplots.
        7. **pheatmap**: Generate Heatmaps
        
        ### Data Manipulation and Analysis
        1. **dplyr**: Provides functions for the most common data manipulation.
        2. **reshape2**: Reshaping data.
        3. **DT**: Provides an interface to the JavaScript library DataTables to display R data as interactive HTML tables.
        4. **openxlsx**: interact with Excel
        
        ### Reporting and Documentation
        1. **knitr**: Provides a general-purpose tool for dynamic report generation in R using Literate Programming techniques.
        2. **kableExtra**: Provides complex tables with merged cells, and enhanced styles.

      </details>

    ## Package installation instructions.  
    <details> 
      <summary>Code</summary>
      
      ```
        
        if(!require(devtools)) { install.packages("devtools") }
        if(!require(BiocManager)) { install.packages("BiocManager") }

        # this version is now obsolete ( leaving here as reminder to always save local copies )  
       
        # devtools::install_github("cBioPortal/cgdsr")
        devtools::install_github("waldronlab/cBioPortalData")
        
        BiocManager::install(c( "cBioPortalData", "ggplot2", "knitr", "kableExtra", "dplyr", "VennDiagram", "reshape2", 
                              "gridExtra", "ggrepel", "DT", "ggpubr", "qpcR",
                              "clusterProfiler", "DOSE", "org.Hs.eg.db"))
    ```
    </details>


---
## Get Set Up: Ensuring a Smooth Start

* Install R and RStudio.
* Open RStudio and make sure R is running correctly.
* Install all the required R packages.
* __Remember to set the working directory to your source directory.__ Do this by clicking on the top menu:
  + Session -> Set Working Directory -> To Source File Location.
* Ensure that you receive your assigned TCGA ID, as each student will be provided with one. This ID will be used for applying the skills and knowledge you acquire during this workshop to create a report. Additionally, it's important to note that this same TCGA ID may be required for future workshops as well. 

---

# Overview
In this workshop, participants will gain a basic understanding of how to acquire and effectively utilize cancer genomic data. By the end of the course, attendees will be equipped to create a detailed R Markdown report for their designated TCGA ID. This report will feature graphical visualizations and basic statistical analysis, identifying potential mutations and/or gene variations through Exome/RNA sequencing. Key topics to be covered include:

## 1. Basic Bioinformatic Workflow: From Sample to Identifying Potentially Targetable Mutations

* Different types of sequencing, such as Whole Exome Sequencing (WES) and Whole Genome Sequencing (WGS), as well as the distinction between DNA and RNA sequencing.
* Standard pipelines for processing sequencing reads into actionable information.
* The scale of modern datasets like TCGA and their applications in healthcare.
* Understanding a standard genome: For example, an average genome may exhibit 4-5 million variants compared to the reference human genome. This leads to discussions about germline vs. somatic mutations, which are crucial in cancer studies.


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
  * This workshop will be entirely focused on the analysis of public datasets collected via an API in an R environment and analyzed in real-time.
  * The primary goal of this workshop is to provide you with the foundation to pursue further research projects. We hope that you will be able to use and expand upon what you learn here. In this 2-3 hour workshop we will attempt to: 
    + "discover" a general molecular profile for the TCGA Breast Cancer dataset.  
    + Each participant has been assigned a TCGA patient identifier for this dataset, and your task is to use the tools provided in this workshop to gather as much information as possible. At the end of the workshop, you should have a complete report for your assigned sample.

### While the assignment is an important aspect of this workshop, the primary objective is to spark your enthusiasm for bioinformatics and illustrate the depth of information that can be obtained even with a cursory examination of data. The possibilities are endless, so feel free to ask questions and embrace the learning experience. We encourage you to fully participate and take advantage of this. Contact information is provided in the class notes. 
  

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



