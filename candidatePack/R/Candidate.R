#' A Candidate object 
#' 
#' Object of class \code{Candidate} are created by the \code{createCandidate} function.
#'
#' 
#' An object of the class `Candidate' has the following slots:
#' \itemize{
#' \item \code{name} The name of a presidential candidate.
#' \item \code{delegatesWon} The number of delegates the presidential candidate has won.
#' \item \code{party} The party of the presidential candidate, either `Democratic' or `Republican'.
#' \item \code{delegatesNeeded} The number of delegates the presidential candidate needs to secure to win his party's nomination.
#' }
#'
#' @author Andy Stone: \email{arstone@@wustl.edu}
#' @aliases Candidate-class initialize,Candidate-method
#' @rdname Candidate
#' @export
setClass(Class="Candidate", 
         slots = c(name = "character",
                   delegatesWon = "numeric",
                   party = "character", 
                   delegatesNeeded = "numeric"
                   ),
         prototype = prototype(
                   name = "",
                   delegatesWon = c(),
                   party = "",
                   delegatesNeeded = c()
                   )
)

#' @export
setMethod("initialize", "Candidate", 
          function(.Object, ...){
            value=callNextMethod()
            return(value)
          }
) 


