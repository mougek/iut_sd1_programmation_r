setwd("L:/BUT/SD/Promo 2025/emougel/R/TP2/")

df = read.csv("fao.csv", header = TRUE, sep = ";", dec = ",")

#Nombre de pays (nb de colonnes) :
nrow(df)

#Résumé du dataframe :
summary(df)

# EX 2

#Disponibilité alimentaire moyenne (en Kcal/personne/jour) :
mean(df$Dispo_alim)

#Nombre d'habitant dans le monde :
sum(df$Population, na.rm = TRUE)

#Ecart-type des importations et exportations de viande :
sd(df$Import_viande)
sd(df$Export_viande,na.rm = TRUE)

#Quartiles de la disponibilité alimentaire :
quantile(df$Dispo_alim,seq(0,1,0.25))

#Centiles du volume d'importation de viande
quantile(df$Import_viande,seq(0,1,0.01))

# EX 3 

df1 = df[order(df$Population,decreasing = FALSE)[1:5],]

df2 = df[order(df$Population,decreasing = TRUE)[1:5],]

df3 = df[order(df$Prod_viande,decreasing = TRUE)[1:5],]

df4 = df[order(df$Import_viande,decreasing = TRUE)[1:5],]

df5 = subset(df,Dispo_alim >= 2300)

df6 = subset(df,Dispo_alim >= 3500 & Import_viande >= 1000)

df7 = subset(df,Nom %in% c("France","Belgique"))

# EX 4 

df$part_export = df$Export_viande / df$Prod_viande

df$dispo_alim_pays = df$Dispo_alim * df$Population

write.table(df,"ExportTp2.csv",sep = ";", dec = ",")

sum(df$dispo_alim_pays,na.rm = TRUE)

sum(df$dispo_alim_pays,na.rm = TRUE)/2300
#On pourrait nourrir 9 858 300 378 personnes

# EX 5

plot(df$Prod_viande,df$Export_viande,xlim = c(0,10000),ylim = c(0,100))

cor(x = df$Prod_viande, y = df$Export_viande, use = "complete.obs")

mat1 = round(cor(df[,c("Dispo_alim","Prod_viande","Import_viande","Export_viande","Population")],use = "complete.obs"),digits = 2)

install.packages("corrplot")

library(corrplot)

corrplot(mat1,method="circle")
