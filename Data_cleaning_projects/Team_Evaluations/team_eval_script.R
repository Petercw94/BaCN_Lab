library(tidyverse)

df = read.csv("FinalSpreadsheet_Raw_edited.csv")

rmcol = 1:17
df = df[ , - rmcol]

# Gather the questions and their responses together
df.long = gather(df, 
      key = "Question",
      value = "Answer",
      c(1:37))

# Get rid of the NAs in the data set
df.long = na.omit(df.long)

# Gather the names of the students together
df.long = gather(df.long, 
       key = "Student_group",
       value = "Student_name",
       c(11:15))

# Remove uneeded columns
df.long = df.long[ , - c(5,7:10)]

# Gather the total scores together
df.long = gather(df.long, 
       key = "Student_evaluated",
       value = "Student_score",
       c(1:4))
