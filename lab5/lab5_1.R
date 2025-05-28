rm(list = ls())

alpha = 0.05
data = c(380, 340, 380, 500) # physics, pe, mechanics, stats
# H0: distribution is uniform: p1=p2=p3=p4=1/4
# H1: not uniform
# np_i >= 5 (yes it is)
# n = n1+n2+n3+n4
sum(data)/4

chisq.test(data)
# p-value is very small, so we reject H0 - data is not uniform