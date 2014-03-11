\name{coverage}
\alias{coverage}
\alias{plot.coverage}
%\alias{ciss.covcoeff}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Calculate coverage probability for a binomial proportion confidence
  interval scheme }
\description{
  For a given true value of the proportion compute the coverage
  probability of the confidence interval
}
\usage{
coverage(ci.fun, n, alpha=0.05, p.grid=NULL,interval=c(0,1),
         pmfX=function(k,n,p) dbinom(k,size=n,prob=p), \dots)
\method{plot}{coverage}(x, y=NULL, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ci.fun}{ \code{\link[binom]{binom.confint}} like function which
    computes confidence intervals for a binomial proportion. }
  \item{n}{ Sample size of the binomial distribution. }
  \item{alpha}{ Level of significance, \eqn{1-\alpha} is the confidence
    level. }
  \item{p.grid}{ Vector of proportions where to evaluate the confidence
    interval function. If \code{NULL} all those values where the minimum
  coverage probability can occur is taken. If not \code{NULL} then the
  union between \code{p.grid} and these values is taken.}
  \item{interval}{Vector of length two specifying lower and upper border
    of an interval of interest for the proportion. The intersection of
    the above grid and this interval is taken.}
  \item{pmfX}{A function based on the arguments \code{k}, \code{n} and
    \code{p}, giving the probability mass function (pmf)
    \eqn{f(x;n,p)=P(X=k;n,p)} of \eqn{X}. Typically, this will be
    the pmf of the binomial distribution.}
  \item{x}{An object of class \code{coverage}}
  \item{y}{Not used}
  \item{\dots}{Further arguments to be sent to \code{ci.fun} or the plot
  function}
}
\details{
  Compute coverage probabilities for each proportion in
  \code{p.grid}. See actual function code for the exact details, which
  \code{p.grid} is actually chosen.
}
\value{
  An object of class \code{coverage} containing coverage probabilities,
  coverage coefficient and more.

}
\references{
Agresti, A. and Coull, B.A. (1998), Approximate is Better than
"Exact" for Interval Estimation of Binomial Proportions, The
American Statistician, 52(2):119-126.

}
\author{ M. \enc{Höhle}{Hoehle} }

%\seealso{ \code{\link{ciss.liubailey}} }
\examples{
#Show coverage of Liu & Bailey interval
cov <- coverage( binom.liubailey, n=100, alpha=0.05,
           p.grid=seq(0,1,length=1000), interval=c(0,1), lambda=0, d=0.1)
plot(cov, type="l")

#Now for some more advanced stuff. Investigate coverage of pooled
#sample size estimators
kk <- 10
nn <- 20
ci.funs <- list(poolbinom.wald, poolbinom.logit, poolbinom.lrt)
covs <- lapply( ci.funs, function(f) {
 coverage( f, n=nn, k=kk, alpha=0.05, p.grid=seq(0,1,length=100),
pmfX=function(k,n,p) dbinom(k,size=n, p=1-(1-p)^kk))
})

par(mfrow=c(3,1))
plot(covs[[1]],type="l",main="Wald",ylim=c(0.8,1))
lines(c(0,1),rep(0.95,2),lty=2,col=2)
plot(covs[[2]],type="l",main="Logit")#,ylim=c(0.8,1))
lines(c(0,1),rep(0.95,2),lty=2,col=2)
plot(covs[[3]],type="l",main="LRT",ylim=c(0.8,1))
lines(c(0,1),rep(0.95,2),lty=2,col=2)

poolbinom.wald(x=1,n=nn,k=kk)
poolbinom.logit(x=1,n=nn,k=kk)
poolbinom.lrt(x=1,n=nn,k=kk)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ design }
\keyword{ survey }
