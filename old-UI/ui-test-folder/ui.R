## ui.R
library(shiny)
library(stats)
library(tools)
library(utils)
library(methods)
library(httpuv)
library(caTools)
library(digest)
library(RJSONIO)
library(xtable)
library(bitops)
library(Rcpp)
require(rCharts)
require(datasets)
library(datasets)

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
    sliderInput("risk", "Allocation", min = 0, max = 100, value = 60, step = 1),
    #Outputs
    
    h3(textOutput("test")),
   
        showOutput("geoChart", "nvd3")
	  
	   )
))