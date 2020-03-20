library(tidyverse)

# Read in the data set
df = read.csv("Who+is+Smarter+Demographics_August+14,+2019_13.09.csv")

# Look at the data set
glimpse(df)

# Change the name of the consent question to names
names(df)[20] <- "Names"

# Remove the time from Start.Date
df$Start.Date = str_remove(df$Start.Date, " .*")

# Remove unwanted rows
unique(df$Start.Date)

df %>%
  group_by(instructorLastName) %>%
  summarise(N = n())

