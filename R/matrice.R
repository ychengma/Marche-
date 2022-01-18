#### 1. générer une list ####
lists <-  rnorm(16)
print(lists)

#### 2. convertir un lists à  matrice ####
matrices <- matrix(data = lists,nrow = 4,byrow = TRUE)
print(matrices)
#### 3.slicer la matice####
matrices[2:4,3:4]

col1 <-  c(1,3,5,8)
col2 <-  c(2,18,27,10)
col3 <-  c(8,37,267,19)
#### 4.fusionner les données en ligne ####
row_bind <- rbind(col1,col2,col3)
print(row_bind)
#### 5.fusionner les donnée en colonne  ####
col_bind <- cbind(col1,col2,col3)
print(col_bind)

dim(matrices)
nrow(matrices)
ncol(matrices)

rownames(matrices)
colnames(matrices)
dimnames(matrices)
rownames(matrices) <- c('row1','row2','row3','row4')
colnames(matrices) <- c('col1','col2','col3','col4')
print(matrices)
print(matrices['row1',])
#### 6.chercher la valeur de col1 qui est superieur à 0 ####
condition <- c(matrices[,'col1'] > 0)
condition
matrices[c(T,F,T,F),]
#### 7. la function dans la matrice ####
f_matrices <- apply(matrices, 2, function(x){
    counts <-length(x)
    for (variable in 1:counts) {
      #print(x[variable])
      if (x[variable] < 0){
        x[variable] = 0
      }else{
        x[variable] = 1  
      }
    }
    return(x)
   # print(x)
    #negatifs <- which(x<0)
    #print(negatifs)
    #x[negatifs] = 0
  })
print(matrices)
print(f_matrices)


r <- c(1,2,3,4)
t <- t(r)
print(r)
table(r)
