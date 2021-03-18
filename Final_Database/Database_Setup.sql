------------------------------------------------------------------- Setup
-- Goal: CREATING TABLES - Create the table dataset skeletons necessary prior to import .csv

-- Create table // county
CREATE TABLE county (
    county VARCHAR,
    state VARCHAR(2),
    lat FLOAT,
    long FLOAT,
    TotalPop FLOAT,
    total_votes20 FLOAT,
    votes20_Donald_Trump FLOAT,
    votes20_Joe_Biden FLOAT,
    percentage20_Donald_Trump FLOAT
    percentage20_Joe_Biden FLOAT,
	cases FLOAT,
    deaths FLOAT,
    Men FLOAT,
    Women FLOAT
    Hispanic FLOAT,
    White FLOAT,
    Black FLOAT,
    Native FLOAT,
    Asian FLOAT,
    Pacific FLOAT,
    Income FLOAT,
    IncomePerCap FLOAT,
    Poverty FLOAT,
    Professional FLOAT,
    Service FLOAT,
    Office FLOAT,
    Construction FLOAT,
    Production FLOAT,
    Drive FLOAT,
    Carpool FLOAT,
    Transit FLOAT,
    Walk FLOAT,
    OtherTransp FLOAT,
    WorkAtHome FLOAT,
    MeanCommute FLOAT,
    Employed FLOAT,
    PrivateWork FLOAT,
    PublicWork FLOAT,
    SelfEmployed FLOAT,
    FamilyWork FLOAT,
    Unemployment FLOAT
);

-- Create table // covid19 
CREATE TABLE covid19 (
    county VARCHAR,
    state VARCHAR(2),
    cases_per_capita_100k FLOAT,
    deaths_per_capita_100k FLOAT,
    pop_per_sq_mile_2010 FLOAT
);

-- Create table // religion - GREEN LIGHT
CREATE TABLE religion (
    county VARCHAR,
    state VARCHAR(2),
    evangelicals FLOAT,
    protestant FLOAT,
    catholic FLOAT,
    orthodox FLOAT,
    muslim FLOAT,
    other FLOAT
);

-- Create table // demographics - GREEN LIGHT
CREATE TABLE demographic (
    county VARCHAR,
    state VARCHAR(2),
    AGE_OTO4 INT,
    AGE_5TO14 INT,
    AGE_15TO24 INT,
    AGE_25TO34 INT,
    AGE_35TO44 INT,
    AGE_45TO54 INT,
    AGE_55TO64 INT,
    AGE_65TO74 INT,
    AGE_75TO84 INT,
    AGE_84PLUS INT
);

---------- Verify Tables
SELECT * FROM county;
SELECT * FROM covid19;
SELECT * FROM demographic;
SELECT * FROM religion; 

------------------------------------------------------------------- Analysis
/*Goal: JOIN DATASETS to CREATE DB
Psuedocode: 
    1) Add column with concatenate county and state in each table as "County X, State Y" 
    2) Left Join tables with county on left into table "Database" 
    3) Export database into .csv or .sqlite for go live 
    4) Use Python / sqlalchemy to connect to db.
 
*/

------------- PRT. 1
-- Add column with county_state column

-- StackOverflow Concatenate - https://stackoverflow.com/questions/22739841/mysql-combine-two-columns-into-one-column/22739860 
-- W3 - Concatenate - https://www.w3schools.com/sql/func_mysql_concat.asp // https://www.w3schools.com/sql/sql_insert_into_select.asp
-- W3 - Add column - https://www.w3schools.com/sql/sql_alter.asp
/* Pseudocode
	Add the column, 
	set the column's value as desired, 
	and double check that it worked
*/

-- COUNTY
ALTER TABLE county
ADD county_state VARCHAR;

UPDATE county
SET county_state = CONCAT(county, ', ', state);

SELECT * FROM county;

-- COVID19 
ALTER TABLE covid19
ADD county_state VARCHAR;

UPDATE covid19
SET county_state = CONCAT(county, ', ', state);

SELECT * FROM covid19;

-- DEMOGRAPHIC 
ALTER TABLE demographic
ADD county_state VARCHAR;

UPDATE demographic
SET county = replace(county,' ', '');
UPDATE demographic
SET county_state = CONCAT(county, ', ', state);

/* ------------------------------------------------------
NOTE - REMOVING WHITE SPACE
Removing extra white space demographic.county_state - https://stackoverflow.com/questions/20376579/how-do-i-remove-all-spaces-from-a-field-in-a-postgres-database-in-an-update-quer
update users
  set fullname = replace(fullname, ' ', '');
--------------------------------------------------------*/

SELECT * FROM demographic;

 -- RELIGION 
ALTER TABLE religion
ADD county_state VARCHAR;

UPDATE religion
SET county_state = CONCAT(county, ', ', state);

SELECT * FROM religion;

