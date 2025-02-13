

tcga = c  ( ilc, idc )

g = c( "CDH1" , "PTEN" ,  "TP53" ,  "FOXA1" , "GATA3", "MYC", "ERRB2")

m1 = mutations[ mutations$hugoGeneSymbol %in% g , ]
m3 = m1[ m1$drug %in% drug$match , ]

m2 = cna[cna$patientId %in% m3$patientId & cna$hugoGeneSymbol %in% g, ]

length ( unique ( m2$patientId))

freq =  data.frame ( table( m1[m1$patientId %in% unique ( m2$patientId), ]$patientId ))
freq = freq[ order ( freq$Freq, decreasing = T), ]

f1 = freq 
f1$Var1 = as.character(f1$Var1)

cat(paste(as.character(f1$Var1), collapse = "\n"))

freq =  data.frame ( table( m2$patientId ))
freq = freq[ order ( freq$Freq, decreasing = T), ]


head ( freq, 20 )