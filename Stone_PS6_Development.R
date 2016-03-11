# Andy Stone
# Problem Set 6
# March 21, 2016

# Setting working directory
setwd("~/github/PS6")

# Packages to be utilized 
library(devtools); library(roxygen2)

Candidate <- setClass(Class="Candidate", 
                      slots = c(
                        name = "character",
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

createCandidate <- setClass(Class="createCandidate")

# romney <- Candidate(name="Romney",delegatesWon=22, party="Republican", delegatesNeeded=1298)

setGeneric(name="createCandidate",
           def=function(name, delegatesWon, party)
           {standardGeneric("createCandidate")}
)

setMethod(f="createCandidate",
          definition=function(name, delegatesWon, party){
            return(new("Candidate", name=name, delegatesWon = delegatesWon, 
                       party = party, delegatesNeeded=neededCalculator(party)))
          }
)


setGeneric(name="neededCalculator",
           def=function(party)
           {standardGeneric("neededCalculator")}
)

setMethod(f="neededCalculator",
          definition=function(party){
            if(party=="R" | party=="Rep" | party=="Rep." | party=="Republican"){
              return(1237)
            }
            if(party=="D" | party=="Dem" | party=="Dem." | party=="Democrat" | party=="Democratic"){
              return(2383)
            }
            else{
              stop("Please specify the party properly with either the string 'Democratic' or 'Republican'")
            }
          }
)






