rm(list = ls())

alpha = 0.05

birds = c(5.21,
          5.15,
          5.20,
          5.48,
          5.19,
          5.25,
          5.09,
          5.17,
          4.94,
          5.11)

range = t.test(birds, conf.level=1-alpha)$conf

# H0 -> mi = 5.15kg
# H1 -> mi != 5.15kg
# Model II X1,X2,...,XN ~ N(mi,sigma^2)
# with mi and sigma unknown
# T = (X^_-mi_0)/S*sqrt(n) ~ t_n-1 if H0 is true
# alpha not needed for testing here, 
# alternative is by default different

t = t.test(birds, mu=5.15, alt="two.sided")
pvalue = 2*(1-pt(0.67144, 9))
# 0.67144 is t from t output

# we decide by comparing result with p-value
# pv <= alpha -> we disregard H0
# pv > alpha  -> we have no grounds to do so
# in this case 0.5188 > 0.05


t = t.test(birds, mu=5.2, alt="less")
print(t$p.value)
# again pv>alpha

# P(reject H0 | mi=5.15 (H1 is true))
power.t.test(n=length(birds), delta=5e-2, sd=sd(birds),
             type="one.sample", alternative="one.sided", sig.level=alpha)$power
# true difference we want to detect
# sig.level default is 5e-2



power.t.test(n=length(birds), power=8e-1, sd=sd(birds),
             type="one.sample", alternative="one.sided", sig.level=alpha)
# mi-delta has to be the average weight so that power will be 0.8

power.t.test(delta=5e-2, power=8e-1, sd=sd(birds),
             type="one.sample", alternative="one.sided", sig.level=alpha)
# 48 has to be minimal sample size

library(TeachingDemos)
# needs to be installed
# prompts when uninstalled upon first import attempt




