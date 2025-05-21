rm(list = ls())

alpha = 5e-2

# a
# restrictions from model iv sheet are met
# 128*0.35 >= 5, (400-128)*(1-0.35) >= 5 -> we can use prop.test, not binom.test
# H0: p = 0.35
# H1: p < 0.35
prop.test(x=128, n=400, p=3.5e-1, alternative="less")
# p-value = 0.114
# no grounds to reject H0

# b
prop.test(x=128, n=400, conf.level=1-alpha)

# c
