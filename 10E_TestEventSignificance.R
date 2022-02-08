#Test Significance of Events
#SMS technology
#### Testing other Clusters #####
rm(list= ls()[!(ls() %in% c('dfTest','dfR','dfSMSall'))])
#Irrigation events greater than 0
# dfSMSall has values greater than zero for only ET technology
dfall<-dfSMSall
#Irrigation events greater than log10 (x+1) = 0.46; x=1.923
dfRsem1<-subset(dfSMSall,eventsum>4.25,)
#Irrigation events less than 1 mm
df1mm<-subset(dfSMSall,eventsum<4.25,)
x<-nrow(df1mm)
y<-nrow(dfSMSall)
x/y
#describe what <1mm events look like in events and gal
max(df1mm$Water.gal)
max(df1mm$normal)
max(df1mm$eventsum)
min(df1mm$Water.gal)
min(df1mm$normal)
min(df1mm$eventsum)
mean(df1mm$Water.gal)
mean(df1mm$normal)
mean(df1mm$eventsum)
median(df1mm$Water.gal)
median(df1mm$normal)
median(df1mm$eventsum)
### For all Irrigation events (including less than 1 mm)
# Total irr applied per HH/ # weeks = 
# Sum each households irrigation applied then divide by 208 weeks (238-30)
Irr.Hall <-ddply(dfall,c(.(Study.ID),.(Treatment)),summarize,HHsum=sum(eventsum))
#Averaging irrigation applied per week by dividing by 
#208 weeks (since its the number of weeks where irrigation COULD HAVE OCCURED)
Irr.Hall$AvgWK<-Irr.Hall$HHsum/(max(dfSMSall$Week)-30)
# 1 = yes with 1 mm, 0 = no without 1 mm
Irr.Hall$factor<-1
#WEEKLY AVERAGE IRRIGATION OF SMS TECHNOLOGIES (including all data)
mean(Irr.Hall$AvgWK)
### For all Irrigation events (including less than 1 mm)
# Total irr applied per HH/ # weeks = 
# Sum each households irrigation applied then divide by 208 weeks (238-30)
Irr.Hsem1 <-ddply(dfRsem1,c(.(Study.ID),.(Treatment)),summarize,HHsum=sum(eventsum))
#Averaging irrigation applied per week by dividing by 
#208 weeks (since its the number of weeks where irrigation COULD HAVE OCCURED)
Irr.Hsem1$AvgWK<-Irr.Hsem1$HHsum/(max(dfSMSall$Week)-30)
# 1 = yes with 1 mm, 0 = no without 1 mm
Irr.Hsem1$factor<-0
#WEEKLY AVERAGE IRRIGATION OF ET TECHNOLOGIES (not including the cluster)
mean(Irr.Hsem1$AvgWK)
##############################################################################
## HERE WE SEPERATE THE TECHNOLOGIES BY TREATMENT. FROM ET TO -> EDU & NONEDU
# THEN WE COMPUTE THEIR AVERAGES
# SEPERATE BY TECH 
#### AVERAGES FOR ALL DATA (including groups)
Irr.HallSMS<-subset(Irr.Hall,Irr.Hall$Treatment=="SMS",) 
mean(Irr.HallSMS$AvgWK)
# only 22 observations which is why avg here is greater than avgerage for all ET technologies (38 obs)
Irr.HallSMSO<-subset(Irr.Hall,Irr.Hall$Treatment=="SMS+OPT",) 
mean(Irr.HallSMSO$AvgWK)
#### AVERAGES FOR data not including group
Irr.Hsem1SMS<-subset(Irr.Hsem1,Irr.Hsem1$Treatment=="SMS",) 
mean(Irr.Hsem1SMS$AvgWK)
# only 22 observations which is why avg here is greater than avgerage for all ET technologies (38 obs)
Irr.Hsem1SMSO<-subset(Irr.Hsem1,Irr.Hsem1$Treatment=="SMS+OPT",) 
mean(Irr.Hsem1SMSO$AvgWK)
# TEST IF FACTOR IS SIGNIFICANT.. DOES REMOVING <3.18 GROUP SIGNIFICANTLY CHANGE THE AVERAGE WEEKLY IRRIGATION APPLIED?
Irr.H<-rbind(Irr.Hall,Irr.Hsem1)
OCUmf<-lm(AvgWK ~ factor, data=Irr.H)
anova(OCUmf)
OCUmt<-lm(AvgWK ~ Treatment + factor, data=Irr.H)
anova(OCUmt)
#######################################
### IS FACTOR SIGNIFICANT BY TREATMENT? AND NOT JUST TECHNOLOGY?
Irr.H.sms<-subset(Irr.H,Irr.H$Treatment=="SMS",)
OCUmsms<-lm(AvgWK ~ factor, data=Irr.H.sms)
anova(OCUmsms)
pairwise.t.test(Irr.H.sms$AvgWK,Irr.H.sms$factor)
Irr.H.smso<-subset(Irr.H,Irr.H$Treatment=="SMS+OPT",)
OCUmsmso<-lm(AvgWK ~ factor, data=Irr.H.smso)
anova(OCUmsmso)
pairwise.t.test(Irr.H.smso$AvgWK,Irr.H.smso$factor)
ET technology
#### Testing other Clusters #####
rm(list= ls()[!(ls() %in% c('dfTest','dfR','dfETall'))])
#Irrigation events greater than 0
# dfETall has values greater than zero for only ET technology
dfall<-dfETall
#Irrigation events greater than log10 (x+1) = 0.46; x=1.923
dfRsem1<-subset(dfETall,eventsum>4.25,)
#Irrigation events less than 1 mm
df1mm<-subset(dfETall,eventsum<4.25,)
x<-nrow(df1mm)
y<-nrow(dfETall)
x/y
#describe what <1mm events look like in events and gal
max(df1mm$Water.gal)
max(df1mm$normal)
max(df1mm$eventsum)
min(df1mm$Water.gal)
min(df1mm$normal)
min(df1mm$eventsum)
mean(df1mm$Water.gal)
mean(df1mm$normal)
mean(df1mm$eventsum)
median(df1mm$Water.gal)
median(df1mm$normal)
median(df1mm$eventsum)
### For all Irrigation events (including less than 1 mm)
# Total irr applied per HH/ # weeks = 
# Sum each households irrigation applied then divide by 208 weeks (253-30)
Irr.Hall <-ddply(dfall,c(.(Study.ID),.(Treatment)),summarize,HHsum=sum(eventsum))
#Averaging irrigation applied per week by dividing by 
#208 weeks (since its the number of weeks where irrigation COULD HAVE OCCURED)
Irr.Hall$AvgWK<-Irr.Hall$HHsum/(max(dfETall$Week)-30)
# 1 = yes with 1 mm, 0 = no without 1 mm
Irr.Hall$factor<-1
#WEEKLY AVERAGE IRRIGATION OF ET TECHNOLOGIES (including all data)
mean(Irr.Hall$AvgWK)
### For all Irrigation events (including less than 1 mm)
# Total irr applied per HH/ # weeks = 
# Sum each households irrigation applied then divide by 208 weeks (238-30)
Irr.Hsem1 <-ddply(dfRsem1,c(.(Study.ID),.(Treatment)),summarize,HHsum=sum(eventsum))
#Averaging irrigation applied per week by dividing by 
#208 weeks (since its the number of weeks where irrigation COULD HAVE OCCURED)
Irr.Hsem1$AvgWK<-Irr.Hsem1$HHsum/(max(dfETall$Week)-30)
# 1 = yes with 1 mm, 0 = no without 1 mm
Irr.Hsem1$factor<-0
#WEEKLY AVERAGE IRRIGATION OF ET TECHNOLOGIES (not including less than 3.18 group)
mean(Irr.Hsem1$AvgWK)
##############################################################################
## HERE WE SEPERATE THE TECHNOLOGIES BY TREATMENT. FROM ET TO -> EDU & NONEDU
# THEN WE COMPUTE THEIR AVERAGES
#### AVERAGES FOR ALL DATA
Irr.HallET<-subset(Irr.Hall,Irr.Hall$Treatment=="ET",) 
mean(Irr.HallET$AvgWK)
# only 22 observations which is why avg here is greater than avgerage for all ET technologies (38 obs)
Irr.HallETO<-subset(Irr.Hall,Irr.Hall$Treatment=="ET+OPT",) 
mean(Irr.HallETO$AvgWK)
#### AVERAGES FOR data not including group
Irr.Hsem1ET<-subset(Irr.Hsem1,Irr.Hsem1$Treatment=="ET",) 
mean(Irr.Hsem1ET$AvgWK)
# only 22 observations which is why avg here is greater than avgerage for all ET technologies (38 obs)
Irr.Hsem1ETO<-subset(Irr.Hsem1,Irr.Hsem1$Treatment=="ET+OPT",) 
mean(Irr.Hsem1ETO$AvgWK)
# TEST IF FACTOR IS SIGNIFICANT.. DOES REMOVING <3.18 GROUP SIGNIFICANTLY CHANGE THE AVERAGE WEEKLY IRRIGATION APPLIED?
Irr.H<-rbind(Irr.Hall,Irr.Hsem1)
OCUmf<-lm(AvgWK ~ factor, data=Irr.H)
anova(OCUmf)
OCUmt<-lm(AvgWK ~ Treatment + factor, data=Irr.H)
anova(OCUmt)
#######################################
### IS FACTOR SIGNIFICANT BY TREATMENT? AND NOT JUST TECHNOLOGY?
Irr.H.et<-subset(Irr.H,Irr.H$Treatment=="ET",)
OCUmet<-lm(AvgWK ~ factor, data=Irr.H.et)
anova(OCUmet)
pairwise.t.test(Irr.H.et$AvgWK,Irr.H.et$factor)
Irr.H.eto<-subset(Irr.H,Irr.H$Treatment=="ET+OPT",)
OCUmeto<-lm(AvgWK ~ factor, data=Irr.H.eto)
anova(OCUmeto)
pairwise.t.test(Irr.H.eto$AvgWK,Irr.H.eto$factor)
Comparison technology
#### Testing other Clusters #####
rm(list= ls()[!(ls() %in% c('dfTest','dfR','dfCompall'))])
#Irrigation events greater than 0
# dfCompall has values greater than zero for only ET technology
dfall<-dfCompall
#Irrigation events greater than log10 (x+1) = 0.46; x=1.923
dfRsem1<-subset(dfCompall,eventsum>4.25,)
#Irrigation events less than 1 mm
df1mm<-subset(dfCompall,eventsum<4.25,)
x<-nrow(df1mm)
y<-nrow(dfCompall)
x/y
#describe what <1mm events look like in events and gal
max(df1mm$Water.gal)
max(df1mm$normal)
max(df1mm$eventsum)
min(df1mm$Water.gal)
min(df1mm$normal)
min(df1mm$eventsum)
mean(df1mm$Water.gal)
mean(df1mm$normal)
mean(df1mm$eventsum)
median(df1mm$Water.gal)
median(df1mm$normal)
median(df1mm$eventsum)
### For all Irrigation events (including less than 1 mm)
# Total irr applied per HH/ # weeks = 
# Sum each households irrigation applied then divide by 208 weeks (238-30)
Irr.Hall <-ddply(dfall,c(.(Study.ID),.(Treatment)),summarize,HHsum=sum(eventsum))
#Averaging irrigation applied per week by dividing by 
#208 weeks (since its the number of weeks where irrigation COULD HAVE OCCURED)
Irr.Hall$AvgWK<-Irr.Hall$HHsum/(max(dfCompall$Week)-30)
# 1 = yes with 1 mm, 0 = no without 1 mm
Irr.Hall$factor<-1
#WEEKLY AVERAGE IRRIGATION OF ET TECHNOLOGIES (including all data)
mean(Irr.Hall$AvgWK)
### For all Irrigation events (including less than 1 mm)
# Total irr applied per HH/ # weeks = 
# Sum each households irrigation applied then divide by 208 weeks (238-30)
Irr.Hsem1 <-ddply(dfRsem1,c(.(Study.ID),.(Treatment)),summarize,HHsum=sum(eventsum))
#Averaging irrigation applied per week by dividing by 
#208 weeks (since its the number of weeks where irrigation COULD HAVE OCCURED)
Irr.Hsem1$AvgWK<-Irr.Hsem1$HHsum/(max(dfCompall$Week)-30)
# 1 = yes with 1 mm, 0 = no without 1 mm
Irr.Hsem1$factor<-0
#WEEKLY AVERAGE IRRIGATION OF ET TECHNOLOGIES (not including less than 3.18 group)
mean(Irr.Hsem1$AvgWK)
# TEST IF FACTOR IS SIGNIFICANT.. DOES REMOVING <3.18 GROUP SIGNIFICANTLY CHANGE THE AVERAGE WEEKLY IRRIGATION APPLIED?
Irr.H<-rbind(Irr.Hall,Irr.Hsem1)
OCUmf<-lm(AvgWK ~ factor, data=Irr.H)
anova(OCUmf)
Change Insignificant Events to Zero
#It was decided that all data less than 4.25 should be removed.
 #dfR<-subset(dfR,eventsum>4.25)
 dfR[dfR$eventsum<4.25,'eventsum']=0
 dfRzeros<-subset(dfR,eventsum>0)
 dfRzeros2<-subset(dfRzeros,eventsum<5)
 dfRzeros3<-subset(dfRzeros2,eventsum<4.3)
 rm(dfRzeros)
 rm(dfRzeros2)
 rm(dfRzeros3)
