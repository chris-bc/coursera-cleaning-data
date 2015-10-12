# q1
idaho<-read.csv("idaho.csv")
s<-strsplit(names(idaho),"wgtp")
s[[123]]

#q2
gdp<-read.csv("gdp.csv",stringAsFactors=FALSE)
gdp<-filter(gdp,Ranking<=190)
gdp<-mutate(gdp,dollars=as.numeric(gsub(",","",gdp$US.dollars)))
mean(gdp$dollars,na.rm=TRUE)

#Q3
gdp<-read.csv("gdp.csv",stringAsFactors=FALSE)
gdp$Country[99]<-"foo"
gdp$Country[186]<-"foo"
grep("^United",gdp$Country)

#Q4
gdp<-read.csv("gdp.csv",stringAsFactors=FALSE)
edu<-read.csv("edu.csv",stringsAsFactors = FALSE)
j<-left_join(gdp,edu,by.x=gdp$CountryCode,by.y=edu$"CountryCode")
length(grep("iscal(.*)[Jj]un",edu$Special.Notes))

#q5
library(quantmod)
library(lubridate)
amzn=getSymbols("AMZN",auto.assign=FALSE)
sampleTimes=index(amzn)
sum(year(sampleTimes)==2012)

sum(year(sampleTimes)==2012 & wday(sampleTimes,label=TRUE)=="Mon")
