#
library(tidyverse)
library(readxl)
library(igraph)
load("~/redes/.RData")
#

Ano11 <- read_excel("data/AnoaAno.xlsx", sheet = "2011")
Ano11 <- select(Ano11, -'Ano')
mx_2011 <- crossprod(with(Ano11, table(Diferenciador, Atrativo)))


Ano12 <- read_excel("data/AnoaAno.xlsx", sheet = "2012")
Ano12 <- select(Ano12, -'Ano')
mx_2012 <- crossprod(with(Ano12, table(Diferenciador, Atrativo)))


Ano13 <- read_excel("data/AnoaAno.xlsx", sheet = "2013")
Ano13 <- select(Ano13, -'Ano')
mx_2013 <- crossprod(with(Ano13, table(Diferenciador, Atrativo)))


Ano14 <- read_excel("data/AnoaAno.xlsx", sheet = "2014")
Ano14 <- select(Ano14, -'Ano')
mx_2014 <- crossprod(with(Ano14, table(Diferenciador, Atrativo)))


Ano15 <- read_excel("data/AnoaAno.xlsx", sheet = "2015")
Ano15 <- select(Ano15, -'Ano')
mx_2015 <- crossprod(with(Ano15, table(Diferenciador, Atrativo)))


Ano16 <- read_excel("data/AnoaAno.xlsx", sheet = "2016")
Ano16 <- select(Ano16, -'Ano')
mx_2016 <- crossprod(with(Ano16, table(Diferenciador, Atrativo)))


Ano17 <- read_excel("data/AnoaAno.xlsx", sheet = "2017")
Ano17 <- select(Ano17, -'Ano')
mx_2017 <- crossprod(with(Ano17, table(Diferenciador, Atrativo)))


Ano18 <- read_excel("data/AnoaAno.xlsx", sheet = "2018")
Ano18 <- select(Ano18, -'Ano')
mx_2018 <- crossprod(with(Ano18, table(Diferenciador, Atrativo)))


Ano19 <- read_excel("data/AnoaAno.xlsx", sheet = "2019")
Ano19 <- select(Ano19, -'Ano')
mx_2019 <- crossprod(with(Ano19, table(Diferenciador, Atrativo)))


#---------------- Matrizes csv ---------------

mx_2011 <- as.data.frame(mx_2011)
write.csv(mx_2011, file = "Trip_11.csv")


mx_2012 <- as.data.frame(mx_2012)
write.csv(mx_2012, file = "Trip_12.csv")


mx_2013 <- as.data.frame(mx_2013)
write.csv(mx_2013, file = "Trip_13.csv")


mx_2014 <- as.data.frame(mx_2014)
write.csv(mx_2014, file = "Trip_14.csv")


mx_2015 <- as.data.frame(mx_2015)
write.csv(mx_2015, file = "Trip_15.csv")


mx_2016 <- as.data.frame(mx_2016)
write.csv(mx_2016, file = "Trip_16.csv")


mx_2017 <- as.data.frame(mx_2017)
write.csv(mx_2017, file = "Trip_17.csv")


mx_2018 <- as.data.frame(mx_2018)
write.csv(mx_2018, file = "Trip_18.csv")


mx_2019 <- as.data.frame(mx_2019)
write.csv(mx_2019, file = "Trip_19.csv")




#------------- Making the Igraph Object --------

#2018---

Trip_18 <- read_excel("~/redes/data/Trip_18.xlsx")
Trip_18 <- Trip_18[,-1]
Trip_18 <- as.matrix(Trip_18)
rownames(Trip_18) <- colnames(Trip_18)


Itrip_18 <- graph_from_adjacency_matrix(Trip_18,
                                        mode = "lower",
                                        weighted = TRUE,
                                        diag = FALSE )
#Itrip_18 <- delete.vertices(Itrip_18, degree(Itrip_18) == 0)
head(Itrip_18)



#2011---


Trip_11 <- read_excel("~/redes/data/Trip_11.xlsx")
Trip_11 <- Trip_11[,-1]
Trip_11 <- as.matrix(Trip_11)
rownames(Trip_11) <- colnames(Trip_11)


Itrip_11 <- graph_from_adjacency_matrix(Trip_11,
                                        mode = "lower",
                                        weighted = TRUE,
                                        diag = FALSE )
#Itrip_11 <- delete.vertices(Itrip_11, degree(Itrip_11) == 0)
head(Itrip_11)



#2012---


