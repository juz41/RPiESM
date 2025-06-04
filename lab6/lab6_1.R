rm(list = ls())

width = iris$Sepal.Width
species = iris$Species

# mean(width[species=="setosa"])
# manual, but it will work

means = tapply(width, species, mean)

plot(width ~ species)
# boxplot works the same
lines(1:3, means, pch=20, type="p", cex=2)
# type -> points, l -> lines, b -> both

par("mfrow"=c(1,3))
tapply(width, species, shapiro.test)
# works, but ugly

tapply(width, species, function(x) shapiro.test(x)$p.value)
# tapply(width, species, (x)shapiro.test(x)$p.value)
# doesnt work here, may on different versions/os

results = simplify2array(tapply(width, species, function(x) shapiro.test(x)[1:2]))
results
                         
# Assumption 1.:  
# H0: distr. are normal -> yes, because all pvalues are somewhat big

# Assumption 2.:
# Variances are the same: H0: sigma1^2=sigma2^2=sigma3^2

bartlett.test(width, species)
# alpha = 1e-2
# p-value = 0.3515 -> we have no grounds to dismiss H0, variances are the same

# we shall proceed since all requirements are met

# the factor variable HAS to be factor - the test will not break, just output nonsense
# class(y), is.factor(y)
is.factor(species)

model = lm(width ~ species)
anova(model)
# outputs analysis of variance table
# p-value is extremely low -> we dismiss H0 and reason that the means are different

# Response: width
# Df Sum Sq Mean Sq F value    Pr(>F)    
# species     2 11.345  5.6725   49.16 < 2.2e-16 ***
#   Residuals 147 16.962  0.1154      


# repeated something
pairwise.t.test(width,species,p.adjust.method="bonferroni")
tukey = TukeyHSD(aov(model),  conf.level=.95)
tukey
plot(tukey)
