library(MASS)
library(TeachingDemos)
library(lattice)
library(car)

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

can_reject(result, alpha)
# nie jest z równomiernego

# 4
data = c(1.017, 1.021, 10.015, 1.019, 1.022, 1.019)
alpha = 0.01
result = sigma.test(data, conf.level = 1-alpha, alt="greater", sigmasq=0.001)
can_reject(result$p.value, alpha)
# nie ma podstaw do odrzucenia H0 - wariancja jest równa 

alpha = 0.05
sigma.test(data, conf.level=1-alpha)

# kol2
# 1
set.seed(111)
lambda = 1/4
N = 27
x = rexp(N, lambda)
fit = fitdistr(x, "exponential")
fit$estimate
(pexp(7, fit$estimate, lower.tail = FALSE))

# 2
# Sprawdzamy, czy możemy skorzystać z prop.test():
(all(c(97, 250-97) > 5))
prop.test(97, 250, conf.level=0.99)

# 3
barley$yield
barley$site
alpha = 0.05
x = barley$yield[barley$site == "Waseca"]
result = t.test(x, mu=50, conf.level=1-alpha, alternative="less")
can_reject(result$p.value, alpha)
# H0 mu=50

# 4
alpha = 0.05
x = cats$Bwt
x1 = x[cats$Sex == "M"]
x2 = x[cats$Sex == "F"]
result = var.test(x1, x2, alternative = "two.sided")
can_reject(result$p.value, alpha)
# są różne

# 5
alpha = 0.05
x = c(-0.89, -0.13, -0.05, 1.18, 0.25)
result = ks.test(x, "pt", df=30)
can_reject(result$p.value, alpha)

# 6
times = c(163, 205, 197, 286, 172,
           87, 106, 101, 94, 123,
           82, 153, 87, 103, 96,
           104, 136, 98, 207, 146)
types = as.factor(rep(c("A", "B", "C", "D"), rep(5, 4)))
alpha = 0.05

simplify2array(tapply(
  times, 
  types, 
  function(x) { shapiro.test(x)[1:2] }))
# są normalne

(test_result <- leveneTest(times, types, center = mean))
model <- lm(times ~ types)
summary(model)
(tukey <- TukeyHSD(aov(model)))
plot(tukey)



# kol3
# 1
set.seed(123)
N <- 25
lambda <- 6
X <- rexp(N, lambda)
(fit <- fitdistr(X, "exponential"))
(qexp(0.9, fit$estimate))

# 2
x = crabs$CW
mean(x)
var(x)
median(x)
quantile(x, 0.8)

hist_data <- hist(x, freq = FALSE)
(test_result <- shapiro.test(X))
pvalue <- test_result$p.value
can_reject(pvalue, 0.05)
sqrt(sigma.test(x, conf.level=0.95)$conf.int)

# 3
(all(c(24, 500-24) > 5))
result = binom.test(24, 500, 0.04, alt="greater")
can_reject(result$p.value, 0.05)
# czyli nie mam podstaw by odrzucic że prawd.  = 0.04
# błąd na githubie gościa w kodzie?
result = binom.test(24, 500, conf.level = 0.99)
result

# 4
alpha = 0.05
data = c(22, 30, 22, 16, 10)
lambda = 2
p_data = c(dpois(0:3 , lambda = lambda), ppois(3, lambda, lower.tail = FALSE))

sum(data)*p_data
result = chisq.test(x = data , p = p_data)
can_reject(result$p.value, alpha)         
# Nie ma podstaw do odrzucenia H0, ponieważ 0.08864 > 0.01.
# Zatem badana próba losowa może pochodzić z rozważanego rozkładu.

# 5
X <- anorexia$Prewt[anorexia$Treat == "CBT"]
Y <- anorexia$Postwt[anorexia$Treat == "CBT"]
alpha = 0.05
result = t.test(X, Y, conf.level = 1-alpha, paired=TRUE, alt="l")
can_reject(result$p.value, alpha)       

delta <- 3
(test_result <- power.t.test(n = length(X), 
                             delta = delta,
                             sd = sd(Y - X),
                             sig.level = alpha,
                             type = "paired",
                             alternative = "one.sided"))
power <- test_result$power
(result <- 1 - power)

# Prawdopodobieństwo to wynosi: 0.3044165


# kol4
# 1
x = c(3.75, 4.52, -3.88, 6.85, 8.15, 6.15)
alpha = 0.05
result = shapiro.test(x)
can_reject(result$p.value, alpha)       
# Nie ma podstaw do odrzucenia H0, ponieważ 0.1118 > 0.05.
# Próba może zatem należeć do rozkładu normalnego.

(fit <- fitdistr(x, "normal"))
sqrt(sigma.test(x, sigma=3.915770, conf.level=0.95)$conf.int)

# 2
x = faithful$eruptions[faithful$waiting < 70]
summary(x)
mean(x)
sd(x)
quantile(x, 0.75)

box = boxplot(x)
box

# 3
x = Orange$circumference
alpha = 0.05
result = t.test(x, mu=100, alt="l", conf.level=1-alpha)
result
can_reject(result$p.value, alpha)
# Nie ma podstaw do odrzucenia H0, ponieważ 0.944 > 0.05.
# Zatem średnia obwodu pnia może nie być mniejsza niż 100 mm.

power.t.test(n=length(x), sd = sd(x), delta=100-90, alt="o", type="o")
result = sigma.test(x, sigma=40, alt="t", conf.level=1-alpha)
can_reject(result$p.value, alpha)
# Odrzucamy H0, ponieważ 0.0005085 ≤ 0.05.
# Możemy zatem twierdzić, że odchylenie standardowe obwodu pnia różni się
# istotnie od 40 mm.

# 4
x = Pima.te$glu[Pima.te$age > 40]
y = Pima.te$glu[Pima.te$age <= 40]
result = t.test(x, y, paired="F", conf.level=1-alpha, alt="g", var.equal=TRUE)
can_reject(result$p.value, alpha)
# tak

# b) - TREŚCI TEGO NIE MA NA GITHUBIE
# Wyznaczamy wartość estymatora odchylenia standardowego X i Y:

nX = length(X)
nY = length(Y)
varX = var(X)
varY = var(Y)
(sd_XY = sqrt(((nX - 1) * varX + (nY - 1) * varY)/(nX + nY - 2)))
# Wartość tego estymatora to: 30.14848
# W celu wyznaczenia prawdopodobieństwa korzystamy z funkcji power.t.test():

(test_result <- power.t.test(power = 0.8,
                             delta = 3, 
                             sd = sd_XY,
                             sig.level = 0.01, 
                             type="two.sample",
                             alternative="one.sided"))
(n <- ceiling(test_result$n))




# 5
x = c(234, 290, 76, 73, 69)
p = c(.3, .4, .1, .1, .1)
sum(x)*p
alpha = 5e-2
# coś tam coś tam możemy
result = chisq.test(x=x, p=p)
can_reject(result$p.value, alpha)
# Nie ma podstaw do odrzucenia H0, ponieważ 0.8835 > 0.05.
# Możemy zatem twierdzić, że rozkład preferencji klientów może być taki jak
# w treści zadania.

