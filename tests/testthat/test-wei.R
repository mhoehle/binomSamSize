library("testthat")
library("binomSamSize")

context("Check Liu & Wei method.")

expect_equal(ciss.liubailey(alpha=0.1,d=0.05),c(nstar=256.0000000000,cp=0.90591849159, lambda=5.0000000000),tolerance=sqrt(.Machine$double.eps)*10)

expect_equal(ciss.liubailey(alpha=0.1,d=0.05,lambda.grid=5), c(nstar=256.0000000000,cp=0.9059184916,lambda=5.0000000000),tolerance=sqrt(.Machine$double.eps)*10)

expect_equal(ciss.liubailey(alpha=0.05,d=0.1), c(nstar=87.0000000000,cp=0.953656329,lambda=2.0000000000))
