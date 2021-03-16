# Statistical analysis of race in relation to COVID cases and deaths 
library(readr)
library(dplyr)
library(tidyverse)
library(ggplot2)

covid_and_politics_db <- read_csv("covid_and_politics_db.csv")

# race is categorized as hispanic, black, white, native, asian, pacific in data, represented by population percentage
# visualize distribution using density plot
ggplot(covid_and_politics_db, aes(x=asian)) + geom_density()
ggplot(covid_and_politics_db, aes(x=black)) + geom_density()
ggplot(covid_and_politics_db, aes(x=hispanic)) + geom_density()
ggplot(covid_and_politics_db, aes(x=native)) + geom_density()
ggplot(covid_and_politics_db, aes(x=pacific)) + geom_density()
ggplot(covid_and_politics_db, aes(x=white)) + geom_density()

# Shapiro test of distributions of each race populations across counties 
shapiro.test(covid_and_politics_db$asian)
shapiro.test(covid_and_politics_db$black)
shapiro.test(covid_and_politics_db$hispanic)
shapiro.test(covid_and_politics_db$native)
shapiro.test(covid_and_politics_db$pacific)
shapiro.test(covid_and_politics_db$white)

# Attempt to normalize data, transform data to log 
covid_and_politics_db <- covid_and_politics_db %>% mutate(logasian=log(asian))
ggplot(covid_and_politics_db, aes(x=logasian)) + geom_density()
shapiro.test((covid_and_politics_db$logasian))
# p-value came back NA
# how to correct for values that are 0? 

#t-test
# How each racial group compares to national percentage?
# National demographics (https://www.census.gov/quickfacts/fact/table/US/RHI725219#RHI725219)
t.test(covid_and_politics_db$asian,mu=5.9)
# p-value < 2.2e-16 

t.test(covid_and_politics_db$black,mu=13.4)
# p-value < 2.2e-16 

t.test(covid_and_politics_db$hispanic,mu=18.5)
# p-value < 2.2e-16 

t.test(covid_and_politics_db$native,mu=1.3)
# p-value = 0.02594

t.test(covid_and_politics_db$pacific,mu=.2)
# p-value < 2.2e-16 

t.test(covid_and_politics_db$white,mu=76.3)
# p-value = 0.0121

# Plotting race against deaths 
# Is there a correlation to the population percentage and number of deaths for each race
cor(covid_and_politics_db$asian,covid_and_politics_db$deaths)
# cor = 0.3866916

asiansubset <- filter(covid_and_politics_db, asian > 0)
cor(asiansubset$asian,asiansubset$deaths)
# cor = 0.3816597

cor(covid_and_politics_db$black,covid_and_politics_db$deaths)
# cor = 0.1000879

blacksubset <- filter(covid_and_politics_db, black > 0)
cor(blacksubset$black,blacksubset$deaths)
# cor = 0.09532199

cor(covid_and_politics_db$hispanic,covid_and_politics_db$deaths)
# cor = 0.1855989

hispanicsubset <- filter(covid_and_politics_db, hispanic > 0)
cor(hispanicsubset$hispanic,hispanicsubset$deaths)
# cor = 0.1852145

cor(covid_and_politics_db$native,covid_and_politics_db$deaths)
# cor = -0.2833973

nativesubset <- filter(covid_and_politics_db, native > 0)
cor(nativesubset$native,nativesubset$deaths)
# cor = -0.03394758

cor(covid_and_politics_db$pacific,covid_and_politics_db$deaths)
# cor = 0.002149216

pacificsubset <- filter(covid_and_politics_db, pacific > 0)
cor(pacificsubset$pacific,pacificsubset$deaths)
# cor = -0.004109643

cor(covid_and_politics_db$white,covid_and_politics_db$deaths)
# cor = -0.2461909

whitesubset <- filter(covid_and_politics_db, white > 0)
# no rows were dropped
cor(whitesubset$white,whitesubset$deaths)
#cor = -0.2461909

# Plotting race against cases 
# Is there a correlation to the population percentage and number of cases for each race
# plot geom_point()

cor(covid_and_politics_db$asian,covid_and_politics_db$cases)
# cor = 0.3789749

cor(asiansubset$asian,asiansubset$cases)
# cor = 0.3713666

cor(covid_and_politics_db$black,covid_and_politics_db$cases)
# cor = 0.09172789

cor(blacksubset$black,blacksubset$cases)
# cor = 0.08546051

cor(covid_and_politics_db$hispanic,covid_and_politics_db$cases)
# cor = 0.21881

cor(hispanicsubset$hispanic,hispanicsubset$cases)
# cor = 0.2183284

cor(covid_and_politics_db$native,covid_and_politics_db$cases)
# cor = -0.03332523

cor(nativesubset$native,nativesubset$cases)
# cor = -0.04104694

cor(covid_and_politics_db$pacific,covid_and_politics_db$cases)
# cor = 0.02951223

cor(pacificsubset$pacific,pacificsubset$cases)
# cor = 0.005940469

cor(covid_and_politics_db$white,covid_and_politics_db$cases)
# cor = -0.2830009

# no plot or cor for white_subset because there are no counties with 0% white populations. 

