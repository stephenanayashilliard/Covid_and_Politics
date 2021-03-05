------------------------------------------------------------------- Setup
-- Goal: CREATING TABLES - Create the table dataset skeletons necessary prior to import .csv

-- Create table // county
CREATE TABLE county (
    county VARCHAR,
    state VARCHAR(2),
    lat INT,
    long INT,
    TotalPop INT,
    total_votes20 INT,
    votes20_Donald_Trump INT,
    votes20_Joe_Biden INT,
    -- percentage20_Donald_Trump INT,
    -- percentage20_Joe_Biden INT,
	cases INT,
    deaths INT,
    Men INT,
    Women INT,
    Hispanic INT,
    White INT,
    Black INT,
    Native INT,
    Asian INT,
    Pacific INT,
    Income INT,
    IncomePerCap INT,
    Poverty INT,
    Professional INT,
    Service INT,
    Office INT,
    Construction INT,
    Production INT,
    Drive INT,
    Carpool INT,
    Transit INT,
    Walk INT,
    OtherTransp INT,
    WorkAtHome INT,
    MeanCommute INT,
    Employed INT,
    PrivateWork INT,
    PublicWork INT,
    SelfEmployed INT,
    FamilyWork INT,
    Unemployment INT
);

-- Create table // covid19 
CREATE TABLE covid19 (
    county VARCHAR,
    state VARCHAR(2),
    cases_per_capita_100k INT,
    deaths_per_capita_100k INT,
    pop_per_sq_mile_2010 INT
);

-- Create table // religion 
CREATE TABLE religion (
    county VARCHAR,
    state VARCHAR(2),
    evangelicals INT,
    -- mainline protestant INT,
    catholic INT,
    orthodox INT,
    muslim INT,
    other INT
);

-- Create table // demographics 
CREATE TABLE demographics (
    county VARCHAR NOT NULL,
    state VARCHAR(2) NOT NULL,
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

---------- Review Tables
SELECT * FROM county;
SELECT * FROM covid19;
SELECT * FROM demographics;
SELECT * FROM religion; 

------------------------------------------------------------------- Analysis
/*Goal: JOIN DATASETS to CREATE DB
Plan: 
    1) Concatenate county and state in each table as "County X, State Y" 
    2) Left Join tables with county on left into table "Database" 
    3) Export database into .csv for go live 
    4) Use Python / sqlalchemy to connect to db.
 
*/

------------- PRT. 1
-- Concatenate: StackOverflow - https://stackoverflow.com/questions/22739841/mysql-combine-two-columns-into-one-column/22739860 // W3 - https://www.w3schools.com/sql/func_mysql_concat.asp
/* Model: 
    SELECT CustomerName, CONCAT(Address, ", ", PostalCode, ", ", City) AS Address
    FROM Customers;
*/

-- county
SELECT * CONCAT(county, ", ", state) AS county_state_key
FROM county;

-- covid19
SELECT * CONCAT(county, ", ", state) AS county_state_key
FROM covid19;

-- demographics
SELECT * CONCAT(county, ", ", state) AS county_state_key
FROM demographics;

-- religion
SELECT * CONCAT(county, ", ", state) AS county_state_key
FROM religion; 

------------- PRT. 2
-- (Left) Join on multiple tables: https://www.sqlshack.com/learn-sql-join-multiple-tables/ 
/* Model: 
    SELECT columnX.tableY, columnX.tableY, columnX.tableY
    FROM county
    LEFT JOIN table 1 ON column.table = column.table
    LEFT JOIN table 2 ON column.table = column.table
    LEFT JOIN table 3 ON column.table = column.table;
*/




------------- PRT. 3
-- Export database to csv. Can be done in settings off to the left in postgres.





------------- PRT. 4
-- Use Python / sqlalchemy to connect to db. To be completed in Python.




/*------------------------------------------------------------------- Issues
1. Setup 
    a. Should the percentages be created in the table as INT or another tag?
    b. Religion table - how can I read in "mainline protestant" into the table despite the space?
    c. Shoould primary and foreign keys be added after creation of the key via concatenate? If so, how?

2. 
    Prt. 1 What should I be selecting prior to the concatenate?
    Prt. 2 Do I need to list every column to get it into the database?

*/