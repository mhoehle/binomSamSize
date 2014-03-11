\name{binom.liubailey}
\alias{binom.liubailey}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Calculate fixed width confidence interval for binomial proportion }
\description{
  Calculate a fixed width confidence interval for the the binomial proportion
  based on one observation from the binomial distribution
}
\usage{
binom.liubailey(x, n, d, lambda=0, conf.level=0.95)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ Vector of number of successes in the binomial experiment.  }
  \item{n}{ Vector of number of independent trials in the binomial experiment. }
  \item{conf.level}{ The level of confidence to be used in the
    confidence interval}
  \item{d}{ half width of the confidence interval }
  \item{lambda}{Shrinkage factor. \code{lambda}=0 corresponds to simple
    \eqn{\hat{p} \pm d} interval.}
}
\details{

  The confidence interval is as suggested in equation (3.1) of Liu &
  Bailey (2002).
  %
  \deqn{(\hat{p}_l,\hat{p}_u) = (C_n(\hat{p}_n)-d,C_n(\hat{p}_n)+d)}{(C_n(p.hat)-d,C_n(p.hat)+d).}
  %
  The exact form is as follows: Let \eqn{z} be the appropriate
  \eqn{(1-\code{conf.level})/2} quantile 
  of the standard normal distribution the interval with shrinkage
  towards 0.5 is given by:
  %
  \deqn{(\hat{p}_l,\hat{p}_u) = \hat{p}_n + \frac{\lambda z^2
      (0.5-\hat{p}_n)}{n+z^2} \pm d}
  %
  The interval is then expanded to a full
  length of \eqn{2d} using the following transformation:
  %
  \deqn{\hat{p}_l^* =
    \max(0,\min( 1-2d, \hat{p}_l))} \deqn{\hat{p}_u^* = \min(1,\max( 2d, \hat{p}_u))}
  %
  As a consequence, the computed interval will always have length \eqn{2d}. 

  If fixed length is a desired property of your CI then this is a way to    
  go. However, the Liu and Bailey (2002) confidence intervals can have a low
  coverage coefficients when \eqn{n} is very small compared to
  \eqn{d}. When using the sample size computation procedure in
  \code{ciss.liubailey} one however ensures that \eqn{n} is large enough
  for the selected \eqn{d} to guarantee the required coverage
  coefficient. Thus, one should use \code{binom.liubailey} in connection 
  with \code{ciss.liubailey}.

}
\value{
  A data.frame containing the observed proportions and the lower and
  upper bounds of the confidence interval. The style is similar
  to the \code{binom.confint} function of the \code{binom} package
}
\references{

Liu, W. and Bailey, B.J.R. (2002), Sample size determination for
constructing a constant width confidence interval for a binomial
success probability. Statistics and Probability Letters, 56(1):1-5.

}
\author{ M. \enc{Höhle}{Hoehle} }

\seealso{ \code{\link{ciss.liubailey}} }
\examples{
binom.liubailey(x=0:20,n=20, d=0.1, lambda=0)

#Compute coverage of this interval
cov <- coverage( binom.liubailey, n=20, alpha=0.05, d=0.1, lambda=0,
                 p.grid=seq(0,1,length=1000))

plot(cov,type="l")

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ design }
\keyword{ survey }
