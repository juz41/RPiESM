library(MASS)
library(TeachingDemos)

can_reject <- function(pvalue, alpha) {
  if(pvalue <= alpha) {
    message("Odrzucamy H0, ponieważ ", pvalue, " ≤ ", alpha)
  } else {
    message("Nie ma podstaw do odrzucenia H0, ponieważ ", 
            pvalue, " > ", alpha)
  }
}


# kol1
# 1
data = c(20.4, 24.2, 18.6, 19.6, 23.0, 21.8)
sigma.test(data, conf.level = .95)

# 2
data = rep(c(5, 15, 25), c(7, 15, 3))
sqrt(sigma.test(data, conf.level = 0.95)$conf)
result = t.test(data, mu = 13, alternative = "greater")$p.value
can_reject(result, 0.05)

# 3
data = c(16,28,32,14,10)
alpha = .1

sum(data)/5 # można korzystać z testu
result = chisq.test(data)$p.value

can_reject(result, 0.05)
# nie jest z równomiernego

# 4
