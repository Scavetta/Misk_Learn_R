# 2.1.4 - Indexing
# Misk Academy Data Science Immersive, 2020

# Indexing refers to
# Finding information by position, using []

# Vectors (1-dimensional) ----
foo1
foo1[6] # The 6th element
foo1[p] # The pth element
foo1[3:p] # The 3rd to the pth element
foo1[p:length(foo1)] # the pth to the last element
foo1[-(11:15)] # remove using - (e.g. 11 - 15th element)
foo1[-c(11,15)] # remove using - (e.g. 11 & 15th element)

# We can use integers, object and functions that
# equate to integers in any combination!

# BUT!!! The exciting part is... using LOGICAL VECTORS
# I.E. THE RESULT OF LOGICAL EXPRESSIONS! (see above)

foo1[foo1 < 45] # All values less than 45

# Data frames (2-dimensional) ----
# so use [ <rows> , <cols> ] 
foo_df[3,] # The 3rd row, all columns (DATAFRAME)
foo_df[,3] # The 3rd column, all rows (VECTOR)
foo_df[3]  # The 3rd column, all rows (DATAFRAME)
foo_df$quantity

# What happens if we have a tibble?
foo_df <- as_tibble(foo_df)
class(foo_df)
foo_df
# now there are both kept as dataframes!
foo_df[,3]
foo_df[3]

# We can also used names:
foo_df[,"healthy"]

# but don't forget logical vectors:
# e.g. which tissues have low quantity (below 10)?
foo_df[foo_df$quantity < 10, "tissue"]
# This also works, as a vector:
foo_df$tissue[foo_df$quantity < 10]

# Which is exactly the same as:
foo_df %>% 
  filter(quantity < 10) %>% 
  select(tissue)

