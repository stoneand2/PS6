#' Creating an object of class `Candidate'
#'
#' A user-friendly function to create an object of class `Candidate' and automatically determine
#' how many delegates the candidate needs to secure their party's presidential nomination.
#'
#' @param name A character string giving the name of the presidential candidate. 
#' @param delegatesWon A numeric object listing how many delegates the candidate has already won.
#' @param party A character string denoting the party of the candidate. This string should be given
#' as either `Republican' or `Democratic'.
#'
#' @return An object of class `Candidate' containing
#' \itemize{
#'  \item{name} The name of a presidential candidate.
#'  \item{delegatesWon} The number of delegates the presidential candidate has won. 
#'  \item{party} The party of the presidential candidate, either `Democratic' or `Republican'.
#'  \item{delegatesNeeded} The number of delegates the presidential candidate needs to secure to win 
#'  his party's nomination. This is automatically determined through the initialize method called when
#'  a new instance of the class `Candidate' is created.
#'  }
#' @author Andy Stone: \email{arstone@@wustl.edu}
#' @note delegatesWon can represent all delegates or just pledged delegates -- but keep this in mind.
#' @examples
#' 
#' createCandidate("Jim Webb", 0, "Democratic") 
#' createCandidate("Marco Rubio", 155, "Republican") 
#' 
#' @seealso \code{\link{neededCalculator}}
#' @rdname createCandidate
#' @aliases createCandidate,ANY-method
#' @export
setGeneric(name="createCandidate",
           def=function(name, delegatesWon, party)
           {standardGeneric("createCandidate")}
)

setMethod(f="createCandidate",
          definition=function(name, delegatesWon, party){
            return(new("Candidate", name=name, delegatesWon = delegatesWon, 
                       party = party))
          }
)