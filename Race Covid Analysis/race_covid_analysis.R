# Statistical analysis of race in relation to COVID cases and deaths 
library(readr)
covid_and_politics_db <- read_csv("Database_Model/Final_Database/covid_and_politics_db.csv")
library(dplyr)
library(tidyverse)
library(ggplot2)ggplot(covid_and_politics_db, aes(x=white)) + geom_density()

# race is categorized as hispanic, black, white, native, asian, pacific in data, represented by population percentage
# visualize distribution using density plot
ggplot(covid_and_politics_db, aes(x=hispanic)) + geom_density()
ggplot(covid_and_politics_db, aes(x=black)) + geom_density()
ggplot(covid_and_politics_db, aes(x=native)) + geom_density()
ggplot(covid_and_politics_db, aes(x=asian)) + geom_density()
ggplot(covid_and_politics_db, aes(x=pacific)) + geom_density()

# linear regression model 
lm(deaths ~ hispanic + black + native + asian + pacific + white,data=covid_and_politics_db)
lm(cases ~ hispanic + black + native + asian + pacific + white,data=covid_and_politics_db)
summary(lm(deaths ~ hispanic + black + native + asian + pacific + white,data=covid_and_politics_db))
summary(lm(cases ~ hispanic + black + native + asian + pacific + white,data=covid_and_politics_db))