


k3 <- function ( df ){
  
df  %>% kable(format = "html"  ) %>%
 kable_classic(full_width = F) %>% print

  
}

k2 <- function (df, tl="", ln = 15){
    #kable( df , format = "html", booktabs = T, caption = tl, table.attr = "style='width:30%;'") %>%
    #kable_styling(full_width = F, bootstrap_options = c("striped", "hover", "condensed"))
  if ( any ( colnames ( df ) == "description" ) ){
  df$description = gsub ( "<A.*A>|<a.*a>", "", df$description)
  }
  DT::datatable( df %>% mutate_if(is.numeric, round, digits = 3 ) %>% data.frame() , rownames = F, 
                 filter= list ( position="top", clear = FALSE )  
                 , extensions = c ( 'Buttons' ) 
               
                 , options = list(dom = 'Bfrtip', buttons = c('copy', 'csv', 'excel', 'pdf', 'print')
                                  , autoWidth = F
                                  , scrollX=T, className = 'dt-left'
                                  , pageLength = ln
                                  
                 ), 
                 caption = tl
                 )
  
  
}

samples = c("TCGA-C8-A3M7-01","TCGA-GM-A2D9-01","TCGA-BH-A1FL-01", "TCGA-E2-A14Z-01","TCGA-BH-A1FC-01","TCGA-AC-A2QJ-01", "TCGA-EW-A1P8-01","TCGA-E2-A1LE-01","TCGA-E2-A1LK-01","TCGA-AC-A2FE-01")

url = 'https://search.vumc.org/?query='
raw = 0 
if ( raw == 1){
    cosmic.70 = "./external/hg19_cosmic70.txt"
    
    cosmic.70 = read.table(cosmic.70, header=F,sep="\t",stringsAsFactors = FALSE,na.strings=".",  quote = "")
    
    colnames ( cosmic.70) = c("chr","start","end","ref","alt","description" )
    
    
    cosmic.70$igv = paste ( cosmic.70$chr, cosmic.70$start, cosmic.70$end, cosmic.70$ref, cosmic.70$alt)
    
    
    cancer.list = read.csv("https://www.dropbox.com/s/naheek0wicegf77/cancer.list.csv?dl=1")
    
    
    drug  = read.csv( "./external/civic.txt" )
    
    
    
    
    drug <- read.xlsx("./external/civic.xlsx" , sheet="civic", colNames = TRUE)
    drug$match = paste ( drug$gene, drug$variant)
    
    saveRDS( list (cosmic.70=cosmic.70, cancer.list = cancer.list, drug = drug, 
                   studies=studies, mycaselist=mycaselist , mygeneticprofile=mygeneticprofile, mutations = mutations
                   
                   ), "workshop.rds")
    
}else{

temp = readRDS("workshop.rds")
cosmic.70 = temp$cosmic.70
cancer.list = temp$cancer.list
drug = temp$drug
cancer.gene = as.character ( cancer.list$gene )
drug.up = read.csv("drug.up.csv")
counts = readRDS("Breast_cell_2015")
colnames ( counts ) = gsub ( "-01", "", colnames ( counts ))
data = readRDS("freeze_2025")
}




venn.this <- function (data1, cp = c("#a6cee3","#fdbf6f","#b2df8a"), type= 3, dgg=0, title1 = "", title2="", cexL = 3, cexC=3, titlesize=25, titlecol= "steelblue" ) {
    
    if ( type==3){
        cat = names (data1 )
        a1 = data.table(unlist ( data1[1] )  )
        a2 = data.table(unlist ( data1[2] ) )
        a3 = data.table(unlist ( data1[3] ) )
        
        n12 = fintersect(a1,a2)
        n23 = fintersect(a2,a3)
        n13 = fintersect(a1,a3)
        n123 = fintersect(n12,a3)
        grid.newpage()
        v3= draw.triple.venn( 
            length ( a1$V1), 
            length ( a2$V1), 
            length ( a3$V1), 
            length (n12$V1), 
            length ( n23$V1), 
            length ( n13$V1), 
            length ( n123$V1), 
            category = c( cat[1], cat[2], cat[3] ), 
            fill = cp, 
            rotation.degree = dgg, 
            euler           = F,
            scaled          = FALSE
            , cex = cexL
            , cat.cex = cexC
            #,cat.pos         = c(0, 0, 0)
        )
        
        #v3 = grid.arrange(gTree(children=v3), top=textGrob(title1, gp=gpar(fontsize=titlesize, col=titlecol) )
        #                         , bottom=textGrob(title2, gp=gpar(fontsize=titlesize, col=titlecol) ))
        
        # get all intersection and union 
        
        n.all = n123$V1
        # unique to a1 
        u.a1 = setdiff(a1$V1, unique ( c(a2$V1, a3$V1) ) )
        u.a2 = setdiff(a2$V1, unique ( c(a1$V1, a3$V1) ) )
        u.a3 = setdiff(a3$V1, unique ( c(a1$V1, a2$V1) ) )
        
        v3 =  as.ggplot( grobTree(v3) ) + ggtitle ( title1 )
        
        main.cmp =  qpcR:::cbind.na ( sort ( u.a1, decreasing=T) 
                                      , sort ( u.a2, decreasing=T) 
                                      , sort ( u.a3, decreasing=T) 
                                      , sort ( n.all, decreasing=T) 
                                      
        )
        main.cmp = data.frame ( main.cmp , stringsAsFactors = F)
        main.cmp[is.na(main.cmp)] <-  '.' 
        
        
        colnames ( main.cmp) = c( cat[1], cat[2], cat[3], "all.three" )
        
        
        return ( list ( venn = v3, main.cmp=main.cmp ) )
        
    } else if ( type == 2){
        
        grid.newpage()
        names.cat = names ( data1)
        ## data1 is one row with n1, n2 and int as colnames
        v3 = draw.pairwise.venn(             area1           = data1[,1],
                                             area2           = data1[,2],
                                             cross.area      = data1[,3],
                                             category        = c(names.cat[1], names.cat[2]),
                                             fill            = cp[1:2],
                                             lty             = "blank",
                                             cex             = 2,
                                             cat.cex         = 2,
                                             cat.pos         = c(180, 160),
                                             cat.dist        = - .03,
                                             #cat.just        = list(c(-1, -1), c(1, 1)),
                                             ext.pos         = 30,
                                             ext.dist        = -0.05,
                                             ext.length      = 0.85,
                                             ext.line.lwd    = 2,
                                             ext.line.lty    = "dashed", 
                                             rotation.degree = dgg # this is to flip left to right cat
        )
        
     
        
        
        
    }
    
    
}

