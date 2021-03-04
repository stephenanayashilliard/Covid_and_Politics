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

### Data Exploration
 - #### Machine Learning
The goal of the model was to predict whether certain variables such as economic status, political behavior and population demographics would have a postive or negative linear relationship with Covid 19 spread.
   - ##### Models used
     - Random Forest Regressor:  Used to rank feature importance since it has better score metrics and R Squared values than the linear model. This was important since we were measuring and testing so many different points of data.  The only limitations was that a Linear model would have provided better extrapolating of the data.
   - ##### Scaler
     - Robust Scaler and Standard Scaler were needed for clarification on outlier sensitivity.
   - ##### Data Prepocessing
   Specific targets and features were selected from the central dataframe using principal component analysis (PCA) to reduce dimensions and make the model more graphable.
     - ####### Features:
       - Feature Set 1: Related to politics and voting
         - Target: Covid Cases
         - Predictions: Line of best fit for cases and politics.
       - Feature Set 2: Related to Economic Status
         - Target: Covid Cases
         - Predictions: Line of best for economic status and cases.
       - Feature Set 3:  Related to Population Demographics
         - Target: Covid Cases
         - Predictions:  Line of best fit for demographics and cases. 

### Analysis
To be filled in future deliverables 

 - ## Results of Analysis
To be filled in future deliverables

 - ## Recomendations for future analysis
To be filled in future deliverables

### Summary
To be filled in future deliverables
