# 2.1.4 - Indexing
# Misk Academy Data Science Immersive, 2020

# Indexing refers to
# Finding information by position, using []

# Vectors (1-dimensional) ----
# Using this vector:
foo1
# Try to find the following:
# The 6th element
# The pth element
# The 3rd to the pth element
# the pth to the last element
# remove using - (e.g. 11 - 15th element)
# remove using - (e.g. 11 & 15th element)

# We can use integers, object and functions that
# equate to integers in any combination!

# BUT!!! The exciting part is... using LOGICAL VECTORS
# I.E. THE RESULT OF LOGICAL EXPRESSIONS! (see above)

foo1[foo1 < 45] # All values less than 45

# So what happened here:
foo1 < 45 # produces a logical vector, 
# Remember, this will ALWAYS be the case when you see a 
# relational or logical operator
# Then we use that logical vector to select only the TRUE positions:
foo1[foo1 < 45] 

# Data frames (2-dimensional) ----
# so use [ <rows> , <cols> ] 
# Using this data frame:
foo_df
# Can you find the following 
# The 3rd row, all columns
# The 3rd column, all rows
# The 3rd column, all rows

# Can you identify the data structure of the output?
# What if foo_df wasn't tibble, but actually a true plain old data frame?

# What happens if we have a tibble?
foo_df <- as.data.frame(foo_df)
class(foo_df)
foo_df
# repeat the solutions from above:

# ok, but let's go back to a tibble
foo_df <- as_tibble(foo_df)

# We can also use names:
foo_df[,"healthy"]

# But don't forget logical vectors:
# e.g. which tissues have low quantity (below 10)?

# This also works, as a vector:


# How can we do this using the tidyverse way?