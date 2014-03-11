\name{binomSamSize-package}
\alias{binomSamSize-package}
\alias{binomSamSize}
\docType{package}
\encoding{latin1}
\title{
  Confidence intervals and sample size determination for a binomial
  proportion under simple random sampling and pooled sampling
}
\description{
  
  A suite of functions to compute confidence intervals and necessary
  sample sizes for the parameter \eqn{p} of the Bernoulli \eqn{B(p)}
  distribution under simple random sampling or under pooled
  sampling. Such computations are e.g. of interest when investigating
  the incidence or prevalence in populations.

  The package contains functions to compute coverage probabilities and
  coverage coefficients of the provided confidence intervals
  procedures. Sample size calculations are based on expected length
  and coverage probabilities of the resulting confidence intervals.

}
\details{
\tabular{ll}{
Package: \tab binomSamSize\cr
Type: \tab Package\cr
Version: \tab 0.1-3\cr
Date: \tab 2013-12-10\cr
License: \tab GPL-3 \cr
LazyLoad: \tab yes\cr
}

The packages relies heavily on the functions in the package
\code{binom} by Sundar Dorai-Raj. 

Other R packages
containing similar functionality for calculating sample sizes for pooled
sampling is the \code{binGroup} package.  Also the \code{epiR} has
further functionality for computing sample sizes for tests with
sensitivity and specificity different from 1.

Functionality for pooled prevalence calculations with a nice web
interface can also be found at
http://www.ausvet.com.au/pprev/content.php?page=home

Note that the package is still in a development stage. As a consequence,
use the results of the package with care because bugs, inconsistencies
and errors might exist. In case you find bugs please do not hesitate to
report them to the package maintainer.

}
\author{
  Michael \enc{Höhle}{Hoehle} with contributions by Wei Liu
  
  Maintainer: Michael \enc{Höhle}{Hoehle} <hoehle@math.su.se>
}
\references{

Piegorsch, W. W. (2004), Sample sizes for improved binomial confidence
intervals, Computational Statistics and Data Analysis, 46:309--316.

}
\keyword{ package }
\seealso{
  Package \code{\link[binom]{binom.confint}{binom::binom.confint}}
}
%\examples{
%}
