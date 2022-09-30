# Load the libraries 
library(tidyverse)
library(haven)

#Load the dataset
nfhs <- read_dta("IAHR52FL.dta")

#Subset the data
nfhs <- select(nfhs,hhid:shstruc)