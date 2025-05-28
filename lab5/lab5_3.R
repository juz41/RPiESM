rm(list = ls())


p = 5e-1
n = 3
data = c(24, 73, 77, 26)
p_data = dbinom(0:3, size=n, prob=p)
chisq.test(x=data, p=p_data)
