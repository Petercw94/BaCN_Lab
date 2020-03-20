library(tidyverse)

# Load the data ####
df = read.csv("./Who_Is_Smarter/Who_is_Smarter_Demographics_RAW_SP2019_full.csv")
df.new = df[ , c(2, 37, 41, 44, 18:36)]
df.new = df.new[ , -c(6:7)]
# tidy the data set ####

colnames(df.new) <- c("EndDate", 
                      "UVID",
                      "CourseCRN",
                      "Semester",
                      "Name",
                      "transfer.from.2.year.college",
                      "parents.graduate.with.bacherlors",
                      "major",
                      "ethnicity",
                      "native.english.speaker","age", 
                      "transgender", 
                      "gender.identity",
                      "gender.identity.cont.",
                      "anxiety.disorder",
                      "learning.disability",
                      "developmental.disorder",
                      "permission.gpa",
                      "permission.high.school.gpa",
                      "permission.exam.one.score.",
                      "permission.course.grade")


df.long = gather(df.new, "question", "response", c(5:length(df.new)))
df.long = df.long[-1, ]
