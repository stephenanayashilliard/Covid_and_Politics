# Covid_and_Politics
Final Project for UC Berkeley Extension Bootcamp in Data Analytics (March 2021)

## Team Members in Alphabetical Order
 - Stephen Anayas-Hilliard
 - John Phillips
 - Melyssa Sibal
 - Isaac D. Tucker-Rasbury

## Overview
Using data acquired from multiple sources, we set out to discover if there are correlations with Covid 19 rates of infection and a group's political views, race or ethnicity, age, gender or economic status.  

To allow for the greatest possible diversity in our data, we drew our data from over 3000 counties in the United States. We retrieved our data on race, ethnicity, age, gender and economic status from the United States Census Bureau.  the Association of Statisticians of American Religious Bodies (ASARB) provided our data for the religious affiliations of a counties population.  We used statistics from kaggle for details on individual countie's Covid 19 rates of infections and death rates. 

## Purpose
To answer the question is there a correlation between Covid 19 transfer rates and a countie's population's political views, race or ethnicity make up, age, gender or economic status. 

### Project Breakdown
The project was broken down into four segments.
 - Segment One: 
   - Flesh out overall project
   - Build a model of our fabricated database
   - Build a simple model for machine learning.
     - Role Breakdown:
       - Stephen Anayas-Hilliard:  Responsible for repository, intitial data research and clean up.
       - John Phillips: Mockup of machine learning model.
       - Isaac D. Tucker-Rasbury: Mockup of sample database.
       - Melyssa Sibal: Technologies used in each step of project
  - Segment Two:
    - Refine our database
    - Train our model
    - Role Breakdown:
      - Stephen Anayas-Hilliard:  Responsible for respository,  back end clean up of data,  mock up Dashboard and Google Slides and breakdown of tools that will be used in our dashboard.
      - John Phillips: Machine Learning Model
      - Isaac D. Tucker-Rasbury:  Took care of Database interface,  the table and joined all 4 of our original tables.
      - Melyssa Sibal: Continued with analysis and sample visuals.
  - Segment Three:
    - Connect final database to our model.
    - Continue to train our model
    - Create dashboard and presentation
  - Segment Four:
    - Final touches on model, database and dashboard
  
### Communication Protocols
 - ##### Information Updates
 Regular updates on progress should be given through the team's Slack channel.
 - ##### Team Meetings
 The team will meet regularly on Tuesdays and Thursdays at 6:30 pm.  Tuesday's meetings will be used to clarify and assign duties for that week.  Thursday's meets will cover updates on assignments as well as any other team questions and/or issues.
 - ##### Emergencies
 Team members are encouraged to call or text team members in case of an Emergency.
 - ##### Deliverables
  - Rough drafts of individual deliverables are due by Thursday of each week and must be pushed to Github   
  - Final draft of deliverables are due by Saturday of each week and must be pushed to Github. 