display_venn <- function(x, ...){
  library(VennDiagram)
  grid.newpage()
  venn_object <- venn.diagram(x, filename = NULL, disable.logging = TRUE, ...)
  grid.draw(venn_object)
}






wtest <- function ( x) {
  wp = wilcox.test(as.numeric ( x[last_j] ) , as.numeric ( x[last_b] ), alternative = "two.sided")
  wp = wp$p.value
  logfc = mean ( as.numeric ( x[last_j] ) ) - mean ( as.numeric ( x[last_b] ) )
  her2_mean = mean ( as.numeric ( x[last_j] ) ) 
  base_mean = mean ( as.numeric ( x[last_b] ) ) 
  all_mean = mean ( as.numeric ( x ) ) 
  c(wp, logfc, her2_mean,base_mean, all_mean )
}

### for the paper only 
perform_fisher_test <- function(mutations_df, gene) {
  # Create contingency table
  cont_table <- table(
    mutations_df$hugoGeneSymbol == gene,
    mutations_df$label == "idc"
  )
  
  # Perform Fisher's test
  test_result <- fisher.test(cont_table)
  
  # Return results
  return(c(
    pvalue = test_result$p.value,
    odds_ratio = test_result$estimate
  ))
}

analyze_all_genes <- function(mutations_df) {
 
  genes <- unique(mutations_df$hugoGeneSymbol)
  
  # Apply Fisher's test to each gene
  results <- genes %>%
    tibble(hugoGeneSymbol = .) %>%
    rowwise() %>%
    mutate(
      test_results = list(perform_fisher_test(mutations_df, hugoGeneSymbol)),
      pvalue = test_results[1],
      odds_ratio = test_results[2]
    ) %>%
    ungroup() 
  
  results$fdr = p.adjust(results$pvalue, method = "fdr")
  results = results[ order ( results$pvalue), ]
 
  
  results$odds_ratio = ifelse(
    results$odds_ratio < 1,
    round(-1/results$odds_ratio, 2),  # Negative for ILC enrichment
    round(results$odds_ratio, 2)      # Positive for IDC enrichment
  )
  results$sig = ifelse ( results$fdr < .05, "*", "ns")
  
  
  return(results)
}
#
# Coefficient of Variation
cov <- function(x){
  x <- sd(x)/ mean ( abs ( x)  ) * 100
  return (x)
}


plot_pca <- function ( key_c,  m.cpm, ccc ){
  
  set.seed(123)
  
  
  # run cluster analysis to see how well the experiment looks from a global perspective. 
  
  
  distuse = "euclidean"
  linkuse = "ward.D2"
  
  
  key_c$tube = key_c$patientId
  all.equal(names(m.cpm), key_c$tube ) 
  
  
  sd <- apply (m.cpm, 1,  function(x) cov(x)  )
  
  p = c(.1,.2,.3,.4,.5,.6, .7, .75, .8, .9,.95)
  q <- quantile (as.numeric ( sd ), probs = p , na.rm =T )
  
  # correct for variance
  get.p = "95%"
  get.p = as.numeric ( q[get.p] )
  sd2 = sd[ !is.na(sd) & sd >get.p  ]
  
  m.cpm = m.cpm [ row.names ( m.cpm) %in% names( sd2), ]
  m.cpm = m.cpm[ , key_c$tube]
  
  
  pca_results <- prcomp(t(m.cpm), scale = TRUE)
  
  
  # Calculate variance explained for axis labels
  var_explained <- round((pca_results$sdev^2 / sum(pca_results$sdev^2)) * 100, 1)
  
  # Create the plot
  plot(pca_results$x[,1], pca_results$x[,2],
       xlab = paste0("PC1 (", var_explained[1], "%)"),
       ylab = paste0("PC2 (", var_explained[2], "%)"),
       main = "Uncorrected PCA",
       type = "n") 
  
  # Add points colored by group
  points(pca_results$x[,1], pca_results$x[,2],
         col = ccc[as.numeric(as.factor(key_c$label))],
         pch = as.numeric(as.factor(key_c$label)),
         cex = 2)
  
  # Add legend for groups
  legend("topright", 
         legend = levels(as.factor(key_c$label)),
         col = ccc[1:length(unique(key_c$label))],
         pch = 16)
  
  return ( recordPlot()  )
  
}


# global variables 
paper_gene <- c(
  "CDH1", "PIK3CA", "PTEN", "TP53", "FOXA1", "GATA3", "RB1", "MAP2K4", "CCNE1",
  "MYC", "CDK4", "FGFR1", "ERBB2", "EGFR"
  
  # "TBX3", "AKT1", "AKT2", "AKT3", "STAT3"
)
