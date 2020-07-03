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