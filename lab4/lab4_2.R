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
# p-value > 1e-1, we cannot reject that variances are the same
# so we can use model II
# in reality we check whether the samples are from the same normal distribution

t.test(a, b, alternative="l", paired=FALSE, var.equal=TRUE)
# var.equal is by default FALSE, we can set because we checked it
# 0.1511 > alpha, so we have no grounds to reject H0

# b
# P(we accept H0 | delta=2) <=> P(we accept H0 | mi_b-mi_a=2)
# 1-P(we reject H0 ...)
tmp = (var(a)+var(b))/2
# pooled variance pre calculated
1-power.t.test(delta=2, type="t", n=5, sd=sqrt(tmp), alt="o")$power
