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

### Machine Learning
   The goal of the model was to predict whether certain variables such as economic status, political behavior and population demographics would have a postive or negative linear relationship with Covid 19 spread.
   - #### Model Used
     - Random Forest Regressor: The random forest regressor model was chosen for two main reasons- it has the ability to rank the importance of features and showed a better R Squared value and model score than the standard linear regression model. The ranking of features can provide insight into which features have the greatest effect on the target- covid cases. This aligns with the goal of the project which is to understand if economic, political, or demographic data is most related to the transmission of covid-19. 
   - #### Scaler
     - Robust Scaler is used because of its sensitivity to outliers via its use of the interquartile range to scale data.
   - #### Data Prepocessing
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
- #### Training and Testing Split
  - The data was split into training and testing sets with the use of scikit learns train_test_split package. The split between training and testing data was set to the default which is 25% for training and 75% for testing. The random state was set to 48 as recommended by the module description on training and testing data.
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

 - ## Results of Analysis
To be filled in future deliverables

 - ## Recomendations for future analysis
To be filled in future deliverables

### Summary
To be filled in future deliverables
