rm(list = ls())

library(MASS)
# model 4, because we have info on normality
# nlschools
alpha = 5e-2
med = median(nlschools$SES)

# x - richer, y - poorer
x = nlschools$IQ[nlschools$SES>med]
y = nlschools$IQ[nlschools$SES<=med]
n1 = length(x)
n2 = length(y)

# H0: mi_1=mi_2
# H1: mi_1>mi_2
U = (mean(x)-mean(y))/(sqrt(var(x)/n1+var(y)/n2))
1 - pnorm(U) # p-value - probability of U > t
pnorm(U, lower.tail=F)
# 