\name{poolbinom.lrt}
\alias{poolbinom.lrt}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Calculate LRT based confidence interval for binomial
  proportion for pooled samples }
\description{
  Calculate LRT based confidence interval for the Bernoulli
  proportion of \eqn{k\cdot n}{k*n} individuals, which are pooled into n pools
  each of size \eqn{k}. Observed is the number of positive pools \eqn{x}.
}
\usage{
poolbinom.lrt(x, k, n, conf.level=0.95, bayes=FALSE, conf.adj=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ Number of positive pools (can be a vector).  }
  \item{k}{ Pool size (can be a vector). }
  \item{n}{ Number of pools (can be a vector). }
  \item{conf.level}{ The level of confidence to be used in the
    confidence interval}
  \item{bayes}{ See \code{\link[binom]{binom.bayes}}}
  \item{conf.adj}{ See \code{\link[binom]{binom.bayes}}}
}
\details{

  
  Compute LRT based intervals for the binomial response
  \eqn{X \sim Bin(n, \theta)}, where \eqn{\theta = 1 - (1-\pi)^k}.
  As a consequence,

  \deqn{\pi = g(\theta) = 1 - (1-\pi)^{1/k}}.

    One then knows that the borders for \eqn{\pi} are just transformations
  of the borders of theta using the above \eqn{g(\theta)} function.

  For further details about the pooling setup see
  \code{\link{poolbinom.logit}}.
  
}
\value{
  A data.frame containing the observed proportions and the lower and
  upper bounds of the confidence interval. The output is similar
  to the \code{binom.confint} function of the \code{binom} package
}
%\references{
%
%%References on the invariance of LRT confidence intervals. E.g. Cox
%
%}
\author{ M. \enc{Höhle}{Hoehle} }

%\seealso{ \code{\link{binom.midp}} }
\examples{
binom.lrt(x=0:34,n=34)
poolbinom.lrt(x=0:34,k=1,n=34)
poolbinom.lrt(x=0:34,k=10,n=34)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ design }
\keyword{ survey }
