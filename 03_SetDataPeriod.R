#Set Data Period
#remove all data that occured before 11/4/2011 (week 30) This is done in SAS because it is when all treatments start for all locations.(except for apopka as this area was implemented into project later (2/2012))
dfWLS<-subset(dfWLS,dfWLS$Date>"40850",
c(Study.ID,Week,Address,OPT,OPT.start.date,Tech,Treatment,Date,Hour,Water.gal))
