# 2.1.1 - R Basics basics and case study
# Misk Academy Data Science Immersive, 2020

# Always begin your R scripts with a descriptive header

# Load packages ----
# Install once, but initialize each time you start a new session
# We'll come back to this packages soon later on. I put this 
# command here since it's good practice to list all your used 
# packages at the beginning of a script
library(tidyverse)

# Basic R syntax ----
# What does this command do?
n <- log2(8)

# Exercise 1 ----
# Can you identify all the parts of the above commands?

# Exercise 2 ----
# Incomplete commands :/
# What happens if you execute this command?
# n <- log2(8

# Plant Growth Case Study ----

# A built-in data set ----
PlantGrowth # already available in base R
data(PlantGrowth) # This will make it appear in your environment

# We're going to do something quite modern in R, which is to use a 
# tibble instead of a data.frame. That doesn't mean anything to you 
# now, but we'll get to it soon.
# First, make sure you have the tidyverse package installed and
# that you have executed the library(tidyverse) command
# above, after installing, so that you have initialized the package.
PlantGrowth <- as_tibble(PlantGrowth) # convert this to a "tibble" (more on this later)

# 1. Descriptive Statistics ----
# The "global mean" of all the weight values


# Would this on the group column?


# Group-wise statistics
# Here, using functions from dplyr, a part of the Tidyverse
# Using Tidyverse notation:
# %>% is the "the pipe operator"
# Pronounce it as "... and then ..."
# Type it using shift + ctrl + m

# Use summarise() for aggregation functions





# Or... an atypical example, but it can still be useful:




# For transformation functions: e.g. z-score within each group
# (x_i - x_bar)/x_sd
# function: scale()
# typical use mutate()



# or...






# Let's review the two most common syntax paradigms in R
# (This is kind of like different dialects of the same language,
#  some things are the same or very similar but there are key
#  differences that make them distinct systems.)
# Typical base pkg syntax
mean(PlantGrowth$weight)

# Tidyverse syntax
PlantGrowth$weight %>% 
  mean()
# %>% says take the object on the left (i.e. a dataframe) and insert it
# into the first position of the function on the right


# 2. Data Visualization ----
# Here, using functions from ggplot2, a part of the Tidyverse
# 3 essential components
# 1 - The data
# 2 - Aesthetics - "mapping" variables onto scales
# scales: x, y, color, size, shape, linetype
# 3 - Geometry - how the plot will look

# box plot

# "dot plot" (mean +/- 1SD)




# 3. Inferential Statistics ----
# first step: define a linear model
# ~ means "described by"





# 1-way ANOVA





# For all pair-wise comparisons use:



