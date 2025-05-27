rm(list = ls())

# a
# Compute Confidence Interval for the Mean (n ≥ 100)
#
# This function calculates a confidence interval for the mean of a numeric vector of an arbitrary distribution
#
# x             numeric vector representing the sample data, must contain at least 100 observations
# conf.level    confidence level for the interval, numeric value between 0 and 1

confidence_interval <- function(x, conf.level){
  n <- length(x)
  if (n < 100) {
    stop("Vector must be of length >= 100")
  }
  mean = mean(x)
  sd = sd(x)
  alpha = 1-conf.level
  margin = qnorm(1-alpha/2)*sd/sqrt(n)
  
  result <- list(
    conf.int = c(mean-margin, mean+margin),
    conf.level = conf.level,
    mean = mean
  )
  
  return (result)
}

# b
alpha = 0.05
library(MASS)
x = geyser$duration
confidence_interval(x=x, conf.level=1-alpha)
t.test(x=x, conf.level=1-alpha)


# Additional tests

# Compare two functions calculating confidence intervals
#
# This function calculates return the sum of differences of calculated intervals 
#
# function1, function2        functions to be compared
# generating_data_function    function that generates data
# sample_size                 size of data generated
# conf.level                  confidence level for the interval, numeric value between 0 and 1

diff_confidence_interval <- function(function1, function2, generating_data_function, sample_size, conf.level){
  x = generating_data_function(n=sample_size)
  interval1 = function1(x=x, conf.level=conf.level)$conf.int
  interval2 = function2(x=x, conf.level=conf.level)$conf.int
  # print(interval1)
  # print(interval2)
  return (sum(abs(interval1-interval2)))
}

# diff_confidence_interval(confidence_interval, t.test, rnorm, 100, 0.95)


generators <- list(
  Normal = rnorm,
  Exponential = rexp
  # Uniform = runif
  # Gamma = function(n) rgamma(n, shape=2, scale=2)
  # Beta = function(n) rbeta(n, shape1=2, shape2=5)
  # Cauchy = rcauchy
  
  # be careful when using many, may cause plotting problems on small screens
)

par(mfrow = c(length(generators), 1))
sample_sizes = seq(100, 1000, by = 5)

# for each function declared in generators
#   compares t.test with our function using diff_confidence_interval
#   for each sample size from sample_sizes and plots the outcome
for(i in 1:length(generators)){
  results = numeric(length=length(sample_sizes))
  for(j in 1:length(sample_sizes)){
    results[j] <- diff_confidence_interval(
      confidence_interval, 
      t.test, 
      generators[[i]], 
      sample_sizes[j], 
      conf.level = 0.95
    )
  }
  plot(sample_sizes, results, type = "o", col = "blue", pch = 16,
       ylim = range(unlist(results)),
       xlab = "sample Size", ylab = "(sum(abs(interval1-interval2)))",
       main = paste("Data generated using", names(generators)[i]))
}