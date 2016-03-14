# Creating Race class
Race <- setClass(Class="Race", 
                      slots = c(
                        candidates = "list",
                        party = "character", 
                        delegatesNeeded = "numeric",
                        delegatesRemaining = "numeric"
                      ),
                      prototype = prototype(
                        candidates = list(),
                        party = "",
                        delegatesNeeded = numeric(),
                        delegatesRemaining = numeric()
                      )
)


#' @export
setMethod("initialize", "Race", 
          function(.Object, candidates, party){
            .Object@candidates <- candidates
            .Object@party <- party
            if(party=="Republican"){
              alloted <- sum(sapply(1:length(candidates), FUN=function(i) candidates[[i]]@delegatesWon))
              .Object@delegatesRemaining <- 1237 - alloted
              .Object@delegatesNeeded <- 1237
            }
            if(party=="Democratic"){
              alloted <- sum(sapply(1:length(candidates), FUN=function(i) candidates[[i]]@delegatesWon))
              .Object@delegatesRemaining <- 2383 - alloted
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
setMethod(f="plot",
          # Class the method is used for
          signature="Race",
          # The method itself
          definition=function(x, y, object, ...){
            plot(x=NULL,
                 y=NULL,
                 xaxt="n",
                 xlim=c(0, length(object@candidates)),
                 ylim=c(0, max((object@delegatesRemaining + 100), (object@delegatesNeeded + 100))), 
                 xlab="Candidates",
                 ylab="Delegates Won", 
                 main=paste("Delegate Count:", object@party, "Party", sep=" "), 
                 cex.main=1)
                if(object@party == "Democratic"){
                  colors <- c("deepskyblue","deepskyblue4")
                  } 
                if(object@party == "Republican"){
                  colors <- c("red1","red2","red3","red4")
                }
                points(1:length(object@candidates) - 0.5, sapply(1:length(object@candidates), 
                    FUN=function(i) object@candidates[[i]]@delegatesWon), pch=c(16:19), col=colors)
                names <- sapply(1:length(object@candidates), 
                    FUN=function(i) object@candidates[[i]]@name)
                axis(side=1, labels=names, at=1:length(object@candidates) - 0.5)
                abline(h=object@delegatesNeeded, lty=2)
                abline(h=object@delegatesRemaining, lty=2)
            
                text(length(object@candidates) - 0.5, object@delegatesNeeded - 200, 
                     labels="Delegates Needed \n for Nomination", cex=0.7)
                arrows(x0=length(object@candidates) - 0.5, y0=object@delegatesNeeded - 135, 
                       x1 = length(object@candidates) - 0.8, y1 = object@delegatesNeeded-10,
                       length=0.1)
                arrows(x0= 0.5, y0=object@delegatesRemaining - 135, 
                       x1 = 0.8, y1 = object@delegatesRemaining-10,
                       length=0.1)
                text(0.5, object@delegatesRemaining - 200, 
                 labels="Delegates Yet \n to Be Allocated", cex=0.7)
          }   
)



