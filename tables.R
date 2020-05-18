#------- Tables -------
library(tidyverse)
library(igraph)




# Degree Centrality
degrease <- plyr::rbind.fill(as.data.frame(t(degree(Itrip_11))),
                             as.data.frame(t(degree(Itrip_12))),
                             as.data.frame(t(degree(Itrip_13))),
                             as.data.frame(t(degree(Itrip_14))),
                             as.data.frame(t(degree(Itrip_15))),
                             as.data.frame(t(degree(Itrip_16))),
                             as.data.frame(t(degree(Itrip_17))),
                             as.data.frame(t(degree(Itrip_18)))
                             )



rownames(degrease) <-c ("2011",
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

tab_all <- cbind(tab_all ,Eigen = Eigen_all$vector)











