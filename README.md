# Covid_and_Politics


The Covid 19 pandemic has devastated and disrupted the lives of billions of people as well as forcing many of the world’s economies to come to a screeching halt.  As of March 18, 2021, the United States has over 29,493,436 confirmed cases of Covid 19 infection and 535,841 confirmed deaths.  The U.S has the highest infection rate and death rate in the world per capita and yet the need to keep the pandemic under control has been very divisive, ultimately splitting into two camps; those who view school closures, stay at home orders and mask wearing as affronts to personal freedoms and those who see them as important steps to curb the pandemic.      The two camps politically divide along party lines with much of those leaning Republican falling in the first camp and those leaning Democratic in the second.  

Anecdotal evidence would suggest that, since mask wearing and social distancing as well as mass testing have proven effected in other countries to curb the spread of covid, then in states or counties with most of their population identifying as Republican should see larger infections rates.   The goal of this project was to find out if there was statistical evidence to back up that perception.


## Table of Contents
 - Overview of the Project
   - Team Members
   - Resources
     - Data
     - Software
     - Technologies
     - Languages
     - Tools
   - Database
   - Dashboard
   - Machine Learning
 - Analysis
   - Process
   - Economics vs Cases/Deaths
   - Race vs Cases/Deaths
   - Machine Learning Analysis of Voting Habits vs Cases/Deaths
 - Summary 
   - Economics and Covid
   - Race and Covid
   - Politics and Covid
 - Recomendations for Future Analysis

## Overview of the Project
Using data acquired from multiple sources, we set out to discover if there are correlations with Covid 19 rates of infection and a group's political views, race or ethnicity, age, gender or economic status.  

