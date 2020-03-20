# Load libraries 
library(tidyverse)

# Load the data sets
pre = read.csv("Data_cleaning_projects/LGI/Pre_LGI_Sp18.csv")

# remove uneeded rows
rmrow = c(1:17)
pre = pre[, -rmrow]
names(pre)

# make the wide data set long
pre.long = gather(pre, "Question", "Answer", 1:22)

# remove the numbers from the questions.
pre.long$Question = str_remove(pre.long$Question, "X._")
pre.long$Question = str_remove(pre.long$Question, "X.._")

# add in a question number column
pre.long$Question.number = pre.long$Question

pre.long$Question.number = plyr::mapvalues(pre.long$Question.number, from = unique(pre.long$Question.number), to = c(1:22))
unique(pre.long$Question.number)

# change the name of the UVID column
names(pre.long)[1] = "UVID"

# rearrange the order of the columns
pre.long = pre.long[, c(1,4,2,3)]

# save as a CSV
write.csv(pre.long, "Pre_LGI_clean.csv", row.names = FALSE)



