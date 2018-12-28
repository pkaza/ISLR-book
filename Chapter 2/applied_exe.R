##################################
## Chapter 2. Applied Exercises ##
##################################
library(ISLR)
library(MASS)
##############################

#########
# EXE.8 # 
#########

# (c)

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

#########
# EXE.9 # 
#########

data("Auto")
fix(Auto)
summary(Auto)

# (a)
# Quantitative: mpg,cylinders,displacement,horsepower,weight,acceleration,year
# Qualitative: origin,name

# (b)
sapply(Auto[,1:7],range)
#       mpg cylinders displacement horsepower weight acceleration year
# [1,]  9.0         3           68         46   1613          8.0   70
# [2,] 46.6         8          455        230   5140         24.8   82

# (c)
sapply(Auto[,1:7],mean)
#       mpg    cylinders displacement   horsepower       weight acceleration         year 
#23.445918     5.471939   194.411990   104.469388  2977.584184    15.541327    75.979592 

sapply(Auto[,1:7],sd)


# (d)
# remove 10th through 85th observations
Auto<-Auto[-c(10:85),]
sapply(Auto[,1:7],range)
#       mpg cylinders displacement horsepower weight acceleration year
# [1,] 11.0         3           68         46   1649          8.5   70
# [2,] 46.6         8          455        230   4997         24.8   82

sapply(Auto[,1:7],mean)
#       mpg    cylinders displacement   horsepower       weight acceleration         year 
# 24.404430     5.373418   187.240506   100.721519  2935.971519    15.726899    77.145570 

sapply(Auto[,1:7],sd)
#     mpg    cylinders displacement   horsepower       weight acceleration         year 
# 7.867283     1.654179    99.678367    35.708853   811.300208     2.693721     3.106217 


# (e)
par(mfrow=c(1,1))
data(Auto)
summary(Auto)

pairs(Auto)

plot(Auto$displacement,Auto$horsepower)
# Displacement (engine) has a positive correlation with horsepower (higher displacement->higher horsepower)

plot(Auto$horsepower,Auto$weight)
# Horsepower has a positive correlation with weight

plot(Auto$horsepower,Auto$acceleration)
# Horsepower has a negative correlation with acceleration (higher horsepower->lower acceleration)

plot(Auto$mpg,Auto$weight)
# Weight has a negative correlation with mpg (Low mpg -> Heavy weight)

# (f)
# Predict gas mileage (mpg) on the basis of other variables
pairs(Auto)
# The foolowing three variables: displacement, horsepower and weight, have a negative correlation with mpg.

##########
# EXE.10 # 
##########

data(Boston)
summary(Boston)
?Boston

# (a)
# Explore Boston data set
nrow(Boston) # 506
ncol(Boston) # 14
str(Boston)

# (b)
pairs(Boston)

# (c)
plot(Boston$age, Boston$crim)
# older unit - higher crime rate

plot(Boston$dis, Boston$crim)
# closer to Boston employment centres - higher crime rate

plot(Boston$rad, Boston$crim)
# After a certain value (>20) of index of accessibility to radial highways the crime rate is high

plot(Boston$tax, Boston$crim)
# The crime rate is high between 600 and 700 Boston tax

# (d)