------------- PRT. 2
-- (Left) Join on multiple tables


SELECT 
    -- county.*, 
    county.county,
    county.state,
    county.county_state,
    county.lat,
    county.long,
    county.TotalPop,
    county.total_votes20,
    county.votes20_Donald_Trump,
    county.votes20_Joe_Biden,
    county.percentage20_Donald_Trump,
    county.percentage20_Joe_Biden,
	county.cases,
    county.deaths,
    county.Men,
    county.Women,
    county.Hispanic,
    county.White,
    county.Black,
    county.Native,
    county.Asian,
    county.Pacific,
    county.Income,
    county.IncomePerCap,
    county.Poverty,
    county.Professional,
    county.Service,
    county.Office,
    county.Construction,
    county.Production,
    county.Drive,
    county.Carpool,
    county.Transit,
    county.Walk,
    county.OtherTransp,
    county.WorkAtHome,
    county.MeanCommute,
    county.Employed,
    county.PrivateWork,
    county.PublicWork,
    county.SelfEmployed,
    county.FamilyWork,
    county.Unemployment,
    -- covid19.* w/o county and state duplicates,
    -- covid19.county_state,
    covid19.cases_per_capita_100k,
    covid19.deaths_per_capita_100k,
    covid19.pop_per_sq_mile_2010
INTO step_one
FROM county
    LEFT JOIN covid19
            ON county.county_state = covid19.county_state
;

-- Double Check
SELECT * FROM  step_one;

SELECT 
	step_one.*,
    demographic.AGE_OTO4, -- has null values post join, must update to zero
    demographic.AGE_5TO14, -- has null values post join, must update to zero
    demographic.AGE_15TO24, -- has null values post join, must update to zero
    demographic.AGE_25TO34, -- has null values post join, must update to zero
    demographic.AGE_35TO44, -- has null values post join, must update to zero
    demographic.AGE_45TO54, -- has null values post join, must update to zero
    demographic.AGE_55TO64, -- has null values post join, must update to zero
    demographic.AGE_65TO74, -- has null values post join, must update to zero
    demographic.AGE_75TO84, -- has null values post join, must update to zero
    demographic.AGE_84PLUS -- has null values post join, must update to zero
INTO step_two
FROM step_one
	LEFT JOIN demographic 
		ON demographic.county_state = step_one.county_state;

/* Pseudocode - 
Turn nulls into 0 preventatively for machine learning model to come
Then Check if a Column has a null value //
*/

-- Changes all nulls in specified columns into 0s
UPDATE step_two
SET AGE_OTO4 = COALESCE(AGE_OTO4, 0),
	AGE_5TO14 = COALESCE(AGE_5TO14, 0), 
	AGE_15TO24 = COALESCE(AGE_15TO24, 0),
	AGE_25TO34 = COALESCE(AGE_25TO34, 0),
	AGE_35TO44 = COALESCE(AGE_35TO44, 0),
    AGE_45TO54 = COALESCE(AGE_45TO54, 0),
    AGE_55TO64 = COALESCE(AGE_55TO64, 0),
    AGE_65TO74 = COALESCE(AGE_65TO74, 0),
    AGE_75TO84 = COALESCE(AGE_75TO84, 0),
    AGE_84PLUS = COALESCE(AGE_84PLUS, 0)
;

-- Check for ISNULL in all columns
SELECT step_two.*
FROM step_two 
WHERE step_two.* ISNULL;

-- Check complete step_two
SELECT * FROM step_two;

-- Final step, step_three as 'covid_and_politics_db'
SELECT
    step_two.*,
    -- religion.* w/o county and state duplicates
    -- religion.county_state,
    religion.evangelicals,
    religion.protestant,
    religion.catholic,
    religion.orthodox,
    religion.muslim,
    religion.other
INTO covid_and_politics_db
FROM step_two
    LEFT JOIN religion
		ON step_two.county_state = religion.county_state
;

SELECT * FROM covid_and_politics_db;

-- Fill null values in religion fields
UPDATE covid_and_politics_db
SET evangelicals = COALESCE(evangelicals, 0),
	protestant = COALESCE(protestant, 0), 
	catholic = COALESCE(catholic, 0),
	orthodox = COALESCE(orthodox, 0),
	muslim = COALESCE(muslim, 0),
    other = COALESCE(other, 0)
;

-- Check final for null values
SELECT covid_and_politics_db.*
FROM covid_and_politics_db 
WHERE covid_and_politics_db.* ISNULL;

-- Review DB
SELECT * FROM covid_and_politics_db;


------------- PRT. 3
-- Export database to csv. Can be done in settings off to the left in postgres.
-- Potential solution is working with bucket and connecting the bucket


------------- PRT. 4
-- Use Python / sqlalchemy to connect to db. To be completed in Python.



/*------------------------------------------------------------------- Issues
- Export final database to csv, upload to AWS bucket, allow teammates to access bucket