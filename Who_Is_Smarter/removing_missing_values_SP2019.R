library(tidyverse)


# deal with missing values
# export the data set

# Load in the data set ####
df = read.csv("tidy_data/Smarter_survey_clean_SP2019.csv")

# fix the date column
df$Date = sub(" ", "T", df$Date)
df$Date = sub("T.*", "", df$Date)

# get rid of the first gender question because the second one has 
# all the valus and contains the same information
df = df[ ,-7]

# deal with missing values ####
# function for finding the columns with NA values
nacols <- function(df) {
  colnames(df) [unlist(lapply(df, function(x) any(is.na(x))))]
}

nacols(df)

# find which elements are missing for each of the rows in nacols(df)
# missing elements of Group_work col
# do we want to analyze this as well, or can it be ignored as well?
missing_gw = is.na(df$Group_work.)
gwMissingElements = which(missing_gw == "TRUE")

# missing elements of Who_is_smarter col
# this seems to be the most important to not have missing
ws_missing = is.na(df$Who_is_smarter.)
wsMissingElements = which(ws_missing == "TRUE")

# missing elements of Group_interactions col
# maybe this column is not as big of a deal if it is missing information
gi_missing = is.na(df$Group_interactions)
giMissingElements = which(gi_missing == "TRUE")

# remove the rows that with NAs for the who is smarter question
df = df[-wsMissingElements, ]

# save the new data set for analysis 
write.csv(df, "./tidy_data/SP2019_survey_no.NAs.csv", row.names = FALSE)
