rm(list = ls())

alpha = 5e-2

# a
# H0: p_w=p_k
# H1: p_w>p_k 
prop.test(x=c(40, 31), n=c(233, 220), alternative="gr", conf.level=1-alpha)
# we cannot reject H0
# by default corrects using some magic Yates' continuity correction (see docs)

# b i
power.prop.test(n=c(233, 220), p1=1.7e-1, p2=1.4e-1)


# b ii