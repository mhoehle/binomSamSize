\name{binom.midp}
\alias{binom.midp}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Calculate mid-p confidence interval for binomial proportion }
\description{
  Calculate mid-p confidence interval for the the binomial proportion
  based on one observation from the binomial distribution
}
\usage{
binom.midp(x, n, conf.level=0.95)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ Vector of number of successes in the binomial experiment.  }
  \item{n}{ Vector of number of independent trials in the binomial experiment. }
  \item{conf.level}{ The level of confidence to be used in the confidence interval}
}
\details{
  The function uses \code{uniroot} to determine the upper and lower
  bounds of the mid-p confidence interval.

  The lower bound \eqn{p_l} is found as the solution to the equation
  \deqn{\frac{1}{2} f(x;n,p_l) + (1-F(x;m,p_l)) = \frac{\alpha}{2}}
  where \eqn{f(x;n,p)} denotes the probability mass function (pmf) and
  \eqn{F(x;n,p)} the (cumulative) distribution function of the binomial
  distribution with size \eqn{n} and proportion \eqn{p} evaluated at
  \eqn{x}. In case x=0 then the lower bound is
  zero.

  The upper bound \eqn{p_u} is found as the solution to the equation
  \deqn{\frac{1}{2} f(x;n,p_u) + F(x-1;m,p_u) = \frac{\alpha}{2}}
   In case x=n then the upper bound is 1.
}
\value{
  A data.frame containing the observed proportions and the lower and
  upper bounds of the confidence interval. The style is similar
  to the \code{binom.confint} function of the \code{binom} package
}
\references{

S. E. Vollset (1993), Confidence intervals for a binomial proportion,
Statistics in Medicine, 12, 809--824

Fosage, G.T. (2005) Modified exact sample size for a binomial proportion
with special emphasis on diagnostic test parameter estimation, 
Statistics in Medicine 24(18):2857-66.

A. Agresti and A. Gottard (2005), Comment: Randomized Confidence
Intervals and the Mid-P Approach, Statistical Science, 20(4):367--371

}
\author{ M. \enc{Höhle}{Hoehle} }

%\seealso{ \code{\link{binom.midp}} }
\examples{
binom.midp(x=0:10,n=10)
binom.midp(x=0:5,n=5,conf.level=0.9)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ design }
\keyword{ survey }
