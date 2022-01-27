source('cachematrix.R')
library(tictoc)

m1 <- matrix(data = c(1,0,0,1), nrow=2, ncol=2)
m2 <- matrix(data = c(0,1,1,0), nrow=2, ncol=2)

mc1 <- makeCacheMatrix(m1)
mc2 <- makeCacheMatrix(m2)

print("Simple matrices test")

inv1 <- cacheSolve(mc1)
inv2 <- cacheSolve(mc2)
inv1 <- cacheSolve(mc1)
inv2 <- cacheSolve(mc2)


mt <- list()

set.seed(1)

for (i in 1:10) {
        mt[[i]] = matrix(sample(0:15, 1000*1000, TRUE), nrow = 1000, ncol = 1000)
}

mtc <- lapply(mt, makeCacheMatrix)

tic()
inv <- lapply(mtc, cacheSolve)
toc()
tic()
inv <- lapply(mtc, cacheSolve)
toc()