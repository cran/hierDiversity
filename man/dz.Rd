\name{dz}
\alias{dz}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Effective Numbers for Alpha, Beta, and Gamma Diversity Indices}

\description{The function \code{dz} calculates the 'effective number' of traits or species in terms of multiplicative alpha, beta, or gamma diversity for any order of q (Hill 1973; Jost 2006, 2007). As the order q increases, the diversity calculated by \code{dz} becomes increasingly sensitive to differential abundance or amount; rare or low-abundance traits/species become downweighted in importance.}
\usage{
dz(abundances, lev = "beta", q = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
 \item{abundances}{ A matrix of community or phenotypic data where columns are individual species or traits and rows are replicates (e.g., sites, individuals, groups). Matrix elements are abundances or amounts (e.g., concentrations, counts). }
 
 \item{lev}{ Partitioning level of diversity. Can be "alpha," "beta," or "gamma". }
 
 \item{q}{ Order of diversity. Default is the exponential of Shannon's entropy where q = 1. }
}
\details{\code{dz} is a direct modification of the \code{\link[vegetarian]{d}} function from the \code{\link[vegetarian]{vegetarian}} package (Charney & Record 2012). The function was optimized to work with \code{\link{hierDiversity}} to return the desired multiplicative diversity partition of interest for a given order q. 
	
The diversity orders most familiar to ecologists are q = 0 (richness), q = 1 (Shannon entropy), and q = 2 (Simpson's probability of identity). As q increases, the diversity measure becomes less sensitive to rare subcomponents of low amount, while components of high abundance are increasingly upweighted (Jost 2006, 2007).	
}
\value{
	\item{D.VALUE}{A scalar that gives the effective number of alpha, beta, or gamma diversity for the desired order of q.}
}
\references{
Charney, N. and S. Record. (2012). \emph{vegetarian: Jost Diversity Measures for Community Data.} R package version 1.2.

Hill, M.O. (1973). Diversity and evenness: a unifying notation and its consequences. \emph{Ecology}, 54(2):427--432.
	
Jost, L. (2006). Entropy and diversity. \emph{Oikos}, 113(2):363--375.

Jost, L. (2007). Partitioning diversity into independent alpha and beta components. \emph{Ecology}, 88(10):2427--2439.	 
}

\author{Zachary Marion \email{zmarion@vols.utk.edu}, James Fordyce \email{jfordyce@utk.edu}, and Benjamin Fitzpatrick \email{benfitz@utk.edu}
}

\note{If \code{abundances} is a class other than a matrix or vector, \code{dz} will return an error.
}

\seealso{\code{\link{hierDiversity}}, \link[vegetarian]{d}}

\examples{
set.seed(2)
dat <- matrix(rpois(100, lambda = 3), nrow = 10)
dz(abundances = dat, lev = "beta", q = 2)
#1.336
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{biodiversity}
\keyword{phenotypic diversity}% __ONLY ONE__ keyword per line
