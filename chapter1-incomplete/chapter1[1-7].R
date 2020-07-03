# joe mampillil - 07.02.2020
# bootcamp chapter 1 - basics


# =-= R as a calculator =-=

2 + 2

2 * pi

7 + runif(1)
runif(1)

3^4
sqrt(4^4)

log(10)
log(100, base = 10)
log(10, base = 10)
log(10^0.5, base = 10)

23 %/% 2
23 %% 2
12 %/% 7
12 %% 7

500000000000000 * 1000
5e9 * 1e3
5000000000 * 1000


# =-= Assigning values to R objects =-=

# value storage
val <- 3
val
print(val)
Val <- 7 # case-sensitive!
print(c(val, Val))

# sequence and repeition storage
mySeq <- 1:6
mySeq

myOtherSeq <- seq(1.1, 11.1, by = 2)
myOtherSeq

length(myOtherSeq)

fours <- rep(4, 6)
fours

# an example of non-numeric data
depts <- c('espm', 'pmb', 'stats')
depts


# =-= Vectors in R =-=

# numeric vector
nums <- c(1.1, 3, -5.7)
devs <- rnorm(5)
devs

# integer vector
ints <- c(1L, 5L, -3L) # force storage as integer not decimal number
# 'L' is for 'long integer'

idevs <- sample(ints, 100, replace=TRUE)

# character vector
chars <- c('hi', 'hallo', "mother's", 'father\'s',
  "She said, 'hi'", "He said, \"hi\"")
chars

cat(chars, sep = "\n")

# logical vector
bools <- c(TRUE, FALSE, TRUE) # looks like bools are case-sensitive
bools


# =-= Working with indices and subsets =-=

vals <- seq(2, 12, by = 2)
vals
vals[3]
vals[3:5]

vals[c(1, 3, 6)]
vals[-c(1, 3, 6)] # Using -c(x) gives everything that is not in c(x)
vals[c(rep(TRUE, 3), rep(FALSE, 2), TRUE)]

# This is one way to read in the contents of a csv file
air <- read.table("data/airline.csv", header=TRUE,
  sep=",")

# create a simple vector from the airline dataset
delay <- air$DepDelay
delay[1:10]

vals[4] <- -35
vals[1:2] <- 0

vals <- rnorm(100)
vals[1:8]
# How does R process these next subset operations?
vals[vals < 0] <- 0 # looks like this replaces every negative with 0
vals[1:8]

crazymakers <- delay[delay > 300]
crazymakers[1:10]

crazymakers <- crazymakers[ !is.na(crazymakers)]
crazymakers[1:10]


# =-= Vectorized calculations and comparisons =-=

vec1 <- sample(1:5, 10, replace = TRUE)
vec2 <- sample(1:5, 10, replace = TRUE)
vec1
vec2

vec1 + vec2
vec1^vec2
vec1 >= vec2
vec1 <= 3

# using 'or'
vec1 <= 0 | vec1 >= 3

# using 'and'
vec1 <= 0 & vec1 >= vec2

vec1 == vec2
vec1 != vec2

# careful:
vec1 = vec2
identical(vec1, vec2)

delayChange <- air$DepDelay - air$ArrDelay
tmp <- delayChange[1:100]
tmp >= 24*60 # full day

vec3 <- sample(1:5, 5, replace = TRUE)
vec4 <- sample(1:5, 3, replace = TRUE)
vec1
vec3
vec4
vec1 + vec3
vec1 + vec4
  # this is interesting. If the longer object is a multiple of the
  # shorter object, then you can operate on the longer one with the
  # shorter one, simply repeating the shorter one when you run out
  # of elements. Doesn't work for non-multiples (no remainder used)