# Andy Stone
# Problem Set 6
# March 21, 2016

# Setting working directory
setwd("~/github/PS6")

# Packages to be utilized 
library(devtools); library(roxygen2)

# Creating the skeleton of the package (only run this once to start!)
# package.skeleton(name="candidatePack")

# devtools functions to help with package development
current.code <- as.package("candidatePack")
load_all(current.code)
document(current.code)

