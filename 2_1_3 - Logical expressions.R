# 2.1.3 - Logical expressions
# Misk Academy Data Science Immersive, 2020

# Logical expressions are how we
# Ask and combine TRUE/FALSE questions

# Asking questions ----
# There a 6 Relational Operators
# == equivalency
# != non-equivalency
# >, <, >=, <=
# !x, where x is a logical vector, give the negation of x
!c(T, F, T, T, T)


# Combining questions ----
# There are 2 typical Logical Operators
# & AND - ALL must be TRUE
# | OR "pipe" - AT LEAST ONE must be TRUE
# plus && and ||, but they are beyond the scope of this workshop

# There is one more R-specific operator
# %in% WITHIN

## Number one thing to remember:
## You will ALWAYS get a logical vector

# Examples with foo_df: Logical data ----
# All healthy observations
foo_df %>% 
  filter(healthy)

# All unhealthy observations
foo_df %>% 
  filter(!healthy)

# Examples with foo_df: Numeric data
# Below quantity 10
foo_df %>% 
  filter(quantity < 10)

# Tails (beyond 10 and 20)
foo_df %>% 
  filter(quantity < 10 | quantity > 20)

# Impossible
foo_df %>% 
  filter(quantity < 10 & quantity > 20)

# Middle (between 10 and 20)
foo_df %>% 
  filter(quantity > 10, quantity < 20)

# Meaningless
foo_df %>% 
  filter(quantity > 10 | quantity < 20)

# What really happened
# We asked two questions:
foo_df$quantity > 10 & foo_df$quantity < 20

# Examples with foo_df: Character data
# NO PATTERN MATCHING so we have to use exact matches
# All heart observations
foo_df %>% 
  filter(tissue == "Heart")

# All heart and liver observations
# Cheap and easy way:
foo_df %>% 
  filter(tissue == "Heart" | tissue == "Liver")

# What if... our query was in a vector?
query <- c("Heart", "Liver")
# %in% is the equivalent of many == combined with |
foo_df %>% 
  filter(tissue %in% query)

# to compare, NEVER DO THIS!!!
# This doesn't work:
foo_df %>% 
  filter(tissue == query)
# But this does: i.e. reverse the query
foo_df %>% 
  filter(tissue == rev(query))

