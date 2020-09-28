# 2.1.5 tidyverse - Tidy data
# Misk Academy Data Science Immersive, 2020

# Get a play data set:
PlayData <- read_tsv("data/PlayData.txt")

# Let's see the scenarios we discussed in class:
# Scenario 1: Transformation across height & width


# For the other scenarios, tidy data would be a 
# better starting point: 
# Specify the ID variables (i.e. Exclude them)



# Now try the same thing but specify the MEASURE variables (i.e. Include them)



# Scenario 2: Transformation across time 1 & 2 (group by type & key)
# Difference from time 1 to time 2 for each type and key (time2 - time1)
# we only want one value as output



# As another example: standardize to time 1 i.e time2/time1




# Keep all values




# Scenario 3: Transformation across type A & B
# Ratio of A/B for each time and key

