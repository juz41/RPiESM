rm(list = ls())

alpha = 1e-1
data = c(140, 280, 235, 200, 100, 45)
data2 = rep(0:5, data)
lambda_estimator <- fitdistr(data2,"Poisson")$estimate
# or just calculate using mean

# p_data = c(dpois(0:4, lambda=lambda_estimator), 1-sum(dpois(0:4, lambda=lambda_estimator)))
p_data = c(dpois(0:4, lambda=lambda_estimator), ppois(4, lambda_estimator, lower.tail=FALSE))

sum(data)*p_data
# we can use chisq.test

# W = [a, +Inf)
a = qchisq(1-alpha, df=(6-1-1))
chisq.test(x=data, p=p_data)
# we cannot use p-value of this, because R does not handle complex H
1-pchisq(9.7363, 4)
# 9.73... is output of chisq.test

# p-value < alpha : 0.08306 < 0.1
# we reject H0 (dist is not Poisson)