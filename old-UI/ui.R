## ui.R
library(shiny)
# library(stats)
# library(tools)
# library(utils)
# library(methods)
# library(httpuv)
# library(caTools)
# library(digest)
# library(RJSONIO)
# library(xtable)
# library(bitops)
# library(Rcpp)
require(rCharts)

###### BEGIN UI ##########
shinyUI(bootstrapPage(
  
  #Html head
  tags$head(
    tags$link(rel = 'stylesheet', type = 'text/css', href = 'styles.css')
  ),
  
  #Html body
  headerPanel("Portfolio allocation"),
 
  mainPanel(
    #Slider input
    selectInput("variable", "Variable:",
                    list("meantemp" = "meantemp", 
                         "maxtemp" = "maxtemp", 
                         "mintemp" = "mintemp")),
    #Outputs
  showOutput("mainPlot","highcharts")
  )
))