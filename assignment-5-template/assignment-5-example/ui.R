library(shiny)
library(shinythemes)
library(bslib)
library(plotly)
library(ggplot2)
library(dplyr)
library(ggridges)
library(forcats)


ui <- navbarPage("Demographic Transition Story",
                 theme = bs_theme(
                     bootswatch = "flatly",
                     base_font = font_google("Inter"),
                     navbar_bg = "#2c3e50",
                     navbar_fg = "#ffffff"
                 ),
                 
                 tags$head(
                     tags$style(HTML("
    .irs-single {
      background: #3498db !important;
      color: white !important;
      font-size: 16px !important;
      padding: 4px 10px !important;
      top: -35px !important;  /* Move it higher to avoid overlap */
      border-radius: 4px !important;
    }
    
    /* Make slider container taller to accommodate value box */
    .irs {
      margin-top: 40px !important;
      margin-bottom: 20px !important;
    }
    
    /* Make play button much bigger - UPDATED */
    .slider-animate-button {
      font-size: 18px !important;
      padding: 8px 15px !important;
      margin-left: 15px !important;
      min-width: 45px !important;
      height: 35px !important;
    }
    
    /* Make axis labels bigger */
    .irs-grid-text {
      font-size: 14px !important;
      font-weight: 500 !important;
    }
    
    /* Slider styling */
    .irs-bar, .irs-line {
      height: 12px !important;
    }
    .irs-slider {
      width: 24px !important;
      height: 24px !important;
      top: -6px !important;
    }
    
    /* Other controls */
    .checkbox label, .radio label {
      font-size: 16px !important;
    }
    
    .control-label {
      font-size: 16px !important;
      font-weight: 600;
    }
    
    /* Min/max labels */
    .irs-min, .irs-max {
      font-size: 14px !important;
      font-weight: 500 !important;
    }
  "))
),
  
  
  tabPanel(
      "The Story",
      source("ui_tab1.R", local = TRUE)$value
  ),
  tabPanel(
      "Why This Happens",
      source("ui_tab2.R", local = TRUE)$value
  ),
  tabPanel(
      "The Answer",
      source("ui_tab3.R", local = TRUE)$value
  )
           
  )
  
