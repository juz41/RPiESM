rm(list = ls())

par(mfrow=c(1,1))
x1 = rnorm(1000)
h = hist(x1, br="FD", prob=T)
lines(density(x1, bw=.1), col="red", lw=3)
curve(dnorm(x), add=T, col="blue", lw=3)

# plot(density(x1), col = "red")
# curve(dnorm(x), add=T)

# histogram br = 5 (tylko sugestie) ="Sturges", "FD"
# prob=T lub freq=F to get densities
# ylim

# bw in density - smoothing bandwith

# output of hist - can access with $
# explanation - breaks, counts, density, mids