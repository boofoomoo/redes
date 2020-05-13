#------- Tables -------
library(tidyverse)
library(igraph)


# ------- PARA PARA PARA PARA, VAI TRABALHAR NAS PROPRIEDADES
# DA CRIAÇÃO DO OBJETO IGRAPH PRIMEIRO ----------



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



