# joe mampillil - 07.12.2020
# bootcamp chapter 1 - basics
# file - ch12.chX.R

# =-= Converting between different types of objects =-=
# Can use the as() family of functions

ints <- 1:10
as.character(ints) # nice

as.numeric(c('3.7', '4.8'))

# R tries to help out by automatically converting between types sometimes
# This isn't always the best idea...

indices <- c(1.7, 2.3)
ints[indices]
ints[0.999999999]


# =-= Managing your objects =-=
# R has many built-ins to get object metadata

vec1 <- 1:4
vec2 <- c(1, 2, 3, 4)

length(vec1)
str(vec1)
class(vec1)
typeof(vec1)
class(vec2)
typeof(vec2)
is.vector(vec1)
is.list(vec1)

is.list(myList)
is.vector(myList)
is.data.frame(air)
is.list(air)

# So the class of a vector is the kind of element it holds
# And the type of a vector is the state/representation(?) of that element
# Objects can belong to multiple categories (e.g., can be both a list and a vector)


# =-= A bit on plotting =-=
# R has several plotting systems:
#   - base graphics
#   - lattice graphics
#   - ggplot2 (an add-on package)
# More on latter systems in Mod 8

hist(air$DepDelay)

# make a random subset for quicker plotting:
set.seed(0)  # make the subset reproducible
subset <- air[sample(1:nrow(air), 10000, replace = FALSE), ]
# censor the outliers to limit plotting range
subset$DepDelay[subset$DepDelay > 60*3] <- 60*3
plot(subset$DepDelay ~ subset$Distance)

boxplot(subset$DepDelay ~ subset$DayOfWeek)

boxplot(subset$DepDelay ~ subset$UniqueCarrier)


# =-= Graphics options =-=
# help(par) for graphics settings
# set using par() or within specific graphics command
# (some can be set in either place), e.g.,

par(pch = 2) # pch 0:18 are S-compatible vector symbols; pch 2 is a (empty) triangle (1 is a circle, 0 is a square)
plot(subset$DepDelay ~ subset$Distance, xlab = 'distance (miles)',
     ylab = 'delay (minutes)', log = 'x')

help(par)


# =-==-==-= Breakout (Practice) =-==-==-=


# =-= Basics =-=

x = mean(subset$DepDelay, na.rm = TRUE) # remove the N/A values so we can actually do the calculation

round(x, digits = 2) # round()

signif(x, 2) # signif()

depShorterArr <- c(subset$DepDelay < subset$ArrDelay, na.rm = TRUE)


# =-= Using the ideas =-=

depDiffArr <- c(subset$ArrDelay - subset$DepDelay, na.rm = TRUE)
l1 = length(depDiffArr)
delayPos[depDiffArr > 0]
l2 = length(depDiffArr[delayPos])
sprintf("%i flights (about %.2f percent) made up for the arrival delay", l1 - l2, l2/l1*100)