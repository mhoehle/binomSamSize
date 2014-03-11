\name{poolbinom.logit}
\alias{poolbinom.logit}
\alias{poolbinom.wald}
\alias{poolbinom.waldtype}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Calculate logit based confidence interval for binomial
  proportion for pooled samples }
\description{

  Calculate logit based confidence interval for the the Bernoulli
  proportion of \eqn{k\cdot n}{k*n} individuals, which are pooled into
  \eqn{n} pools each of size \eqn{k}. Observed is the number of positive
  pools \eqn{x}.
  
}
\usage{
poolbinom.wald(x, k, n, conf.level=0.95)
poolbinom.logit(x, k, n, conf.level=0.95)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ Number of positive pools (can be a vector).  }
  \item{k}{ Pool size (can be a vector). }
  \item{n}{ Number of pools (can be a vector). }
  \item{conf.level}{ The level of confidence to be used in the confidence interval}
}
\details{
  
  Assume the individual probability of experiencing the event for each
  of \eqn{k\cdot n} individuals is \eqn{\pi}, i.e. the response is
  Bernoulli distributed \eqn{X_i \sim B(\pi)}. For example \eqn{\pi}
  could be the prevalence of a disease in veterinary epidemiology.

  Now, instead of considering each individual the \eqn{k\cdot n}
  samples are pooled into \eqn{n} pools each of size \eqn{k}. A pool is
  positive if there is at least one positive in the pool. Let X be the
  number of positive pools. Then \deqn{X \sim Bin(n, 1-(1-\pi)^k)}.

  The present function computes an estimator and confidence interval for
  \eqn{\pi} by computing the MLE and standard error for
  \eqn{\hat{\pi}}. A Wald confidence interval is formed using
  \eqn{\hat{\pi} \pm z_{1-\alpha/2}\cdot se(\hat{\pi})}.  In case of
  \code{poolbinom.logit} a logit transformation is used, i.e. the
  standard error for \eqn{logit(\hat{\pi})} is computed and the Wald-CI
  is derived on the logit-scale which is then backtransformed using the
  inverse logit function. In case \eqn{x=0} or \eqn{x=n} the logit of
  \eqn{\hat{\pi}} is not defined and hence the confidence interval is
  not defined in these two situation. To fix the problem  we use the
  intervals \eqn{(0, 
  \hat{\pi}_u(x=0))} and \eqn{(\hat{\pi}_l(x=n),1)}, respectively, where
  \eqn{\pi_u} and \eqn{\pi_o} are the respective borders of a
  corresponding LRT interval.

  The \code{poolbinom.wald} approach corresponds to method 2 in the
  Cowling et al. (1999). The logit transformation improves on this
  procedure, because the method ensures that the interval is in the
  range (0,1). 
  
}
\value{
  A data.frame containing the observed proportions and the lower and
  upper bounds of the confidence interval. The style is similar
  to the \code{binom.confint} function of the \code{binom} package
}
\references{

D. W. Cowling, I. A. Gardner, W. O. Johnson (1999), Comparison of
methods for estimation of individual level prevalence based on pooled
samples, Preventive Veterinary Medicine, 39:211--225

}
\author{ M. \enc{Höhle}{Hoehle} }

\seealso{ \code{\link{poolbinom.lrt}} }
\examples{
poolbinom.wald(x=0, k=10, n=34, conf.level=0.95)
poolbinom.logit(x=0:1, k=10, n=34, conf.level=0.95)
poolbinom.logit(x=1, k=seq(10,100,by=10), n=34, conf.level=0.95)
poolbinom.logit(x=0:34,k=1,n=34)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ design }
\keyword{ survey }
