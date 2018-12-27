##############################
##        Applied           ##
##############################
library(ISLR)

##############################

# Exe.8

data("College")
fix(College)
str(College)

## i.
summary(College)

## ii.
pairs(College)

## iii.
plot(College$Outstate,College$Private)

# Explore the variable Private which is a factor
class(College$Private)
nlevels(College$Private)
levels(College$Private)

## iv. Create qualititave var Elite

# First way...
College$Elite<-rep("No",nrow(College))
College$Elite[College$Top10perc>50]<-"Yes"
class(College$Elite)
College$Elite<-as.factor(College$Elite)
nlevels(College$Elite)
levels(College$Elite)

# Second way...
College$Elite<-ifelse(College$Top10perc>50,"Yes","No")
College$Elite<-as.factor(College$Elite)  

summary(College)
plot(College$Outstate,College$Elite)

## v. Histograms

par(mfrow=c(2,2))
hist(College$S.F.Ratio,col=1,breaks = 10)
hist(College$F.Undergrad,col=2,breaks = 10)
hist(College$P.Undergrad,col=3,breaks = 100)
hist(College$Outstate,col=4,breaks = 5)
