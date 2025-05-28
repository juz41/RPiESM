rm(list = ls())

p = 5e-1
n = 3
data = c(24, 73, 77, 26)
p_data = dbinom(0:3, size=n, prob=p)
chisq.test(x=data, p=p_data)

# H0 = samples are from distribution binom(3, 1/2)
# H1 not H0
# p-value - we cannot reject H0, he shall gonna pass