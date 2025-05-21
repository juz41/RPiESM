rm(list = ls())

alpha = 5e-2

# H0: p_w=p_k
# H1: p_w>p_k 
prop.test(x=c(40, 31), n=c(233, 220), alternative="gr", conf.level=1-alpha)
# we cannot reject H0

