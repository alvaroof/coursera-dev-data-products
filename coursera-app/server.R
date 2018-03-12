#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
 
  output$distPlot <- renderPlot({
     #set probability for hedas (fair/unfair is checked)
      p = 0.5
      if(input$unfair_coin){p = 0.8}
    # generate binomial probability throw set and calculate
     # mean. do this for each experiment
      
      means <- numeric(input$experiments)
      
      for(i in seq(1:input$experiments)){
         x <- rbinom(input$throws,1,p)
         means[i] <- mean(x)
      }
 
    # draw the histogram with the specified number of bins
    hist(means, breaks = 30, col = 'darkgray', border = 'white',xlim = c(0,1))
  })
})
