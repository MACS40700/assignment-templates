library(shiny)
library(shinythemes)
library(bslib)
library(plotly)
library(ggplot2)
library(dplyr)
library(ggridges)
library(forcats)

tagList(
  # Header
  fluidRow(
    column(12,
           h1("The Mechanisms Behind Demographic Transition", 
              style = "text-align: center; margin-bottom: 30px; font-weight: bold; color: #2c3e50;"),
           
           div(style = "max-width: 1000px; margin: 0 auto; text-align: justify; line-height: 1.6;",
               
               p("Having observed the ", strong("universal pattern"), " of demographic transition, the critical question becomes: ",
                 em("What drives this transformation?"), " The following visualizations examine the ", 
                 strong("causal mechanisms"), " that enable countries to move from high mortality/fertility to low mortality/fertility.",
                 style = "font-size: 18px; margin-bottom: 20px;"),
               
               p("Demographic transition theory identifies ", strong("three primary drivers"), 
                 " that operate through distinct but interconnected pathways:",
                 style = "font-size: 16px; margin-bottom: 15px;"),
               
               div(style = "margin-left: 20px; margin-bottom: 25px;",
                   p("• ", strong("Economic Development:"), " Enables investment in healthcare infrastructure", br(),
                     "• ", strong("Female Education:"), " Transforms family planning decisions and opportunities", br(),
                     "• ", strong("Urbanization:"), " Restructures economic incentives regarding family size",
                     style = "font-size: 15px; line-height: 1.8;")
               ),
               
               h3("Visualization Methodology", style = "color: #2c3e50; margin-top: 25px;"),
               
               p("The ", strong("ridgeline plot"), " (left) employs ", em("GDP quartiles"), 
                 " to demonstrate how economic stratification correlates with health outcomes. Countries are ranked by GDP per capita and divided into four equal groups, revealing the ",
                 strong("systematic relationship"), " between wealth and child survival across development levels.",
                 style = "font-size: 15px; margin-bottom: 15px;"),
               
               p("The ", strong("butterfly chart"), " (right) displays the ", em("temporal correlation"), 
                 " between female education and fertility decisions within individual countries. The mirrored design emphasizes how these variables move in ",
                 strong("opposite directions"), " over time—as education rises (right wing), fertility falls (left wing).",
                 style = "font-size: 15px; margin-bottom: 20px;"),
               
               div(style = "background-color: #f8f9fa; padding: 20px; border-left: 4px solid #e67e22; margin: 25px 0;",
                   h4("Analytical Expectations", style = "color: #2c3e50; margin-top: 0;"),
                   p("The ridgeline plot should reveal ", strong("distinct distributions"), 
                     " with wealthier quartiles clustered around lower child mortality rates. The butterfly chart should demonstrate ",
                     strong("synchronized change"), "—countries with rising female education consistently experience declining fertility, regardless of cultural context.",
                     style = "font-size: 15px; margin: 0;")
               ),
               
               p("These mechanisms operate ", em("sequentially"), " rather than simultaneously: economic development enables healthcare investment, reducing child mortality. Lower child death rates create conditions where ",
                 strong("smaller families become rational"), ". Female education accelerates this transition by providing women with economic alternatives to early marriage and large families.",
                 style = "font-size: 16px; margin-top: 20px;")
           )
    )
  ),
  
  # Two mechanism charts side by side
  fluidRow(
    column(6,
           h3("Economic Development Saves Lives"),
           
           p("Richer countries can afford", strong("better healthcare systems"), 
             "leading to lower", strong("child mortality rates.")),
           # Year selector for GDP chart
           selectInput("gdp_year", "Select Year:", 
                       choices = seq(1960, 2020, 5), selected = 2015),
           div(style = "max-width: 600px; margin: 0 auto;",
               plotOutput("gdp_ridgeline", height = "400px", width = "100%")
           )
           
    ),
    
    column(6,
           h3("Education Transforms Family Decisions"),
           p("As female education rises, fertility rates fall. 
                  Education gives women choices and economic opportunities."),
           
           # Country selector for butterfly chart
           selectInput("butterfly_country", "Select Country:", 
                       choices = NULL,  # Will be populated by server
                       selected = NULL),
           plotOutput("butterfly_education", height = "400px")
    )
  )
)
