# quiz 3
#Q1
#idaho<-read.csv("idaho.csv")
#library(dplyr)
#filter(idaho, ACR==3, AGS==6)
agricultureLogical <- idaho$ACR==3 & idaho$AGS==6
which(agricultureLogical)


#Q2
library(jpeg)
jpg<-readJPEG("jeff.jpg", native=TRUE)
quantile(jpg,probs=c(.3,.8))

#q3
gdp<-read.csv("gdp.csv", stringsAsFactors = FALSE)
edu<-read.csv("edu.csv", stringsAsFactors = FALSE)
matches<-match(gdp$country, edu$CountryCode)
length(sort(matches))
merged <- merge(gdp, edu, by.x = "country", by.y="CountryCode")
library(dplyr)
ordered<-arrange(filter(merged, !is.na(ranking)), -ranking)

#q3
highincomeLogical<- ordered$Income.Group == "High income: OECD" | ordered$Income.Group == "High income: nonOECD"
highIncome<-ordered[which(highincomeLogical),]
avgRanking <- highIncome[,c("Income.Group","ranking")]

#q4
oecd<-avgRanking[avgRanking$Income.Group=="High income: OECD",]
nonoecd<-avgRanking[avgRanking$Income.Group=="High income: nonOECD",]
mean(oecd$ranking)
mean(nonoecd$ranking)

#q5
quantile(ordered$ranking, probs=c(.2,.4,.6,.8,1))
short<-tail(ordered,n=38)
sum(short$Income.Group=="Lower middle income")