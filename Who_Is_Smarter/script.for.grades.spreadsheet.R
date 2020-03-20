library(tidyverse)

# load in the Fall 19 data ####
fall19 = read.csv("./Who_Is_Smarter/Demographics_fall_2019.csv")
df = fall19[ ,c(37,41,44)]
df$courseSemester = rep("Fall_2019")

# remove the NAs ####
df = df[-1, ]
df$uvid = as.factor(df$uvid)
df$courseCrn = as.factor(df$courseCrn)


# load in the Spring 19 data ####
sp19 = read.csv("./Who_Is_Smarter/Who_is_Smarter_Demographics_RAW_SP2019_full.csv")
sp = sp19[ ,c(37, 41, 44)]
sp$courseSemester = rep("Spring_2019")


# merge the datasets ####
new.df = full_join(df, sp)
new.df = new.df[-241 , ]


# save the data as .csv ####
write.csv(new.df, "./Who_Is_Smarter/Grades.spreadsheet.csv", row.names = FALSE)




