# rm(list = ls())
# commented out for goats were manually imported

# goats from website
# https://pages.mini.pw.edu.pl/~dembinskaa/www/?Dydaktyka%26nbsp%3B:Materia%C5%82y_dydaktyczne:Zbiory_danych
# on top right - import dataset
# functions to load files to check

alpha = 5e-2

# a
interval = t.test(goats$WeightInitial, conf.level=1-alpha)$conf

# b
t = t.test(goats$WeightInitial, mu=23, alt="greater")
# we cannot disregard H0 (mu=23)
# df (degrees of freedom) is number of samples minus one

# c
1 - power.t.test(n=length(goats$WeightInitial), delta=1, sd=sd(goats$WeightInitial),
             type="one.sample", alternative="one.sided", sig.level=alpha)$power
# P(nie odrz. H0 | mu=24) = 1 - P(odrz H0 - mu=24) = 1 - moc
# we can make power better by enlaring alpha or n
# it may be the case that the bigger the power the better
# for example false alarms or something idk sugar measuring in factories

# d
power.t.test(power=8e-1, sd=sd(goats$WeightInitial), delta=1,
             type="one.sample", alternative="one.sided", sig.level=alpha)
# mi-delta has to be the average weight so that power will be 0.8
# 77 is the answer

library(TeachingDemos)
# e
# conf range for variance
sigma.test(goats$WeightInitial, conf.level=9e-1)$conf

# f
# H0 -> sigma = 2e1
# H1 -> sigma != 2e1
sigma.test(goats$WeightInitial, sigma=2e1)
# pv > 0.05 => no grounds to reject H0
# we rejest H0
