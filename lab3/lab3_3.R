rm(list = ls())

alpha = 5e-2
p = 3.5e-1

# a
# restrictions from model iv sheet are met
# H0: p = 0.35
# H1: p < 0.35
prop.test(128, 400, p=p, alternative="less", conf.level=1-alpha, correct = TRUE)