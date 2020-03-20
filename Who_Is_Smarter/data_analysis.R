# load the needed libraries 
library(tidyverse)

# load the data to be cleaned ####

# spring data
spring = read.csv("./Who_Is_Smarter/cleaning_data/SMARTER_spring19_clean.csv")

# fall data 
fall = read.csv("./Who_Is_Smarter/cleaning_data/SMARTER_fall19_clean.csv")


# find the total number of students who particpated per semester ####
spring %>%
  group_by(spring$questions) %>%
  summarise(N= n())

fall %>%
  group_by(fall$questions) %>%
  summarise(N= n())
