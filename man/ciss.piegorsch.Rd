\name{ciss.wilson}
\alias{ciss.wilson}
\alias{ciss.wald}
\alias{ciss.agresticoull}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Sample sizes for improved binomial confidence intervals }
\description{
  Calculate sample size for a binomial parameter enhancing
  the traditional Wald-type interval
}
\usage{
ciss.wald(p0, d, alpha)
ciss.wilson(p0, d, alpha)
ciss.agresticoull(p0, d, alpha)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{p0}{ hypothesized upper bound (if below 0.5, if above 0.5 then
    lower bound) on the parameter p in the binomial distribution }
  \item{alpha}{ an \eqn{(1-\alpha/2)\cdot 100\%} confidence interval is
    computed } 
  \item{d}{ half width of the confidence interval }
}
\details{
  Given a pre set \eqn{\alpha}-level and an anticipated value of
  \eqn{p}, say \eqn{p_0}, the objective is to find the minimum sample
  size \eqn{n} such that the confidence interval will lead to an interval of
  length \eqn{2\cdot d}.

  The work in Piegorsch (2004) gives a number of formulas enhancing the
  traditional Wald-type interval.
  
}
\value{
  the necessary sample size n
}
\references{

Piegorsch, W. W. (2004), Sample sizes for improved binomial confidence
intervals, Computational Statistics and Data Analysis, 46:309--316.

}
\author{ M. \enc{Höhle}{Hoehle} }

\seealso{ \code{\link{ciss.midp}} }
\examples{

#Simple calculation at one proportion (worst case)
ciss.wald(p0=0.5,alpha=0.1,d=0.05)

#Evaluate for a grid of hypothesized proportion
p.grid <- seq(0,0.5,length=100)
cissfuns <- list(ciss.wald, ciss.wilson, ciss.agresticoull)
ns <- sapply(p.grid, function(p) {
  unlist(lapply(cissfuns, function(f) f(p, d=0.1, alpha=0.05)))
})

matplot(p.grid, t(ns),type="l",xlab=expression(p[0]),ylab="n",lwd=2)
legend(x="topleft", c("Wald", "Wilson","Agresti-Coull"), col=1:3, lty=1:3,lwd=2)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ design }
\keyword{ survey }
