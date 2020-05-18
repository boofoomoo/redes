#--- Stacking os anos ---

T_Anos <- rbind(Ano11, Ano12, Ano13, Ano14, Ano15, Ano16, Ano17, Ano18)

#--- Making the Matrix ------

mx_Anos <- crossprod(with(T_Anos, table(Diferenciador, Atrativo)))

freq_total <- as.data.frame(table(T_Anos$Atrativo))



#------------- Making the Igraph Object --------

ig_Anos <- delete.vertices(ig_Anos, which(strength(ig_Anos) < 8))

#weighted
ig_Anos <- graph_from_adjacency_matrix(mx_Anos,
                                       mode = "lower",
                                       weighted = TRUE,
                                       diag = FALSE )

ig_Anos <- delete.vertices(ig_Anos, which(strength(ig_Anos) < 8))

#total - lower
lig_Anos <- graph_from_adjacency_matrix(mx_Anos,
                                       mode = "lower",
                                       diag = FALSE )


# no loop & no multiple
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


compara <- data.frame(
        row.names = c("Weighted", "Lower", "Simplified"),
        Size = c(gsize(ig_Anos), gsize(lig_Anos), gsize(sig_Anos)),
        `Mean Degree` = c(mean(strength(ig_Anos)), mean(degree(lig_Anos)), mean(degree(sig_Anos)))
        
)

# Oh yeas, so the weighted approach works just fine, thanks plis :)









