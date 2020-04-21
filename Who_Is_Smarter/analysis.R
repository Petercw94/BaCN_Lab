# libraries
# load data
# mutate the data
# make a contingency table
# run a chi-squared


library(tidyverse)
library(readxl)
library(gmodels)
df = read.csv("./tidy_data/SP2019_survey_no.NAs.csv")
df = df %>%
  mutate(Who_is_smarter. = factor(Who_is_smarter.))

CrossTable(df$gender2, df$Who_is_smarter., 
           fisher = TRUE, 
           chisq = TRUE, 
           expected = TRUE, 
           sresid = TRUE,
           format = "SPSS",
           prop.c = TRUE,
           prop.t = FALSE,
           prop.chisq = FALSE)
