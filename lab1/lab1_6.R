rm(list = ls())

par(mfrow=c(2,1))

N = 1e4
k = 20
theta = 2
estimators = replicate(N, {x=runif(k,0,theta) 
                          c(2*mean(x), max(x))
                          })
(dim(estimators)) # 2 rows
# dim

plot(1:N, estimators[1,], cex=0.05, col = "blue", ylab=" ", las=1)
abline(h = theta, col = "darkgreen", lty = 2)
plot(1:N, estimators[2,], cex=0.05, col = "blue", ylab=" ", las=1)
abline(h = theta, col = "darkgreen", lty = 2)

# EMM are on average good so they are not biased
# in contrast to ENW

# X_1 ~ U((0, theta))
# EX_1 = theta/2
# theta^^{MM} = 2X^_

# theta^^_{NW} = X_{n:n} = max(x1,..,xn)

# for every sample we calculate both thetas
# 1e4 in total of each
# graph both, compare with real theta
# see which one is closer
# empiryczne obiążenie potem porównujemy
# b(theta^^) = E(thetat^^)-theta
#            = mean(samples)-theta