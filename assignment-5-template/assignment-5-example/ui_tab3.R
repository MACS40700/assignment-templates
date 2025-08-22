library(shiny)
library(shinythemes)
library(bslib)
library(plotly)
library(ggplot2)
library(dplyr)
library(ggridges)
library(forcats)

tagList(
    fluidRow(
        column(12,
               h1("The Answer: No Overpopulation", 
                  style = "text-align: center; margin-bottom: 30px; font-weight: bold; color: #2c3e50;"),
               
               div(style = "max-width: 1000px; margin: 0 auto; text-align: justify; line-height: 1.6;",
                   
                   p("The evidence conclusively answers the central question: ", 
                     strong("saving poor children does not lead to overpopulation"), ". Instead, the data reveals that all regions are ",
                     em("converging toward replacement-level fertility"), " by 2100, precisely because child mortality has declined.",
                     style = "font-size: 18px; margin-bottom: 20px;"),
                   
                   p("The regional fertility projections demonstrate ", strong("universal convergence"), 
                     " toward approximately ", strong("2.1 children per woman"), "—the replacement level necessary for population stability. This convergence occurs ",
                     em("across all geographical and cultural contexts"), ", indicating that demographic transition follows economic and social development rather than cultural preferences.",
                     style = "font-size: 16px; margin-bottom: 20px;"),
                   
                   h3("Projection Methodology", style = "color: #2c3e50; margin-top: 25px;"),
                   
                   p("The visualization displays ", strong("regional averages"), " rather than individual countries to emphasize ",
                     em("systematic patterns"), " over isolated cases. The dashed horizontal line at 2.1 children per woman represents ",
                     strong("replacement-level fertility"), "—the rate at which births exactly replace deaths in a population with low mortality.",
                     style = "font-size: 15px; margin-bottom: 15px;"),
                   
                   p("Even regions currently experiencing high fertility—particularly ", strong("Sub-Saharan Africa"), 
                     " and parts of ", strong("South Asia"), "—demonstrate clear trajectories toward replacement level. The convergence timeline varies by region based on current development levels, but the ",
                     em("direction is universal"), ".",
                     style = "font-size: 15px; margin-bottom: 25px;"),
                   
                   h3("Policy Implications", style = "color: #2c3e50; margin-top: 25px;"),
                   
                   p("The overpopulation misconception carries ", strong("significant policy consequences"), 
                     ". Delaying investments in child health, education, and economic development under the false belief that saving children causes overpopulation actually ",
                     em("prolongs the demographic transition"), ". Countries that remain in high mortality/fertility equilibrium longer will add ",
                     strong("excess population"), " during the eventual transition period, creating larger demographic momentum with its own economic and environmental consequences.",
                     style = "font-size: 16px; margin-bottom: 15px;"),
                   
                   p("Conversely, ", strong("accelerating the demographic transition"), 
                     " through targeted investments in healthcare, female education, and economic development minimizes long-term population growth while improving human welfare. The data demonstrates that ",
                     em("saving children is the pathway to population stability"), ", not its obstacle.",
                     style = "font-size: 16px; margin-bottom: 20px;"),
                   
                   div(style = "background-color: #f8f9fa; padding: 20px; border-left: 4px solid #27ae60; margin: 25px 0;",
                       h4("Definitive Answer", style = "color: #2c3e50; margin-top: 0;"),
                       p("The question ", em("'Will saving poor children lead to overpopulation?'"), " is answered with empirical certainty: ",
                         strong("No"), ". Reducing child mortality is the prerequisite for achieving replacement-level fertility and long-term population stability. The fear of overpopulation represents a fundamental misunderstanding of demographic processes and should not influence development policy formulation.",
                         style = "font-size: 16px; margin: 0; font-weight: 500;")
                   )
               )
        )
    ),
    
    # Regional projections chart
    fluidRow(
        column(12,
               
               div(style = "max-width: 1000px; margin: 0 auto; padding: 0 20px;",
                   h3("Regional Fertility Projections to 2100"),
                   div(style = "margin-top: 100px;"),
                   plotOutput("regional_projections", height = "500px")),
               
               # add spacing                  
               div(style = "margin-top: 100px;")
        )
    )
    
)