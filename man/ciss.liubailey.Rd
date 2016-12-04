\name{ciss.liubailey}
\alias{ciss.liubailey}
\alias{liuSamSize}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Sample size calculations using the Liu and Bailey (2002) approach }
\description{
 Calculate sample size for a binomial proportion based on the
 confidence interval width specification in Liu and Bailey (2002).
}
\usage{
ciss.liubailey(alpha, d, lambda.grid = 0:30)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{alpha}{ a \eqn{(1-\alpha/2)\cdot 100\%}{(1-alpha/2)*100\%} confidence interval is
    computed }
  \item{d}{ half width of the confidence interval }
  \item{lambda.grid}{ range of lambda values to try } }
\details{

  The objective is to find the minimum sample size \eqn{n} so that the
  minimum coverage probability (aka. as the coverage coefficient) of the
  confidence interval for the binomial parameter is larger than
  \eqn{1-\alpha}.  In the present approach the confidence interval is of
  form
  \deqn{(C_n(\hat{p}_n)-d,C_n(\hat{p}_n)+d)}{(C_n(p.hat)-d,C_n(p.hat)+d)}
  as suggested in equation (3.1) of Liu & Bailey (2002):
  \deqn{(\hat{p}_l,\hat{p}_u) = \hat{p}_n + \frac{\lambda z^2
      (0.5-\hat{p}_n)}{n+z^2} \pm d}
where \eqn{\hat{p}_n = x/n}. The interval is then expanded to a full
  length of \eqn{2d} using the following transformation:
  \deqn{\hat{p}_l^* = \max(0,\min( 1-2d, \hat{p}_l))} \deqn{\hat{p}_u^*
  = \min(1,\max( 2d, \hat{p}_u))} As a consequence, the computed
  interval will always have length \eqn{2d}.

  Given \code{d}, fixed \code{lambda} and a sample size \code{n}, the
  proportion \eqn{p} in [0,1] where the coverage probability is minimum
  is computed.  The sample size is then gradually increased until this
  minimum coverage probability becomes larger than \eqn{1-\alpha}.  We
  then change the value of \eqn{\lambda}, and search the minimum sample
  size that guarantee the \eqn{1-\alpha} confidence level for this
  lambda value. The smallest minimum sample size over a set of lambda
  values in \code{lambda.grid} is then used as the required sample size;
  this sample size and the corresponding lambda value are used to
  calculate the confidence interval given above.

  For a general overview of coverage probabilities of confidence
  intervals for a binomial proportion see Agresti and Coull (1998). Once
  actual binomial data are obtained the function
  \code{\link{binom.liubailey}} can be used to compute the actual
  confidence interval.

  The R function code calls the original Fortran code developed for the
  Liu and Bailey (2002) article. NAG calls were replaced by R API calls
  and an R wrapper calling the code as a subroutine was created.

}
\value{
   a vector containing the following three elements
   \item{nstar}{sample size at most favorable lambda value in \code{lambda.grid}}
   \item{cp}{coverage probability}
   \item{lambda}{value in lambda.grid giving the lowest \code{nstar} value}
}
\references{
  Agresti, A. and Coull, B.A. (1998), Approximate is Better than
  "Exact" for Interval Estimation of Binomial Proportions, The
  American Statistician, 52(2):119-126.

  Liu, W. and Bailey, B.J.R. (2002), Sample size determination for
  constructing a constant width confidence interval for a binomial
  success probability. Statistics and Probability Letters, 56(1):1-5.
}
\author{ M. \enc{Höhle}{Hoehle} and W. Liu }

\seealso{ \code{\link{binom.liubailey}} }
\examples{
ciss.liubailey(alpha=0.1,d=0.05)
ciss.liubailey(alpha=0.1,d=0.05,lambda.grid=5)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ design }
\keyword{ survey }