To allow for the greatest possible diversity in our data, we drew our data from over 3000 counties in the United States. We retrieved our data on race, ethnicity, age, gender and economic status from the United States Census Bureau.  the Association of Statisticians of American Religious Bodies (ASARB) provided our data for the religious affiliations of a counties population.  We used statistics from kaggle for details on individual countie's Covid 19 rates of infections and death rates. 

  - ### Team Members in Alphabetical Order
    - Stephen Anayas-Hilliard [Github Link](https://github.com/stephenanayashilliard)
    - John Phillips [Github Link](https://github.com/jcp650)
    - Melyssa Sibal [Github Link](https://github.com/melyssasibal)
    - Isaac D. Tucker-Rasbury [Github Link](https://github.com/TuckerRasbury)

 - ### Resources
   - Data Source: 
     - [county Statistics](https://github.com/stephenanayashilliard/Covid_and_Politics/blob/main/Data/county_statistics.csv)
     - [U.S Religion Census Religious Congregations and Membership](https://github.com/stephenanayashilliard/Covid_and_Politics/blob/main/Data/U.S.%20Religion%20Census%20Religious%20Congregations%20and%20Membership%20Study%2C%202010%20(County%20File).csv)
     - [covid19_us_county.csv](https://github.com/stephenanayashilliard/Covid_and_Politics/blob/main/Data/covid19_us_county.csv)
     - [us_county_demographics.csv](https://github.com/stephenanayashilliard/Covid_and_Politics/blob/main/Data/us_county_demographics.csv)
     - [us-county_pop_and_shps.csv](https://github.com/stephenanayashilliard/Covid_and_Politics/blob/main/Data/us_county_pop_and_shps.csv)
   - Technologies
     - PostgresSQL 
     - AWS 
     - Jupyter Notebook
     - Visual Studio Code
     - Tableau for intitial data exploration
     - R and RStudio
     - www.quickdatabaseddiagrams.com:  Used to flesh out our fabricated database
   - Languages
     - Python
       - Pandas: Used to create and clean DataFrames.
       - Numpy
     - Javascript
       - Plotly

 - ### Database
   - #### Process
     - #### Part 1
       - From the intitial research, four csv files containing a total of 53 data points for 3049 counties was retrieved. Using Pandas, the four csv files were converted to dataframes then organized, data was converted to usuable numbers where needed and null values were converted to zeros.
    
     - #### Part 2
       - _Creating the Join Key_: To perform a join, there needs to be a field to join on. Unfortunately, we did not have one native to the data so one was created. A column was created to hold the key and then set the value equal to the result of county and state column data combined in each row. County data was then used as the primary table because it had the most results.
 
       - ![Creating Column State Key](https://github.com/stephenanayashilliard/Covid_and_Politics/blob/main/images/Data_images/Creating_column_state_key.png)
 
     - #### Part 3
       - _Joining in Parts_: To execute the join, the two tables were joined into interim tables, table_one. Then a third table was joined, creating a table_two. This process was repeated again to join the fourth table into the final database.

       - ![Database Joins](https://github.com/stephenanayashilliard/Covid_and_Politics/blob/main/images/Data_images/Database_Joins.png)

     - #### Part 4
       - _Troubleshooting Issues_: The fields that were null after the joins from part two needed to be filled in in order to not obstruct the upcoming machine learning model. The null values  were converted into zeros and the result saved.

     - #### Part 5
       - _Uploaded_: Once the tables were joined, they were uploaded from the local server to an AWS S3 bucket to allow the team to access the database by using Pyspark and the object URL.
       - ![Amazon S3 Bucket](https://github.com/stephenanayashilliard/Covid_and_Politics/blob/main/images/Data_images/Amazon_S3_bucket.png) 

 - ### Machine Learning
   The goal of the machine learning aspect of this project is to predict if a county’s voting patterns in the 2020 election are correlated to covid transmission. Specifically, looking at the percentage of votes for Donald Trump and the percentage of votes for Joe Biden and the number of covid cases per county were used to make predictions. 
     - #### Models Used
       An Ordinary Least Squares (OLS) Model was used to analyze one independent variable at a time and its relation to the dependent variable- covid cases. A Random Forest Regressor (RFR) model was used to analyze multiple independent variables in relation to the dependent variable- covid cases. The OLS model was chosen for its ability to produce descriptive summary statistics and for its ability to be graphed using statsmodels packages. The RFR model was used for its ability to rank feature importances and for its compatibility with other sklearn packages such as RobustScaler, Principal Component Analysis (PCA), and Train, Test, Split.
     - #### Scaling and Data Preprocessing
       For the OLS model, a new column was created titled “normalized_cases” which was created by dividing the number of covid cases per county by the population of that county. This created a more usable variable because it more closely resembled the format of the percentage of votes for Trump and Biden columns. Because both of these columns contained numbers between 0 and 1, it behaved better in the OLS model. Below is an image of the calculation and creation of the normalized_cases column:

      ![](images/ml_images/normalized_cases.png)
      For the RFR model, the data was scaled using the Robust Scaler for its use of the interquartile range to handle the outliers in our dataset. It was decided that removing the outliers would negatively impact the analysis, because the outliers represented large cities that were critical for undertanding the relationship between social, economic, and political correlation to covid. For both models, the data was preprocessed by another team member to include religion and age metrics by county from other datasets. This was helpful for the correlation matrix and for the ranking of feature importance.
     - #### Testing and Training
       - The OLS model did not require any testing or training of the data.
       - The RFR model was trained and tested using sklearn's Train, Test, Split package, which split the data into 70% training data and 30% testing data. The random state for the train and testing and the model was set to 48, as recommended by the sklearn docs.
     - #### Targets and Features
       - For both models, the target was covid cases. The only difference is that the OLS model used the “normalized_cases” calculation and the RFR model used the raw covid cases per county data. The features for the OLS model were the percentage of votes for Donald Trump per county, percentage of votes for Joe Biden per county, and the total votes per county columns. 
       - For the RFR model, all usable features in the dataset were included. The latitude, longitude, county and state columns were excluded from the features because these columns would not benefit the analysis. It was decided that the raw covid cases data would be used as the target instead of the normalized_cases metric for the RFR model to preserve the data format for the ranking of feature importance.
     - #### Limitations
       The main limitation of the machine learning portion of this project is from the dataset. Because the dataset is based on a single moment in time, the linear model can not extrapolate the predictions into the future. If the dataset was organized in a time-series format that tracked the amount of covid cases over time, then this model could predict the amount of covid cases based on the time-series data. Further, the main drawback of the RFR model was its weakness in creating actionable insights. With no ability to create regression result statistics like the OLS model, the only insight into our question that could be gained from the RFR model was from the ranking of feature importance. 

 - ### Dashboard
   - #### Process
     It was determined from the onset of the project that the dashboard for the project needed to be fully interactive and contain both information about processes for the    individual deliverables, as well as a written report about the analysis. For illustrative purposes, the dashboard allows the user to choose a county from a drop down menu.  From that choice illustrated graphs are created and depicted.
     - Dashboard and Information Tabs
     - ![Dashboard Title Page](https://github.com/stephenanayashilliard/Covid_and_Politics/blob/main/images/dash_board_images/dashboard_title_page.png)
     
     - Depicted Graphs:
       - How the County Voted
       - Racial Demographics for the County
       - Unemployment Rates for the County
       - Occupation Demographics for the County
       - Age Demogrphics for the County
       - ![Screenshot of Graphs](https://github.com/stephenanayashilliard/Covid_and_Politics/blob/main/images/dash_board_images/graphs.png)

     - Pulldown Menu
     - ![Screenshot of Pulldown Menu](https://github.com/stephenanayashilliard/Covid_and_Politics/blob/main/images/dash_board_images/pull_down_menu.png)

     - Storyboard: A storyboard was created to aid in the programming process.
       - [Google Slides of Dashboard  First Draft](https://docs.google.com/presentation/d/1pdmZe6_bEvOAb7rD1yRc64DmFuYZrB4FGuGW2Jl7vnw/edit?usp=sharing)

     - Dashboard Tools: The following tools were used to create the dashboard:
       - Bootstrap:  Used to create our responsive, front end.
       - D3.json:  Data format for sorting and presenting data
       - Potly:  Used to create dynamic charts to illustrated our findings.
       - Tableau:  Used to create interactive map of covid spread and deaths attributed to covid.
     
   
## Analysis
 - ### Process 
   Data was first explored through Tableau, which provided framework for further statistical analysis. This exploration looked at the number of cases in each county against 2020 presidential votes, age groups, racial groups, gender and income. 

   R was used to conduct statistical analysis on economic and racial demographics and its relationship to COVID cases and deaths. Machine learning was utilized to examine political voting behavior and COVID impacts. 

 - ### Economics vs Cases/Deaths
   The component of the overall analysis examines the relevance of the economic demographic variables to the strength of the overall Covid19 cases and deaths predicting model that we have endeavor to build here. While this analysis confirms the relevance of economic demographic variables with linear regression models, it leaves quantifying that relevance to the broader analysis in the machine learning section. To substantiate the relevance of the aforementioned variables, see the below for the p-values of the multi-variable linear regressions below with income, poverty rate, and unemployment rate as independent variables and Covid19 deaths and cases as dependent variables.

 - ![](/images/ITR/Economics_LinearRegression_on_Deaths.png) 

 - ![](/images/ITR/Economics_LinearRegression_on_Cases.png)

  Here, the p-values establish the statistical significance of each variable. However, the R-squared values of both linear regressions can be interpreted as saying that these variables are very limited in their ability to alone predict Covid cases and deaths. Which brings us to a point where we should explore each of these variables.

   - #### Income
     The average incomes per county represented in the databased are distributed around approximately $49k.

   - #### Poverty Rates 
     The poverty rates in the database are predominantly distributed around 15% per county.

   - ![](/images/ITR/Distribution_of_PovertyRates.png)

   - #### Unemployment Rates
     The unemployment rates in the database are predominantly distributed around 6-7% per county.

   - ![](/images/ITR/Distribution_of_UnemploymentRates.png)

 - ### Race vs Cases/Deaths
   This analysis examines the relationship between race and COVID-19 reported cases and deaths using RStudio to conduct statistical testing. The data explored comes from two separate sources. Racial demographics disaggregated by county were extracted from the US Census and presented as population percentages of six racial categories: Asian, Black, Hispanic, Native, Pacific, and White. COVID report cases and deaths were extracted from The New York Times, which has been tracking cases and deaths since January 2021.  

    - **Distribution of Racial Demographics within Counties**

      - ![density_asian](/images/race_analysis/AsianPopulationDistribution.png)

      - ![density_black](/images/race_analysis/BlackPopulationDistribution.png)

      - ![density_hispanic](/images/race_analysis/HispanicPopulationDistribution.png)

      - ![density_native](/images/race_analysis/NativePopulationDistribution.png)
 
      - ![density_pacific](/images/race_analysis/PacificPopulationDistribution.png)

      - ![density_white](/images/race_analysis/WhitePopulationDistribution.png)

      - ![histogram](/images/race_analysis/histograms_all.png)

        Density plots and histograms for each racial category illustrate that populations do not have normal distribution across the selected counties. Further, that racial groups are not equally represented within each county and within the entire dataset. For Asian, Black, Hispanic, Native, and Pacific populations, the data is right skewed. In contrast, white populations are left skewed. This shows that there is more data on counties with larger white populations. 

   - ![shapiro](/images/race_analysis/shapiro_tests.png)

     Shapiro tests for each racial category continue to support, in addition to visual assessments of the density plots, that the data is skewed. Because the calculated p-values are less than a significance level of 0.05, there is quantitative data to substantiate that the data does not have normal distribution. 

   - ![t_tests](/images/race_analysis/t-test_countyvscountry.png)

     One-sample t-tests were conducted to compare if the distributions of race across sample counties were representative of national demographics. The national demographics were taken from the US Census from 2020 (https://www.census.gov/quickfacts/fact/table/US/RHI725219#RHI725219). 

     P-values for each racial category from the one-sample t-tests are calculated under the 0.05 significance level. Therefore, there is sufficient evidence to reject the null hypothesis. There is a statistical difference between the means of each racial category and its national percentage, showing that racial representation differ at the county level. 

  - **Correlations Between Race and COVID Cases and Deaths**

    Pearson correlation coefficients were calculated for each racial category against the number of COVID cases and deaths. Subsets of the data were filtered to remove counties that reported 0% populations of specific ethnicities. Calculating correlation coefficients with these subsets showed that correlations were generally weaker. It should be noted that there were no counties that reported 0% white. 

![r_deaths](/images/race_analysis/pearsoncoefficients_deaths.png)

Racial categories against the number of deaths show relatively weak correlations than expected. Asian populations and number of deaths show the strongest correlation at 0.3866916 and 0.3816597 when populations with 0% Asian American citizens were removed. 

![r_cases](/images/race_analysis/pearsoncoefficients_cases.png)

Racial categories against the number of COVID related deaths performed similarly for Pearson correlation coefficients. 

These coefficients for both the number of cases and deaths offer opposing ideas to other public studies and reports. One specific instance of this is the correlation coefficients for Native populations. From this data, the coefficient shows a negative correlation between COVID cases and Native populations. In contrast, the CDC has reported that cases in American Indian/Native Americans are 3.5 times that of non-Hispanic whites (https://www.cdc.gov/media/releases/2020/p0819-covid-19-impact-american-indian-alaska-native.html). Additionally, there are several reports that minority communities have been disproportionately impacted by COVID-19, however, these correlation coefficients do not substantiate those claims. 

  - **Linear Regression Models** 

    Linear regressions were performed between individual racial categories and the number of COVID-related deaths to examine further if race is a predictor. 

![1linear](/images/race_analysis/1linear.png)

![2linear](/images/race_analysis/2linear.png)

![3linear](/images/race_analysis/3linear.png)

From the linear regression models, all R-squared values are small, and therefore, the models would be poor predictors of deaths. While p-values for Asian, Black, Hispanic, and white populations are below the significance level, p-values for Native and Pacific populations are above the significance level. Therefore, the slope of the linear model is 0, which is illustrated when the graphs are plotted. This could be interpretted that deaths in Native and Pacific populations could be due to randm chance and error. 

  - **Multiple Linear Regression Models** 

    Multiple linear regressions were performed utilizing all racial categories and the number of COVID deaths and cases. 

![ml_cases](/images/race_analysis/ml_cases.png)

![ml_deaths](/images/race_analysis/ml_deaths.png)

   Similarly to the linear regressions, the multiple linear regression models returned low R-squared values. Again this shows that these models would be poor predictors of COVID cases and deaths. Asian and Pacific communities were found to be statistically significant in these models. 

  - **Limitations** 

    While this analysis shows weak correlations between race and COVID impacts, there are various public reports and studies that provide opposing conclusions, specifically stating that Black and brown communities have been disproportionately impacted. This disconnect may be happening for the following reasons: 

     * Inaccurate or missing data: While the data has been sourced from the New York Times and the US Census, two reputable sources, these data may be inaccurate. The New York Times disclaims that their "patchwork reporting methods" led to "difficult interpretations about how to count and record cases". Additionally, COVID cases were reported from counties where patients were being treated and not necessarily where they lived. In regards to census data, these data may be inaccurate due to the political debates around who is counted, as well as results of the Trump administration.

     * Missing perspective: Racial demographics of people who contracted COVID or who had died of COVID would have been a key perspective to this analysis. This could have provided insight into which populations are getting COVID or dying from COVID and are those proportions similar to the county racial demographics. 

- ### Machine Learning Analysis
  This analysis is based on the OLS regression model described earlier in the readme under the "Machine Learning" section. The three factors used and their relation to covid were a county's percentage of votes for Trump in the 2020 election, a county's percentage of votes for Biden in the 2020 election, and a county's total votes in the 2020 election.

 - **Percentage of Trump Votes and Covid Cases (per county)**

   The chart below shows the OLS summary statistcs for this analysis. Notably, the R-squared is 68% and the p-value is 0. This means that 68% of the covid cases are explained by a county's votes for Donald Trump, and that we can reject the null hypothesis that this relationship is due to random chance.
![](images/ml_images/ml_trumpvotes_OLS.png)

   The graph below visualizes the distribution of the data and the regression line with confidence intervals.
   ![](images/ml_images/ml_trumpvotes_graph.png)

 - **Percentage of Biden Votes and Covid Cases (per county)**

   The chart below shows the OLS summary statistcs for this analysis. Notably, the R-squared is 60% and the p-value is 0. This means that 60% of the covid cases are explained by a county's votes for Joe Biden, and that we can reject the null hypothesis that this relationship is due to random chance.
![](images/ml_images/ml_bidenvotes_OLS.png)

   The graph below visualizes the distribution of the data and the regression line with confidence intervals.
![](images/ml_images/ml_bidenvotes_graph.png)

 - **Total Votes and Covid Cases (per county)**

   The chart below shows the OLS summary statistcs for this analysis. Notably, the R-squared is 65% and the p-value is 0. This means that 65% of the covid cases are explained by a county's total votes, and that we can reject the null hypothesis that this relationship is due to random chance.
![](images/ml_images/ml_total_votes_OLS.png)

   The graph below visualizes the distribution of the data and the regression line with confidence intervals.
![](images/ml_images/ml_totalvotes_graph.png)

 - **Model Efficacy: OLS Real Values vs Predictions and Mean Difference**

   Another method for analyzing the regression results apart from the summary statistics is to compare the real values and the predicted values. This was done by creating a dataframe with the real values, predicted values, and the the difference between these values (by subtracting the real values from the predicted values). Next, the mean of these differences was calculated for each model and put into the dataframe below:

![](images/ml_images/ml_comparison.png)

  From this dataframe, we can conclude that the OLS model was able to best predict the amount of covid cases based on a county's percentage of votes for Donald Trump. However, there does appear to be a relationship between the R-squared value and the mean of the differences for each model's independent variable: the higher the R-squared, the lower the mean of differences is between the real values and the predicted values for each model's independent variable. From this, we can conclude that the ability of a linear regression model to explain the relationship between a dependent and an independent variable directly affects the ability of that model to make predictions.

 - **RFR Model Insights**

   Below is a correlation matrix graph that indicates the correlation between all features in the dataset. This was useful in helping to determine the levels of correlation between features, most importantly between covid cases per county and everything else.
![](images/ml_images/correlation_matrix.png)

 - **RFR Ranking of Feature Importance**

   One of the main benefits of the RFR model is its ability to rank the importance of features based on the target of covid cases per county. The graph below ranks the top 11 most important features used in the RFR model. This provides further insight into what characteristics have the greatest effect on covid cases per county.
![](images/ml_images/feature_importances.png)

 - **Analysis of Results**

   Based on the above above information, there are several conclusions that can be made. First, the R-squared values are all within 60% to 68%, which tells us that this model only explains the relationship between covid cases and voting behavior to a certain extent. The p-values of 0 are a strong indicator that the relationship of this data is not due to random chance, and that there is a statistically significant relationship between voting behavior and covid cases.

   The RFR model's ranking of feature importance and the correlation matrix both demonstrate that for voting behaviors, votes for Donald Trump seem to be most correlated to covid cases per county. However, the OLS model's coefficient for Trump votes is 0.0411, and the OLS model's coeffecient for Biden Votes is 0.0721. From this information, we can conclude that for every percentage increase in votes for Trump in a county, the amount of covid cases increases by roughly 4.1%; and for every percentage increase in votes for Biden in a county, the amount of covid cases increases roughly 7.2%. This finding can be explained by the fact that densely populated metropolitan areas typically vote for democrats while less populated rural areas typically vote for republicans. Covid cases are more easily transmissable in densely populated areas, which explains the higher coefficient for Biden votes. In essence, the density of populations is probably a stronger indicator of covid transmission than the voting habits of those areas.

### Summary
Taking anecdotal evidence into account; the daily news reports of large groups of conservatives not using masks or practicing social distancing, as well as a multitude of reports showing that the covid pandemic is affecting minority communities at a much higher rate than predominantly white communities.  The hypothesis was that one or both factors should be a good indicator of future covid spread. 

In the case of race, it turned to be a poor predictor which is contrary to current reports and research, however, it does suggest that there are additional factors in play.  For example, race in combination with social economic status or in combination with the population density of the region.

As for the political leanings of a region, the opposite proved true, in areas where the greater percentage of votes went to the Democratic ticket, there was marked increase in higher covid transmission.  However, most large, densely populated urban areas have historically lean Democratic while sparsely populated rural areas have typically identified as Republican.


### Recommendations for Future Analysis

At the time of this study, covid rates were changing rapidly. The study should be approached again once the incoming stream of data stabilizes, and a much clearer picture can be assessed.  In addition, data showing more specific information about individuals who have contracted covid allow for better representation and breakdown of the data.  

The machine learning model could be improved by including data sets that include data both before and after the 2020 election which would allow data input much better suited for regression analysis. Another interesting study would be to find out why the RFR model ranked the votes for Donald Trump as the most important political feature. Further analysis could prove that Trump votes are more highly correlated to increases in covid transmission if the population density of the county were accounted for. This could be accomplished by dividing the number of votes for each candidate per county by the square mileage of each county.

Additionally, an analysis of comparable counties may reveal even more insight.  For example, multiple counties with approximately the same total population, could prove or disprove if one of the many factors we reviewed could have a significant correlation on Covid spread.


# Contact Information
Email: Stephenanayashilliard@gmail.com

Linkedin: [Linkedin for Stephen Anayas-Hilliard](https://www.linkedin.com/in/stephen-anayas-hilliard-942a8431/)
