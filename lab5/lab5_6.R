rm(list = ls())

par("mfrow"=c(2,2))
N=100
x1 = rnorm(n=N, 20, 5)
x2 = runif(n=N, -1, 1)
x3 = rexp(n=N, 5)
x4 = rpois(n=N, 3)

# a
qqnorm(x1)
qqline(x1)
qqnorm(x2)
qqline(x2)
qqnorm(x3)
qqline(x3)
qqnorm(x4)
qqline(x4)