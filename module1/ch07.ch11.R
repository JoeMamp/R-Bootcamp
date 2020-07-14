# joe mampillil - 07.03.2020
# bootcamp chapter 1 - basics
# file - ch7.ch11.R

# =-= R is a functional language =-=
# Operations are carried out with functions. Functions take objects as
# inputs and return objects as outputs.
# 
# An analysis can be considered a pipeline of function calls, with
# output from a function used later in a subsequent operation as input
# to another function.
# 
# Functions themselves are objects:

median
class(median)
median(delay)

median(delay, na.rm = TRUE)

hist(rnorm(1000))


# =-= Getting help about a function =-=

# help(lm)
# ?lm
# ?log
# ??'regr'


# =-= Basic kinds of R objects
# In both vectors and matrices, all objects must be of the same type

# matrices
mat <- matrix(rnorm(9), nrow = 3)
t(mat) %*% mat
dim(mat)

# data frames - collections of columns of potentially different types
head(air)
dim(air)
nrow(air)
ncol(air)
names(air)
class(air)
is.matrix(air)
class(air$DepDelay)
class(air$UniqueCarrier)
class(air$Diverted)

# lists - collections of disparate or complicated objects
myList <- list(stuff = 3, mat = matrix(1:4, nrow = 2),
               moreStuff = c("china", "japan"), list(5, "bear"))
myList

myList[[1]]
identical(myList[[1]], myList$stuff)
myList$moreStuff[2]
myList[[4]][[2]]
myList[1:3] # subset of a list is a list

myList$newOne <- 'more weird stuff'
names(myList)
length(myList)


# =-= Other classes of R objects =-=
# R has many approaches to OOP(o-o p). Popular, but kinda klunky.
# The most basic is 'S3' objects (generally built upon lists).

mod <- lm(air$DepDelay ~ air$Distance) # illustration ONLY - poorly-specified model!
class(mod)
is.list(mod)
names(mod)
mod$coefficients
mod[['coefficients']]
mod[[1]]

summary(air$DepDelay)
summary(mod)
# summary.lm