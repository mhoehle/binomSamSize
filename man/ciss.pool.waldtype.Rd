\name{ciss.pool.wald}
\alias{ciss.pool.wald}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Sample size calculations for fixed pool size and perfect test }
\description{
 Calculate sample size for a binomial proportion based on Wald
 type confidence interval for pooled samples using a perfect test
}
\usage{
ciss.pool.wald(pi0, alpha, d, k)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{pi0}{ hypothesized upper bound (if below 0.5, if above 0.5 then
    lower bound) on the parameter \eqn{\pi_0}  }
  \item{alpha}{ an \eqn{(1-\alpha/2)\cdot 100\%} confidence interval is
    computed } 
  \item{d}{ half width of the confidence interval }
  \item{k}{ The pool size }
}
\details{
  
  Sample size calculation based on width of Wald confidence intervals
  for pooled sample. The equation is

  \deqn{ n = \left\lceil \left( \frac{z_{1-\alpha/2} (1-\pi_0)}{d k}
  \right)^2 \cdot \left((1-\pi_0)^{-k} - 1\right) \right\rceil}

}
\value{
  the necessary sample size \eqn{n}
}
\references{

D. D. Worlund and G. Taylor (1983), Estimation of Disease Incidence in
Fish Populations, Can. J. Fish. Aquat. Sci., 40:2194-2197.

}
\author{ M. \enc{Höhle}{Hoehle} }

\seealso{ \code{\link{poolbinom.wald}}}
\examples{
k <- 1:50
n <- sapply(k, function(k) ciss.pool.wald(pi0=0.1, alpha=0.05,k=k, d=0.05))
#sizes <- cbind(k=k, n=n, N=n*k)
plot(k, n, type="s",xlab="Pool size",ylab="Number of pools")
plot(k*n,n,type="s",xlab="Total size",ylab="Number of pools")

ciss.pool.wald(pi0=0.1, d=0.01, alpha=0.05, k=10)
#Compare with ciss.binom function
np02x <- function(n,p0,k) round( (1-(1-p0)^k)*n )
(n <- ciss.binom( p0=0.1, d=0.01, alpha=0.05, ci.fun=poolbinom.wald,
            np02x=np02x, k=10))

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ design }
\keyword{ survey }
