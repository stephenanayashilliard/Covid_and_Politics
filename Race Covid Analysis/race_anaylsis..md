This analysis examines the relationship of race and COVID-19 reported cases and deaths using RStudio to conduct statistical testing. The data explored comes from two separate sources. COVID reported cases and deaths are from this source from this time point, while racial demographics for each county are from this source from this timepoint. **Insert methodology on how data was collected** Information on race for each county is presented in percentage of county population. As provided by the data source, race is defined into six categories: Asian, Black, Hispanic, Native, Pacific, and White. 

**Limitations**
- Timepoints of data collection
- Incomplete data or missing data due to US Census methodology
- Incomplete data or missing data due to inaccuracy of COVID reporting
- Racial categories are not broken out for further investigation

**Distribution of Racial Demographics within Counties**

![image]

Density plots for each racial category illustrate that populations are not normally distributed across the sample counties. Further, racial groups are not equally represented within each county and within the entire dataset. For Asian, Black, Hispanic, Native, and Pacific populations, the data is right skewed. In contrast, white populations are left skewed. This shows that there is more data on counties with larger white populations. 

![image]

Shapiro tests for each racial category continue to support, in addition to visual assessments of the density plots, that the data is skewed. Because the calculated p-values are less than a significance level of 0.05, there is quantitative data to substainate that the data is not normally distributed. 

![image]

One-sample t-tests were conducted to compare if the distributions of race across sample counties were representative of national demographics. The national demographics were taken from the US Census from 2020 (https://www.census.gov/quickfacts/fact/table/US/RHI725219#RHI725219). While it could be assumed that the categories by the US Census align with the census county data, it should be noted that the methodologies of reporting race vary. It may be possible that people may have been recorded differently between the two points of data collection, and therefore, this comparison may not be accurate. Specifically, the US Census included categories "Two or more races", "White alone, not Hispanic or Latino", while the other dataset does not include those categories. 

With the assumption that the categories are, in fact, aligned, all p-values for each racial category from the one-sample t-tests are calculated under the 0.05 significance level. Therefore, there is sufficient evidence to reject the null hypothesis. There is a statistical difference between the means of each racial category and its national percentage, showing that racial representation differ at the county level. 

**Correlations Between Race and COVID Cases and Deaths**

Pearson correlation coefficients were calculated for each racial category against the number of COVID cases and deaths. Subsets of the data were filtered to remove counties that reported 0% populations of specific ethinicities. Calculating correlation coefficients with these subsets showed that correlations were generally weaker (albeit not by much) when counties that did not report citizens of specific racial categories were removed. It should be noted that there were no counties that reported 0% white. 

![r_deaths](/images/race_analysis/pearsoncoefficients_deaths.png)

Racial categories against the number of deaths show relatively weak correlations than expected. Asian populations and number of deaths show the strongest correlation at 0.3866916 and 0.3816597 when populations with 0% Asian American citizens were removed. 

![r_cases](/images/race_analysis/pearsoncoefficients_cases.png)

Racial categories against the number of COVID related deaths performed similarly for Pearson correlation coefficients. 

These coefficients for both the number of cases and deaths offer opposing ideas to other studies and reports. Specifically, from this data, the coefficient shows a negative correlation between COVID cases and Native populations. In contrast, the CDC has reported that cases in American Indian/Native Americans are 3.5 times that of non-Hispanic whites (https://www.cdc.gov/media/releases/2020/p0819-covid-19-impact-american-indian-alaska-native.html). Additionally, there are several reports that minority communities have been disproportionately impacted by COVID-19, however, these correlation coefficients do not substantiate those claims. 

**Linear Regressions** 



