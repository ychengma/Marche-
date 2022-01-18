#### 1.installer les pakages qu'on n'a pas  ####
install.packages('stringr')
install.packages('ggplot2')
#### 2.cherger les pakages ####
library(stringr)
library(ggplot2)
a <- 1:5
b <- 6:10

resultat <-  a + b 
resultat
x <- 1

resultat2 <-  x + a

resultat3 <-  c(a,b)
resultat3

3/2
class(resultat)
#### ?nom de function: ?seq consulter le document de seq  ####
#?seq
?seq
x <- seq(1,6,0.5)
x
x <-  seq(1,100,length.out = 20)
x
length(x)
x <-  rep(c(1,2,5),6)
x
length(x)

x <- seq(1,100)
x[x > 80 & x < 90]

typeof(x)
nchar('je suis')

paste('je',1:30)
paste0('je',1:30)

paste('bonjour','tout le monde')

x
y <- rank(x>8) 
x[y]
?rank
 
r1 <- rank(x1 <- c(3, 1, 4, 15, 92))
x1[r1]
x2 <- c(3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5)