#Sort Data Issues and Treatment Changes
#Import Issues File
getwd()
 setwd('S:\\mddgrp\\ebreder\\Eliza\\MASTERS\\THESIS\\EVENTS 1-20-16\\2. R ready\\R code 1-9-2017')
dfIssues <- data.frame()
dfIssues <- rbind(dfIssues, read.xlsx("Data removal.xlsx", sheet="R Issue Removal", startRow = 1, colNames = TRUE))
View(dfIssues)
    #1 APK #4 #5 KPT #6
    #2 HCA #3 HCB #7 WLE #8 WLS #9 WLW
#CHANGE TREATMENTS #############
# WLW treatment Change
dfWLE[(dfWLE$Study.ID==700956),7] = "Comparison"
dfWLE[(dfWLE$Study.ID==700956),6] = "none"
# Check if data was changed
head(dfWLE[dfWLE$Study.ID==700956,])
tail(dfWLE[dfWLE$Study.ID==700956,])
