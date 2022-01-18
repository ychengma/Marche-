install.packages("FactoMineR")
install.packages("factoextra")
install.packages("ODBC")
install.packages('aplpack')
install.packages('maps')
install.packages('geosphere')
install.packages('TeachingDemo')
install.packages('rjava')
install.packages('libSvm')
install.packages('keras')
install.packages('randomForest')
install.packages("e1071")  # pour svm
install.packages("arules")
install.packages("arulesViz")
install.packages("openssl")
install.packages("dendextend")
install.packages("tidyverse", dependencies = TRUE) 

library(arules)
library("arulesViz")
library("e1071")
library(randomForest)
#library(libSvm)
library(keras)
library(maps)
library(FactoMineR)
library(factoextra)
library(ggplot2)
library(datasets)
map("state")
a <- rnorm(16)
a
mode(a)

ln(w~1+h)


toothpaste <- data.frame(
  x1 = c(-0.05,0.25,0.06,0,0.25,0.20,0.15,0.05,-0.15,0.15,0.20,0.10,0.40,0.45,0.35,0.30,0.50,0.50,0.40,-0.05,-0.05,-0.01,0.20,0.10,0.50,0.60,-0.05,0,0.05,0.55),
  x2 = c(5.50,6.75,7.25,5.50,5.00,4.89,7.00,6.50,6.75,25.5,25.6,6.00,6.50,6.25,7.00,6.90,6.80,7.10,7.00,6.80,6.50,6.25,6.00,6.50,7.00,6.80,6.50,5.75,5.80,6.80),
  y = c(7.38,8.51,9.52,7.50,9.33,8.28,8.75,7.87,7.10,8.00,7.89,8.15,9.10,8.86,8.90,8.87,9.26,9.00,8.75,7.95,7.65,7.27,8.00,8.50,8.75,9.21,8.27,7.67,7.93,9.26)	
)
lm.sol <-lm(y~x1+x2,data = toothpaste)
lm.sol <-update(lm.sol,.~.+I(x2^2))
lm.sol <-update(lm.sol,.~.+(x1*x2))
summary(lm.sol)
step(lm.sol)







sale <- read.csv('/home/ma/cours/m1/R/graphsCookbook-master/chapter/01/data/dailysales.csv',header = T)
print(mode(sale$date))
plot(sale$units~as.Date(sale$date,'%d/%m/%y'),
     type='l',
     main='unit sale',
     xlab='date',
     ylab='number of units',
     col='blue')
plot(sale$units~as.Date(sale$date,'%d/%m/%y'))
lines(sale$units~as.Date(sale$date,'%d/%m/%y'),col='red')

sales <- read.csv('/home/ma/cours/m1/R/graphsCookbook-master/chapter/01/data/citysales.csv',header = T)
barplot(sales$ProductA,names.arg = sales$City,col = 'black')
barplot(as.matrix(sales[2:4]),beside = T,legend = sales$City,col = heat.colors(5),border = 'white')
hist(rnorm(1000))


heatmap(as.matrix(mtcars),
        Rowv = NA,
        Colv = NA,
        col = heat.colors(256),
        scale = 'column',
        margins = c(2,8),
        main='Car carctéristique')

pairs(iris[1:4])
plot(iris[1:4],
     main = 'Relation',
     pch=19,
     col='blue',
     cex=0.9)

par(mfrow = c(2,3))
plot(rnorm(1000),col='blue',main='plot1')
plot(rnorm(1000),col='green',main='plot1')
plot(rnorm(1000),col='red',main='plot1')
plot(rnorm(1000),col='black',main='plot1')
plot(rnorm(1000),col='orange',main='plot1')
plot(rnorm(1000),col='yellow',main='plot1')


png('france.png')
map('france')
dev.off()

colors()
palette()

barplot(as.matrix(sales[,2:4]),beside = T,
        legend = sales$City,
        col = rainbow(length(sales$City)),
        border = 'white')

barplot(as.matrix(sales[,2:4]),beside = T,
        legend = sales$City,
        col = terrain.colors(length(sales$City)),
        border = 'white')

par(bg='gray')
plot(rnorm(100))

plot(rnorm(1000),type = 'n')
x <- par('usr')
rect(x[1],x[3],x[2],x[4],col='lightgray')
points(rnorm(1000))



par(col.axis='black',
    col.lab = '#444444',
    col.main = 'darkblue',
    family = 'serif',
    font = 2)
plot(rnorm(100),
     main='Plot',
     col.axis='blue',
     col.lab='red',
     col.main='darkblue')
title('sales',col.main='blue')

rain <- read.csv('/home/ma/cours/m1/R/graphsCookbook-master/chapter/01/data/cityrain.csv',header = T)
plot(rain$Tokyo,
     ylim = c(0,250),
     main='rain',
     xlab = "mois d'année",
     ylab = 'Rainfull',
     type = 'l',
     lty = 1,
     lwd = 2)
lines(rain$NewYork,lty=2,lwd=2)
lines(rain$London,lty=3,lwd=2)
lines(rain$Berlin,lty=4,lwd=2)
legend('top',
       legend = c('Tokyo','New York','London','Berlin'),
       ncol = 4,
       cex = 0.8,
       bty = 'n',
       lty = 1:4,
       lwd = 2)

par(bty='l')
plot(rnorm(100))
par(bty='7')
plot(rnorm(100))
par(bty='c')
plot(rnorm(100))
par(bty='u')
plot(rnorm(100))
par(bty='n')
plot(rnorm(100))

