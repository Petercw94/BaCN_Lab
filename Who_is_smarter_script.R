library(tidyverse)

# Load the data set ####
who = read.csv("./Who_Is_Smarter/Are+you+Smarter__fall_pre-test_survey.csv")

whodates$class = who$courseName

# Separate out the survey dates
whodates = who[, c(2,3,13,21,22)]
whodates$End.Date = as.character(whodates$End.Date)
# Separate time and date from the date column
whodates = separate(data = whodates, col = End.Date, into = c("Date", "Time"), sep = " ")

# Get rid of "/"
whodates$newdates = str_remove_all(whodates$Date, pattern = "/")

whodates %>%
  filter(whodates$instructorLastName == "Kopp") 

# find out which classes each teacher is teaching
whodates %>%
  group_by(instructorLastName) %>%
  unique(class)
