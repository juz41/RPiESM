rm(list = ls())

data = c(36, 42, 14, 8)
p = c( 0.4, 0.4, 0.1, 0.1)
alpha = 5e-2
n = 1e2
# np_i >= 5
sum(data)*p
chisq.test(x=data, p=p)

# we cannot reject H0