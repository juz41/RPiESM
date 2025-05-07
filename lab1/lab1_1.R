rm(list = ls())

# set.seed(2137)
N = 1e4
n = 1:N
par(mfrow=c(3,1))
# mfcol will fill by column

x_a = rbinom(N, size=1, prob=1/4)
S_a = cumsum(x_a)
M_a = S_a/n
plot(M_a, type="l")
abline(h = 1/4, lty = 2, col="red")

x_b = rexp(N, rate=1/3)
S_b = cumsum(x_b)
M_b = S_b/n
plot(M_b, type="l")
abline(h = 3, lty = 2, col="green")

x_c = rcauchy(N, location=0, scale=1)
S_c = cumsum(x_c)
M_c = S_c/n
plot(M_c, type="l")

# dont name variables c T F t dt df pt pf rt rf qt qf
# c T F t [dprq][tf]
# density, probability, random, quantile
# cumsum, mean, median, var, sq, IQR,
