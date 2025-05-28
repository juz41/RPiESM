rm(list = ls())

par("mfrow"=c(2,2))
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
# qqnorm(x5, main="Cauchy")
# qqline(x5)

# b
boxplot(x1, main="Norm")
boxplot(x2, main="Unif")
boxplot(x3, main="Exp")
boxplot(x4, main="Pois")

# c
hist(x1, main="Norm")
hist(x2, main="Unif")
hist(x3, main="Exp")
hist(x4, main="Pois")

# d
alpha = 5e-2
# H0: it is normal
shapiro.test(x1)
shapiro.test(x2)
shapiro.test(x3)
shapiro.test(x4)
# for x1 p-value is rather enormous, so we cannot reject H0, in other cases we can