# linear regression 
asian_model <- lm(deaths ~ asian,data=covid_and_politics_db)
summary(lm(deaths ~ asian,data=covid_and_politics_db))
asian_yvals <- asian_model$coefficients['asian']*covid_and_politics_db$asian + asian_model$coefficients['(Intercept)']
plt <- ggplot(covid_and_politics_db,aes(x=asian,y=deaths))
plt + geom_point() + geom_line(aes(y=asian_yvals), color="red")

asiansubset_model <- lm(deaths ~ asian,data=asiansubset)
summary(lm(deaths ~ asian,data=asiansubset))
asiansubset_yvals <- asiansubset_model$coefficients['asian']*asiansubset$asian + asiansubset_model$coefficients['(Intercept)']
plt <- ggplot(asiansubset,aes(x=asian,y=deaths))
plt + geom_point() + geom_line(aes(y=asiansubset_yvals), color="red")

black_model <- lm(deaths ~ black,data=covid_and_politics_db)
summary(lm(deaths ~ black,data=covid_and_politics_db))
black_yvals <- black_model$coefficients['black']*covid_and_politics_db$black + black_model$coefficients['(Intercept)']
plt <- ggplot(covid_and_politics_db,aes(x=black,y=deaths))
plt + geom_point() + geom_line(aes(y=black_yvals), color="red")

blacksubset_model <- lm(deaths ~ black,data=blacksubset)
summary(lm(deaths ~ black,data=blacksubset))
blacksubset_yvals <- blacksubset_model$coefficients['black']*blacksubset$black + blacksubset_model$coefficients['(Intercept)']
plt <- ggplot(blacksubset,aes(x=black,y=deaths))
plt + geom_point() + geom_line(aes(y=blacksubset_yvals), color="red")

hispanic_model <- lm(deaths ~ hispanic,data=covid_and_politics_db)
summary(lm(deaths ~ hispanic,data=covid_and_politics_db))
hispanic_yvals <- hispanic_model$coefficients['hispanic']*covid_and_politics_db$hispanic + hispanic_model$coefficients['(Intercept)']
plt <- ggplot(covid_and_politics_db,aes(x=hispanic,y=deaths))
plt + geom_point() + geom_line(aes(y=hispanic_yvals), color="red")

hispanicsubset_model <- lm(deaths ~ hispanic,data=hispanicsubset)
summary(lm(deaths ~ hispanic,data=hispanicsubset))
hispanicsubset_yvals <- hispanicsubset_model$coefficients['hispanic']*hispanicsubset$hispanic + hispanicsubset_model$coefficients['(Intercept)']
plt <- ggplot(hispanicsubset,aes(x=hispanic,y=deaths))
plt + geom_point() + geom_line(aes(y=hispanicsubset_yvals), color="red")

native_model <- lm(deaths ~ native,data=covid_and_politics_db)
summary(lm(deaths ~ native,data=covid_and_politics_db))
native_yvals <- native_model$coefficients['native']*covid_and_politics_db$native + native_model$coefficients['(Intercept)']
plt <- ggplot(covid_and_politics_db,aes(x=native,y=deaths))
plt + geom_point() + geom_line(aes(y=native_yvals), color="red")

nativesubset_model <- lm(deaths ~ native,data=nativesubset)
summary(lm(deaths ~ native,data=nativesubset))
nativesubset_yvals <- nativesubset_model$coefficients['native']*nativesubset$native + nativesubset_model$coefficients['(Intercept)']
plt <- ggplot(nativesubset,aes(x=native,y=deaths))
plt + geom_point() + geom_line(aes(y=nativesubset_yvals), color="red")

pacific_model <- lm(deaths ~ pacific,data=covid_and_politics_db)
summary(lm(deaths ~ pacific,data=covid_and_politics_db))
pacific_yvals <- pacific_model$coefficients['pacific']*covid_and_politics_db$pacific + pacific_model$coefficients['(Intercept)']
plt <- ggplot(covid_and_politics_db,aes(x=pacific,y=deaths))
plt + geom_point() + geom_line(aes(y=pacific_yvals), color="red")

pacificsubset_model <- lm(deaths ~ pacific,data=pacificsubset)
summary(lm(deaths ~ pacific,data=pacificsubset))
pacificsubset_yvals <- pacificsubset_model$coefficients['pacific']*pacificsubset$pacific + pacificsubset_model$coefficients['(Intercept)']
plt <- ggplot(pacificsubset,aes(x=pacific,y=deaths))
plt + geom_point() + geom_line(aes(y=pacificsubset_yvals), color="red")

white_model <- lm(deaths ~ white,data=covid_and_politics_db)
summary(lm(deaths ~ white,data=covid_and_politics_db))
white_yvals <- white_model$coefficients['white']*covid_and_politics_db$white + white_model$coefficients['(Intercept)']
plt <- ggplot(covid_and_politics_db,aes(x=white,y=deaths))
plt + geom_point() + geom_line(aes(y=white_yvals), color="red")

# no subset model for white population because the subset is the same as data

# multiple linear regression model 
lm(deaths ~ hispanic + black + native + asian + pacific + white,data=covid_and_politics_db)
lm(cases ~ hispanic + black + native + asian + pacific + white,data=covid_and_politics_db)
summary(lm(deaths ~ hispanic + black + native + asian + pacific + white,data=covid_and_politics_db))
summary(lm(cases ~ hispanic + black + native + asian + pacific + white,data=covid_and_politics_db))