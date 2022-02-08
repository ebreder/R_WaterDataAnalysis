#Import Raw Data
#The following was done for all nine neighborhoods:
#Resets working directory to my files
getwd()
setwd("S:/mddgrp/ebreder/Eliza/MASTERS/THESIS/EVENTS 1-20-16/2.R ready/WLS hourly raw data")
getwd()
##########################################
##### IMPORT HOURLY DATA #########
#lists the sheet names for all workbooks for OCU
sheets13 <- c("Hourly WLS 175","Hourly WLS 236", "Hourly WLS 8092","Hourly WLS 12700","Hourly WLS 1142")
sheets14 <- c("Hourly WLS 12819","Hourly WLS 12626", "Hourly WLS 12966","Hourly WLS 1028","Hourly WLS 12412")
sheets15  <- c("Hourly WLS 13008","Hourly WLS 12501", "Hourly WLS 156","Hourly WLS 12429","Hourly WLS 8091")
sheets16   <- c("Hourly WLS 815","Hourly WLS 825", "Hourly WLS 12502","Hourly WLS 12663","Hourly WLS 116")
#creates data frame for xlsx file
df13 <- data.frame()
df14 <- data.frame()
df15 <- data.frame()
df16 <- data.frame()
#####Imports xlsx "WLS 1-4" workbook and all five of its sheets at once
for (c in 1:5) #only 5 sheets per workbook
  df13 <- rbind(df13, read.xlsx("WLS 1-4 gal.xlsx", sheet=sheets13[c], startRow = 1, colNames = TRUE))
for (d in 1:5) #only 5 sheets per workbook
  df14 <- rbind(df14, read.xlsx("WLS 2-4 gal.xlsx", sheet=sheets14[d], startRow = 1, colNames = TRUE))
for (e in 1:5) #only 5 sheets per workbook
  df15 <- rbind(df15, read.xlsx("WLS 3-4 gal.xlsx", sheet=sheets15[e], startRow = 1, colNames = TRUE))
for (f in 1:5) #only 5 sheets per workbook
  df16 <- rbind(df16, read.xlsx("WLS 4-4 gal.xlsx", sheet=sheets16[f], startRow = 1, colNames = TRUE))
dfWLS <- rbind(df13, df14, df15, df16)
View(dfWLS)
str(dfWLS)
