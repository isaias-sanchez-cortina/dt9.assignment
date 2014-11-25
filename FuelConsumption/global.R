#-------------------------------------
# Data
#-------------------------------------
library(datasets)
data(mtcars)
#
mins=sapply(mtcars,min)
maxs=sapply(mtcars,max)

steps=(maxs-mins)/10.  ;
steps[2]<-1.; steps[10]<-1. ; steps[11]<-1. 
  
var.names <- c("Miles per gallon of fuel:",
"Number of cylinders:" , "Displacement (cu.in.):" ,
"Gross horsepower:" ,  "Rear axle ratio:" ,
"Weight (in lb/1000):",        "0.25 miles time:",
"V/S?",  ": Manual Transmission?" ,  
"Number of forward gears:", "Number of carburetors:" )
       
var.colnames <- names(mtcars)
