# Andy Stone
# Problem Set 6
# March 21, 2016

# Setting working directory
setwd("~/github/PS6")

# Packages to be utilized 
library(devtools); library(roxygen2)

# Creating Candidate class
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

current.code <- as.package("candidatePack")
load_all(current.code)
document(current.code)


# romney <- Candidate(name="Romney",delegatesWon=22, party="Republican", delegatesNeeded=1298)

# Function to help user create a candidate
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

# candidate.webb <- createCandidate("Webb", 0, "Democratic")

# Function that is called in order to calculate delegates needed
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

# Show method
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

# Print method (print is a S3 function)
print.Candidate <- function(candidate){
  print(candidate@name)
}


# propNeeded function
# pass as arguments an object of class Candidate and number of delegates remaining in the race
setGeneric(name="propNeeded",
           def=function(candidate, remaining)
           {standardGeneric("propNeeded")}
)

setMethod(f="propNeeded",
          definition=function(candidate, remaining){
            return(candidate@delegatesNeeded / remaining)
          }
)





