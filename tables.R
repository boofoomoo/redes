#------- Tables -------
library(tidyverse)
library(igraph)






#---------- The actual Metrics ---------


# Degree Centrality -----



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

# Weighted Degreee ---------


stronk <- plyr::rbind.fill(as.data.frame(t(strength(Itrip_11))),
                             as.data.frame(t(strength(Itrip_12))),
                             as.data.frame(t(strength(Itrip_13))),
                             as.data.frame(t(strength(Itrip_14))),
                             as.data.frame(t(strength(Itrip_15))),
                             as.data.frame(t(strength(Itrip_16))),
                             as.data.frame(t(strength(Itrip_17))),
                             as.data.frame(t(strength(Itrip_18)))
)



rownames(stronk) <- c("2011",
                        "2012", 
                        "2013", 
                        "2014", 
                        "2015", 
                        "2016", 
                        "2017", 
                        "2018")


stronk <- as.data.frame(t(stronk))











# Closness Centrality ------

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




# Betweenness Centrality ------


bituin <- plyr::rbind.fill(  as.data.frame(t(betweenness(Itrip_11, normalized = TRUE))),
                             as.data.frame(t(betweenness(Itrip_12, normalized = TRUE))),
                             as.data.frame(t(betweenness(Itrip_13, normalized = TRUE))),
                             as.data.frame(t(betweenness(Itrip_14, normalized = TRUE))),
                             as.data.frame(t(betweenness(Itrip_15, normalized = TRUE))),
                             as.data.frame(t(betweenness(Itrip_16, normalized = TRUE))),
                             as.data.frame(t(betweenness(Itrip_17, normalized = TRUE))),
                             as.data.frame(t(betweenness(Itrip_18, normalized = TRUE)))
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




# Bonaich POwer -------

bona <- plyr::rbind.fill(  as.data.frame(t(power_centrality(Itrip_11, exponent = .5, sparse = FALSE))),
                             as.data.frame(t(power_centrality(Itrip_12, exponent = .5, sparse = FALSE))),
                             as.data.frame(t(power_centrality(Itrip_13, exponent = .5, sparse = FALSE))),
                             as.data.frame(t(power_centrality(Itrip_14, exponent = .5, sparse = FALSE))),
                             as.data.frame(t(power_centrality(Itrip_15, exponent = .5, sparse = FALSE))),
                             as.data.frame(t(power_centrality(Itrip_16, exponent = .5, sparse = FALSE))),
                             as.data.frame(t(power_centrality(Itrip_17, exponent = .5, sparse = FALSE))),
                             as.data.frame(t(power_centrality(Itrip_18, exponent = .5, sparse = FALSE)))
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






# Eigenvector Centrality -------









# ------------ Exporting Tables -------------




write.csv(degrease, file = "degrease.csv")
write.csv(stronk, file = "stronk.csv")
write.csv(closen, file = "closen.csv")
write.csv(bituin, file = "bituin.csv")
write.csv(bona, file = "bona.csv")





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



#------ Global metrics ------


global <- plyr::rbind.fill(as.data.frame(t(diameter(Itrip_11))),
                           as.data.frame(t(diameter(Itrip_12))),
                           as.data.frame(t(diameter(Itrip_13))),
                           as.data.frame(t(diameter(Itrip_14))),
                           as.data.frame(t(diameter(Itrip_15))),
                           as.data.frame(t(diameter(Itrip_16))),
                           as.data.frame(t(diameter(Itrip_17))),
                           as.data.frame(t(diameter(Itrip_18))))



rownames(global) <- c("2011",
                    "2012", 
                    "2013", 
                    "2014", 
                    "2015", 
                    "2016", 
                    "2017", 
                    "2018")


global <- as.data.frame(t(global))



#---

global <- rbind(global, 1)

global$`2011`[2] <- gsize(Itrip_11)
global$`2012`[2] <- gsize(Itrip_12)
global$`2013`[2] <- gsize(Itrip_13)
global$`2014`[2] <- gsize(Itrip_14)
global$`2015`[2] <- gsize(Itrip_15)
global$`2016`[2] <- gsize(Itrip_16)
global$`2017`[2] <- gsize(Itrip_17)
global$`2018`[2] <- gsize(Itrip_18)


#---
global <- rbind(global, 1)

global$`2011`[3] <- edge_density(Itrip_11)
global$`2012`[3] <- edge_density(Itrip_12)
global$`2013`[3] <- edge_density(Itrip_13)
global$`2014`[3] <- edge_density(Itrip_14)
global$`2015`[3] <- edge_density(Itrip_15)
global$`2016`[3] <- edge_density(Itrip_16)
global$`2017`[3] <- edge_density(Itrip_17)
global$`2018`[3] <- edge_density(Itrip_18)



#---

global <- rbind(global, c(19, 30, 38, 41, 47, 51, 56, 64))



rownames(global) <- c("Diameter", "Size", "Density", "n_Vertex")

global <- t(global)


#--- Community detection ----


random_walk <- cluster_walktrap(ig_Anos, weights = E(ig_Anos)$weight, steps = 3, modularity = TRUE, membership = TRUE)

view(membership(random_walk))

#--

edge_bet <- cluster_edge_betweenness(ig_Anos, weights = E(ig_Anos)$weight,
                                     directed = FALSE, edge.betweenness = TRUE, merges = TRUE,
                                     bridges = TRUE, modularity = TRUE, membership = TRUE)

view(membership(edge_bet))

#--


mod_new <- cluster_leading_eigen(
    ig_Anos,
    steps = 1,
    start = NULL,
    options = arpack_defaults,
    callback = NULL,
    extra = NULL,
    env = parent.frame()
  )



view(membership(mod_new))


sizes(random_walk)

plot_dendrogram(mod_new)


