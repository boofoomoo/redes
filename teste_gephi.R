# --------- Teste Gephi ------

mean(degree(ig_Anos, loops = TRUE))
mean(degree(ig_Anos, loops = F))

mean(degree(smx_Anos, loops = TRUE))

mean(degree(smx_Anos, v = "Lago Negro" ,loops = TRUE))

#Betweenness---------------

view(estimate_betweenness(Itrip_18, directed = FALSE))

view(betweenness(Itrip_18, weights = NA, normalized = TRUE))

View(closeness(Itrip_18, weights = E(Itrip_18)$weights ,normalized = TRUE))

view(strength(sig_Anos))

#-----
library(rgexf)

test_adj <- as_adjacency_matrix(Itrip_18, sparse = FALSE)

write.csv(test_adj, file = "test_bet.csv", quote = TRUE, na = "", fileEncoding = "UTF-8")

view(as_adjacency_matrix(sig_Anos, sparse = FALSE))
#--


g <- make_ring(10)
g2 <- make_star(6, mode = "undirected")
edge_attr(g2, "weights") <- c(7,4,3,2,1) 
plot(g2, edge.width = E(g2)$weights)

View(closeness(g2, weights = E(g2)$weights))


# So, it turns out that igraph interprets the strength of an edge as distance. 
# I am not entirely sure why, but it seems that it assumes that the walk has
# all these "edges" to walk to go from A to B. I have two options here.
# Use the unweighted betweenness or the inverse of the weighted one.


# As for the closeness, it's just it uses the inverse of the mean shortest paths.
# So the higher the mean shortest path, the smaller the closeness 1/mean(shtpath)


