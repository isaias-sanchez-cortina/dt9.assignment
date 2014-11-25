# By Isaias Sanche-Cortina, 2014


## MAIN
library(shiny)
library(stats)

# Left panel: Estimation of mpg given the rest of the vars (linear regression model)
fitall<-lm(mpg~., mtcars)
# Estimation of the mpg each time an input parameter is changed:
Estimate <- function(input) {
   dat = data.frame(mpg=NA);
   for (i in var.colnames)   dat[i] = input[[i]]
   #convert checkbox input to numeric
   dat$am<-as.numeric(dat$am) ; dat$vs<-as.numeric(dat$vs)
   res=signif(predict(fitall, dat, interval="predict"),3)
   sprintf("Estimated mpg=%3.2f [miles/gallon]. \n95%% Confidence interval: [%3.2f, %3.2f]",res[1],res[2],res[3])
}

# Right panel
plotfit <- function(input) {
  selectedcols = cbind( "mpg", input[["group_analysis"]]) ;
  if (length(selectedcols)<2) {
    plot(c(0,1),main="Please, select at least one predictor")
  } else {
  dat<-mtcars[,selectedcols];
  myfit<- lm(mpg~., dat)
  par(mfrow=c(2,2))
  par(bg=rgb(0.6,.85,.95))
  plot(myfit)
  }
}


shinyServer(function(input, output, session) {
  # Linear regression prediction for left panel:
  output$Estimation <- renderText(Estimate(input))
	#  Regression and Fit plot:
  output$b_distPlot <- renderPlot({  	plotfit(input)  })
})




