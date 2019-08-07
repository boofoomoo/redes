library(tidyverse)
library(readxl)


Ano11 <- read_excel("AnoaAno.xlsx", sheet = "2011")
Ano11 <- select(Ano11, -'Ano')
mx_2011 <- crossprod(with(Ano11, table(Diferenciador, Atrativo)))


Ano12 <- read_excel("AnoaAno.xlsx", sheet = "2012")
Ano12 <- select(Ano12, -'Ano')
mx_2012 <- crossprod(with(Ano12, table(Diferenciador, Atrativo)))


Ano13 <- read_excel("AnoaAno.xlsx", sheet = "2013")
Ano13 <- select(Ano13, -'Ano')
mx_2013 <- crossprod(with(Ano13, table(Diferenciador, Atrativo)))


Ano14 <- read_excel("AnoaAno.xlsx", sheet = "2014")
Ano14 <- select(Ano14, -'Ano')
mx_2014 <- crossprod(with(Ano14, table(Diferenciador, Atrativo)))


Ano15 <- read_excel("AnoaAno.xlsx", sheet = "2015")
Ano15 <- select(Ano15, -'Ano')
mx_2015 <- crossprod(with(Ano15, table(Diferenciador, Atrativo)))


Ano16 <- read_excel("AnoaAno.xlsx", sheet = "2016")
Ano16 <- select(Ano16, -'Ano')
mx_2016 <- crossprod(with(Ano16, table(Diferenciador, Atrativo)))


Ano17 <- read_excel("AnoaAno.xlsx", sheet = "2017")
Ano17 <- select(Ano17, -'Ano')
mx_2017 <- crossprod(with(Ano17, table(Diferenciador, Atrativo)))


Ano18 <- read_excel("AnoaAno.xlsx", sheet = "2018")
Ano18 <- select(Ano18, -'Ano')
mx_2018 <- crossprod(with(Ano18, table(Diferenciador, Atrativo)))


Ano19 <- read_excel("AnoaAno.xlsx", sheet = "2019")
Ano19 <- select(Ano19, -'Ano')
mx_2019 <- crossprod(with(Ano19, table(Diferenciador, Atrativo)))


#-----------------TEMP-----------------------

mx_2011 <- read_excel("Trip_11.xlsx")
mx_2012 <- read_excel("Trip_12.xlsx")
mx_2013 <- read_excel("Trip_13.xlsx")
mx_2014 <- read_excel("Trip_14.xlsx")
mx_2015 <- read_excel("Trip_15.xlsx")
mx_2016 <- read_excel("Trip_16.xlsx")
mx_2017 <- read_excel("Trip_17.xlsx")
mx_2018 <- read_excel("Trip_18.xlsx")
mx_2019 <- read_excel("Trip_19.xlsx")

#-----------------/TEMP-----------------------


lista_at <- c(
  names(mx_2011),
  names(mx_2012),
  names(mx_2013),
  names(mx_2014),
  names(mx_2015),
  names(mx_2016),
  names(mx_2017),
  names(mx_2018),
  names(mx_2019)
)

lista_at <- unique(lista_at)

write.csv(lista_at, file = "lista.csv")

Referência <- read_excel("lista.xlsx", sheet = "Ref")

#-------------- Recode ----------------------------

plyr::revalue(mx_2011???,c(
       "Alpen Park"="A1"
       ,"Dreamland Museu de Cera"="A2"
       ,"Fragram - Museu do Perfume"="A3"
       ,"GramadoZoo"="A4"
       ,"Harley Motor Show"="A5"
       ,"Igreja Matriz São Pedro Apóstolo"="A6"
       ,"Lago Negro"="A7"
       ,"Mini Mundo"="A8"
       ,"Mirante do Belvedere"="A9"
       ,"Mundo Encantado"="A10"
       ,"Museu do Automóvel - Hollywood Dream Cars"="A11"
       ,"O Reino do Chocolate"="A12"
       ,"Parque do Pinheiro Grosso"="A13"
       ,"Parque Gaúcho"="A14"
       ,"Pórtico via Nova Petrópolis"="A15"
       ,"Pórtico Via Taquara"="A16"
       ,"Praça Major Nicoletti"="A17"
       ,"Rotula das Bandeiras"="A18"
       ,"Rua Coberta"="A19"
       ,"A Mina"="A20"
       ,"A Rua Torta de Gramado"="A21"
       ,"Casa Centenária"="A22"
       ,"Casa das Artes"="A23"
       ,"Casa do Colono"="A24"
       ,"Centro Municipal de Cultura"="A25"
       ,"Cine -Teatro Elizabeth Rosenfeld"="A26"
       ,"Ervateira Marcon - Natural de Gramado"="A27"
       ,"Fonte do Amor Eterno"="A28"
       ,"Le Jardin Parque de Lavanda"="A29"
       ,"Memorial Casa Italiana"="A30"
       ,"Mundo de Chocolate"="A31"
       ,"Museu de Artes Dr. Carlos Nelz"="A32"
       ,"Museu do Sapato"="A33"
       ,"Museu Fioreze"="A34"
       ,"Museu Gramado - Minerais & Pedras Preciosas"="A35"
       ,"Museu Naval"="A36"
       ,"Parque Temático Mundo Gelado"="A37"
       ,"Praça das Etnias"="A38"
       ,"Prefeitura Municipal de Gramado"="A39"
       ,"Snowland"="A40"
       ,"Vinícola Ravanello"="A41"
       ,"Aldeia do Papai Noel"="A42"
       ,"Casa Seganfredo"="A43"
       ,"Central de Informações Turísticas de Gramado"="A44"
       ,"Gram Bier"="A45"
       ,"Museu do Festival de Cinema de Gramado"="A46"
       ,"Praça da Criança"="A47"
       ,"Capela Cristo Ressuscitado"="A48"
       ,"Caro Watson Escape Game"="A49"
       ,"Colorio"="A50"
       ,"Galleria D'arte Giovanni Bocchi"="A51"
       ,"Vinicola Masotti"="A52"
       ,"Chave-Mestra Escape Game Gramado"="A53"
       ,"Galeria Arte12b"="A54"
       ,"Igreja Metodista"="A55"
       ,"Parque do Palácio"="A56"
       ,"Parque Municipal Caminho da Santinha"="A57"
       ,"Adega Dom Carlo"="A58"
       ,"Caminho das Estrelas"="A59"
       ,"Cascata Véu de Noiva"="A60"
       ,"Centro de Informações Turísticas"="A61"
       ,"Clube da Crianca"="A62"
       ,"Estátua do Maestro Eleazar de Carvalho"="A63"
       ,"Parque Olivas de Gramado"="A64"
       ,"Praça do Moínho"="A65"
       ,"Trem Maria Fumaça"="A66"
       ,"Vila Olímpica Eduardo Tissott"="A67"
       ,"Vinícola Stopassola"="A68"
))














