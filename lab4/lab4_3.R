# rm(list = ls())

# getwd setwd
# hemoglobina <- read.csv("~/Documents/coding/R/lab4/hemoglobina.txt", sep="")

# not 1.5% but 1.5% pp
before = hemoglobina$przed
after = hemoglobina$po

# H0: mi_przed=mi_po
# H1: mi_przed>mi_po
t.test(before, after, alt="gr", paired=TRUE)
# p-value < 0.05 => we can reject H0

