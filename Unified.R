#--- Stacking os anos ---

T_Anos <- rbind(Ano11, Ano12, Ano13, Ano14, Ano15, Ano16, Ano17, Ano18)

#--- Making the Matrix ------

mx_Anos <- crossprod(with(T_Anos, table(Diferenciador, Atrativo)))

freq_total <- as.data.frame(table(T_Anos$Atrativo))



#------------- Making the Igraph Object --------


ig_Anos <- graph_from_adjacency_matrix(mx_Anos,
                                       mode = "lower",
                                       weighted = TRUE,
                                       diag = FALSE )



sig_Anos <- 
        graph_from_adjacency_matrix(mx_Anos, mode = ) %>%
        simplify(remove.multiple = TRUE, remove.loops = TRUE)

#---- Plotting ----

plot(ig_Anos,
     vertex.size = 3,
     vertex.color = "green",
     layout=layout_with_fr,
     vertex.label = NA,
     edge.color = adjustcolor("grey50", alpha = .3)
)


write.csv(mx_Anos, file = "~/redes/mx_Anos.csv")


#--- Unified Degrees---

t_degrees <- as.data.frame(degree(ig_Anos))


#---- Comparação dos modos de rede ----


#Fazer um ultimo teste com o modo lower sem os pesos, o que me daria uma 
# parte da matriz com os valores "reais" e sem atributos de peso.






