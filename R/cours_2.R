install.packages("FactoMineR")
install.packages("factoextra")

library(FactoMineR)
library(ggplot2)
library(factoextra)

data("iris") 
head(iris,10)
tail(iris,10)
iris2 <- iris[1:4]

iris.pca <- PCA(iris2, scale.unit = TRUE, graph = FALSE)
fviz_screeplot(iris.pca, ncp = 4) 
plot.PCA(iris.pca, axes = c(1,2), choix = "var")
