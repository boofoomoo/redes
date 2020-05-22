#------- Tables -------
library(tidyverse)
library(igraph)




# Degree Centrality


# ----- Write a better method -------
degrease <- list(
  "2011" = degree(Itrip_11),
  "2012" = degree(Itrip_12),
  "2013" = degree(Itrip_13),
  "2014" = degree(Itrip_14),
  "2015" = degree(Itrip_15),
  "2016" = degree(Itrip_16),
  "2017" = degree(Itrip_17),
  "2018" = degree(Itrip_18)
)






#-------






#---------- The actual Metrics ---------
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

closen <- plyr::rbind.fill(  as.data.frame(t(closeness(Itrip_11, normalized = TRUE))),
                             as.data.frame(t(closeness(Itrip_12, normalized = TRUE))),
                             as.data.frame(t(closeness(Itrip_13, normalized = TRUE))),
                             as.data.frame(t(closeness(Itrip_14, normalized = TRUE))),
                             as.data.frame(t(closeness(Itrip_15, normalized = TRUE))),
                             as.data.frame(t(closeness(Itrip_16, normalized = TRUE))),
                             as.data.frame(t(closeness(Itrip_17, normalized = TRUE))),
                             as.data.frame(t(closeness(Itrip_18, normalized = TRUE)))
)



rownames(closen) <- c("2011",
                        "2012", 
                        "2013", 
                        "2014", 
                        "2015", 
                        "2016", 
                        "2017", 
                        "2018")


closen <- as.data.frame(t(closen))




# Betweenness Centrality


bituin <- plyr::rbind.fill(  as.data.frame(t(betweenness(Itrip_11))),
                             as.data.frame(t(betweenness(Itrip_12))),
                             as.data.frame(t(betweenness(Itrip_13))),
                             as.data.frame(t(betweenness(Itrip_14))),
                             as.data.frame(t(betweenness(Itrip_15))),
                             as.data.frame(t(betweenness(Itrip_16))),
                             as.data.frame(t(betweenness(Itrip_17))),
                             as.data.frame(t(betweenness(Itrip_18)))
)



rownames(bituin) <- c("2011",
                      "2012", 
                      "2013", 
                      "2014", 
                      "2015", 
                      "2016", 
                      "2017", 
                      "2018")


bituin <- as.data.frame(t(bituin))




# Bonaich POwer

bona <- plyr::rbind.fill(  as.data.frame(t(power_centrality(Itrip_11, exponent = .5, sparse = FALSE))),
                             as.data.frame(t(power_centrality(Itrip_12, exponent = .5, sparse = FALSE))),
                             as.data.frame(t(power_centrality(Itrip_13, exponent = .5, sparse = FALSE))),
                             as.data.frame(t(power_centrality(Itrip_14, exponent = .5, sparse = FALSE))),
                             as.data.frame(t(power_centrality(Itrip_15, exponent = .5, sparse = FALSE))),
                             as.data.frame(t(power_centrality(Itrip_16, exponent = .5, sparse = FALSE))),
                             as.data.frame(t(power_centrality(Itrip_17, exponent = .5, sparse = FALSE))),
                             as.data.frame(t(power_centrality(Itrip_18)))
)



rownames(bona) <- c("2011",
                      "2012", 
                      "2013", 
                      "2014", 
                      "2015", 
                      "2016", 
                      "2017", 
                      "2018")


bona <- as.data.frame(t(bona))






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











