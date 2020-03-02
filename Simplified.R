#---- SImplified Measures -----

sItrip_18 <- simplify(graph_from_adjacency_matrix(Trip_18, mode = "Undirected"))
sItrip_17 <- simplify(graph_from_adjacency_matrix(Trip_17, mode = "Undirected"))
sItrip_16 <- simplify(graph_from_adjacency_matrix(Trip_16, mode = "Undirected"))
sItrip_15 <- simplify(graph_from_adjacency_matrix(Trip_15, mode = "Undirected"))
sItrip_14 <- simplify(graph_from_adjacency_matrix(Trip_14, mode = "Undirected"))
sItrip_13 <- simplify(graph_from_adjacency_matrix(Trip_13, mode = "Undirected"))
sItrip_12 <- simplify(graph_from_adjacency_matrix(Trip_12, mode = "Undirected"))
sItrip_11 <- simplify(graph_from_adjacency_matrix(Trip_11, mode = "Undirected"))

sdeg2011 <- as.data.frame(t(degree(sItrip_11)))
sdeg2012 <- as.data.frame(t(degree(sItrip_12)))
sdeg2013 <- as.data.frame(t(degree(sItrip_13)))
sdeg2014 <- as.data.frame(t(degree(sItrip_14)))
sdeg2015 <- as.data.frame(t(degree(sItrip_15)))
sdeg2016 <- as.data.frame(t(degree(sItrip_16)))
sdeg2017 <- as.data.frame(t(degree(sItrip_17)))
sdeg2018 <- as.data.frame(t(degree(sItrip_18)))


sdegrees <- plyr::rbind.fill(sdeg2011, sdeg2012, sdeg2013, sdeg2014, sdeg2015, sdeg2016, sdeg2017, sdeg2018)


rownames(sdegrees) <- c("2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018")


#--- Stacking os anos ---

T_Anos <- rbind(Ano11, Ano12, Ano13, Ano14, Ano15, Ano16, Ano17, Ano18)

#--- Making the Matrix ------

mx_Anos <- crossprod(with(T_Anos, table(Diferenciador, Atrativo)))

freq_total <- as.data.frame(table(T_Anos$Atrativo))



#------------- Making the Igraph Object --------
smx_Anos <- simplify(ig_Anos, remove.loops = T, remove.multiple = T)


st_degrees <- as.data.frame(degree(smx_Anos))
