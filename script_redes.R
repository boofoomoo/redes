library(tidyverse)
library(readxl)


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
write.csv(mx_2011, file = "Trip_12.csv")


mx_2013 <- as.data.frame(mx_2013)
write.csv(mx_2011, file = "Trip_13.csv")


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

#-----------------------




