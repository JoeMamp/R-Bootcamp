# joe mampillil - 07.02.2020
# bootcamp module 2 - managing R and R resources
# file - ch01.chX.R
setwd("C:/Users/josep/Code/Personal/Practice/Learning - R/bootcamp")
# This is one way to read in the contents of a csv file
air <- read.table("data/airline.csv", header=TRUE, sep=",")


# =-= Managing and saving the workspace =-=

x <- rnorm(5)
y <- c(5L, 2L, 7L)
z <- list(a = 3, b = c('sam', 'yang'))
ls() # search the user the workspace (global environment)

rm(x)
ls()
ls.str()

ls()
save.image('ch01.chX.R')
rm(list = ls()) # clears all the objects??!?!!
ls()

load('ch01.chX.R')
ls()

# how to find all objects with 'x' in their name?
apropos('x')


# =-= Packages (R's killer app) =-=

# install.packages(c('chron','colorspace','DBI','devtools','dichromat','digest',
# 'doParallel', 'dplyr', 'fields','foreach','ggplot2',
# 'gridExtra','gtable','inline', 'iterators','knitr',
# 'labeling','lme4','mapproj','maps','munsell', 'proto',
# 'rbenchmark','RColorBrewer','Rcpp','reshape2','rJava',
# 'RSQLite', 'scales','spam','stringr','tidyr','xlsx',
# 'xlsxjars','xtable'))

# for a list of the objects in a package, along with a brief description, use: library(help = packageName)