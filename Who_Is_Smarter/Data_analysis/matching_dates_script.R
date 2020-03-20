library(tidyverse)

# read in the tidy data ####

df = read.csv("./Who_Is_Smarter/Data_analysis/SP.2019.survey.data.to.analyse.csv")
syllabi = read.csv("./Who_Is_Smarter/Data_analysis/syllabi_df.csv")
# add in dates to syllabi df  ####

# create syllabi df 


# arrange the last names of instructors
syllabi <- syllabi %>%
  arrange(instructorLastName)

# get rid of the instructors whose syllabi we don't have
rm = which(syllabi$instructorLastName == "Beucher")
syllabi = syllabi[-rm , ]
rm = which(syllabi$instructorLastName == "Jensen")
syllabi = syllabi[-rm , ]
rm = which(syllabi$instructorLastName == "Kopp")
syllabi = syllabi[-rm , ]
rm = which(syllabi$instructorLastName == "Ogden")
syllabi = syllabi[-rm , ]
rm = which(syllabi$instructorLastName == "Slezak")
syllabi = syllabi[-rm , ]
rm = which(syllabi$instructorLastName == "King")
syllabi = syllabi[-rm , ]

# get rid of classes not from Spring 2019
rm = which(syllabi$courseName == "BIOL-3500-001 | Summer 2019 B2")
syllabi = syllabi[-rm , ]

# get rid of the first three rows that are USELESS
syllabi = syllabi[-c(1:3), ]

# find out how many entries each teacher has 
syllabi %>%
  group_by(instructorLastName) %>%
  summarize(N = n())

# add in the dates FINALLY 
syllabi$dates = c(rep(20190122, 35), 
  rep(20190208, 113), 
  rep(20190201, 84), 
  rep(20190207, 28), 
  rep(00000000, 1), 
  rep(20190208, 43),
  rep(20190207, 27),
  rep(20190117, 65),
  rep(20190124, 1),
  rep(20190201, 85))

# get rid of unwanted columns (no data present)
rm = which(syllabi$courseName == "courseName")
syllabi = syllabi[-rm, ]

# change the column names to match
colnames(syllabi) <- c("course", "instructorName", "date")

# merge the two data sets
new.df = full_join(x = df, y = syllabi)

# get rid of dash marks in first date column
new.df$Date = gsub("-", "", new.df$Date)

# export the new data set ####
write.csv(new.df, "./Who_Is_Smarter/Data_analysis/data_with_syllabus_dates.csv", row.names = FALSE)

