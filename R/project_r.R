library(FactoMineR)
library(ggplot2)
library(factoextra)

filename <- 'travaille_personnel/R/archive/gate_applicants.csv'
filename2 <- 'travaille_personnel/R/archive/gate_cutoff.csv'

gate_applicants <- read.csv(file = filename,sep=',',quote="\"",header = T,fill = TRUE)
gate_cutoff <- read.csv(file = filename2,sep=',',quote="\"",header = T,fill = TRUE)

View(gate_applicants)
View(gate_cutoff)
class(gate_applicants)

gate_applicants.pca <- PCA(gate_applicants, scale.unit = TRUE, graph = FALSE)
fviz_screeplot(gate_applicants.pca, ncp = 5)
