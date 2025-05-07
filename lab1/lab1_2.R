rm(list = ls())

par(mfrow=c(2,1))

n = 500
mi = 4
sigma = 2
y = rnorm(n, mean=mi, sd=sigma)

mean_y = numeric(n)
median_y = numeric(n)
sd_y = numeric(n)
iqr_y = numeric(n)

for (i in 1:n) 
{
  x = y[1:i]
  mean_y[i] = mean(x)
  median_y[i] = median(x)
  sd_y[i] = sd(x)
  iqr_y[i] = IQR(x)/1.35
}
# sd_y[1] and iqr_y[1] shall contain nonsense

plot(1:n, mean_y, type = "l", col = "blue", ylab=" ", las=1)
lines(1:n, median_y, col = "red")
abline(h = mi, col = "darkgreen", lty = 2)
legend("bottomleft", legend = c("Średnia", "Mediana", "μ=4"),
       col = c("blue", "red", "darkgreen"), lty = c(1,1,2))

plot(2:n, sd_y[2:n], type = "l", col = "blue", ylab=" ", las=1)
lines(2:n, iqr_y[2:n], col = "red")
abline(h = sigma, col = "darkgreen", lty = 2)
legend("bottomleft", legend = c("Odch. standardowe", "IQR/1.35", "σ=2"),
       col = c("blue", "red", "darkgreen"), lty = c(1,1,2))
