# 2.1.1 - R Basics basics and case study
# Misk Academy Data Science Immersive, 2020

# Always begin your R scripts with a descriptive header

# Load packages ----
# Install once, but initialize each time you start a new session
library(tidyverse)

# Basic R syntax ----
n <- log2(8)

# Exercise 1 ----
# Can you identify all the parts of the above commands?

# Exercise 2 ----
# Incomplete commands :/
# What happens if you execute this command?
n <- log2(8)

# Plant Growth Case Study ----

# A built-in data set ----
PlantGrowth #already available
data(PlantGrowth)

# 1. Descriptive Statistics ----
# The "global mean", e.g. ANOVA Null hypothesis
mean(PlantGrowth$weight)

mean(PlantGrowth$group) # Error, not numeric (int or dbl) or logical (TRUE/FALSE, 1/0)

# group-wise stats
# Here, using functions from dplyr, a part of the Tidyverse
# Thus, using Tidyverse notation
# %>% is the "the pipe operator"
# Pronounce it as "... and then ..."
# Type it using shift + ctrl + m

# summarise for aggregration functions
PlantGrowth %>% 
  group_by(group) %>% 
  summarise(avg = mean(weight),
            sum = sum(weight)) 

# Atypcial, but can still be useful:
PlantGrowth %>% 
  group_by(group) %>% 
  mutate(avg = mean(weight)) 

# for transformation functions: e.g. z-score within each group
# (x_i - x_bar)/x_sd
# function: scale()
# typical use mutate()
PlantGrowth %>% 
  group_by(group) %>% 
  mutate(z_score = scale(weight))

# or
PlantGrowth %>% 
  group_by(group) %>% 
  summarise(z_score = scale(weight))


# What if we didn't use mutate - this doesn't work: 
group_by(PlantGrowth, group) %>% 
  scale(weight)

scale(PlantGrowth$weight)


# Typcial base pkg syntax
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
ggplot(PlantGrowth, aes(group, weight)) +
  geom_boxplot()

# "dot plot" (mean +/- 1SD)
ggplot(PlantGrowth, aes(group, weight)) +
  geom_jitter(width = 0.2, color = "steelblue") +
  stat_summary(fun.data = mean_sdl, 
               fun.args = list(mult = 1),
               color = "red")

# Q-Q plot (useful, but a bit more advanced):
ggplot(PlantGrowth, aes(sample = weight)) +
  geom_qq() +
  geom_qq_line(color = "red") +
  facet_wrap(~ group, scales = "free_y")

# 3. Inferential Statistics ----
# first step: define a linear model
# ~ means "described by"
plant_lm <- lm(weight ~ group, data = PlantGrowth)


# t-tests
# Typically, use t.test(), but here, we can use:
summary(plant_lm)

# 1-way ANOVA
summary(plant_lm)
anova(plant_lm)

# For only ctrl-trt1
# 0.250
t.test(x = PlantGrowth$weight[PlantGrowth$group == "ctrl"],
       y = PlantGrowth$weight[PlantGrowth$group == "trt1"],
       var.equal = FALSE)

# 0.249
t.test(x = PlantGrowth$weight[PlantGrowth$group == "ctrl"],
       y = PlantGrowth$weight[PlantGrowth$group == "trt1"],
       var.equal = TRUE)

# For all pair-wise comparisons use 
Plant_aov <- aov(weight ~ group, data = PlantGrowth)
summary(Plant_aov)
TukeyHSD(Plant_aov)

# What about when there are only two groups:
sleep

# classic t-test
t.test(extra ~ group, data = sleep)

# compare to lm method:
sleep_lm <- lm(extra ~ group, data = sleep)
summary(sleep_lm)
