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


# 2

# 3

# 4

# 5



