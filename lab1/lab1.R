# 1
N = 1e4
x_a = rbinom(N, size=1, prob=1/4)
x_b = rexp(N, rate=1/3)
x_c = rcauchy(N, location=0, scale=1)

X_a = sum(x_a)/N # EX_a = 1/4
X_b = sum(x_b)/N # EX_b = 3
X_c = sum(x_c)/N # EX_c = ?

# 2
n = 500
mu = 4
sig = 2
y = rnorm(n, mean=mu, sd=sig)
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

plot(1:n, mean_y, type = "l", col = "blue", ylim = range(c(mean_y, median_y)),
     xlab = "n", ylab = "Estymatory", main = "Średnia i Mediana")
lines(1:n, median_y, col = "red")
abline(h = mu, col = "darkgreen", lty = 2)
legend("topright", legend = c("Średnia", "Mediana", "μ=4"),
       col = c("blue", "red", "darkgreen"), lty = c(1,1,2))

plot(2:n, sd_y[2:n], type = "l", col = "purple", ylim = range(c(sd_y, iqr_y), na.rm = TRUE),
     xlab = "n", ylab = "Estymatory", main = "Odchylenie standardowe i IQR/1.35")
lines(2:n, iqr_y[2:n], col = "orange")
abline(h = sig, col = "darkgreen", lty = 2)
legend("topright", legend = c("Odch. standardowe", "IQR/1.35", "σ=2"),
       col = c("purple", "orange", "darkgreen"), lty = c(1,1,2))

# 3
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

plot(1:n, mean_y, type = "l", col = "blue", ylim = range(c(mean_y, median_y)),
     xlab = "n", ylab = "Estymatory", main = "Średnia i Mediana")
lines(1:n, median_y, col = "red")
abline(h = a, col = "darkgreen", lty = 2)
legend("topright", legend = c("Średnia", "Mediana", "a=20"),
       col = c("blue", "red", "darkgreen"), lty = c(1,1,2))

plot(2:n, sd_y[2:n], type = "l", col = "purple", ylim = range(c(sd_y, sqr_y), na.rm = TRUE),
     xlab = "n", ylab = "Estymatory", main = "Odchylenie standardowe i IQR/2")
lines(2:n, sqr_y[2:n], col = "orange")
abline(h = d, col = "darkgreen", lty = 2)
legend("topright", legend = c("Odch. standardowe", "IQR/2", "d=1"),
       col = c("purple", "orange", "darkgreen"), lty = c(1,1,2))

# 4
