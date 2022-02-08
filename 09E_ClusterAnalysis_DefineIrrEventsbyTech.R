#Cluster Analysis
#Define Events by Technology
#SMS technology
#######################
## CLUSTER SMS ########
##############################################################
######## Test if irrigation events were calculated ###########
dfTest<-subset(dfR,normal>0,)
View(dfTest)
rm(list= ls()[!(ls() %in% c('dfTest','dfR'))])
#############################################
######## Seperate data by technology ########
## FOr all ET tech
dfSMSall<-subset(dfTest,Tech=="SMS",)
#View(dfETall)
############################################
## WITH NORMALIZED DATA Log base 10 (x + 1)
####################################
######## CLUSTER ANALYSIS ##########
### Way 1. K-Means
data<-dfSMSall$normal
wssEPLOT <- function(data, nc=15, seed=500){
                wssE<-(nrow(dfSMSall$normal)-1)*var(dfSMSall$normal)
                for (i in 2:15) {
                                  set.seed(500)
                                  wssE[i] <- sum(kmeans(dfSMSall$normal, 
                                           centers=i)$withinss)}
                plot(1:15, wssE, type="n", xlab="Number of Clusters", main="SMS Technologies (no zeros)",
                ylab="Within groups sum of squares")
                text(1:15, wssE, round(wssE, 2), cex=0.45)}
wssEPLOT(data)
# 3 or 4
######## K - Means ##########
set.seed(500)
fitall <- kmeans(dfSMSall$normal,centers=3,nstart=25)
# get cluster means 
aggregate(dfSMSall$normal,by=list(fitall$cluster),FUN=mean)
aggregate(dfSMSall$normal,by=list(fitall$cluster),FUN=max)
aggregate(dfSMSall$normal,by=list(fitall$cluster),FUN=min)
max(dfSMSall$eventsum)
max(dfSMSall$normal)
ET technology
#######################
## CLUSTER ET ########
##############################################################
######## Test if irrigation events were calculated ###########
dfTest<-subset(dfR,normal>0,)
View(dfTest)
rm(list= ls()[!(ls() %in% c('dfTest','dfR'))])
#############################################
######## Seperate data by technology ########
## FOr all ET tech
dfETall<-subset(dfTest,Tech=="ET",)
#View(dfETall)
############################################
## WITH NORMALIZED DATA Log base 10 (x + 1)
####################################
######## CLUSTER ANALYSIS ##########
# ET Determine number of clusters
### Way 1. K-Means
data<-dfETall$normal
wssEPLOT <- function(data, nc=15, seed=500){
                wssE<-(nrow(dfETall$normal)-1)*var(dfETall$normal)
                for (i in 2:15) {
                                  set.seed(500)
                                  wssE[i] <- sum(kmeans(dfETall$normal, 
                                           centers=i)$withinss)}
                plot(1:15, wssE, type="n", xlab="Number of Clusters", main="ET Technologies (no zeros)",
                ylab="Within groups sum of squares",font.main=1)
text(1:15, wssE, round(wssE, 2), cex=0.45)}
wssEPLOT(data)
# 3 or 4
######## K - Means ##########
set.seed(500)
fitall <- kmeans(dfETall$normal,centers=3,nstart=25)
# get cluster means 
aggregate(dfETall$normal,by=list(fitall$cluster),FUN=mean)
aggregate(dfETall$normal,by=list(fitall$cluster),FUN=max)
aggregate(dfETall$normal,by=list(fitall$cluster),FUN=min)
max(dfETall$eventsum)
max(dfETall$normal)
Comparison technology
#######################
## CLUSTER COMPARISON ########
##############################################################
######## Test if irrigation events were calculated ###########
dfTest<-subset(dfR,normal>0,)
View(dfTest)
rm(list= ls()[!(ls() %in% c('dfTest','dfR'))])
#############################################
######## Seperate data by technology ########
## FOr all ET tech
dfCompall<-subset(dfTest,Tech=="none",)
#View(dfCompall)
############################################
## WITH NORMALIZED DATA Log base 10 (x + 1)
####################################
######## CLUSTER ANALYSIS ##########
# COMPARISON Determine number of clusters
### Way 1. K-Means
data<-dfCompall$normal
wssEPLOT <- function(data, nc=15, seed=500){
  wssE<-(nrow(dfCompall$normal)-1)*var(dfCompall$normal)
  for (i in 2:15) {
    set.seed(500)
    wssE[i] <- sum(kmeans(dfCompall$normal, 
                          centers=i)$withinss)}
  plot(1:15, wssE, type='n', xlab="Number of Clusters", main="Comparison Technologies (no zeros)",
       ylab="Within groups sum of squares",)
text(1:15, wssE, round(wssE, 2), cex=0.45)}
wssEPLOT(data)
# 3 or 4
table(data)
######## K - Means ##########
set.seed(500)
fitall <- kmeans(dfCompall$normal,centers=3,nstart=25)
# get cluster means 
aggregate(dfCompall$normal,by=list(fitall$cluster),FUN=mean)
aggregate(dfCompall$normal,by=list(fitall$cluster),FUN=max)
aggregate(dfCompall$normal,by=list(fitall$cluster),FUN=min)
max(dfCompall$eventsum)
max(dfCompall$normal)
