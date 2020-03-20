library(tidyverse)

# load and tidy the data ####
# load
df = read.csv("./Who_Is_Smarter/SP.2019.survey.raw.csv")

# tidy
colnames(df)
df.new = df[ , c(2, 18:28, 30,32,35,41,44)]
colnames(df.new) <- c("Date",
                      "Name",
                      "Consent",
                      "Name2",
                      "Percentage.smarter.than",
                      "how.many.work.with?",
                      "name.work.with",
                      "class.interactions",
                      "who.is.smarter",
                      "how.do.you.know?",
                      "gender",
                      "uvid",
                      "course",
                      "CRN",
                      "Semester",
                      "Major",
                      "gender2")
df.new = df.new[-c(1:2), ]
df.long = gather(df.new, "question", "answer", c(5:10))

# rearrange the data
df.long = df.long[ , c(1,2,4,6,12,13,5,11,7,8,9,10,3)]

# Tidy the individual columns to make them workable
# remove the time stamp from the dates
df.long = separate(df.long, Date, into = c("Date", "Time"), sep = " ")
df.long = df.long[ , -2]

# join the name columns
df.long = unite(df.long, col = "Name", c(Name, Name2), sep = "_")
df.long = df.long[ , -6]

# explore the data
df.long %>%
  filter(question == "who.is.smarter") %>%
  ggplot(aes(x=gender2, y = answer, color = course)) +
  geom_jitter()

# make a syllabi df
syllabi = df[ ,c(30, 37)]


# export the data ####
write.csv(df.long, 
          "./Who_Is_Smarter/Data_analysis/SP.2019.survey.data.to.analyse.csv",
          row.names = FALSE)

write.csv(syllabi, "./Who_Is_Smarter/Data_analysis/syllabi_df.csv", row.names = FALSE)
