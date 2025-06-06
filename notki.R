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
