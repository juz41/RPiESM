rm(list = ls())

par(mfrow=c(1,1))
curve(dchisq(x, 5), from=-5, to=5, col="red", ylim=c(0,0.6))
curve(dchisq(x, 10), from=-5, to=5, col="green", add=T)
curve(dchisq(x, 40), from=-5, to=5, col="blue", add=T)
curve(dnorm(x), from=-5, to=5, col="black", add=T)

ylim_v = c(0,1)
curve(dchisq(x, 1), from=0, to=10, col=rgb(1,0,1), ylim=ylim_v)
for (i in 1:10) {
  curve(dchisq(x, i+1), from=0, to=10, col=rgb(1-(i*255/10)/255,0,1), add=T)
}
curve(dnorm(x, 10, sqrt(20)), from=0, to=10, col="red", add=T, lw=3)

