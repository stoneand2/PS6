#' A Candidate object 
#' 
#' Object of class \code{Candidate} are created by the \code{createCandidate} function. Objects of
#' this class have their own \code{show} and \code{print} methods.
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
#' @aliases Candidate-class initialize,Candidate-method show,Candidate-method 
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
                   delegatesWon = numeric(),
                   party = "",
                   delegatesNeeded = numeric()
                   )
)

#' @export
setMethod("initialize", "Candidate", 
          function(.Object, name, delegatesWon, party){
            .Object@name <- name
            .Object@party <- party
            .Object@delegatesWon <- delegatesWon
            if(party=="Republican"){
              .Object@delegatesNeeded <- 1237
            }
            if(party=="Democratic"){
              .Object@delegatesNeeded <- 2383
            }
            if(party!="Democratic" & party!="Republican"){
              stop("Please specify the party properly with either the string 'Democratic' or 'Republican'")
            }
            value=callNextMethod()
            return(value)
          }
) 

#' @export
setMethod(f="show",
          # Class the method is used for
          signature="Candidate",
          # The method itself
          definition=function(object){
            show.df <- data.frame(object@name, object@delegatesWon, object@party, object@delegatesNeeded)
            colnames(show.df) <- c("Name","Delegates Won","Party","Delegates Needed")
            print(show.df)
          }   
)

#' @export
# Print method (print is a S3 function)
print.Candidate <- function(candidate){
  paste(paste(candidate.rubio@party, candidate.rubio@name), paste(candidate.rubio@delegatesWon, "Delegates Won"),
           paste(candidate.rubio@delegatesNeeded, "Delegates Needed for Nomination"), sep=", ")
}

