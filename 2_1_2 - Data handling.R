# 2.1.2 - Data handling
# Misk Academy Data Science Immersive, 2020

# Part 1: Functions (i.e. "verbs") ----
# Everything that happens, is because of a function

# Arithmetic operators ----
# e.g.
34 + 6

# BEDMAS - order of operations
# brackets, expon, div, mult, add, sub
2 - 3/4 # 1.25
(2 - 3)/4 # -0.25

# Use objects in place of numbers
n <- 34
p <- 6
# so...
n + p

# 1 - Generic functions have a form:
# fun_name(fun_arg = ...)

# 2 - Call args by name or position

# i.e.
log(x = 8, base = 2) # long form, naming
log(8, 2) # long form, positional matching
log(8, base = 2) # common: mix naming and position
log2(8) # short form, positional matching
log(base = 2, 8) # works, but confusing!

# 3 - Funs can have 0 to many un-named args
ls()

# 4 - Args can be named or un-named

# e.g. combine
xx <- c(3, 8, 9, 23)
xx

myNames <- c("healthy", "tissue", "quantity")
myNames

# How is + a function?
p + n
# this is actually...
`+`(p, n)

# A regular sequence of numbers
seq(from = 1, to = 100, by = 7)
# typically:
foo1 <- seq(1, 100, 7)
foo1

# use objects in functions:
foo2 <- seq(1, n, p)
foo2

# regular sequence of 1 interval
seq(1, 10, 1)
# Use the colon operator instead:
1:10

# Two major types of math functions:
# Aggregration functions
# 1 output value (typically)
# mean, sd, n, var, median, max, min, sum, prod

# Transformation functions
# same number of output as input
# log, [0,1], z-scores, sqrt, exponents
# subtract background
# +, -, /, ...

# Exercise: Are these transformation or aggregation?
foo2 + 100 # 
foo2 + foo2 # 
sum(foo2) + foo2 # 
1:3 + foo2 # 

# FUNDAMENTAL CONCEPT: VECTOR RECYCLING

1:4 + foo2

# 3 types of messages:
# Information: Neutral
# Warning: Possible problem
# Error: Full stop

# Exercise: Calculate y = 1.12x − 0.4 for xx

# Part 2: Objects (nouns) ----
# Anything that exists is an object

# Vectors - 1-dimensional, homogenous ----
# Everything in the values section
foo1
myNames

# "user-defined atomic vector types" ----
# The 4 most common ones: 
# Logical - TRUE/FALSE, T/F, 1/0 (Boolean)
# Integer - whole numbers
# Double - real numbers (float)
# Character - All values (string)

# Numeric - Generic reference to int or dbl

# check
typeof(foo1)
typeof(myNames)

foo3 <- c("Liver", "Brain", "Testes", "Muscle",
          "Intestine", "Heart")
typeof(foo3)

foo4 <- c(TRUE, FALSE, FALSE, TRUE, TRUE, FALSE)
typeof(foo4)

# Homogenous types:
test <- c(1:10, "bob")
test
typeof(test)

# We can't do math:
mean(test)

# R has a type hierarchy

# Solution: Coercion to another type
# use an as.*() function
test <- as.numeric(test)
test

# Now we can do math: but deal with the NA
mean(test, na.rm = TRUE)

# Lists - 1-dimensional, heterogenous ----
typeof(plant_lm)

# how many elements:
length(plant_lm)
length(foo1) # also works for vectors

# attributes (meta data)
attributes(plant_lm)
# 13 named elements

# use common "accessor" functions for attributes
names(plant_lm)

# Anything that's named can be called with $
plant_lm$coefficients # a 3-element named dbl (numeric) vector
plant_lm$residuals # a 30-element dbl vector
plant_lm$model # dataframe

# Add comment as metadata:
comment(plant_lm) <- "I love R so much!"
attributes(plant_lm)

# Add comment as an actual list item:
plant_lm$myComment <- "But python also :)"
plant_lm$myComment

# What is class?
# An attribute to an object
attributes(plant_lm)
# can also access with "accessor" function:
class(plant_lm)
class(plant_aov)
# class tells R functions what to do with this object
# e.g.
summary(plant_lm) # get t-test and ANOVA summary from an "lm"
summary(PlantGrowth) # summarise each column in a "dataframe"

# Dataframes - 2-dimensional, heterogenous ----
class(PlantGrowth)
# A special class of type list...
typeof(PlantGrowth)
# ...where each element is a vector of the SAME length!
# Rows = observations
# Columns = variables

# Make a data frame from scratch:
foo_df <- data.frame(foo4, foo3, foo2)
foo_df

# update metadata (names)
names(foo_df) <- myNames
foo_df

# Call each variable by name:
foo_df$quantity # as a vector

# Basic functions:
str(foo_df) # structure
glimpse(foo_df)
summary(foo_df)

# also...
dim(foo_df)
nrow(foo_df)
ncol(foo_df)


