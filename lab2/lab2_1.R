rm(list = ls())

par(mfrow=c(2,1))


y1 = rnorm(20)
y2 = rnorm(100)

plot(ecdf(y1), col = "blue")
curve(pnorm(x), add=T)
plot(ecdf(y2), col = "red")
curve(pnorm(x), add=T)

# Dystrybuanta empiryczna
# ecdf 
# cumulated ditribution function
# lwd/lw - line thickness
# curve function
# ecdf()
# najmocniejsze tw. statystyki
# tw. Gliwienki Canteriego
