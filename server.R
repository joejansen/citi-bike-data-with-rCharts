## server.r
library(shiny)

require(rCharts)

citibike_all <- read.csv("all-data.csv", header = TRUE, sep = ",")
citibike_all$miles <- round(citibike_all$milesToday, digits=0)

fit1 <- lm(miles ~ day_of_week + maxtemp + precip + cloudsNum + MinDewpointF + maxwind, data=citibike_all)
citibike_all$fit <- as.numeric(fitted(fit1))

#Shiny server function, inputs from slider and dropdown menu, outputs to ui.R or html
shinyServer(function(input, output) {
  
  #########     BEGIN REACTIVE EXPRESIONS    ############
  
	 plotBy <- reactive({
		 paste("miles ~ ", input$variable)	
	      })   
	 groupBy <- reactive({
		 groups <- switch(input$group,
 		            "rain" = rain,
			"sky" = sky,
			"day_of_week" = day_of_week,
 		            "month" = month)
	      })   
	corNum  <- reactive({
		yChoice = input$variable
		yCor = citibike_all[yChoice]
		 round(cor(citibike_all$miles,yCor,method="pearson"),2)
	      })
 	corText  <- reactive({
 		 paste("Correlation between miles and  ", input$variable,":")
 	      })	   	 

  #########     END REACTIVE EXPRESIONS    ############
  		 
  #########     BEGIN OUTPUTS    ############	
     
	 output$mainPlot <- renderChart2({
		 groups <- input$group
		 yPlot <- input$variable
		 h1 <- hPlot(as.formula(plotBy()), data = citibike_all, group=groups,name='date',type = 'scatter', radius = 8, 
		   group.na = "Not Available")
		 h1$params$width = 1000
		 h1$params$height = 700
		 h1$yAxis(title = list(text = "Miles travelled"))
		 
		 # h1$legend(symbolWidth = 80)
		 h1$tooltip(formatter = "#! function(d) { return '<p>' + this.series.name +'<br>Miles travelled: '     + this.point.y + 
		                                                 '<br>x: '  + this.point.x + '</p>'  ; } !#")
		#h1$tooltip(valuePrefix = paste(yPlot," "), crosshairs=list(width=1,color='gray'))
	
		 return(h1)
	     })
		
	     output$corNum <- renderText({
	       corNum()
	     })
	     output$corText <- renderText({
	       corText()
	     })
	   
  #########     END OUTPUTS    ############
  
})
