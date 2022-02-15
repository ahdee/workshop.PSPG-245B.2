dim ( studies[ grepl("Breast Invasive Carcinoma", studies$name, ignore.case = T )  , ]  )

# X how would you get only samples labeled as 	Her2-positive breast tumors
mycaselist[ mycaselist$case_list_id == "brca_tcga_pub2015_her2pos", ]$case_ids
