% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/neededCalculator.R
\name{neededCalculator}
\alias{neededCalculator}
\alias{neededCalculator,ANY-method}
\title{Determining how many delegates are needed to secure a nomination}
\usage{
neededCalculator(party)
}
\arguments{
\item{party}{A character string denoting the party of the candidate. This string should be given
as either `Republican' or `Democratic'.}
}
\value{
A numeric object denoting the number of delegates needed for a candidate from the party
specified by \code{party} to secure the presidential nomination.
}
\description{
A function to calculate how many delegates a presidential candidate from one of the two major
parties needs to secure the presidential nomination.
}
\note{
This delegate count includes both pledged and unpledged delegates.
}
\examples{

neededCalculator("Democratic") 
neededCalculator("Republican")

}
\author{
Andy Stone: \email{arstone@wustl.edu}
}
\seealso{
\code{\link{createCandidate}}
}

