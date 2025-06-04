rm(list = ls())

# clt in eng

N = 500
k = 12

s = numeric(N)
y = numeric(N)

# Y_i = (S_i-k*mi)/(sqrt(k*sigma^2)) -> simplifies to S_i - 6 in our case of default runif

for (i in 1:N) {
  s[i] = sum(runif(k))
  y[i] = s[i] - 6
} 

hist(y)
boxplot(y)

ks.test(y, "pnorm")
shapiro.test(y)
