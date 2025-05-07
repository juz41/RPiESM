rm(list = ls())

N = 5e1
n = 1e1
mi = 5
sigma = 2
alpha = 5e-2

result = replicate(N,
                   {
                      x = rnorm(n, mi, sigma)
                      t.test(x, conf.level = 1-alpha)$conf
                   })
matplot(result, rbind(1:N, 1:N), type='l', lty=1,
        col=c('grey','blue'), las=1,
        xlab="granice przedzialu",
        ylab="nr przedzialu")
abline(v=mi, col=2)

# seq is for sequence generation
# cbind, rbind (bind by column or row)
# matplot for plotting
x = seq(-1, 1, by=0.1)
y1 = sin(x)
y2 = cos(x)
y3 = x*x/2+x-1/2
matplot(x, cbind(y1,y2,y3), type='l', col=2:4, ann=F)
# omitting type='l' provides humourous results