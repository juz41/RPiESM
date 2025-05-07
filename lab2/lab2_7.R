rm(list = ls())

N = 10^4
n = 10
mi = 5
sigma = 2
alpha = 0.05
v = numeric(N)

# formulae from paper handed out during lectures
counter = 0
for (i in 1:N) {
  x = rnorm(n, mean=mi, sd=sigma)
  range = t.test(x, conf.level=1-alpha)$conf
  if(mi < range[2] && mi > range[1]){
    counter = counter + 1
  }
}
result = counter/N

# alternative - use of replicate
hits = replicate(N,
                    {
                      x = rnorm(n, mean=mi, sd=sigma)
                      range = t.test(x, conf.level=1-alpha)$conf
                      mi < range[2] && mi > range[1]
                    })

result2 = sum(hits)/N