library(shiny)

Panel_estimators <- function() {

    wellPanel(  tags$h3("Prediction"),
                p("- Predicts expected distance a car is able to travel per gallon of combusted fuel."),
     fluidRow(
       column(6,
              sliderInput(var.colnames[2],var.names[2],    min = mins[2], max = maxs[2], value = mins[2], step= steps[2]), 
              sliderInput(var.colnames[3], var.names[3], min = mins[3], max = maxs[3], value = mins[3], step= steps[3]),
              sliderInput(var.colnames[4], var.names[4],        min = mins[4], max = maxs[4], value = mins[4], step= steps[4]),
              sliderInput(var.colnames[5], var.names[5],       min = mins[5], max = maxs[5], value = mins[5], step= steps[5]),
              checkboxInput(var.colnames[8], label =  var.names[8], value = TRUE)
       ),
       column(6,
              sliderInput(var.colnames[6], var.names[6],     min = mins[6], max = maxs[6], value = mins[6], step= steps[6]),
              sliderInput(var.colnames[7], var.names[7],         min = mins[7],   max = maxs[7], value = mins[7], step= steps[7]),
              sliderInput(var.colnames[10],  var.names[10], min = mins[10], max = maxs[10], value = mins[10], step= steps[10]),
              sliderInput(var.colnames[11],  var.names[11],   min = mins[11], max = maxs[11], value = mins[11], step= steps[11]),
              checkboxInput(var.colnames[9], label =  var.names[9], value = FALSE)
              )
     ),
     div(id='id_divEstimation', class='divEstimation',style = "background-color:rgb(153, 216, 242)",
         h3(verbatimTextOutput("Estimation"))
     )
   )
}

Panel_analisys <- function() {
        wellPanel(
            tags$h3("Data Analysis"),
            p("- Explore factors affecting the travel distance/consumption."),
            column(6,
             checkboxGroupInput("group_analysis", label = h3("Selected predictors:"), 
                                choices = var.colnames[-1], # do not include mpg (1st var)
                                selected = "hp"),
            plotOutput("b_distPlot", height = "600px")
            )
        )
}

# Define UI for application that plots random distributions
shinyUI(fluidPage(theme="mytheme.css",
                  tags$style(type="text/css",
                             "label {font-size: 12px;}",
                             ".recalculating {opacity: 1.0;}"
                  ),
                  
                  # Application title
                  tags$h2("Estimation of fuel consumption"),
                  tags$h4("by Isaias Sanchez-Cortina, 2014"),
                  hr(),hr(),
                  tags$h3("Documentation and Quick Help:"),
                  p("This site introduces two aplications for estimating and analysing fuel consumption on cars. Both applications are completely intuitive."),
                  p("Please, ", strong("SCROLL DOWN"), "if you cannot see the two side panels below."),
                  hr(),
                  strong("- Estimation of the distance you can travel with your car:"),
                  p("This application returns  an estimation of the miles you can travel per gallon of fuel."),
                  p("The estimation is perfomed by means of a linear regression model, and returns not only the estimation, but also the 95% confidence intervals."),
                  p("USAGE: Use the sliders and checkers correspondent to several different characteristics of a car to compute the estimation"),
                  strong("- Interactive analysis of the importance of factors of a car than can make it more efficient."),
                  p("This application assumes a linear regression model depending only on the selected factors."),
                  p("4 plots ares returned. These plots are standard for analisyng the adequatness of a model to the data collected in '1974 Motor Trend US magazine'."),
                  p("USAGE: Select one or more factors (characteristics) and see how the regression improves or degrades."),
                  p("      The less residual of the to the fitted model, the better linearly related are the selected factors to fuel consumption."),
                  hr(),
                  
                  fluidRow(

                    column(6, Panel_estimators()),
                    Panel_analisys()

                  )
))
