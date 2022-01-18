install.packages('Hmisc','RcolorBrewer')
install.packages('vcd','plotrix','sm','vioplot')

library(XML)
library(VIM)
library(rvest)
library(stringr)
library(RColorBrewer)
library(Hmisc)
x <- matrix(1:20,4,5,byrow = T)
x[,c(2,3,4)]

num <- -10
ifelse( num > 0 ,'positif','négatif')

top <- read_html('https://movie.douban.com/top250')
top$doc
title <- top %>% html_nodes('span.title') %>% html_text()
title <- title[is.na(str_match(title,'/'))]
title[2]

Titanic
class(Titanic)
summary(Titanic)
aggr(Titanic)

pref <- read.csv('travaille_personnel/R/etalab.csv',header = FALSE,sep = ';')
class(pref)
summary(pref)
View(pref)
aggr(pref)
matrixplot(pref)

length(pref$V9)
length(pref$V1)

m <- pref

y <- m[complete.cases(m),]
dim(y)
aggr(y)
summary(y)

dim(na.omit(m))
is.na(m$V9)

x <- matrix(rnorm(16),4,4,byrow = T)
nrow(x)
y <- solve(x)

a <- c(1,2)
b <- c(5,6)
x <- matrix(c(a,b),nrow = 2,ncol = 2,byrow = T)
x
y <- solve(x)
y
x*y

x1 <- c(1:16)
x2 <- c(21:36)
df <- data.frame(x1,x2)

View(df)
aggr(df)

plot(df)


manage <- c(1,2,3,4,5)
date <- c("10/2/11","28/10/10","10/01/07","10/12/08","10/01/09")
age <- c(32,45,25,39,99)
q1 <- c(4,2,3,NA,4)
q2 <- c(5,3,3,3,2)
q3 <- c(5,2,5,4,1)
q4 <- c(5,5,5,NA,2)
q5 <- c(5,5,2,NA,1)
genger <- c('M','F','F','M','F')
leader_ship <- data.frame(manage,date,genger,age,q1,q2,q3,q4,q5,stringsAsFactors = T)
View(leader_ship)
aggr(leader_ship)
summary(leader_ship)

donne <- data.frame(x1 = c(2,2,6,8), x2 = c(3,2,8,4))

donne$sum <- donne$x1 + donne$x2
View(donne)
donne$sumx <- x1 + x2

leader_ship$agecat[leader_ship$age > 75] <- 'Vielle'
leader_ship$agecat[leader_ship$age >= 55 & leader_ship$age <=75] <- 'adulte'
leader_ship$agecat[leader_ship$age < 55 ] <- 'adonaissant'

leader_ship$sex[leader_ship$genger == 'F'] <- 'Femme'
leader_ship$sex[leader_ship$genger == 'M'] <- 'Homme'
attach(leader_ship)
detach(leader_ship)
View(leader_ship)


is.na(leader_ship[2])
na.omit(leader_ship)

today <- Sys.Date()
format(today,format='%d/%m/%Y')

dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)
plot(dose,drugA,type = "b")

opar <- par(no.readonly = T)
par(lty=2,pch=17,cex=1 )
plot(x = dose,y=drugA,type = 'b')
par(opar)

plot(dose,drugB,type = 'b',pch = 15,lty = 3, lwd = 3, cex = 2)

n <- 9
mes_color <- brewer.pal(n,'Set1')
barplot(rep(1,n), col = mes_color)

n <- 12
mes_color <- rainbow(n)
pie(rep(1,n), labels =  mes_color, col =  mes_color)

gray_graphe <- gray( 0:n / n)

x <- (1:10)/10

pie(rep(1,n),labels = gray_graphe,col = gray_graphe)
par(pin = c(5,3))
par(lwd = 3,cex = 1.5)
par(cex.axis = .75, font.axis = 4)
plot(dose, drugA, type = 'b',pch = 19, lty = 2, col = 'red')
plot(dose, drugA, type = 'b',pch = 23, lty = 9, col = 'red', bg = 'blue')
par(opar)

drugA
plot(dose,drugA,type = 'b',col = 'red', lty = 2,pch = 6, lwd = 2, main = 'dose par le grugA', sub = 'le deuième titre', 
     xlab = 'le dose', ylab = 'la grugA', xlim = c(20,75),ylim = c(10,70))
lines(dose,drugB,col = 'blue', pch = 15)
axis(2, at = dose, labels = dose)
minor.tick(nx = 3, ny =3, tick.ratio = 0.5)
legend('topleft', inset = .05, title = 'drung Type', c('A','B'), lty = c(1,2)
       ,pch = c(6,17), col = c('red','blue'))

