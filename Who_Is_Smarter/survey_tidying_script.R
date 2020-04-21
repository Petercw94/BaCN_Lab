library(tidyverse)

# Load the data
df = read.csv("./Are You Smarter Survey RAW SP2019.csv")
# Remove the unnecessary columns
nocol = c(1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,23,31,32,33,34,35,36,38,39,40,42,43)
df.new = df[,-nocol]

# Rename the columns
newNames = c("Date", 
             "Percentage_smarter_than", 
             "Group_work?", 
             "Group_interactions", 
             "Who_is_smarter?", 
             "How_do_you_know_who_is_smarter?", 
             "Gender", 
             "uvid", 
             "courseID", 
             "courseName", 
             "instructor_last_name", 
             "major_description", 
             "gender2")
colnames(df.new) = newNames

# Remove the unnecessary rows
df.new = df.new[-c(1:3), ]

# Save the file as a .csv
write.csv(df.new, "./tidy_data/Smarter_survey_clean_SP2019.csv", row.names = FALSE)
