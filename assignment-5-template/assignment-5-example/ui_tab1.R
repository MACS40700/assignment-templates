library(shiny)
library(shinythemes)
library(bslib)
library(plotly)
library(ggplot2)
library(dplyr)
library(ggridges)
library(forcats)

tagList(
    # Header Section
    fluidRow(
        column(12,
               h1("Will Saving Poor Children Lead to Overpopulation?", 
                  style = "text-align: center; margin-bottom: 30px; font-weight: bold; color: #2c3e50;"),
               
               div(style = "max-width: 1000px; margin: 0 auto; text-align: justify; line-height: 1.6;",
                   
                   p(strong("The central research question"), " addresses a persistent misconception in global development discourse: ",
                     em("'Will saving poor children lead to overpopulation?'"), " This question emerges from a ", 
                     strong("fundamentally flawed understanding"), " of demographic processes, yet continues to influence policy discussions regarding development interventions.",
                     style = "font-size: 18px; margin-bottom: 20px;"),
                   
                   p("The dataset comprises demographic indicators from ", strong("Gapminder Foundation"), 
                     ", spanning ", strong("1960-2020"), " across ", strong("195 countries"), 
                     ". The primary visualization presents ", strong("sixty years of demographic data"), 
                     " as an animated bubble chart where each bubble represents a nation.",
                     style = "font-size: 16px; margin-bottom: 15px;"),
                   
                   h3("Visualization Design", style = "color: #2c3e50; margin-top: 25px;"),
                   
                   div(style = "margin-left: 20px; margin-bottom: 20px;",
                       p("• ", strong("Horizontal axis:"), " Child mortality (deaths per 1,000 births)", br(),
                         "• ", strong("Vertical axis:"), " Total fertility rate (children per woman)", br(),
                         "• ", strong("Bubble size:"), " Population (demographic weight)", br(),
                         "• ", strong("Colour:"), " Geographical region", br(),
                         "• ", strong("Animation:"), " Temporal progression (1960-2020)",
                         style = "font-size: 15px; line-height: 1.8;")
                   ),
                   
                   p("This particular visualization design serves ", strong("three critical analytical purposes"), ":",
                     style = "font-size: 16px; margin-bottom: 15px;"),
                   
                   div(style = "margin-left: 20px;",
                       p(strong("First"), ", the animation reveals ", em("temporal patterns"), 
                         " that static charts cannot capture. Users observe how countries move through demographic space over time, demonstrating that demographic transition follows ", 
                         strong("predictable pathways"), " rather than random fluctuations.",
                         style = "font-size: 15px; margin-bottom: 15px;"),
                       
                       p(strong("Second"), ", the dual-axis configuration directly tests the ", 
                         strong("overpopulation hypothesis"), ". If saving children caused population explosions, we would expect countries to move ",
                         span("leftward and upward", style = "color: #e74c3c; font-weight: bold;"),
                         " (lower mortality, higher fertility). Instead, the data consistently shows movement ",
                         span("leftward and downward", style = "color: #27ae60; font-weight: bold;"),
                         " (lower mortality, ", em("lower"), " fertility).",
                         style = "font-size: 15px; margin-bottom: 15px;"),
                       
                       p(strong("Third"), ", the bubble sizing by population ensures that ", 
                         strong("demographic weight"), " is visually represented. When large nations like China or India transition, users immediately comprehend the ",
                         em("global significance"), " of these changes.",
                         style = "font-size: 15px; margin-bottom: 20px;")
                   ),
                   
                   div(style = "background-color: #f8f9fa; padding: 20px; border-left: 4px solid #3498db; margin: 25px 0;",
                       h4("Conclusion", style = "color: #2c3e50; margin-top: 0;"),
                       p("As the animation progresses, observe that ", strong("no country defies the general pattern"), 
                         ". All nations move toward the bottom-left quadrant (low mortality, low fertility), with timing correlating to economic development. This consistency across nearly two centuries provides ",
                         strong("compelling evidence against the overpopulation hypothesis"), ".",
                         style = "font-size: 15px; margin: 0;")
                   )
               )
        )
    ),
    
    
    # Main Chart Section
    fluidRow(
        column(12,
               div(style = "max-width: 1200px; margin: 0 auto; padding: 0 20px;",
                   # Main bubble chart
                   plotlyOutput("bubble_chart", height = "600px"),
                   
                   # add spacing                  
                   div(style = "margin-top: 30px;"),
                   
                   # Chart controls panel
                   wellPanel(
                       fluidRow(
                           column(6,
                                  sliderInput("year_slider", "Year:", 
                                              min = 1960, max = 2020, value = 1960, step = 1,
                                              animate = animationOptions(interval = 200))
                           ),
                           column(6,
                                  checkboxGroupInput("region_filter", "Show Regions:",
                                                     choices = c("Africa", "Asia", "Europe", "Americas", "Oceania"),
                                                     selected = c("Africa", "Asia", "Europe", "Americas", "Oceania"),
                                                     inline = TRUE)
                           )
                       )
                   )
               )
        ),
        
    )
    
)

