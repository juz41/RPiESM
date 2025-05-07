rm(list = ls())
library(MASS)

czas = c(483, 705, 2623, 347, 620, 2719, 1035, 421)
(est1 = 1/mean(czas))
# est1
# print(est1)
(est2 = fitdistr(czas, densfun = "exponential"))
estimate = est2 $ estimate
# print(est2 $ estimate)
p = (pexp(1e3, estimate))


# ()/variable name in line/print() = printing
# " ' - no diff, just use the same
# $est after the line
# ENW(E_1X) = ENW(1/lambda) = 1/ENW(lambda) = 1/est2
# ENW(g(o)) = g(ENW(o))
# ENW(P(X<1000)) = ENW(F_1(1000)) = F_lambda(1000)
# = pexp(1000, est2)