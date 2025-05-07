rm(list = ls())

par(mfrow=c(2,1))

n = 500
a = 20
d = 1
y = rcauchy(n, location=a, scale=d)
mean_y = numeric(n)
median_y = numeric(n)
sd_y = numeric(n)
sqr_y = numeric(n)
for (i in 1:n) 
{
  x = y[1:i]
  mean_y[i] = mean(x)
  median_y[i] = median(x)
  sd_y[i] = sd(x)
  sqr_y[i] = IQR(x)/2
}

plot(1:n, mean_y, type = "l", col = "blue", ylab=" ", las=1)
lines(1:n, median_y, col = "red")
abline(h = a, col = "darkgreen", lty = 2)

plot(2:n, sd_y[2:n], type = "l", col = "blue", ylab=" ", las=1)
lines(2:n, sqr_y[2:n], col = "red")
abline(h = d, col = "darkgreen", lty = 2)
