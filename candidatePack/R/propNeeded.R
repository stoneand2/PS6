#' Calculating proportion of candidates needed to win nomination
#' 
#' A function to determine the proportion of remaining delegates a presidential candidate needs 
#' to secure in order to win his party's nomination.
#'
#' @param candidate An object of the class `Candidate'
#' @param remaining A numeric object denoting the number of delegates yet to be allocated in the 
#' party of the candidate. This should include both pledged and unpledged delegates.
#'
#' @return A numeric object denoting the proportion of the delegates yet to be allocated that a 
#' presidential candidate must secure in order to win his party's nomination.
#' 
#' @author Andy Stone: \email{arstone@@wustl.edu}
#' @note Be certain to include both pledged and unpledged delegates in the total given for
#' \code{remaining}.
#' @examples
#' 
#' candidate.rubio <- createCandidate("Marco Rubio", 155, "Republican")
#' propNeeded(candidate.rubio, 1407) 
#' 
#' @seealso \code{\link{createCandidate}}, \code{\link{Candidate}}
#' @rdname propNeeded
#' @aliases propNeeded,ANY-method
#' @export
setGeneric(name="propNeeded",
           def=function(candidate, remaining)
           {standardGeneric("propNeeded")}
)

setMethod(f="propNeeded",
          definition=function(candidate, remaining){
            return((candidate@delegatesNeeded - candidate@delegatesWon) / remaining)
          }
)