\name{ciss.binom}
\alias{ciss.binom}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ General purpose sample size calculation based on confidence
  interval widths }
\description{
  
 Calculate necessary sample size for estimating a binomial proportion
 with the confidence interval computed by an arbitrary
 \code{binom.confint} function
 
}
\usage{
ciss.binom(p0, d, alpha=0.05, ci.fun=binom.confint,
           np02x = function(n, p0) round(n*p0), verbose=FALSE,
           nStart=1,nMax=1e6,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{p0}{ hypothesized value of the parameter \eqn{p} in the binomial
    distributionproportion. This is an upper bound if \code{p0}
    is below 1/2, and a lower bound if \code{p0} is above 1/2. }
  \item{d}{ half width of the confidence interval. Note: The CI is not
    necessarily symmetric about the estimate so we just look at its
    width as determine by \eqn{d = 1/2*(CI_upper - CI_lower)}. }
  \item{alpha}{ a two-sided \eqn{(1-\alpha)\cdot 100\%} confidence
    interval is computed } 
  \item{ci.fun}{ Any \code{binom.confint} like confidence interval
    computing function. The default is the
    \code{binom.confint} function itself. In this case one
    would have to specify the appropriate method to use
		 using the \code{method} argument of the
		 \code{binom.confint} function.}
  \item{np02x}{A function specifying how to calculate the value of
    \eqn{x} which results in an estimator of the proportion being as close
    as possible to the anticipated value \eqn{p_0}. Typically the value is
    obtained by rounding the result of \eqn{x\cdot p_0}{x*p0}.}
  \item{verbose}{ If \code{TRUE}, additional output of the computations are
    shown. The default is \code{FALSE}. }
  \item{nStart}{Value where to start the search. The default \code{n=1}
    can sometimes lead to wrong answers, e.g. for the Wald-type interval }
  \item{nMax}{Max value of the sample size \eqn{n} to try in the
    iterative search. See details}
  \item{\dots}{Additional arguments sent to \code{ci.fun} function}
}
\details{
  Given a pre set \eqn{\alpha}-level and an anticipated value of
  \eqn{p}, say \eqn{p_0}, the objective is to find the minimum sample
  size \eqn{n} such that the confidence interval will lead to an interval of
  length \eqn{2\cdot d}.

  Using \code{ciss.binom} this is done in a general purpose way by
  performing an iterative search for the sample size. Starting from
  \eqn{n=nStart} the appropriate \eqn{x} value, computed as
  \code{round(x*p0)}, is found. For this integer \eqn{x} and the current
  \eqn{n} the corresponding confidence interval is computed using the
  function \code{ci.fun}. This function has to deliver the same type of
  result as the \code{\link[binom]{binom.confint}} function, i.e. a
  data frame containing the arguments \code{lower} and \code{upper}
  containing the borders of the confidence interval.

  The sample size is iteratively increased until the obtained confidence
  interval has a length smaller than \eqn{2\cdot d}{2*d}.  This might
  take a while if \eqn{n} is large. It is possible to speed up the
  search if an appropriate \code{nStart} is provided.
  
  A brute force search is used within the function. Note that for many
  of the confidence intervals explicit expressions exists to calculate
  the necessary sample size.

}
\value{
  the necessary sample size n
}
%\references{
%
%}
\author{ M. \enc{Höhle}{Hoehle} }

\seealso{ \code{\link[binom]{binom.confint}} and its related functions }
\examples{
#Compute the classical Wald-type interval using brute force search
#Note that nStart=2 needs to be called, because the Wald-intervals
#for x=round(1*0.5)=0 is too short.
ciss.binom(p0=1/2, d=0.1, alpha=0.05, method="asymptotic",nStart=2)
#This could of course be done easier
ciss.wald(p0=1/2, d=0.1, alpha=0.05)

#Same for the Wilson intervals
ciss.binom(p0=1/2, d=0.1, alpha=0.05, method="wilson")
ciss.wilson(p0=1/2, d=0.1, alpha=0.05)

#Now the mid-p intervals 
ciss.binom(p0=1/2, d=0.1, alpha=0.05, ci.fun=binom.midp)
#This search in Fosgate (2005) is a bit different, because interest
#is not directly in the length, but the length is used to derive
#the upper and lower limits and then a search is performed until
#the required alpha level is done. The difference is negliable
ciss.midp(p0=1/2, d=0.1, alpha=0.05)

#Another situation where no closed formula exists
ciss.binom(p0=1/2, d=0.1, alpha=0.05, method="lrt")

#Pooled samples. Now np02x is a func taking three arguments
#The k argument is provided as additional argument
np02x <- function(n,p0,k) round( (1-(1-p0)^k)*n )
ciss.binom( p0=0.1, d=0.05, alpha=0.05, ci.fun=poolbinom.lrt,
            np02x=np02x, k=10,verbose=TRUE)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ design }
\keyword{ survey }
