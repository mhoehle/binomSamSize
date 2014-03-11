\name{ciss.midp}
\alias{ciss.midp}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Sample size calculations using the Fosgate (2005) approach }
\description{
 Calculate sample size for a binomial proportion based on a
 mid-p confidence interval width specification.
}
\usage{
ciss.midp(p0, d, alpha, nMax=1e6)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{p0}{ hypothesized upper bound (if below 0.5, if above 0.5 then
    lower bound) on the parameter p in the binomial distribution }
  \item{alpha}{ an \eqn{(1-\alpha/2)\cdot 100\%} confidence interval is
    computed } 
  \item{d}{ half width of the confidence interval }
  \item{nMax}{ Largest n to check. Interrupt iterations when this value
    is reached }
}
\details{
  
  Fosgate (2005) discusses the need for improved sample size
  calculations in cases where the binomial proportion is close to 0 and
  1. To improve on this, calculation on confidence intervals based on
  the mid-p method are suggested where computation of the upper and
  lower limit are combined into one formula. Given lower and upper
  bounds \eqn{p_l} and \eqn{p_u} of the (1-\code{alpha})*100\%
  confidence interval, one finds the sample size \eqn{n} as the solution
  to

  \deqn{\frac{1}{2} f(x;n,p_l) + \frac{1}{2} f(x;n,p_u) + (1 -
  F(x;n,p_l)) + F(x-1;m,p_u) = \alpha}
  
  where \eqn{f(x;n,p)} denotes the probability mass function (pmf) and
  \eqn{F(x;n,p)} the (cumulative) distribution function of the binomial
  distribution with size \eqn{n} and proportion \eqn{p} evaluated at
  \eqn{x}.  The function then returns \eqn{\lceil n \rceil}.  Note that
  in this approach \eqn{(p_l,p_u) = p_0 \pm d}, which has to be a subset
  of \eqn{(0,1)}. Another option would be to choose the lower and upper
  independent specifically.
  
  In the above, \eqn{x} is found as the integer value, such that
  \eqn{x/n} is as close as possible to the hypothesized value \code{p0}
  as possible. 

  An alternative approach to determine sample sizes based on the mid-p
  approach is to manually find the sample size \eqn{n} such that the
  interval obtained by \code{binom.midp} has a length less than
  \eqn{2\cdot d}.
  
}
\value{
  the necessary sample size \eqn{n}
}
\references{
  
Fosage, G.T. (2005) Modified exact sample size for a binomial proportion
with special emphasis on diagnostic test parameter estimation, 
Statistics in Medicine 24(18):2857-66.

}
\author{ M. \enc{Höhle}{Hoehle} }

\seealso{ \code{\link{binom.midp}}, \code{\link{ciss.binom}} }
\examples{
#Fosgate approach
ciss.midp(p0=0.2,alpha=0.05,d=0.05)
#Iterative increase of n using the general purpose function
ciss.binom( p0=0.2, alpha=0.05, ci.fun=binom.midp, d=0.05)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ design }
\keyword{ survey }
