\name{hierDiversity}
\alias{hierDiversity}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Hierarchical Group-wise Diversity Partitioning}

\description{Group-wise diversity partitioning (Marion et al. \emph{in press}) summarizes diversity for each group using the framework of effective or Hill numbers at each hierarchical level for any order q (Hill 1973; Jost 2006, 2007). This approach facilitates comparisons among groups at each level. Hierarchical bootstrapping is then used to approximate uncertainty around diversity estimates.}

\usage{
hierDiversity(dat, group, replace = NULL, reps = 99, q = 1, 
quant = c(0.025, 0.975), sims = FALSE)
}

\arguments{
\item{dat}{ A matrix of community or phenotypic data where columns are individual species or traits and rows are replicates (e.g., sites, individuals, groups). Matrix elements are abundances or amounts (e.g., concentrations, counts). }
  
\item{group}{ A matrix with the same number of rows as in \code{dat}, where columns code the levels of the sampling hierarchy that DO NOT include the individual level (this is added by the function). The column groupings should---from left to right---go from least inclusive to most inclusive, with the highest level containing only one grouping; i.e., the number of groups within the hierarchy should decrease from left to right. }
  
\item{replace}{ A vector of logicals to indicate whether resampling is done with replacement at each level. If \code{NULL}, bootstrapping is automatically done for all levels. }
  
\item{reps}{ Numeric indicating the number of bootstrap replicates to conduct for approximating uncertainty. }

\item{q}{ Order of diversity. Default is the exponential of Shannon's entropy where q = 1. }

\item{quant}{ Numeric vector of probabilities with values in \eqn{[0,1]} for bootstrapped sample quantiles. Defaults to \code{c(0.025, 0.975)}. }

\item{sims}{ Logical to save each bootstrapped diversity estimate. } 	
}

\details{\code{hierDiversity} uses group-wise hierarchical partitioning (Marion et al. \emph{in press}) to summarize community or phenotypic complexity as the 'effective number' (Hill 1973; Jost 2006, 2007) of parts within and among groups. 
	
For each level of the hierarchial sampling design with \eqn{i = 1, 2, 3, \ldots, m} levels of sampling (e.g., individuals, demes, regions, \ldots, continents), the total (gamma) diversity of each group within a level is multiplicatively partitioned (Whittaker 1972; Jost 2006, 2007) into two components: (1) \code{alpha}, the within-group component, is the average effective number of individual phenotypic elements within a sample; and (2) \code{beta}, the among-group component, is the effective number of completely distinct phenotypic combinations present and estimates the extent of differentiation among phenotypes (Jost 2006). 

Group-wise partitioning (Marion et al. \emph{in press}) uniquely differs from the level-wise partitioning approach proposed by Crist et al. (2003). Instead of a single \eqn{\alpha_{i}} and \eqn{\beta_{i}} at level \emph{i}, separate estimates are provided for each of the \eqn{n_{i+1}} groups at the next level up. This method facilitates comparisons among groups at each hierarchical level; level-wise partitioning highlights comparisons among \eqn{i} levels in the hierarchy.

To enable comparisons when there are unequal sample sizes among levels, this function also provides two standardized estimates of beta diversity: turnover and homogeneity (Jost 2007). Turnover is the proportional turnover rate per sample ranging from 0 (all samples are identical) to unity (all samples are completely distinct). Homogeneity is interpreted as the inverse of turnover. See Jost (2007) for a more complete mathmatical description. 

To approximate uncertainty around the diversity estimates,  hierarchical bootstrapping is used. In each iteration, the appropriate subgroups in a level are re-sampled, the groups within those subgroups are resampled, etc. down to the lowest level of replication.
}


\value{
\code{hierDiversity} returns a list of diversity estimates for each group within each hierarchical level. For each group, a dataframe is provided. The first row returns the true estimates of diversity. The second returns the standard error (standard deviation of bootstrap replicates). Subsequent rows return the quantiles specified in the \code{quant} arguement. The dataframe returns the following columns:

\item{alpha}{ A scalar, alpha diversity, is the average effective number of parts within a group-level replicate. }

\item{beta}{ A scalar, beta diversity, is the effective number of completely distinct combinations within a group. Ranges from unity, when all group members are identical, to \eqn{N} when all group members are distinct. }

\item{gamma}{ A scalar, gamma diversity, is the pooled total effective number of parts overall. }

\item{turnover}{ A scalar that gives the proportional turnover among group replicates. The lower limit is 0 when all group members are identical, and the upper limit is unity when all members are distinct. }

\item{homogeneity}{ A scalar where the lower limit is 0 when all \eqn{N} group members are completely distinct, and the upper limit is unity when all members are identical. }
 
If \code{sims}=TRUE, a separate dataframe is provided for each group returning the saved bootstrapped diversity replicates for each iteration of \code{rep}.
}

\references{
Crist, T.O., J.A. Veech, J.C. Gering, and K.S. Summerville (2003). Partitioning species diversity across landscapes and regions: a hierarchical analysis of \eqn{\alpha}, \eqn{\beta}, and \eqn{\gamma}-diversity. \emph{Am. Nat.}, 162(6): 734--743.

Fordyce, J.A. and S.B. Malcolm (2000). Specialist weevil, \emph{Rhyssomatus lineaticollis}, does not spatially avoid cardenolide defenses of common milkweed by ovipositing into pith tissue. \emph{J. Chem. Ecol.}. 26(12): 2857--2874.

Hill, M.O. (1973). Diversity and evenness: a unifying notation and its consequences. \emph{Ecology}, 54(2): 427--432.
	
Jost, L. (2006). Entropy and diversity. \emph{Oikos}, 113(2): 363--375.

Jost, L. (2007). Partitioning diversity into independent alpha and beta components. \emph{Ecology}, 88(10): 2427--2439.

Marion, Z.H., J.A. Fordyce, and B.M. Fitzpatrick. Extending the concept of diversity partitioning to characterize complex phenotypes. \emph{Am. Nat.}. \emph{in press}.

Whittaker R.H. (1972.) Evolution and measurement of species diversity. \emph{Taxon}, 21, 213--251.	 
}

\author{Zachary Marion \email{zmarion@vols.utk.edu}, James Fordyce \email{jfordyce@utk.edu}, and Benjamin Fitzpatrick \email{benfitz@utk.edu}
}

\note{
If groupings among levels are not unique (i.e., group "A" appears in both level 1 and level 2), only the diversity estimates from the lowest (least inclusive) should be interpreted. For higher levels, alpha will equal gamma, beta diversity will be one, and there will be no error due to the hierarchical nature of the sampling.  
}


\examples{
## NOTE: 'reps' argument usually needs to be >= 99.
## The lower values used here are for demonstration.

set.seed(2)
## Create Data Matrix
dat <- matrix(rpois(1000, 3), nrow=100)
#Create Grouping Matrix
group <- as.matrix(data.frame(
  L1 = rep(c("A","B","C","D","E"), each=20),
  L2 = rep(c("AB", "CDE"), times=c(40,60)),
  L3 = rep("total",100)))

hierDiversity(dat, group, reps=9)
replace <- c(FALSE, rep(TRUE, 3))
hierDiversity(dat, group, replace=replace, reps=9, q=2)
div <- hierDiversity(dat, group, reps=9, q=2, 
  quant=c(0.25, 0.75), sims=TRUE)
div$L2$CDE


##### Example data from Fordyce & Malcolm (2000) 
data(milkweedData)
data(milkweedVars)
milkDat <- as.matrix(milkweedData)
milkVars <- as.matrix(milkweedVars)

milkDiv <- hierDiversity(milkDat, milkVars, reps=5, q=3, 
  sims=TRUE)
milkDiv$infectstatus
turnover <- c(milkDiv$infectstatus$I[[2]][,5],
  milkDiv$infectstatus$U[[2]][,5])
infectionStatus <- rep(c("infected","uninfected"), each=6)
boxplot(turnover~infectionStatus, las = 1, 
  ylab = "Turnover", xlab = "Infection Status")
}


% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%%\keyword{ ~kwd1 }
%%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