par(oma=c(1,1,1,1))
plot(rnorm(100),bty='l')
box(which = 'figure')

plot(rnorm(100),xaxp=c(0,100,10))

z <- lm(iris$Sepal.Length ~iris$Sepal.Width)
summary(z)
plot(z)

norell <- data.frame(x=0:5,
                     n = rep(70,6),
                     success = c(0,9,21,47,60,63)
)
norell$Ymat<-cbind(norell$success,norell$n-norell$success)
glm.sol <- glm(Ymat~x,
               family = binomial,
               data = norell)
summary(glm.sol)
plot(glm.sol)

a <- c(1:10)
a
a <- replace(a,c(1:5),10)
a
sd(a)
var(a)
a
v <- sum((a-mean(a))^2) / (length(a)-1)
sqrt(v)
rev(sort(a))
mat0 <- matrix(c(1:12),nrow = 3,byrow = T)
mat1 <- matrix(c(1:24),nrow = 4,byrow = T)
f <- function(mat0,mat1){
  xcol = dim(mat0)[2]
  yrow = dim(mat1)[1]
  if (xcol != yrow){
    print('dexu matrices ne peuvent pas munipuler')
    return(0)
    }
  n = dim(mat0)[1]
  m = dim(mat1)[2]
  mat_pro = matrix(0, nrow =n, ncol = m)
  for (i in c(1:n) ){
    for (j in c(1:m)) {
      mat_pro[i,j] =sum(mat0[i,] * mat1[,j] )
    }
  }
  return(mat_pro)
}
mrt <- f(mat0,mat1)
print(mrt)
mat0 %*% mat1


f <- function(a=1,b=1){
  d <- a + b
  a <- b
  b <- d
  if (d>1000)
  {
    return(d)
  }
  f(a,b)
}

s <- f()
s
pie(c(1,2,3))
boxplot(iris[,c(1:4)],notch=T,col=rainbow(4),names=c('sl','sw','pl','l'))


unique(color)

runif(10)
a <-c(rep(1,3),rep(2,3),rep(6,7),1:10)	
a
unique(a)
x <- c(1:5,4:1)
x
euro.cross
a <- c(1,4,6,8,3,4,6,6,6,8,6,1)
b <- table(a)
b == max(b)
as.numeric(names(b)[b == max(b)])
a <- matrix(c(1:6,NA,8,9),nrow=3)
a <- na.omit(a)
a
x <- c(1,NA,2,NA,3) 
x[!is.na(x)]
g <- complete.cases(airquality)
length(g)
airquality[g,]
airquality[c(1,2),]

x <- matrix(c(1,3,6,10,15,21,7,11,17,25,35,47),nrow = 6,byrow = F)
plot(x)
mean.x <- mean(x[,1])
mean.x
mean.y <- mean(x[,2])
mean.y 
a <- c(1:10)
var(a)
var(x[,2])

f <- function(x,y){
  r = 0
  for(i in c(1:length(x))){
    r = r + (x[i] - y)^2
  }
  return(r/(length(x)-1))
}
vx <- f(a,mean(a))
vx



a <- (48.22 *192.89)
b <- 94.44
a / b


8.33 * 16.67

x <- array(data = c(0,0,1,1,0,1,0,1),dim=c(4,2))
y <- factor(c(1,-1,-1,1))
model <- svm(x,y,type="C-classification")
plot(predict(model,x))

library(ggplot2)
library(dplyr)
library(tidyr)
a <- c(1,2,3,4)
b <- c(5,6,7,8)
x <- rbind(a,b)
x <- as.data.frame(x)
class(x)
rbind(a,b)
plot(a,b)
y <- sapply(x,mean)
y
date <- as.Date('2017-6-22') + 0:14
hour <- sample(1:24,15)
min <- sample(1:60,15)
second <- sample(1:60,15)
dat <- data.frame(date,hour,min,second)
dat %>% unite(dateHour,date,hour,sep=' ')%>% 
  unite(dh,dateHour,min,second,sep=':')%>% 
  unite(DH,dateHourMinute,second,sep=':')
a = c(2,3,4,2,5,1,6,3,2,5,8,5,7,3)
index <- order(-a)
a[x]
dat <- data.frame(name=c('kg','ky','kq'),score=c(89,90,79))
dat[order(dat$score,decreasing=TRUE),]




f <- matrix(c(3,5,1,2),nrow=2,byrow=TRUE)
rf <- matrix(c(4,1),nrow=2)
solve(f,rf)
a <- matrix(rnorm(16),4,4)
b <- c(1:4) 
solve(a,b) 
identical('1','1')
cumprod(1:5)
a <- c(rep(1,3),rep(2,3),rep(4,7),1:10)
a[which(a>5)]

a <-c(1:10)
b <-c(1:10)
dat <- data.frame(a,b)
dat
dat[which(dat[,1] > 5),1]
a <- matrix(c(1:6,NA,8,9),nrow=3)
complete.cases(a)
a[!complete.cases(a),]
mat <- iris[1:4] 
summary(mat)
sl <- scale(iris[,1])
pw <- scale(iris[,4])
model <- lm(pw~sl)
summary(model)


a <- matrix(c(1,2),nrow = 1)
b <- matrix(c(2,1),nrow=2)
c <- a %*% b
c
