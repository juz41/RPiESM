# rm(list = ls())

# getwd setwd
# hemoglobina <- read.csv("~/Documents/coding/R/lab4/hemoglobina.txt", sep="")

# not 1.5% but 1.5% pp
before = hemoglobina$przed
after = hemoglobina$po

# H0: mi_przed=mi_po
# H1: mi_przed>mi_po
t.test(before, after, alt="gr", paired=TRUE)
# p-value < 0.05 => we can reject H0 (drug works)

power.t.test(n=length(before), delta=1.5, sd=sd(before-after), type="p", 
             alt="o", sig.level=5e-2)
# power is 0.9362774, so the diff of 1.5% is big and easily detectable