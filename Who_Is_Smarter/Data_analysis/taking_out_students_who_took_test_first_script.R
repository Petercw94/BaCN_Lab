library(tidyverse)

# load the data 
df = read.csv("./Who_Is_Smarter/Data_analysis/data_with_syllabus_dates.csv", na.strings = c("", " "))

# remove the first row
df = df[-1, ]

# fix row types 
df$date = as.character(df$date)

# find the students who took the survey after the test
date.test = df$date > df$Date
false.dt = which(date.test == FALSE)

# remove the students who took the survey after the test ####
df = df[-false.dt, ]

# remove the blank rows
df.new = na.omit(df)



# export the data ####
write.csv(df, "./Who_Is_Smarter/Data_analysis/without_students_who_took_test_first.csv", row.names = FALSE)
write.csv(df.new, "./Who_Is_Smarter/Data_analysis/without.students.and.without.NAs.csv", row.names = FALSE)
