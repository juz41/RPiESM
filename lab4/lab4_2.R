rm(list = ls())

alpha = 5e-2
a = c(26.4, 22.5, 24.9, 23.7, 21.5)
b = c(25.1, 29.0, 23.4, 27.6, 22.3)

# a
# H0: mi_a=mi_b
# H1: mi_a<mi_b

var.test(a, b)

# see docs for usages
# we need to check whether variance is the same or not
# p-value > 5e-2, we cannot reject that variances are the same
# so we can use model II


