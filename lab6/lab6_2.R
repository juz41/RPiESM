rm(list = ls())

par("mfrow"=c(1,1))
count = InsectSprays$count
sprays = InsectSprays$spray

plot(count ~ sprays)

results = simplify2array(tapply(count, sprays, function(x) shapiro.test(x)[1:2]))
results
# alpha = .05
# C, D p-value is alarmingly low, dont use bartlett, use levene

install.packages("car", dependencies=TRUE)
library("car")
leveneTest(count~sprays, center=mean)
# p-value is very low, we have to dismiss H0 and we lose all hope and go home
