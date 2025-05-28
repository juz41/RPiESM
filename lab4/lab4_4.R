rm(list = ls())

library(MASS)
# model 4, because we have info on normality
# nlschools
alpha = 5e-2
x = nlschools$IQ
y = nlschools$SES

# H0: mi_1=mi_2
# H1: mi_1mi_2
# 1 - richer, 2 - poorer