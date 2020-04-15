library(tidyverse)


df = read.csv("./Are You Smarter Survey RAW SP2019.csv")

newNames = c("Date", "Name", "Name1", "Name2", "Group_work?", "Group_member_name", "Group_interactions", "Who_is_smarter?", "How_do_you_know_who_is_smarter?", "Gender", "uvid", "courseID", "courseName", "instructor_last_name", "major_description", "gender2")
df[-2, ]
