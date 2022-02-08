# R_WaterDataAnalysis
This is R code was completed in 2017 to analyze hourly irrigation data of 167 households over 4 years across two soil types.
The irrigation treatments were a combination of two technology types and a group with optimized settings and a group without, creating 4 overall treatments and a monitored/ control group.
It includes initial data management and a clustering analysis. (Files 1-10)
The following was completed as initial steps:
Normaled data using Log base 10 (x + 1), a K-means cluster analysis using the cluster package, summary statistics of irrigation events using the plyr package.

To understand the average amount of irrigation water savings from each technology, summary statistics of irrigation used were calculated for each treatment, divided across two soil types. (Files 11-...)
Average irrigation was calculated per week, per irrigation event (as definied in the initial steps), and the average number of irrigation events to occur per week.


