# joe mampillil - 07.12.2020
# bootcamp chapter 1 - basics
# file - ch12.ch16.R

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

x = mean(air$DepDelay, na.rm = TRUE) # remove the N/A values so we can actually do the calculation

round(x, digits = 2) # round() could do round(x, digits = 2)
signif(x, 2) # signif() could do round(x, digits = 0)

kmsPerMile <- 1.60934
dist_km <- air$Distance * kmsPerMile
c(dist_km[1], air$Distance[1])

# depShorterArr <- c(subset$DepDelay < subset$ArrDelay, na.rm = TRUE)
delayWorsening <- air$DepDelay < air$ArrDelay
head(delayWorsening)


# =-= Using the ideas =-=

depDiffArr <- c(subset$ArrDelay - subset$DepDelay, na.rm = TRUE)
l1 = length(depDiffArr)
l2 = length(depDiffArr[depDiffArr > 0])
sprintf("%i flights (about %.2f percent) made up for the arrival delay", l1 - l2, l2/l1*100)

# airDD6 = air$DepDelay[air$DepDelay <= 60]
# airDD6[airDD6 < 0] <- 0
# hist(airDD6, breaks=5) # breaks argument is just a suggestion
airDD6 <- air$DepDelay
airDD6[airDD6 < 0] <- 0  
airDD6[airDD6 > 60] <- 60
hist(airDD6)
hist(airDD6, nclass = 100)
hist(airDD6, nclass = 5) # nclass argument is just a suggestion

subChiHou <- air[air$Dest == "ORD" | air$Dest == "IAH", ]
plot(subChiHou$CRSDepTime, subChiHou$DepDelay, main = 'Departure delay by time of day')
subChiHou$color = "blue"
subChiHou$color[subChiHou$Dest == "IAH"] <- "orange"
plot(subChiHou$CRSDepTime, subChiHou$DepDelay, col = subChiHou$color, main = 'Departure delay by time of day')

y <- rnorm(10)
x <- rnorm(10)
mod <- lm(y ~ x)
summ <- summary(mod)
r2 <- summ$r.squared
rse <- summ$sigma
