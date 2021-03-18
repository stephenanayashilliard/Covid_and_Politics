# Statistical analysis of race in relation to COVID cases and deaths 
library(readr)
library(dplyr)
library(tidyverse)
library(ggplot2)

covid_and_politics_db <- read_csv("covid_and_politics_db.csv")
asiansubset <- filter(covid_and_politics_db, asian > 0)
blacksubset <- filter(covid_and_politics_db, black > 0)
hispanicsubset <- filter(covid_and_politics_db, hispanic > 0)
nativesubset <- filter(covid_and_politics_db, native > 0)
pacificsubset <- filter(covid_and_politics_db, pacific > 0)

# normalize deaths and cases 
normalizecovid <- filter(covid_and_politics_db, deaths > 0)
normalizecovid <- filter(covid_and_politics_db, cases > 0)
normalizecovid <- normalizecovid %>% mutate(logdeaths=log(deaths),logcases=log(cases))
# looking at outliers 
boxplot(normalizecovid$logdeaths)
boxplot.stats(normalizecovid$logdeaths)$out
boxplot.stats(normalizecovid$deaths)$out


# race is categorized as hispanic, black, white, native, asian, pacific in data, represented by population percentage
# visualize distribution using density plot
ggplot(covid_and_politics_db, aes(x=asian)) + geom_density()
ggplot(covid_and_politics_db, aes(x=black)) + geom_density()
ggplot(covid_and_politics_db, aes(x=hispanic)) + geom_density()
ggplot(covid_and_politics_db, aes(x=native)) + geom_density()
ggplot(covid_and_politics_db, aes(x=pacific)) + geom_density()
ggplot(covid_and_politics_db, aes(x=white)) + geom_density()

# histograms of data
hist(covid_and_politics_db$asian)
hist(covid_and_politics_db$black)
hist(covid_and_politics_db$hispanic)
hist(covid_and_politics_db$native)
hist(covid_and_politics_db$pacific)
hist(covid_and_politics_db$white)

boxplot(covid_and_politics_db$deaths, ylab = "deaths")
boxplot(covid_and_politics_db$deaths, ylab = "cases")

# Shapiro test of distributions of each race populations across counties 
shapiro.test(covid_and_politics_db$asian)
shapiro.test(covid_and_politics_db$black)
shapiro.test(covid_and_politics_db$hispanic)
shapiro.test(covid_and_politics_db$native)
shapiro.test(covid_and_politics_db$pacific)
shapiro.test(covid_and_politics_db$white)

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

cor(asiansubset$asian,asiansubset$deaths)
# cor = 0.3816597

cor(covid_and_politics_db$black,covid_and_politics_db$deaths)
# cor = 0.1000879

cor(blacksubset$black,blacksubset$deaths)
# cor = 0.09532199

cor(covid_and_politics_db$hispanic,covid_and_politics_db$deaths)
# cor = 0.1855989

cor(hispanicsubset$hispanic,hispanicsubset$deaths)
# cor = 0.1852145

cor(covid_and_politics_db$native,covid_and_politics_db$deaths)
# cor = -0.2833973

cor(nativesubset$native,nativesubset$deaths)
# cor = -0.03394758

cor(covid_and_politics_db$pacific,covid_and_politics_db$deaths)
# cor = 0.002149216

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

# Normalize data  
asiansubset <- asiansubset %>% mutate(logasian=log(asian))
ggplot(asiansubset, aes(x=logasian)) + geom_density()
shapiro.test((asiansubset$logasian))
# p-value < 2.2e-16
cor(asiansubset$logasian, asiansubset$cases)
# cor = 0.3599048
cor(asiansubset$logasian, asiansubset$deaths)
# cor = 0.3233336  
plt <- ggplot(asiansubset,aes(x=logasian,y=cases))
plt + geom_point()
plt <- ggplot(asiansubset,aes(x=logasian,y=deaths))
plt + geom_point()

blacksubset <- blacksubset %>% mutate(logblack=log(black))
ggplot(blacksubset, aes(x=logblack)) + geom_density()
shapiro.test((blacksubset$logblack))
# p-value < 2.2e-16
cor(blacksubset$logblack, blacksubset$cases)
# cor = 0.1729617
cor(blacksubset$logblack, blacksubset$deaths)
# cor = 0.1625232
plt <- ggplot(blacksubset,aes(x=logblack,y=cases))
plt + geom_point()
plt <- ggplot(blacksubset,aes(x=logblack,y=deaths))
plt + geom_point()

hispanicsubset <- hispanicsubset %>% mutate(loghispanic=log(hispanic))
ggplot(hispanicsubset, aes(x=loghispanic)) + geom_density()
shapiro.test(hispanicsubset$loghispanic)
# p-value < 2.2e-16
hist(hispanicsubset$loghispanic)
hist(hispanicsubset$hispanic)
cor(hispanicsubset$loghispanic, hispanicsubset$cases)
# cor = 0.2331263
cor(hispanicsubset$loghispanic, hispanicsubset$deaths)
# cor = 0.1992367
plt <- ggplot(hispanicsubset,aes(x=loghispanic,y=cases))
plt + geom_point()
plt <- ggplot(hispanicsubset,aes(x=loghispanic,y=deaths))
plt + geom_point()

nativesubset <- nativesubset %>% mutate(lognative=log(native))
ggplot(nativesubset, aes(x=lognative)) + geom_density()
shapiro.test(nativesubset$lognative)
# p-value < 2.2e-16
hist(nativesubset$lognative)
hist(nativesubset$native)
cor(nativesubset$lognative, nativesubset$cases)
# cor = -0.1024355
cor(nativesubset$lognative, nativesubset$deaths)
# cor = -0.1138298
plt <- ggplot(nativesubset,aes(x=lognative,y=cases))
plt + geom_point()
plt <- ggplot(nativesubset,aes(x=lognative,y=deaths))
plt + geom_point()

pacificsubset <- pacificsubset %>% mutate(logpacific=log(pacific))
ggplot(pacificsubset, aes(x=logpacific)) + geom_density()
shapiro.test(pacificsubset$logpacific)
# p-value < 2.2e-16
hist(pacificsubset$logpacific)
hist(pacificsubset$pacific)
cor(pacificsubset$logpacific, pacificsubset$cases)
# cor = 0.03101699
cor(pacificsubset$logpacific, pacificsubset$deaths)
# cor = 0.01305663
plt <- ggplot(pacificsubset,aes(x=logpacific,y=cases))
plt + geom_point()
plt <- ggplot(pacificsubset,aes(x=logpacific,y=deaths))
plt + geom_point()

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