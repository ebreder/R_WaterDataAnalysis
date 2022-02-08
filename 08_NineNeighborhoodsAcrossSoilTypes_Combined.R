#Nine Neighborhoods Combined
#COMBINE Neighborhoods Data
dfR<-rbind(dfHCA,dfHCB,dfWLE,dfWLS,dfWLW,dfAPK,dfKPT,dfNTR,dfTCR)
str(dfR)
View(dfR)
 rm(list= ls()[!(ls() %in% c('dfR'))])
Data end dates
#END DATES OF DATA (SUBSET ANYTHING BEFORE..)
  # For Phase I & phase II (YR1): 11/4/2011 - 2/16/2016
  #Find data larger than 2/16/2016
  tail(dfR[dfR$Date>42416,])
  #### Data should end on: 2/16/2016 42416
  dfR<-subset(dfR,dfR$Date<42416,)
  tail(dfR[dfR$Date==42416,])
      #START DATE FOR PHASE II 
          ## PHASE II: 10/16/2014(41928) - 10/16/2016(42293) - 2/15/2016(42415) & 6/18/2016(42539) - 9/29/2016(42642)
            #dfR<-subset(dfR,dfR$Date>41927,)
      #END DATE FOR PHASE I ONLY
          ## PHASE I: 11/4/2011(40851) - 10/15/14(41927)
            #dfR<-subset(dfR,dfR$Date<41928,)
Data frame corrections
#Correct Date and time in columns
    dfR$Date<-convertToDate(dfR$Date,origin="1900-01-01") ##The Origin is the start date in excel which corresponds to the number 1
    dfR$Hour<-(dfR$Hour*24)
    dfR$OPT.start.date<-convertToDate(dfR$OPT.start.date,origin="1900-01-01")
# fix ET+OPT treatments that lack the correct name(lack the OPT)
 # TEST IF FIXING WILL WORK
 dfR1<-dfR
 dfRTet<-subset(dfR1,Tech=='ET')
 str(dfRTet) 
 dfRTet[(dfRTet$OPT>0 & dfRTet$Tech=="ET"),'Treatment']="ET+OPT"
 dfRetTest<-subset(dfRTet,Study.ID=='204907')
 dfRetTest<-subset(dfRTet,Study.ID=='205123')
 dfRetTest<-subset(dfRTet,Study.ID=='205157')
 #FINAL FIXING TO DFR
 dfR[(dfR$OPT>0 & dfR$Tech=="ET"),'Treatment']="ET+OPT"
 dfRetTest<-subset(dfR,Study.ID=='204907')
 dfRetTest1<-subset(dfR,Study.ID=='205123')
 dfRetTest2<-subset(dfR,Study.ID=='205157')
Soil type
 #Make sure Data frame has neighborhood and soil type vector
 dfR$Neighborhood<-dfR$Study.ID
 dfR$Neighborhood<-substring(dfR$Neighborhood,1,1)
 dfR$Neighborhood<-as.numeric(dfR$Neighborhood)
 str(dfR)
 #dfRmmWketopt$Soil<-NULL
 dfR[(dfR$Neighborhood==2 | dfR$Neighborhood==3 | dfR$Neighborhood==7 | dfR$Neighborhood==8 | dfR$Neighborhood==9),'Soil']='Flatwood'
 dfR[(dfR$Neighborhood==1 | dfR$Neighborhood==4 | dfR$Neighborhood==5 | dfR$Neighborhood==6),'Soil']='Sand'
 dfR[dfR$Neighborhood==4,]
 #dfR[dfR$Study.ID<200000,]
