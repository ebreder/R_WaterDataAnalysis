#Convert Hourly Volume to Depth
#The following was done for all nine neighborhoods:
##### IMPORT MASTER LIST INFO (WLS) #########
# IMPORT MAST LIST INFO: Study ID and Irrigated Area 
WLSmList<-read.xlsx("WLS List.xlsx",sheet=1, startRow = 1, colNames = TRUE)
View(WLSmList)
str(WLSmList)
#############MANIPULATION
## Delete gallons that are less than 0 (negative values are not real)
dfWLS$Water.gal<-ifelse(dfWLS$Water.gal<0,0,as.numeric(dfWLS$Water.gal))
str(dfWLS)
galsqft.to.mmconversion <- 12/7.48*25.4
galsqft.to.mmconversion
#Divide gal by specific area for WLS
dfWLS$water.mm <- ifelse(dfWLS$Study.ID==WLSmList[1,1],dfWLS$Water.gal/WLSmList[1,10]*galsqft.to.mmconversion,
ifelse(dfWLS$Study.ID==WLSmList[2,1],dfWLS$Water.gal/WLSmList[2,10]*galsqft.to.mmconversion,
ifelse(dfWLS$Study.ID==WLSmList[3,1],dfWLS$Water.gal/WLSmList[3,10]*galsqft.to.mmconversion,
ifelse(dfWLS$Study.ID==WLSmList[4,1],dfWLS$Water.gal/WLSmList[4,10]*galsqft.to.mmconversion,
ifelse(dfWLS$Study.ID==WLSmList[5,1],dfWLS$Water.gal/WLSmList[5,10]*galsqft.to.mmconversion,
ifelse(dfWLS$Study.ID==WLSmList[6,1],dfWLS$Water.gal/WLSmList[6,10]*galsqft.to.mmconversion,
ifelse(dfWLS$Study.ID==WLSmList[7,1],dfWLS$Water.gal/WLSmList[7,10]*galsqft.to.mmconversion,
ifelse(dfWLS$Study.ID==WLSmList[8,1],dfWLS$Water.gal/WLSmList[8,10]*galsqft.to.mmconversion,
ifelse(dfWLS$Study.ID==WLSmList[9,1],dfWLS$Water.gal/WLSmList[9,10]*galsqft.to.mmconversion,
ifelse(dfWLS$Study.ID==WLSmList[10,1],dfWLS$Water.gal/WLSmList[10,10]*galsqft.to.mmconversion,
ifelse(dfWLS$Study.ID==WLSmList[11,1],dfWLS$Water.gal/WLSmList[11,10]*galsqft.to.mmconversion,
ifelse(dfWLS$Study.ID==WLSmList[12,1],dfWLS$Water.gal/WLSmList[12,10]*galsqft.to.mmconversion,
ifelse(dfWLS$Study.ID==WLSmList[13,1],dfWLS$Water.gal/WLSmList[13,10]*galsqft.to.mmconversion,
ifelse(dfWLS$Study.ID==WLSmList[14,1],dfWLS$Water.gal/WLSmList[14,10]*galsqft.to.mmconversion,
ifelse(dfWLS$Study.ID==WLSmList[15,1],dfWLS$Water.gal/WLSmList[15,10]*galsqft.to.mmconversion,
ifelse(dfWLS$Study.ID==WLSmList[16,1],dfWLS$Water.gal/WLSmList[16,10]*galsqft.to.mmconversion,
ifelse(dfWLS$Study.ID==WLSmList[17,1],dfWLS$Water.gal/WLSmList[17,10]*galsqft.to.mmconversion,
ifelse(dfWLS$Study.ID==WLSmList[18,1],dfWLS$Water.gal/WLSmList[18,10]*galsqft.to.mmconversion,
ifelse(dfWLS$Study.ID==WLSmList[19,1],dfWLS$Water.gal/WLSmList[19,10]*galsqft.to.mmconversion,
ifelse(dfWLS$Study.ID==WLSmList[20,1],dfWLS$Water.gal/WLSmList[20,10]*galsqft.to.mmconversion,
ifelse(dfWLS$Study.ID==WLSmList[21,1],dfWLS$Water.gal/WLSmList[21,10]*galsqft.to.mmconversion,"x")))))))))))))))))))))
#Done
View(dfWLS)
