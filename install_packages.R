if (!require("BiocManager"))
  install.packages("BiocManager")


if(!require(devtools)) { install.packages("devtools") }

# if above fails please do not proceed. 

# Core packages for R Markdown

packages <- c("rmarkdown", "knitr", "htmltools")
packages_install <- c() # this will store any missing packages 


# Install missing packages
for(pkg in packages) {
  if(!require(pkg, character.only = TRUE, quietly = TRUE)) {
    packages_install <- c(packages_install, pkg)
  }
}

if ( is.null ( packages_install )){
  print ( "all good for now")
}


# core class 
core_class <- c( "limma",  "edgeR","DESeq2", "cBioPortalData", "ggplot2", 
                 "knitr", "kableExtra", "dplyr", "VennDiagram", "reshape2", 
                 "gridExtra", "ggrepel", "DT", "ggpubr", "qpcR","clusterProfiler", 
                 "DOSE", "org.Hs.eg.db", "openxlsx","patchwork", "ggpval", 
                 "tidyr", "ggridges", "pheatmap" )


# ignore warning from rgl. 

for(pkg in core_class) {
  if(!require(pkg, character.only = TRUE, quietly = TRUE)) {
    packages_install <- c(packages_install, pkg)
  }
}


if ( is.null ( packages_install )){
  print ( "all good ready for class")
}


# install final 


for(pkg in packages_install) {
  if(!require(pkg, character.only = TRUE, quietly = TRUE)) {
    print ( paste ("installing ", pkg) )
    
    tryCatch(
      {
        BiocManager::install(pkg, ask = FALSE, update = FALSE, quiet = TRUE,
                             dependencies=TRUE
        )
      },
      error = function(e) {
        message(paste("Cannot install", pkg))
      }
    )
    
# run above again and manually i    
  }else{
    print ( paste ("already installed ", pkg) )
  }
}


# final. 
if ( is.null ( packages_install )){
  print ( "all good ready for class")
}

# if bioc fails try building from source
devtools::install_github("waldronlab/cBioPortalData")
