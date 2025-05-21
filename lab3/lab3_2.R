# rm(list = ls())
# commented out for goats were manually imported

# goats from website
# https://pages.mini.pw.edu.pl/~dembinskaa/www/?Dydaktyka%26nbsp%3B:Materia%C5%82y_dydaktyczne:Zbiory_danych
# on top right - import dataset
# functions to load files to check

alpha = 5e-2

# a
interval = t.test(goats$WeightInitial, conf.level=1-alpha)$conf

# b
t = t.test(goats$WeightInitial, mu=23, alt="greater")
# we cannot disregard H0 (mu=23)