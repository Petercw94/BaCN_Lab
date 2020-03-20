library(tidyverse)


# Load the data set ####
who = read.csv("Demographics_fall_2019.csv")

# remove the unnecessary columns
bad = c(1, 3:17)
who = who[,-bad]

