\name{hierDiversity-package}
\alias{hierDiversity-package}
\docType{package}
\title{
Hierarchical Multiplicative Partitioning of Diversity and Complexity
}
\description{
Computes the diversity of multivariate phenotypic or species composition datasets in a group-wise hierarchical framework (Marion et al. \emph{in press}). The method provides several benefits. First, partitioning complexity in terms of Hill numbers (Hill 1973) or the 'effective number' of parts (Jost 2006, 2007) offers biologically interpretable and relevant estimates of phenotypic or species complexity. Second, diversities can be calculated for any order (\eqn{q}) as a continuous estimate of disparity in the abundances, counts, or concentrations of phenotypic parts. Third, for a given hierarchical level, the pooled total phenotypic complexity (gamma) is multiplicatively partitioned into two components: 1) a within-group component (alpha), the average effective number of phenotypic subunits expected within a sample from the group; and 2) an among-group component (beta), the effective number of completely distinct phenotypic combinations found within the group. Finally, uncertainty around diversity estimates is approximated using hierarchical bootstrapping.}

\details{
\tabular{ll}{
Package: \tab hierDiversity\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2015-03-12\cr
License: \tab GPL >= 2\cr
}
The package contains two functions. The first function, \code{dz}, computes alpha, beta, and gamma diversity as 'effective numbers' for any order of \eqn{q}. The second function, \eqn{hierDiversity}, uses group-wise hierarchical partitioning (Marion et al. \emph{in press}) to calculate phenotypic diversity for each group within a hierarchical level. Proportional turnover and homogeneity are also provided as standardized alternatives to beta diversity for comparisons among groups when sample sizes are uneven. Hierarchical bootstrapping approximates uncertainty by resampling appropriate subgroups within a level. Although designed for phenotypic complexity, the package is all appropriate for community composition data as well. Group-wise partitioning provides a complement to the level-wise partitioning approach proposed by Crist et al. (2003).}

\author{Zachary Marion \email{zmarion@vols.utk.edu}, James Fordyce \email{jfordyce@utk.edu}, and Benjamin Fitzpatrick \email{benfitz@utk.edu}
}

\references{
Crist, T.O., J.A. Veech, J.C. Gering, and K.S. Summerville (2003). Partitioning species diversity across landscapes and regions: a hierarchical analysis of \eqn{\alpha}, \eqn{\beta}, and \eqn{\gamma}-diversity. \emph{Am. Nat.}, 162(6): 734--743.

Hill, M.O. (1973). Diversity and evenness: a unifying notation and its consequences. \emph{Ecology}, 54(2): 427--432.
	
Jost, L. (2006). Entropy and diversity. \emph{Oikos}, 113(2): 363--375.

Jost, L. (2007). Partitioning diversity into independent alpha and beta components. \emph{Ecology}, 88(10): 2427--2439.

Marion, Z.H., J.A. Fordyce, and B.M. Fitzpatrick. Extending the concept of diversity partitioning to characterize complex phenotypes. \emph{Am. Nat.}. \emph{in press}.
}


\keyword{ package}
\keyword{ multivariate}
\keyword{ phenotypic complexity}
\keyword{ diversity}
\keyword{ community ecology}
\keyword{ evolution}

\seealso{
\code{\link[vegetarian]{vegetarian-package}}
}

\examples{
set.seed(2)
dat <- matrix(rpois(100, lambda = 3), nrow = 10)
dz(abundances = dat, lev = "beta", q = 2)
#1.336

#Create Grouping Matrix
group <- as.matrix(data.frame(
  L1 = rep(c("A","B","C","D","E"), each=2),
  L2 = rep(c("AB", "CDE"), times=c(4,6)),
  L3 = rep("total",10)))

hierDiversity(dat, group, reps=9)

}
