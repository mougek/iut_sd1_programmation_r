# EXERCICE 1

iris 
class(iris) #Affiche la classe de iris
View(iris) #Affiche le jeu de données iris dans une fenêtre
nrow(iris) #Affiche le nombre de ligne
ncol(iris) #Affiche le nombre de colonne
colnames(iris) #Affiche les noms des colonnes
summary(iris) #Affiche un résumé du jeu de donnée
iris[c("Petal.Length","Species")]
iris[c(100,103,105),]
iris[50:100,]
mean(iris[,"Sepal.Length"])
median(iris[,"Sepal.Width"])
sd(iris[,"Petal.Length"])
quantile(iris[,"Petal.Width"],probs=seq(0,1,0.1))