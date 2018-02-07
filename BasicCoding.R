
# Basic R commands and usage
# 30 January 2018
# Kyle Dittmer

 #Control + Shift + C will annotate any line of code that is highlighted 

# Using the assignment operator 
x <- 5 #preferred 
print(x)
y=4 #legal but not used except in function
y=y+1.1
y<- y+1
plantHeight<- 5.5

#------beginning of class for 02/01/18-------------

z <- c(3,7,7,10) #simple atomic vector
print(z)
typeof(z) #get the varible type
str(z) #get the structure of the variable
is.numeric(z) #logican test for variable type
is.character(z) 

# c always "flattens to an atomic vector
z <- c(c(3,4),c(5,6))
print(z)

# character strings with single or double quotes
z<-c("perch","bass","trout","red snapper")
print(z)

#use both quote types for an internal quote

z<-c("this is only 'one' character strong",'a second string')
str(z)

#logical TRUE FALSE 
z<-c(TRUE,TRUE,FALSE)
is.numeric(z)
is.logical(z)

#Three properties of atomic vectors
#Type of atomic vector
z<-c(1.1,2.2,3.2)
typeof(z)
is.numeric(z)

#length of vector
length(z)

#name of vectors elements (optional)
z<- runif(5) #random uniform (0,1)
names(z)

#add names after variable is created
names(z)<- c("chow","pug","beagle","greyhound","akita")
print(z)

#add names when variable is built
z2<-c(gold=3.3,silver=10,lead=2)
print(z2)
names(z2) <- NULL
print(z2)
names(z2)<- c("copper","zinc")
print(z2)

#special data values
#NA for missing values
z<-c(3.2,3.3,NA)
length(z)
typeof(z[3])
#missing values can trip up basic function
mean(z) #does not work!
is.na(z) #checks for missing valeus (the NAs)
!is.na(z) # ! is the NOT function
mean(!is.na(z)) #WRONG
mean(z[!is.na(z)]) #do it this way

#--------------------------------------------
#NaN, Inf -Inf #bad results from numeric calculations
z<-0/0
print(z)
z<-1/0
print(z)
z<--1/0
print(z)
z<--0/1 #OK
print(z)
z<-1/0
print(z)
#-----------------------------------------------
# NULL is an object that is nothing
z<-NULL
typeof(z)
length(z)
is.null(z)
# Three properties of atomic vectors
# Coercion
a<-c(2.1,2.2)
typeof(a)
b<-c("purple","green")
typeof(b)
d<-c(a,b)
print(d)
typeof(d)
#hierarchy of conversion
# logical -> intergers -> double -> character 

a<- runif(10)
print(a) 
a > 0.5    #logical operation
temp<- a > 0.5 # hold these logical values
sum(temp)
# what proportion of the valeus are > 0.5 
mean(a>0.5)

# qualifying exam question: approximately what proportion of observations from a normal (0,1) random variable are >2.0)
mean(rnorm(1000000)>2.0)
#------------ Vectorazation
z<-c(10,20,30)
z+1
y<-c(1,2,3)
z+y #element-by-element matching

short<- c(1,2)
z+short # what happens?
z^2

#creating vectors 
# create an empty vector
z<-vector(mode="numeric",length=0)
print(z)

#add eleemnts to empty vector
z<-c(z,5) #don't do this in your code
print(z)

# instead create a vector of pre-defined length 
z<- rep(0,100)
z[1]<-3.3
z<-rep(NA,100)
head(z)
typeof(z)
z[c(1,2)]<-c("Washington",2.2)
typeof(z)

#generate a long list of names 
MyVector <- runif(100) # get 100 random uniform values 
myNames <- paste("File",seq(1:length(MyVector)),".txt",sep="")
head(myNames)
names(MyVector) <- myNames
head(MyVector)

#-------------------2/6/18----------------------
rep("mystring",3)
rep(x=0.5,times=6)
rep(times=6,x=0.5)
myVec <- c(1,2,3)
rep(myVec,times=2)
rep(x=myVec,each=2)
rep(x=myVec,times=myVec)
rep(x=1:3,times=3:1)

# seq for creating sequences
seq(from=2,to=4)
seq(from=2,to=4,by=0.5)
seq(from=2,to=4,length=7)
x <- seq(from=2,to=4,length=7)
1:x
1:length(x)
seq_along(x) #better than previous line
1:5
seq(1:5)
seq_len(10)
x<-vector(mode="numeric",length=0)
str(x)
1:length(x)
seq_along(x)

#using random numbers
runif(1)
set.seed(100)
runif(1)
runif(n=5,min=100,max=200)
library(ggplot2) #graphics library
z<-runif(1000,min=30,max=300)
qplot(x=z)

# random normal values
z <- rnorm(1000)
qplot(x=z)
z<- rnorm(n=1000,mean=30,std=20)
qplot(x=z)

#use the sample function to draw from an existing vector
longVec<- seq_len(10)
longVec
sample(x=longVec)
sample(x=longVec,size=3) #sample without replacement
sample(x=longVec,size=3,replace = TRUE)
myWeights<- c(rep(20,5),rep(100,5))
sample(x=longVec,replace=T,prob = myWeights)
sample(x=longVec,replace=F,prob = myWeights)

#subsetting of atomic vectors
z<-c(3.1,9.2,1.3,0.4,7.5)
#subsetting on positive index values
z[2]
z[c(2,3)]
z[2:3]
#subsetting on negative index values
z[-c(2,3)]
#subset by creating a boolean vector to select elements that meet a condition
z<3 #just gives index values
z[z<3] #gives actual values
which(z<3) 
myCriteria<-z<3
z[myCriteria]
z[which(z<3)]
zx<-c(NA,z)
zx[zx<3] #missing values retained
zx[which(zx<3)] #missing values dropped

#keep entire vector
z[] #prints entire vector
z[-(length(z):(length(z)-2))]

# subset on names of vector elements
z
names(z) <- letters[seq_along(z)]
z
z[c("b","d","e")]

#generate the set of all numbers from 1 to 100 that are divisible by 9 
q<- seq_len(100)
q[q%%9==0]

