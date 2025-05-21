rm(list = ls())

alpha = 5e-2

# H0: p = 0.8
# H1: p != 0.8
# we can use prop.test
prop.test(x=118, n=150, p=8e-1, conf.level=1-alpha, alternative="t")
