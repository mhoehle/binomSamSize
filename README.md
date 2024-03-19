# binomSamSize

<!-- badges: start -->
[![CRAN](http://cranlogs.r-pkg.org/badges/binomSamSize)](https://cran.r-project.org/package=binomSamSize)
<!-- badges: end -->

An R package for confidence intervals and sample size determination
for a binomial proportion under simple random sampling and pooled
sampling. 

The package used to be available under the GPL-3 license from CRAN as
http://cran.r-project.org/web/packages/binomSamSize/, but was removed from CRAN as I had changed e-mail adressed. For now, 
the package remains off CRAN, but can be installed using:

```
devtools::install_github("mhoehle/binomSamSize")
```

#### Quickstart:

Sample size determination for a proportion, which we expect to be around 10%. We specify, that for this proportion we want a two-sided 95% exact Clopper-Pearson confidence interval to have a width of 10%. 

    binomSamSize::ciss.binom(p0=0.1, d=0.1, alpha=0.05, ci.fun=binom::binom.exact)
