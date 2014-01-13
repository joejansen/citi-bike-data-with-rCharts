citi-bike-data-with-rCharts
===========================

Another look at Citi Bike data using Shiny and rCharts

server.R processes the csv data and delivers outputs to www/index.html

Most of the CSS is in shared/bootsrap/css/bootstrap.css


## dependencies

- R: Shiny, shinyapps, rCharts
- HTML/CSS/JS: jquery, shiny.js, bootstrap, highcharts.js

## issues

- tooltip overlay formatting: unable to pull this.point.y.name or other attribute for y-axis name, also unable to pull other fields from data, like the date of the point

## data

-  Citi Bike data http://citibikenyc.com/system-data
- weather http://www.wunderground.com/history/

## credits

- RStudio for shiny and shinyapps!
- Ramnath Vaidyanathan, fantastic online resources for rCharts and highcharts on Shiny

