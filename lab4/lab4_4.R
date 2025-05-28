rm(list = ls())

library(MASS)
# model 4, because we have info on normality
nlschools
iqs = nlschools$IQ
sess = nlschools$SES
# H0: mi_1=mi_2
# H1: mi_1mi_2