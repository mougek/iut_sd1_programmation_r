# EXERCICE 2

dfManga = read.csv("L:/BUT/SD/Promo 2025/emougel/R/manga.csv")
dfAnime = read.csv("L:/BUT/SD/Promo 2025/emougel/R/anime.csv")

class(dfManga)
class(dfAnime)

View(dfManga)
View(dfAnime)

dim(dfManga)
dim(dfAnime)

mean(dfManga[,"Score"])
mean(dfAnime[,"Score"])

if (mean(dfManga[,"Score"]) > mean(dfAnime[,c("Score")])) {print("Le score de dfManga est en moyenne plus haut que celui de dfAnime")} else {print("Le score de dfAnime est en moyenne plus haut que celui de dfManga")}

sum(dfManga[,"Vote"])
sum(dfAnime[,"Vote"])

if (sum(dfManga[,c("Vote")]) > sum(dfAnime[,c("Vote")])) {print("La somme des votes dans dfManga est supérieur à la somme des votes dans dfAnime")} else {print("La somme des votes dans dfAnime est supérieur à la somme des votes dans dfManga")}

sd(dfManga[,"Score"])
sd(dfAnime[,"Score"])

if (sd(dfManga[,"Score"]) > sd(dfAnime[,"Score"])) {print("Au niveau des scores, dfAnime est le plus homogène")} else {print("Au niveau des scores, dfManga est le plus homogène")}

quantile(dfManga[,"Score"], probs = seq(0,1,0.1))
quantile(dfAnime[,"Score"], probs = seq(0,1,0.1))

if (quantile(dfManga[,"Score"], probs = 0.1) < quantile(dfAnime[,"Score"], probs = 0.1)) {print("dfManga a le décile 1 le plus petit")} else {print("dfAnime a le décile 1 le plus petit")}

##############

sous_ensemble1 = subset(dfManga,dfManga[,"Score"] >= 9)

cat("Il y a",nrow(sous_ensemble1),"éléments ayant une note supérieure à 9")

sous_ensemble2 = subset(dfManga,dfManga[,"Vote"] >= 200000)

cat("Il y a",nrow(sous_ensemble2),"éléments ayant plus de 200000 votes")

sous_ensemble3 = subset(dfManga,(dfManga[,"Vote"] >= 200000) & (dfManga[,"Score"] >= 8))

cat("Il y a",nrow(sous_ensemble3),"éléments ayant plus de 200000 votes et ayant une note supérieure à 8")

sous_ensemble4 = subset(dfManga,(dfManga[,"Score"] >= 7) & (dfManga[,"Score"] < 8))

cat("Il y a",nrow(sous_ensemble4),"éléments ayant une note comprise entre 7 et 8")

################

prop.table(table(dfAnime[,"Rating"]))

sous_ensemble5 = subset(dfAnime,Rating == "R - 17+ (violence & profanity)")
nrow (sous_ensemble5)

sous_ensemble6 = subset(dfAnime,(Rating == "R - 17+ (violence & profanity)") & (Score >= 8))
nrow (sous_ensemble6)

sous_ensemble7 = subset(dfAnime,Rating != "R - 17+ (violence & profanity)")
nrow(sous_ensemble7)

sous_ensemble8 = subset(dfAnime,(Rating == "PG - Children") | (Rating == "G - All Ages"))
nrow(sous_ensemble8)

sous_ensemble9 = subset(dfAnime,(Vote >= 400000) & (Score >= 9))
nrow(sous_ensemble9)

#################

datafManga = dfManga[,c("Title","Score","Vote","Ranked")]
datafAnime = dfAnime[,c("Title","Score","Vote","Ranked")]

datafManga$Type = "Manga"
datafAnime$Type = "Anime"

dfConcat = rbind(datafManga,datafAnime)

View(dfConcat)

write.table(dfConcat,file="L:/BUT/SD/Promo 2025/emougel/R/ExportTp1.csv",sep=",",row.names=TRUE)
