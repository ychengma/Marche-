install.packages("dplyr")
library(dplyr)
filename <- 'travaille_personnel/R/actifscnracl_typecoll_nbragents_agemoyen_nbremployeur.csv'
#filename <- 'travaille_personnel/R/data.txt'
emp_csv <- read.csv(file = filename,sep=',',quote="\"",header = T,fill = TRUE)
#emp_csv <- read.table(file = filename,header = TRUE,sep="\t",encoding = "UTF-8",fileEncoding ="UTF-8" ,stringsAsFactors = FALSE,dec=".")
print(emp_csv)
#index <- rank(emp_csv[,'femmes'])
v_femmes <- emp_csv[,'femmes']>50000
print(v_femmes)
sorts <- emp_csv[v_femmes,c('annee','famille','hommes')]

head(emp_csv)
tail(emp_csv)
summary(emp_csv)
table(emp_csv$age_moy_femmes)
emp_csv$annee[1:10]
emp_csv$famille[1:6]
emp_csv$is_null <- c(T,F,T)

#### 1.utilser la pakage dplyr ####
new_emp <- emp_csv %>%
  #filter des lignes
  filter(femmes > 50000 & nombre_employeurs < 100,grepl('FPT',famille)) %>%
  #filter des colonnes
  select(annee,famille,hommes,femmes,age_moy_femmes,age_moy_hommes) %>%
  #ajouter une colonne
  mutate(Difs = age_moy_hommes - age_moy_femmes) %>%
  #nommer les colonnes
  rename(salaire_hommes = hommes,salaire_femmes = femmes) %>%
  #trier des données
  arrange(desc(Difs))

print(new_emp)



