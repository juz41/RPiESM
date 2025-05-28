rm(list = ls())

alpha = 1e-1
data = c(140, 280, 235, 200, 100, 45)
data2 = rep(0:5, data)
lambda_estimator <- fitdistr(data2,"Poisson")$estimate
# or just calculate using mean

p_data = c(dpois(0:4, lambda=lambda_estimator), 1-sum(dpois(0:4, lambda=lambda_estimator)))
chisq.test(x=data, p=p_data)

# we cannot reject H0 (dist is Poisson)