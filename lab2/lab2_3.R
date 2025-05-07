rm(list = ls())

par(mfrow=c(3,1))
plot(0:10, dbinom(0:10, 10, 0.5), col="red", pch=19, type="h", lty=3)
plot(0:10, dbinom(0:10, 10, 0.25), col="blue", pch=19, type="h", lty=2)
plot(0:50, dbinom(0:50, 50, 0.25), col="green", pch=19, type="h", lty=1)
curve(dnorm(x, mean=50*0.25, sd=sqrt(50*0.25*(1-0.25))), add=T, col="blue", lw=3)
curve(dpois(x, lambda=50*0.25), add=T, col="purple", lw=3)
(50*0.25*(1-0.25))

# np(1-p) >=9 -> przyblizamy normalnym
# inaczej pois