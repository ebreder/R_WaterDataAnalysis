#Omit Data Issues
#Omit data issues UDF
	OmitIssues_UDF <-
function(dfR){
for (n in 1:nrow(dfIssues)){
dfR[(dfR$Study.ID==dfIssues[n,1] & dfR$Date>dfIssues[n,2] & dfR$Date<dfIssues[n,3]),'water.mm'] = NA
}
return(dfR)
#makes water column numeric for logical expressions
dfR$water.mm <- as.numeric(dfR$water.mm)
dfR <- na.omit(dfR)
}
dump("OmitIssues_UDF", file="OmitIssues_UDF.R")
source("OmitIssues_UDF.R")
#run the udf on a particular dataframe
dfAPK<-OmitIssues_UDF(dfAPK)
dfKPT<-OmitIssues_UDF(dfKPT)
dfNTR<-OmitIssues_UDF(dfNTR)
dfTCR<-OmitIssues_UDF(dfTCR)
dfHCA<-OmitIssues_UDF(dfHCA)
dfHCB<-OmitIssues_UDF(dfHCB)
dfWLE<-OmitIssues_UDF(dfWLE)
dfWLS<-OmitIssues_UDF(dfWLS)
dfWLW<-OmitIssues_UDF(dfWLW)
#Check data removal
head(dfAPK[dfAPK$Study.ID==101126 & dfAPK$Date>40982,])
#Numeric and missing values
#make water.mm numeric
dfAPK$water.mm <- as.numeric(dfAPK$water.mm)
dfKPT$water.mm <- as.numeric(dfKPT$water.mm)
dfNTR$water.mm <- as.numeric(dfNTR$water.mm)
dfTCR$water.mm <- as.numeric(dfTCR$water.mm)
dfHCA$water.mm <- as.numeric(dfHCA$water.mm)
dfHCB$water.mm <- as.numeric(dfHCB$water.mm)
dfWLE$water.mm <- as.numeric(dfWLE$water.mm)
dfWLS$water.mm <- as.numeric(dfWLS$water.mm)
dfWLW$water.mm <- as.numeric(dfWLW$water.mm)
#omit any NA (missing data)
#Omit missing data ("NA")
dfAPK <- na.omit(dfAPK)
dfKPT <- na.omit(dfKPT)
dfNTR <- na.omit(dfNTR)
dfTCR <- na.omit(dfTCR)
dfHCA <- na.omit(dfHCA)
dfHCB <- na.omit(dfHCB)
dfWLE <- na.omit(dfWLE)
dfWLS <- na.omit(dfWLS)
dfWLW <- na.omit(dfWLW)
