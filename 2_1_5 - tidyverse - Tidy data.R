# 2.1.5 tidyverse - Tidy data
# Misk Academy Data Science Immersive, 2020

# Get a play data set:
PlayData <- read_tsv("data/PlayData.txt")

# Let's see the scenarios we discussed in class:
# Scenario 1: Transformation across height & width
PlayData$height/PlayData$width

# For the other scenarios, tidy data would be a 
# better starting point: 
# Specify the ID variables (i.e. Exclude them)
PlayData_t <- PlayData %>% 
  pivot_longer(-c(type, time), names_to = "key", values_to = "value")

# Specify the MEASURE variables (i.e. Include them)
PlayData %>% 
  pivot_longer(c(height, width), names_to = "key", values_to = "value")

# Scenario 2: Transformation across time 1 & 2 (group by type & key)
# difference from time 1 to time 2 for each type and key (time2 - time1)
# we only want one value as output
PlayData_t %>% 
  group_by(type, key) %>% 
  summarise(time_diff = value[time == 2] - value[time == 1])

# as another example: standardize to time 1 i.e time2/time1
PlayData_t %>% 
  group_by(type, key) %>% 
  summarise(time_ratio = value[time == 2]/value[time == 1])

# keep all values
PlayData_t %>% 
  group_by(type, key) %>% 
  mutate(time_ratio = value/value[time == 1])

# Scenario 3: Transformation across type A & B
# A/B for each time and key

