#--- Stacking os anos ---

T_Anos <- rbind(Ano11, Ano12, Ano13, Ano14, Ano15, Ano16, Ano17, Ano18)

#--- Making the Matrix ------

mx_Anos <- crossprod(with(T_Anos, table(Diferenciador, Atrativo)))


#------------- Making the Igraph Object --------

ig_Anos <- graph_from_adjacency_matrix(mx_Anos, mode = "Undirected")
head(ig_Anos)

#---- Plotting ----

plot(ig_Anos,
     vertex.size = 3,
     vertex.color = "green",
     layout=layout_with_fr,
     vertex.label = NA,
     edge.color = adjustcolor("grey50", alpha = .3)
)


write.csv(mx_Anos, file = "~/redes/mx_Anos.csv")



