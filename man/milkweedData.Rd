\name{milkweedData}
\alias{milkweedData}
\alias{milkweedVars}
\docType{data}
\title{Milkweed Chemical Defense Data}
\description{
The milkweed (\emph{Asclepius syriaca}) chemical defense data, \code{milkweedData}, has concentrations for 12 cardenolides from multiple tissues and plants with and without evidence of herbivorous weevil damage. These correspond to the \code{milkweedVars} dataframe, which contains the plant variables.
}

\usage{
	data("milkweedData")
	data("milkweedVars")
	}
\format{
  \code{milkweedData} is a data frame with 101 observations of concentrations (\eqn{\mu}g per 0.1 g dry wt) for 12 cardenolides. Column names indicate the HPLC retention times for each compound (earlier RTs are more polar). 
  
 \code{milkweedVars} is a dataframe of 101 observations on the following 4 variables: 
 \describe{
    \item{\code{tissue}}{a character vector of five tissues analyzed: \code{cortex}, \code{epidermis}, \code{leaf}, \code{pith}, and \code{vascular} tissue}
    \item{\code{PlantID}}{a character vector of unique plant IDs}
    \item{\code{infectstatus}}{a character vector identifying whether a plant had weevil oviposition damage (\code{D}) or was undamaged (\code{U})}
    \item{\code{total}}{a character vector indicating the highest hierarchical level}
	}
}
%\details{
%%  ~~ If necessary, more details than the __description__ above ~~
%}
\source{
Fordyce, J.A. and S.B. Malcolm (2000). Specialist weevil, \emph{Rhyssomatus lineaticollis}, does not spatially avoid cardenolide defenses of common milkweed by oviposition into pith tissue. \emph{J. Chem. Ecol.}. 26(12):2857--2874.
}

\examples{
data(milkweedData)
str(milkweedData)

data(milkweedVars)
str(milkweedVars)
}
\keyword{datasets}
