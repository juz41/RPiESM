rm(list = ls())

library(MASS)
x = Cars93
dim(x)
head(x)
summary(x)

zp.m = 380/1.6/x$MPG.c
x$zp.m = 380/1.6/x$MPG.city

# can shorten var names

quantile(x$zp.m, 0.95)

boxplot(x$zp.m)

b = boxplot(x$zp.m~x$Origin, las=1, horizontal = TRUE)
b1 = boxplot(x$MPG.city~x$Origin, las=1, horizontal = TRUE)
# ~ usage
# what is in b
# stats - locations of the graph thingies
# n - how many in each groups
# conf - confidence intervals for each group
# out - outliers
# group - to which group outliers belong

t = table(x$Type)
t = sort(t) # not shown on labs
barplot(t)

pie(t)

# paste funcion to concat strings