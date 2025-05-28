rm(list = ls())

par("mfrow"=c(2,3))
N = 100
x1 = rnorm(n=N, 20, 5)
x2 = runif(n=N, -1, 1)
x3 = rexp(n=N, 5)
x4 = rpois(n=N, 3)
x5 = rcauchy(n=N)

# a
qqnorm(x1, main="Norm")
qqline(x1)
qqnorm(x2, main="Unif")
qqline(x2)
qqnorm(x3, main="Exp")
qqline(x3)
qqnorm(x4, main="Pois")
qqline(x4)
qqnorm(x5, main="Cauchy")
qqline(x5)

# b
