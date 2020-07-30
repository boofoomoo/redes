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

closen <- plyr::rbind.fill(  as.data.frame(t(closeness(Itrip_11, normalized = TRUE, weights = NA))),
                             as.data.frame(t(closeness(Itrip_12, normalized = TRUE, weights = NA))),
                             as.data.frame(t(closeness(Itrip_13, normalized = TRUE, weights = NA))),
                             as.data.frame(t(closeness(Itrip_14, normalized = TRUE, weights = NA))),
                             as.data.frame(t(closeness(Itrip_15, normalized = TRUE, weights = NA))),
                             as.data.frame(t(closeness(Itrip_16, normalized = TRUE, weights = NA))),
                             as.data.frame(t(closeness(Itrip_17, normalized = TRUE, weights = NA))),
                             as.data.frame(t(closeness(Itrip_18, normalized = TRUE, weights = NA)))
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


bituin <- plyr::rbind.fill(  as.data.frame(t(betweenness(Itrip_11, normalized = TRUE, weights = NA))),
                             as.data.frame(t(betweenness(Itrip_12, normalized = TRUE, weights = NA))),
                             as.data.frame(t(betweenness(Itrip_13, normalized = TRUE, weights = NA))),
                             as.data.frame(t(betweenness(Itrip_14, normalized = TRUE, weights = NA))),
                             as.data.frame(t(betweenness(Itrip_15, normalized = TRUE, weights = NA))),
                             as.data.frame(t(betweenness(Itrip_16, normalized = TRUE, weights = NA))),
                             as.data.frame(t(betweenness(Itrip_17, normalized = TRUE, weights = NA))),
                             as.data.frame(t(betweenness(Itrip_18, normalized = TRUE, weights = NA)))
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




#write.csv(degrease, file = "metricas.csv", quote = TRUE, na = "", fileEncoding = "UTF-8")
write.csv(stronk, file = "stronk.csv", quote = TRUE, na = "", fileEncoding = "UTF-8")
  write.csv(closen, file = "closen.csv", quote = TRUE, na = "", fileEncoding = "UTF-8")
write.csv(bituin, file = "bituin.csv", quote = TRUE, na = "", fileEncoding = "UTF-8")
write.csv(bona, file = "bona.csv", quote = TRUE, na = "", fileEncoding = "UTF-8")





#---------- Making some metrics for the whole period ---------


tab_all <- data.frame(Degree = degree(ig_Anos),
                      W_degree = strength(ig_Anos),
                      Closeness = closeness(ig_Anos, normalized = TRUE, weights = NA),
                      Betweenness1 = betweenness(ig_Anos, weights = NA),
                      Bonacich = power_centrality(ig_Anos, exponent = 1, sparse = FALSE),
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

global$`2011`[3] <- edge_density(simplify(Itrip_11))
global$`2012`[3] <- edge_density(simplify(Itrip_12))
global$`2013`[3] <- edge_density(simplify(Itrip_13))
global$`2014`[3] <- edge_density(simplify(Itrip_14))
global$`2015`[3] <- edge_density(simplify(Itrip_15))
global$`2016`[3] <- edge_density(simplify(Itrip_16))
global$`2017`[3] <- edge_density(simplify(Itrip_17))
global$`2018`[3] <- edge_density(simplify(Itrip_18))



#---

global <- rbind(global, c(19, 30, 38, 41, 47, 51, 56, 64))



rownames(global) <- c("Diameter", "Size", "Density", "n_Vertex")

global <- t(global)

cluster_coef <- data.frame("2011" = transitivity(Itrip_11, type = "global"),
                           "2012" =  transitivity(Itrip_12, type = "global"),
                           "2013" = transitivity(Itrip_13, type = "global"),
                           "2014" =  transitivity(Itrip_14, type = "global"),
                           "2015" = transitivity(Itrip_15, type = "global"),
                           "2016" = transitivity(Itrip_16, type = "global"),
                           "2017" =  transitivity(Itrip_17, type = "global"),
                           "2018" = transitivity(Itrip_18, type = "global")
                           )

#--- Community detection ----


random_walk <-
  cluster_walktrap(
    ig_Anos,
    weights = E(ig_Anos)$weight,
    steps = 3,
    modularity = TRUE,
    membership = TRUE
  )

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

#-----

boxplot(rowSums(stronk, na.rm = TRUE))$out


All2 <- read_excel(
  "Results/All2.xlsx",
  sheet = "Planilha1", col_names = FALSE,
  col_types = c("numeric")
)
All2 <- All2*100

boxplot(All2)$out

#--------- Testing metrics --------

g <- sample_gnp(10, 3/10)
view(betweenness(g, normalized = TRUE))

plot(g)

#----- Teste de Hipóteses kikiki ------


View(strength(Itrip_18, vids = "Parque Gaúcho"))

view(distances(ig_Anos, v = "Parque Gaúcho"))


#--

View(shortest_paths(ig_Anos, from = "A Mina", output = "vpath"))


view(get.edge.ids())

# Trynna create a ranking table -----------


# Betweenness--

rank_between <- data.frame("2011" = rank(-bituin$`2011`, ties.method = "random", na.last = "keep"),
                     "2012" = rank(-bituin$`2012`, ties.method = "random", na.last = "keep"),
                     "2013" = rank(-bituin$`2013`, ties.method = "random", na.last = "keep"),
                     "2014" = rank(-bituin$`2014`, ties.method = "random", na.last = "keep"),
                     "2015" = rank(-bituin$`2015`, ties.method = "random", na.last = "keep"),
                     "2016" = rank(-bituin$`2016`, ties.method = "random", na.last = "keep"),
                     "2017" = rank(-bituin$`2017`, ties.method = "random", na.last = "keep"),
                     "2018" = rank(-bituin$`2018`, ties.method = "random", na.last = "keep"),
                     row.names = row.names(bituin),
                     check.rows = TRUE
                     )


# Weighted Degree--
rank_stronk <- data.frame("2011" = rank(-stronk$`2011`, ties.method = "random", na.last = "keep"),
                           "2012" = rank(-stronk$`2012`, ties.method = "random", na.last = "keep"),
                           "2013" = rank(-stronk$`2013`, ties.method = "random", na.last = "keep"),
                           "2014" = rank(-stronk$`2014`, ties.method = "random", na.last = "keep"),
                           "2015" = rank(-stronk$`2015`, ties.method = "random", na.last = "keep"),
                           "2016" = rank(-stronk$`2016`, ties.method = "random", na.last = "keep"),
                           "2017" = rank(-stronk$`2017`, ties.method = "random", na.last = "keep"),
                           "2018" = rank(-stronk$`2018`, ties.method = "random", na.last = "keep"),
                           row.names = row.names(stronk),
                           check.rows = TRUE
)



# Closeness--


rank_close <- data.frame("2011" = rank(-closen$`2011`, ties.method = "random", na.last = "keep"),
                           "2012" = rank(-closen$`2012`, ties.method = "random", na.last = "keep"),
                           "2013" = rank(-closen$`2013`, ties.method = "random", na.last = "keep"),
                           "2014" = rank(-closen$`2014`, ties.method = "random", na.last = "keep"),
                           "2015" = rank(-closen$`2015`, ties.method = "random", na.last = "keep"),
                           "2016" = rank(-closen$`2016`, ties.method = "random", na.last = "keep"),
                           "2017" = rank(-closen$`2017`, ties.method = "random", na.last = "keep"),
                           "2018" = rank(-closen$`2018`, ties.method = "random", na.last = "keep"),
                           row.names = row.names(closen),
                           check.rows = TRUE
)


# CSV -- 

write.csv(rank_between, file = "rank_between.csv", quote = TRUE, na = "", fileEncoding = "UTF-8")
write.csv(rank_close, file = "rank_close.csv", quote = TRUE, na = "", fileEncoding = "UTF-8")
write.csv(rank_stronk, file = "rank_stronk.csv", quote = TRUE, na = "", fileEncoding = "UTF-8")






