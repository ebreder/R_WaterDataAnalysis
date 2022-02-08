#EVENT SIZE THRESHOLD
#Event Count Loop UDF
ml_udf <-function(dfR){
  #Create data Frames for Irrigation applied per event
  ## Algorithm for sum event and count length
  #creates vector_temp object which is then transformed into a vector that holds information 'x' from dfR
  dfR$eventsum<-0;  dfR$duration<-0
  vector_temp<-0;   sum_temp<-0;    duration1<-0
  #nrow(dfR)
  #Elizaloop
  for (n in 1:nrow(dfR)){
    #x is a given value in row n of column water.mm in data frame dfR
    x<-dfR[n,"water.mm"]
    #if value is greater than zero then put it in vector
    ifelse(x>0, vector_temp<-rbind(vector_temp,x),
           ifelse((x+1>0) && (x-1>0), vector_temp<-rbind(vector_temp,x), 
                  ifelse((x+2>0) && (x-2>0), vector_temp<-rbind(vector_temp,x),"")))
    #if value is greater than zero then count the number of values in the vector minus 1 (minus 1 since vector starts with 0)
    ifelse(x>0, duration<-length(vector_temp)-1, "")
    #if value is greater than zero then sum up the values in the vector
    ifelse(x>0, sum_temp<-sum(vector_temp), "")    
    if(x>0 && dfR[n+1,"water.mm"]==0){dfR[n,12]=sum_temp; dfR[n,13]=duration}
    #If value in water.mm column is zero then set vector, duration and sum to zero - to restart calculation when next irrigation starts
    if(x==0 && n>1 && dfR[n-1,"water.mm"]>0){   vector_temp<-0; duration<-0; sum_temp<-0 } 
  }
  return(dfR)
}

UDF applied: #Eliza Loop: Sum irrigation applied per event and count the duration
#call up the udf file
dump("ml_udf", file="ml_udf.R")
source("ml_udf.R")
 #dfKPTetT<-subset(dfKPT,Treatment=='ET')
 dfKPTetT<-ml_udf(dfKPTetT)
 #dfKPTet5<-subset(dfKPTetT,Study.ID=='506138')
 #dfKPTet560<-subset(dfKPTetT,Week=='60')
         View(dfHCA)
         View(dfHCB)
         View(dfWLE)
         View(dfWLS)
         View(dfWLW)
         View(dfAPK)
         View(dfKPT)
         View(dfNTR)
         View(dfTCR)
#Normalizing Loop UDF
NormL_udf <-
function(dfN){
    ## Normalize eventsum data ##
    #Loop that normalizes data with log(x+1)
    for (i in 1:nrow(dfN)){
      p<-dfN[i,"eventsum"]
      ifelse(p>0, dfN[i,'normal']<-log10(p+1), dfN[i,'normal']<-0)
    }
    return(dfN)
  }

UDF applied: #Norm Loop - Normalizes data of eventsum for each neighborhood
#remove specifics from environment
rm(list= ls()[!(ls() %in% c('dfKPT','dfHCB','dfWLE','dfWLS','dfWLW'))])
#Call up the udf file
dump("NormL_udf", file="NormL_udf.R")
source("NormL_udf.R")  
#dfWLS<-subset(dfWLS, select = -c(normal))
#dfWLW<-subset(dfWLW, select = -c(normal))
dfHCA<-NormL_udf(dfHCA)
dfHCB<-NormL_udf(dfHCB)
dfWLE<-NormL_udf(dfWLE)
dfWLS<-NormL_udf(dfWLS)
dfWLW<-NormL_udf(dfWLW)
dfAPK<-NormL_udf(dfAPK)
dfKPT<-NormL_udf(dfKPT)
dfNTR<-NormL_udf(dfNTR)
dfTCR<-NormL_udf(dfTCR)
#Check to make sure normalizing loop ran.
# Loop ran all the way through 
dfHCAevent<-subset(dfHCA,dfHCA$eventsum>0,)
dfHCANorm<-subset(dfHCA,dfHCA$normal>0,)
dfHCBevent<-subset(dfHCB,dfHCB$eventsum>0,)
dfHCBNorm<-subset(dfHCB,dfHCB$normal>0,)
dfWLEevent<-subset(dfWLE,dfWLE$eventsum>0,)
dfWLENorm<-subset(dfWLE,dfWLE$normal>0,)
dfWLSevent<-subset(dfWLS,dfWLS$eventsum>0,)
dfWLSNorm<-subset(dfWLS,dfWLS$normal>0,)
dfWLWevent<-subset(dfWLW,dfWLW$eventsum>0,)
dfWLWNorm<-subset(dfWLW,dfWLW$normal>0,)
rm(dfAPKevent)
rm(dfAPKNorm)
