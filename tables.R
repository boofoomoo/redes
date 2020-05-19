#------- Tables -------
library(tidyverse)
library(igraph)




# Degree Centrality


# ----- Write a better method -------
degrease <- data.frame("2011" = degree(Itrip_11),
                       "2012" = degree(Itrip_12),
                       "2013" = degree(Itrip_13),
                       "2014" = degree(Itrip_14),
                       "2015" = degree(Itrip_15),
                       "2016" = degree(Itrip_16),
                       "2017" = degree(Itrip_17),
                       "2018" = degree(Itrip_18),
                       row.names = row.names(mx_Anos),
                       check.rows = TRUE
                       )

#-------






#------------------------------------------------------
degrease <- plyr::rbind.fill(as.data.frame(t(degree(Itrip_11))),
                             as.data.frame(t(degree(Itrip_12))),
                             as.data.frame(t(degree(Itrip_13))),
                             as.data.frame(t(degree(Itrip_14))),
                             as.data.frame(t(degree(Itrip_15))),
                             as.data.frame(t(degree(Itrip_16))),
                             as.data.frame(t(degree(Itrip_17))),
                             as.data.frame(t(degree(Itrip_18)))
                             )



rownames(degrease) <- c("2011",
                        "2012", 
                        "2013", 
                        "2014", 
                        "2015", 
                        "2016", 
                        "2017", 
                        "2018")


degrease <- as.data.frame(t(degrease))




# Closness Centrality





# Betweenness Centrality





# Bonaich POwer






# Eigenvector Centrality





#---------- Making some metrics for the whole period ---------


tab_all <- data.frame(Degree = degree(ig_Anos),
                      W_degree = strength(ig_Anos),
                      Closeness = closeness(ig_Anos, normalized = TRUE),
                      Betweenness = betweenness(ig_Anos, directed = FALSE),
                      Bonacich = power_centrality(ig_Anos, exponent = 0.5, sparse = FALSE),
                      check.rows = TRUE)

Eigen_all <- eigen_centrality(ig_Anos, scale = TRUE)

tab_all <- cbind(tab_all, Eigen = Eigen_all$vector)

write.csv(tab_all, file = "metrics_all.csv")











