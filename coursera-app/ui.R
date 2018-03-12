#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Coin-thrower simulator"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
    h3("How many times should we throw that coin?"),
       numericInput("throws",
                   "Number of coin throws:",
                   min = 10,
                   max = 1000,
                   value = 20),
    h3("How many different experiments should we perform?"),
    numericInput("experiments",
                 "Number of experiments:",
                 min = 50,
                 max = 10000,
                 value = 1000),
        h3("is the coin unfair? (if yes, will be heads with 0.8 prob)"),
        checkboxInput("unfair_coin", "Unfair coin", value = FALSE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
