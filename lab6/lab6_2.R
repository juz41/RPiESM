rm(list = ls())

par("mfrow"=c(1,1))
count = InsectSprays$count
sprays = InsectSprays$spray

plot(count ~ sprays)

results = simplify2array(tapply(count, sprays, function(x) shapiro.test(x)[1:2]))
results
# D p-value is alarmingly low