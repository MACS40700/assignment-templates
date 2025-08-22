# app.R
library(shiny)
library(shinythemes)
library(bslib)
library(plotly)
library(ggplot2)
library(dplyr)
library(ggridges)
library(forcats)

# Source Global Variables
source("global.R")


# Source the UI and server
source("ui.R")
source("server.R")

# Run the app
shinyApp(ui = ui, server = server) 

