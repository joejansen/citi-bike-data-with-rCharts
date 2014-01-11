## server.r
library(shiny)
library(stats)
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
require(datasets)
library(datasets)

# import asset allocation sheet as data frame
aas1 <- read.csv("aas.csv", header = TRUE, sep = "," )
# convert aas to matrix, transpose (flip row and col), delete first row
aas <- t(data.matrix(aas1))[-1,]
#import etf data as data frame
etfs <- read.csv("etfs.csv", header = TRUE, sep = ",")
bonds <- etfs[1:6,1:12] 
stocks <- etfs[7:12,1:12] 

#Shiny server function, inputs from slider, outputs to UI or html
shinyServer(function(input, output) {
  
  #########     BEGIN REACTIVE EXPRESIONS    ############
  
  #Multiplies all div yields by user selected weight, then sums
 GeoData <- reactive({
	 BnorthA = round(100*sum(bonds$NorthAmerica*aas[1:6,input$risk+1]),2)
	 Beurope = round(100*sum(bonds$Europe*aas[1:6,input$risk+1]),2)
	 Basia = round(100*sum(bonds$Asia*aas[1:6,input$risk+1]),2)
	 BlatAm = round(100*sum(bonds$LatinAmerica*aas[1:6,input$risk+1]),2)
	 Baf = round(100*sum(bonds$Africa*aas[1:6,input$risk+1]),2)
	 BmE = round(100*sum(bonds$MiddleEast*aas[1:6,input$risk+1]),2)	
	 SnorthA = round(100*sum(stocks$NorthAmerica*aas[7:12,input$risk+1]),2)
	 Seurope = round(100*sum(stocks$Europe*aas[7:12,input$risk+1]),2)
	 Sasia = round(100*sum(stocks$Asia*aas[7:12,input$risk+1]),2)
	 SlatAm = round(100*sum(stocks$LatinAmerica*aas[7:12,input$risk+1]),2)
	 Saf = round(100*sum(stocks$Africa*aas[7:12,input$risk+1]),2)
	 SmE = round(100*sum(stocks$MiddleEast*aas[7:12,input$risk+1]),2)
	 values <- c(BnorthA,Beurope,Basia,BlatAm,Baf,BmE,SnorthA,Seurope,Sasia,SlatAm,Saf,SmE) 
	 etfType <- c(" ")
	 etfType[1:6] <- "Bonds"
	 etfType[7:12] <- "Stocks"
	 regions <- c("North America", "Europe", "Asia", "Latin America", "Africa", "Middle East","North America", "Europe", "Asia", "Latin America", "Africa", "Middle East")
	 geoData <- data.frame(values,regions,etfType)

	 return(geoData)
  })

  #########     END REACTIVE EXPRESIONS    ############
  
  #########     BEGIN OUTPUTS    ############

 # output$dividend <- renderText({
#	  DivYield()
  #})

  output$test <- renderText({
	  sum(bonds$NorthAmerica[1:6]*aas[,input$risk+1])
  })
  
  output$geoChart <- renderChart({
      geo <- nPlot(values ~ regions, group = 'etfType', data = GeoData(), 
        type = "multiBarChart", dom = 'geoChart', width = 800)
      geo$chart(color = c('brown', 'blue', '#594c26', 'green','#333','#000'))
      return(geo)
    })
    


  
  #########     END OUTPUTS    ############
  
})
