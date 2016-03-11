#' Determining how many delegates are needed to secure a nomination
#'
#' A function to calculate how many delegates a presidential candidate from one of the two major
#' parties needs to secure the presidential nomination.
#'
#' @param party A character string denoting the party of the candidate. This string should be given
#' as either `Republican' or `Democratic'.
#'
#' @return A numeric object denoting the number of delegates needed for a candidate from the party
#' specified by \code{party} to secure the presidential nomination.
#' @author Andy Stone: \email{arstone@@wustl.edu}
#' @note This delegate count includes both pledged and unpledged delegates.
#' @examples
#' 
#' neededCalculator("Democratic") 
#' neededCalculator("Republican")
#' 
#' @seealso \code{\link{createCandidate}}
#' @rdname neededCalculator
#' @aliases neededCalculator,ANY-method
#' @export
setGeneric(name="neededCalculator",
           def=function(party)
           {standardGeneric("neededCalculator")}
)

setMethod(f="neededCalculator",
          definition=function(party){
            if(party=="Republican"){
              return(1237)
            }
            if(party=="Democratic"){
              return(2383)
            }
            else{
              stop("Please specify the party properly with either the string 'Democratic' or 'Republican'")
            }
          }
)