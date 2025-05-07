rm(list = ls())

par(mfrow=c(1,1))
curve(dt(x, 5), from=-5, to=5, col="red", ylim=c(0,0.6))
curve(dt(x, 10), from=-5, to=5, col="green", add=T)
curve(dt(x, 40), from=-5, to=5, col="blue", add=T)
curve(dnorm(x), from=-5, to=5, col="black", add=T)

curve(dt(x, 1), from=-5, to=5, col="pink", ylim=c(0,0.6))
for (i in 1:255) {
  curve(dt(x, i+1), from=-5, to=5, col=rgb(1-i/255,0,1), ylim=c(0,0.6), add=T)
}

curve(dexp(x, 1), col="pink")
for (i in 1:255) {
  curve(dexp(x, i+1), col=rgb(1-i/255,0,1), add=T)
}