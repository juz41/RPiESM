rm(list = ls())

par("mfrow"=c(1,1))
count = InsectSprays$count
sprays = InsectSprays$spray

plot(count ~ sprays)

results = simplify2array(tapply(count, sprays, function(x) shapiro.test(x)[1:2]))
results
# alpha = .05
# C, D p-value is alarmingly low, dont use bartlett, use levene

# on linux install with your package manager -> r-car / r-cran-car
install.packages("car", dependencies=TRUE)
library("car")
leveneTest(count~sprays, center=mean)
# p-value is very low, we have to dismiss H0 and we lose all hope and go home

# we shall take a square root of the data
count = sqrt(count)
leveneTest(count~sprays, center=mean)
# p-value is acceptable now
plot(count ~ sprays)

results = simplify2array(tapply(count, sprays, function(x) shapiro.test(x)[1:2]))
results

# H0: mi1=mi2=...mi6
# H1: !H0
model = lm(count ~ sprays)
anova(model)

pairwise.t.test(count,sprays,p.adjust.method="bonferroni")
tukey = TukeyHSD(aov(model),  conf.level=.95)
tukey
plot(tukey)
# if two groups' confidence level is close to 0, then the means are similar