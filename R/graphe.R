library(ggplot2)

dim(mtcars)

ggplot(mtcars,aes(x=disp,y=mpg)) + geom_point()

dim(iris)
table(iris$Species)
summary(iris)
ggplot(iris,aes(x = Sepal.Length, y = Sepal.Width, colour = Species )) + geom_point()

#View(mtcars)

ggplot(iris,aes(x = Sepal.Length, y = Sepal.Width, colour = Species , shape = Species))+
  geom_point() +
  geom_smooth()

ggplot(iris,aes(x = Sepal.Width, y = Sepal.Length, colour = Species))+
  geom_point() +
  scale_colour_manual(values = c('magenta','orange','blue')) + 
  geom_smooth(method = 'lm')

ggplot(iris,aes(y = Sepal.Length , x = Species , fill = Species )) +
  geom_boxplot() + 
  geom_jitter()

table(mtcars$carb)
table(mtcars$gear)
ggplot(mtcars,aes(as.factor(gear),fill = as.factor(carb))) + 
  geom_bar( position = 'dodge')

View(mtcars)
