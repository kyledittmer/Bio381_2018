# More basic coding tools for matrices and lists 
# 02/08/18
#Kyle Dittmer

library(ggplot2)

# create a matrix from an atomic vector 
m <- matrix(data=1:12,nrow = 4,byrow = T)
dim(m) # tells you the number of rows and columns, respectively 
dim(m) <- c(6, 2)
m
dim(m) <- c(4,3) 
m
nrow(m)
ncol(m)
length(m)

#add names to rows and columns 
rownames(m) <- c("a","b","c","d")
colnames(m) <- LETTERS[1:ncol(m)]

#Subsetting matrix values
print(m[2,3]) # will read row first, then column 
print(m[2,]) # row 2, all columns 
print(m[,2]) # column 2, all rows 
print(m[c(1,4),c(1,3)])

rownames(m) <- paste("Species",LETTERS[1:nrow(m)],sep="")
m
colnames(m) <- paste("Site",1:ncol(m),sep="")      
m

#add names through the dim command with a list
dimnames(m) <- list(paste("Site",1:nrow(m),sep=""),paste("Species",ncol(m):1,sep=""))
m
# t function transposes rows and columns 
t(m)

# add a row to m with rbind 
m2 <- t(m)
m2
m2 <- rbind(m2,c(10,20,30,40))
rownames(m2)[4] <- "Species X"
m2["Species X",c("Site3","Site4")]

# can always convert this back to an atomic vector 
myVec <- as.vector(m)


# Lists are vectors but each element can hold things of different 
# sizes and different types 

myList <- list(1:10,matrix(1:8,nrow=4,byrow = T), letters[1:3],pi)
myList                                                      
str(myList)

#lists don't behave as you think they should 
myList[4] - 3
myList[4]
str(myList[4])
myList[[4]] # will extract the matrix that is part of a list

# combine single and double brackets to access items 
myList[[2]]
myList[[2]][4,1] # [[ ]] to get matrix, followed by another set of brackets to get the element 

# name list items as we create them 
myList2 <- list(Tester=F,littleM=matrix(1:9,nrow = 3))
myList2$littleM[2,3] #get row 2, column 3

m[1]