### Resources
 - Data Source: 
   - [county Statistics](https://github.com/stephenanayashilliard/Covid_and_Politics/blob/main/Data/county_statistics.csv)
   - [U.S Religion Census Religious Congregations and Membership](https://github.com/stephenanayashilliard/Covid_and_Politics/blob/main/Data/U.S.%20Religion%20Census%20Religious%20Congregations%20and%20Membership%20Study%2C%202010%20(County%20File).csv)
   - [covid19_us_county.csv](https://github.com/stephenanayashilliard/Covid_and_Politics/blob/main/Data/covid19_us_county.csv)
   - [us_county_demographics.csv](https://github.com/stephenanayashilliard/Covid_and_Politics/blob/main/Data/us_county_demographics.csv)
   - [us-county_pop_and_shps.csv](https://github.com/stephenanayashilliard/Covid_and_Politics/blob/main/Data/us_county_pop_and_shps.csv)
- Software:
- Technologies
- Requirements List
  - PythonData 
- Languages
  - Python
    - Pandas: Used to create and clean DataFrames.
    - Numpy 
- Tools
  - www.quickdatabaseddiagrams.com:  Used to flesh out our fabricated database
- Algorithms

### Database

In order to create the database, I needed to join the datasets detailing the following: a) covid cases and deaths, b) two tables with demographic data, and c) religion. Each table had county and state details as well that I leveraged to join the tables. Once the tables were joined, I uploaded the database to an AWS S3 bucket to allow my colleagues to access the database  by using Pyspark and the object URL. The breakdown of the steps are as follows.

1. _Creating the Join Key_: To perform a join, there needs to be a field to join on. Unfortunately, we did not have one native to the data so we created one. I created a column to hold the key and then set the value equal to the result of county and state column data combined in each row. I then used our county data as the primary table because it had the most results.
2. _Joining in Parts_: To execute the join, I joined two tables into an interim table, table_one, and joined the third table to it creating a table_two. I repeated this again to get the fourth table into the final database.
3. _Troubleshooting Issues_: The fields that were null after the joins from part two needed to be filled in in order to not obstruct the upcoming machine learning model. I turned the null values into zeros and then kept the result.

### Machine Learning
   The goal of the model was to predict whether certain variables such as economic status, political behavior and population demographics would have a positive or negative linear relationship with Covid 19 spread.
   - #### Model Used
     - Random Forest Regressor: The random forest regressor model was chosen for two main reasons- it has the ability to rank the importance of features and showed a better R Squared value and model score than the standard linear regression model. The ranking of features can provide insight into which features have the greatest effect on the target- covid cases. This aligns with the goal of the project which is to understand if economic, political, or demographic data is most related to the transmission of covid-19. 
   - #### Scaler
     - Robust Scaler is used because of its sensitivity to outliers via its use of the interquartile range to scale data.
   - #### Data Preprocessing
     The target of covid cases per county were selected from the central dataframe. This dataframe also included data on voting behavior in the 2020 election, economic indicators such as employment, types of employment, and income, and demographic data such as gender and ethnicity. The columns containing these types of data were selected and put into unique dataframes that were segemented based on economics, voting, and demographics. These dimensions of these individual dataframes were reduced using the principal component analysis package in scikit learn in order to improve the model's ability to perform accurately and to make the findings more graphable. Below is a further breakdown of the features and targets of the three dataframes:
     - Features and Target:
       - Feature Set 1: Related to politics and voting in the 2020 election
         - Target: Covid Cases
         - Predictions: output into a dataframe to compare actual values with predicted values
       - Feature Set 2: Related to Economic Indicators
         - Target: Covid Cases
         - Predictions: output into a dataframe to compare actual values with predicted values
       - Feature Set 3:  Related to Population Demographics
         - Target: Covid Cases
         - Predictions: output into a dataframe to compare actual values with predicted values  
- #### Limitations
  - The main limitation of the machine learning portion of this project is from the dataset. Because the dataset is based on a single moment in time, the linear model can not extrapolate the predictions into the future. If the dataset was organized in a time-series format that tracked the amount of covid cases over time, then this model could predict the amount of covid cases based on the time-series data.

### Dashboard
 - [Google Slides of Dashboard  First Draft](https://docs.google.com/presentation/d/1pdmZe6_bEvOAb7rD1yRc64DmFuYZrB4FGuGW2Jl7vnw/edit?usp=sharing)
 - Dashboard Tools
   - Bootstrap:  Used to create our responsive, front end.
   - D3.json:  Data format for sorting and presenting data
   - Potly:  Used to create dynamic charts to illustrated our findings.
   - Leaflet.js: Javascript Library used to build the heatmap portion of the Dashboard
   - GeoJSON: Used to create feature points for heatmap portion
   - Mapbox API: Used to pull our Maps for our heatmap portion.
   

### Analysis
To be filled in future deliverables 

 - ## Results of Melyssa's Analysis
This section of the project explores the data through Tableau, which will provide some framework for further statistical analysis. 

**Total Cases by State** 

![totalcases](/images/TotalCasesByState.png)

The above bar graph shows the total number of cases per state. While this image gives some information on the number of cases reported within each state, further analysis could provide insight into how the number of cases fits within the total population. This comparison of states does not consider population size. An additional comparison of population per square mile would also be interesting to examine. 

**Cases vs. Voting Count/Percentage**

![casesvsvotingcount](/images/CasesvsVotingCount.png)

The scatter plot illustrates the number of votes for Joe Biden or Donald Trump during the 2020 Presidental Election against the number of cases by county. While this provides a comparison between votes, it does not provide information within the context of total votes.   

![casesvsvotingpercentage](/images/CasesvsVotingPercentage.png)

The scatter plot shows the percentage of total votes for each presidential candidate against the number of cases by county. 

While both plots explore a connection between presidental votes and reported COVID-19 cases, it is difficult to understand if there is a correlation given the clustering effect that can be seen. Further analysis may be conducted to provide insight into a relationship, if any.  

**Cases vs. Age Groups** 

![casesvsallagegroups](/images/CasesvsAllAgeGroups.png)

The graph plots the population percent within given age brackets against number of cases per county. 

![casesvsagegroups](/images/CasesvsAgeGroups.png)

Due to the low percentages of age groups on opposite sides of the age range, the above graph combines age groups, which may be reconsidered for additional analysis. 

Again, the effect of age on reported cases may be explored further. 

**Cases vs. Racial Groups** 

![casesvsrace](/images/casesvsrace.png)

The scatter plot disaggregates the country population by race against the number of reported COVID cases. Race in this graph is reported by the population percentage. Again, from this initial analysis, it is difficult to interpret what effect race has on COVID infection, if any. 

**Cases vs. Median Income**

![casesvsincome](/images/casesvsincome.png)

Median income for counties is plotted against number of cases. Further analysis could examine the difference between median income and income per capita and if either influence reported COVID cases. 

**Cases vs. Gender Percentage**

![casesvsgenderpercentage](/images/CasesvsGenderPercentage.png)

Population by gender is shown in relation to the number of COVID cases. Gender is reported in percentage of the county population. Similarly to the other graphs, it is difficult to see a clear correlation. 

**Cases Heat Map**

![Cases Heat Map](/images/CasesHeatMap.png)

Latitude and longitudes for each county is plotted with the color of each point relating to the number of reported COVID cases. Darker points have relatively more COVID cases, which is defined in the legend. It would be interesting to explore in further depth where the hot spots are and if there are any similarities between the counties in terms of the factors previously mentioned.  

**Cases vs. Religion**

![casesvsreligion](/images/CasesvsReligion.png)

This factor was not included in the machine learning portion, but data on religion is available for the counties included in this project. Religion was grouped into six categories and is plotted as the population percentage of the county against the number of COVID reported cases. Again, further analysis could be conducted to provide further insight. 

- ## Results of Isaac's Analysis
For future deliverables

- ## Results of Stephen's Analysis
For future deliverables

 - ## Recomendations for future analysis
To be filled in future deliverables

### Summary
To be filled in future deliverables
