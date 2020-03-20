library(tidyverse)

# upload the individual data sets ####

# Spring demographics
SP.dem = read.csv("./Who_Is_Smarter/cleaning_data/Who_is_Smarter_Demographics_RAW_edited_SP2019.csv")

# Spring survey
SP.sur = read.csv("./Who_Is_Smarter/cleaning_data/Are You Smarter Survey RAW SP2019.csv")

# Fall demographics
FA.dem = read.csv("./Who_Is_Smarter/cleaning_data/Who+is+Smarter+Demographics_FALL_edited.csv")

# Fall survey
FA.sur = read.csv("./Who_Is_Smarter/cleaning_data/Are_you_Smarter_survey_FALL.csv")


# add in identifier column
SP.dem$SEMESTER = c(rep("Spring.dem"))
SP.sur$SEMESTER = c(rep("Spring.sur"))
FA.dem$SEMESTER = c(rep("Fall.dem"))
FA.sur$SEMESTER = c(rep("Fall.sur"))

# merge the data sets into one big data set ####

# Spring data set
spring = full_join(SP.dem, SP.sur, by="uvid")

# Fall data set
fall = full_join(FA.dem, FA.sur, by="uvid")


# Remove duplicate data sets ####

# spring
spring = spring[!duplicated(spring$Please.type.your.full.name.below.to.receive.credit.for.participating.), ]

# fall
fall = fall[!duplicated(fall$Please.type.your.full.name.below.to.receive.credit.for.participating.), ]

# rearrange the data sets for the gather function ####

# spring
spring = spring[ ,c(1:21,23:68,22)]

# fall
fall = fall[ ,c(1:21,23:68,22)]

# clean the data sets with the gather function #### 

# spring
spring = gather(spring, key = "questions", value = "response", c(1:66))

# fall 
fall = gather(fall, key = "questions", value = "response", c(1:66))

# export the clean data sets ####

# spring
write.csv(spring, file = "./Who_Is_Smarter/cleaning_data/SMARTER_spring19_clean.csv")

# fall 
write.csv(fall, file = "./Who_Is_Smarter/cleaning_data/SMARTER_fall19_clean.csv")