Trip_12 <- read_excel("~/redes/data/Trip_12.xlsx")
Trip_12 <- Trip_12[,-1]
Trip_12 <- as.matrix(Trip_12)
rownames(Trip_12) <- colnames(Trip_12)


Itrip_12 <- graph_from_adjacency_matrix(Trip_12,
                                        mode = "lower",
                                        weighted = TRUE,
                                        diag = FALSE )
#Itrip_12 <- delete.vertices(Itrip_12, degree(Itrip_12) == 0)
head(Itrip_12)


#2013---


Trip_13 <- read_excel("~/redes/data/Trip_13.xlsx")
Trip_13 <- Trip_13[,-1]
Trip_13 <- as.matrix(Trip_13)
rownames(Trip_13) <- colnames(Trip_13)


Itrip_13 <- graph_from_adjacency_matrix(Trip_13,
                                        mode = "lower",
                                        weighted = TRUE,
                                        diag = FALSE )
#Itrip_13 <- delete.vertices(Itrip_13, degree(Itrip_13) == 0)
head(Itrip_13)



#2014---


Trip_14 <- read_excel("~/redes/data/Trip_14.xlsx")
Trip_14 <- Trip_14[,-1]
Trip_14 <- as.matrix(Trip_14)
rownames(Trip_14) <- colnames(Trip_14)


Itrip_14 <- graph_from_adjacency_matrix(Trip_14,
                                        mode = "lower",
                                        weighted = TRUE,
                                        diag = FALSE )
#Itrip_14 <- delete.vertices(Itrip_14, degree(Itrip_14) == 0)
head(Itrip_14)


#2015---


Trip_15 <- read_excel("~/redes/data/Trip_15.xlsx")
Trip_15 <- Trip_15[,-1]
Trip_15 <- as.matrix(Trip_15)
rownames(Trip_15) <- colnames(Trip_15)


Itrip_15 <- graph_from_adjacency_matrix(Trip_15,
                                        mode = "lower",
                                        weighted = TRUE,
                                        diag = FALSE )
#Itrip_15 <- delete.vertices(Itrip_15, degree(Itrip_15) == 0)
head(Itrip_15)



#2016---


Trip_16 <- read_excel("~/redes/data/Trip_16.xlsx")
Trip_16 <- Trip_16[,-1]
Trip_16 <- as.matrix(Trip_16)
rownames(Trip_16) <- colnames(Trip_16)


Itrip_16 <- graph_from_adjacency_matrix(Trip_16,
                                        mode = "lower",
                                        weighted = TRUE,
                                        diag = FALSE )
#Itrip_16 <- delete.vertices(Itrip_16, degree(Itrip_16) == 0)
head(Itrip_16)



#2017---


Trip_17 <- read_excel("~/redes/data/Trip_17.xlsx")
Trip_17 <- Trip_17[,-1]
Trip_17 <- as.matrix(Trip_17)
rownames(Trip_17) <- colnames(Trip_17)


Itrip_17 <- graph_from_adjacency_matrix(Trip_17,
                                        mode = "lower",
                                        weighted = TRUE,
                                        diag = FALSE )
#Itrip_17 <- delete.vertices(Itrip_17, degree(Itrip_17) == 0)
head(Itrip_17)


#---- Remove the bitch ass vertices -----

Itrip_18 <- delete.vertices(Itrip_18, which(strength(Itrip_18) < 8))
Itrip_17 <- delete.vertices(Itrip_17, which(strength(Itrip_17) < 8))
Itrip_16 <- delete.vertices(Itrip_16, which(strength(Itrip_16) < 8))
Itrip_15 <- delete.vertices(Itrip_15, which(strength(Itrip_15) < 8))
Itrip_14 <- delete.vertices(Itrip_14, which(strength(Itrip_14) < 8))
Itrip_13 <- delete.vertices(Itrip_13, which(strength(Itrip_13) < 8))
Itrip_12 <- delete.vertices(Itrip_12, which(strength(Itrip_12) < 8))
Itrip_11 <- delete.vertices(Itrip_11, which(strength(Itrip_11) < 8))











#------- Plotting ------



#2011---
plot(Itrip_11,
     vertex.size = 3,
     vertex.color = "green",
     layout=layout_with_fr,
     #vertex.label = NA,
     edge.color = adjustcolor("grey50", alpha = .3)
)


