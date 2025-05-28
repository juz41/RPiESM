rm(list = ls())

time <- read.csv("~/Documents/coding/R/lab5/infolinia.txt", sep="")

alpha = 5e-2
a = 4.5
beta = 4

# H0: data is from gamma(a, beta)
# H1: it is not

ks.test(x=time, y="pgamma", alternative="t", shape=4.5, rate=4)
# p-value = 0.3745 > alpha
# we have no grounds to reject data is from gamma