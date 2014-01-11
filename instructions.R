# Before running this project on your local machine you'll have to install R - http://www.r-project.org/
# You can use R via the terminal/console or with a number of different IDEs. I prefer RStudio - http://www.rstudio.com/
# Once you're ready to run commands in R, you'll have to install some packages and libraries.
# You can use the lines below to get started. Also you can refer to this page - http://rstudio.github.io/shiny/tutorial/

install.packages("shiny")
library(shiny)

# Now set your working directory to the location of server.R either by changing the following line or using the RStudio seesion menu.

setwd("~/your-path-here")

# Try to run the app

runApp()

# If you get an error about a missing function or package, you may have to install addidtional packages
# Copy the format used above for installing the package and loading the library
#install.packages("shiny")
#library(shiny)
