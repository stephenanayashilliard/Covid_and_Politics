# Link to Github Project: https://github.com/stephenanayashilliard/Covid_and_Politics

# Covid and Politics
# ------------------------------------------------------------------------

## Setup

### Library Imports
library(dplyr)
library(ggplot2)
library(tidyverse)

### Reading in .csv
covid_and_politics_db <- read.csv(file='covid_and_politics_db.csv', check.names=F,stringsAsFactors = F)
head(covid_and_politics_db)

### Tools used
?ggplot() # Graphing
?geom_point() # scatter
?geom_bar() # bar 
?geom_boxplot() # boxplot
?geom_tile # heatmap
?lm() # trendline


# ------------------------------------------------------------------------

## Analysis
# -----

## Goal 1: Cases compared to income, poverty, unemployment
## A. Linear regression (multivariable)
## B. Scatter 1 to 1
# -----

### A. Linear Regression: Cases v. income, poverty, and unemployment
lm(cases ~ income + poverty + unemployment, data=covid_and_politics_db)
summary(lm(cases ~ income + poverty + unemployment, data=covid_and_politics_db))

### B. 1:1 Scatter plots

# Income
cases_v_income_scatter <- ggplot(covid_and_politics_db, aes(x=income,y=cases))
cases_v_income_scatter + geom_point() + geom_smooth(method = "lm") + labs(x="Average Income of a County", y="Covid Cases Recorded in the County") + ggtitle("Correlation between Covid Cases and Income")

# Poverty
cases_v_poverty_scatter <- ggplot(covid_and_politics_db, aes(x=poverty,y=cases))
cases_v_poverty_scatter + geom_point() + geom_smooth(method = "lm") + labs(x="Poverty in % in a County", y="Covid Cases Recorded in the County") + ggtitle("Correlation between Covid Cases and Poverty Rates")

# Unemployment
cases_v_unemployment_scatter <- ggplot(covid_and_politics_db, aes(x=unemployment,y=cases))
cases_v_unemployment_scatter + geom_point() + geom_smooth(method = "lm") + labs(x="Unemployment in % in a County", y="Covid Cases Recorded in the County") + ggtitle("Correlation between Covid Cases and Unemployment Rates")

## Goal 2: Deaths compared to income, poverty, unemployment
## A. Linear regression (multivariable)
## B. Scatter 1 to 1
# -----

### A. Linear Regression: Deaths v. income, poverty, and unemployment
lm(deaths ~ income + poverty + unemployment, data=covid_and_politics_db)
summary(lm(deaths ~ income + poverty + unemployment, data=covid_and_politics_db))

### B. 1:1 Scatter plots

# Income
deaths_v_income_scatter <- ggplot(covid_and_politics_db, aes(x=income,y=deaths))
deaths_v_income_scatter + geom_point() + geom_smooth(method = "lm") + labs(x="Average Income of a County", y="Covid Deaths Recorded in the County") + ggtitle("Correlation between Covid Deaths and Income")

# Poverty
deaths_v_poverty_scatter <- ggplot(covid_and_politics_db, aes(x=poverty,y=deaths))
deaths_v_poverty_scatter + geom_point() + geom_smooth(method = "lm") + labs(x="Poverty in % in a County", y="Covid Deaths Recorded in the County") + ggtitle("Correlation between Covid Deaths and Poverty Rates")

# Unemployment
deaths_v_unemployment_scatter <- ggplot(covid_and_politics_db, aes(x=unemployment,y=deaths))
deaths_v_unemployment_scatter + geom_point() + geom_smooth(method = "lm") + labs(x="Unemployment in % in a County", y="Covid Deaths Recorded in the County") + ggtitle("Correlation between Covid Deaths and Unemployment Rates")

## Goal 3: Income, Poverty, and Unemployment rate distributions

# A. Distribution of Income
# -----
representation_of_county_average_income <- ggplot(covid_and_politics_db,aes(x=income)) + geom_density() #visualize distribution using density plot
representation_of_county_average_income + labs(x="Average Incomes per County", y="Density") + ggtitle("Distribution of Average Income per County Represented in Dataset")

# B. Distribution of Poverty
# -----
representation_of_poverty_rates <- ggplot(covid_and_politics_db,aes(x=poverty)) + geom_density() #visualize distribution using density plot
representation_of_poverty_rates + labs(x="Poverty Rates per County", y="Density") + ggtitle("Distribution of Poverty Rates Represented in Dataset")

# C. Distribution of Unemployment
# -----
representation_of_unemployment_rates <- ggplot(covid_and_politics_db,aes(x=unemployment)) + geom_density() #visualize distribution using density plot
representation_of_unemployment_rates + labs(x="Unemployment Rates per County", y="Density")  + ggtitle("Distribution of Unemployment Rates Represented in Dataset")
