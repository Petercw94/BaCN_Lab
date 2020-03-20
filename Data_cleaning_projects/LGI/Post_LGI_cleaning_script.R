# Load libraries 
library(tidyverse)

# Load the data sets
post = read.csv("Data_cleaning_projects/LGI/Post_LGI_Sp18.csv")

# remove uneeded rows
rmrow = c(1:17)
post = post[, -rmrow]
names(pre)

# make the wide data set long
post.long = gather(post, "Question", "Answer", 1:27)

# remove the numbers from the questions.
post.long$Question = str_remove(post.long$Question, "X._")
post.long$Question = str_remove(post.long$Question, "X.._")

# add in a question number column
post.long$Question.number = post.long$Question

post.long$Question.number = plyr::mapvalues(post.long$Question.number, from = unique(post.long$Question.number), to = c(1:27))
unique(post.long$Question.number)

# change the name of the UVID column
names(post.long)[1] = "UVID"

# rearrange the order of the columns
post.long = post.long[, c(1,4,2,3)]

# save as a CSV
write.csv(post.long, "Post_LGI_clean.csv", row.names = FALSE)