#2012---
plot(Itrip_12,
     vertex.size = 3,
     vertex.color = "green",
     layout=layout_nicely,
     vertex.label = V(Itrip_12)$names,
     edge.color = adjustcolor("grey50", alpha = .3)
)



#2013---
plot(Itrip_13,
     vertex.size = 6,
     vertex.color = "green",
     layout=layout_nicely,
     vertex.label = NA,
     edge.color = adjustcolor("grey50", alpha = .3),
     edge.width=2
)


#2014---
plot(Itrip_14,
     vertex.size = 3,
     vertex.color = "green",
     layout=layout_nicely,
     vertex.label = NA,
     edge.color = adjustcolor("grey50", alpha = .3)
)


#2015---
plot(Itrip_15,
     vertex.size = 3,
     vertex.color = "green",
     layout=layout_nicely,
     vertex.label = NA,
     edge.color = adjustcolor("grey50", alpha = .3)
)


#2016---
plot(Itrip_16,
     vertex.size = 3,
     vertex.color = "green",
     layout=layout_nicely,
     vertex.label = NA,
     edge.color = adjustcolor("grey50", alpha = .3)
)


#2017---
plot(Itrip_17,
     vertex.size = 3,
     vertex.color = "green",
     layout=layout_nicely,
     vertex.label = NA,
     edge.color = adjustcolor("grey50", alpha = .3)
)


#2018---

plot(Itrip_18,
     vertex.size = 3,
     vertex.color = "green",
     layout=layout_nicely,
     vertex.label = NA,
     edge.color = adjustcolor("grey50", alpha = .3)
)



#---------- Save Enviroment ---------
save.image(file = ".RData")
#------------------------------------

install.packages("threejs")
install.packages("htmlwidgets")

library(threejs)
library(htmlwidgets)



net.js <- Itrip_16
graph_attr(net.js, "layout") <- NULL

V(Itrip_16)$color <- "green"
gjs <- graphjs( net.js,
                main = "Network!",
                vertex.size = .8,
                vertex.label = V(Itrip_16)$name,
                vertex.color = V(Itrip_16)$color,
                bg = "gray10",
                stroke = F,
                curvature = 0.1,
                attraction = 0.9,
                repulsion = 0.8,
                opacity = 0.9
        )


print(gjs)
saveWidget(gjs, file="Media-Network-gjs.html")
browseURL("Media-Network-gjs.html")


install.packages("widgetframe")
library(widgetframe)



frameableWidget(gjs)

## Descriptives -------

deg2011 <- as.data.frame(t(degree(Itrip_11)))
deg2012 <- as.data.frame(t(degree(Itrip_12)))
deg2013 <- as.data.frame(t(degree(Itrip_13)))
deg2014 <- as.data.frame(t(degree(Itrip_14)))
deg2015 <- as.data.frame(t(degree(Itrip_15)))
deg2016 <- as.data.frame(t(degree(Itrip_16)))
deg2017 <- as.data.frame(t(degree(Itrip_17)))
deg2018 <- as.data.frame(t(degree(Itrip_18)))


degrees <- plyr::rbind.fill(deg2011, deg2012, deg2013, deg2014, deg2015, deg2016, deg2017, deg2018)


rownames(degrees) <- c("2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018")


degrees <- as.data.frame(degrees)


##
hist(deg2012, breaks = 1:vcount(Itrip_12)-1)
hist(deg2013, breaks = 1:vcount(Itrip_13)-1)
hist(deg2014, breaks = 1:vcount(Itrip_14)-1)
hist(deg2015, breaks = 1:vcount(Itrip_15)-1)
hist(deg2016, breaks = 1:vcount(Itrip_16)-1)
hist(deg2017, breaks = 1:vcount(Itrip_17)-1)
hist(deg2018, breaks = 1:vcount(Itrip_1d8)-1)
##



ggplot(gather(degrees), aes(value)) + 
        geom_histogram(bins = 10) + 
        facet_wrap( ~key, scales = 'free_x')
        

ndegrees <- as.numeric(t(degrees))

hist(ndegrees, breaks = 1:vcount(Itrip_18)-1)



sum(degrees, na.rm = T)
mean(ndegrees, na.rm = T)

#--- Mean Degrees ----


degrees <- t(degrees)


degrees <- as.data.frame(cbind(degrees, M?dia = rowMeans(degrees, na.rm = T)))


sdegrees <- as.data.frame(cbind(sdegrees, M?dia = rowMeans(sdegrees, na.rm = T)))














