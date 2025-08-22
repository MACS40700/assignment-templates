ui <- navbarPage("Demographic Transition Story",
                 
                 tabPanel("The Story",
                          
                          # Header Section
                          fluidRow(
                            column(12,
                                   h1("Will Saving Poor Children Lead to Overpopulation?", 
                                      style = "text-align: center; margin-bottom: 20px;"),
                                   p("Many fear that reducing child mortality in developing countries will lead to 
          population explosions. But what actually happens when children stop dying? 
          Watch 60 years of global data reveal the surprising truth.",
          style = "font-size: 18px; text-align: center; margin-bottom: 30px;")
                            )
                          ),
          
          # Main Chart Section
          fluidRow(
            column(12,
                   # Chart controls panel
                   wellPanel(
                     fluidRow(
                       column(3, 
                              actionButton("play_pause", "Play", icon = icon("play"),
                                           class = "btn-primary btn-lg")
                       ),
                       column(6,
                              sliderInput("year_slider", "Year:", 
                                          min = 1960, max = 2020, value = 1960, step = 1,
                                          animate = animationOptions(interval = 200))
                       ),
                       column(3,
                              selectInput("highlight_country", "Highlight Country:",
                                          choices = NULL, selected = NULL)
                       )
                     )
                   ),
                   
                   # Main bubble chart
                   plotlyOutput("bubble_chart", height = "600px"),
                   
                   # Chart filters
                   fluidRow(
                     column(6,
                            checkboxGroupInput("region_filter", "Show Regions:",
                                               choices = c("Africa", "Asia", "Europe", "Americas", "Oceania"),
                                               selected = c("Africa", "Asia", "Europe", "Americas", "Oceania"),
                                               inline = TRUE)
                     ),
                     column(6,
                            numericInput("speed_control", "Animation Speed (ms):", 
                                         value = 200, min = 50, max = 1000, step = 50)
                     )
                   )
            )
          ),
          
          # Conclusion Section
          fluidRow(
            column(12,
                   wellPanel(
                     h3("The Demographic Transition Revealed"),
                     p("As you just witnessed, countries don't move UP and RIGHT (more children + more deaths). 
            Instead, they move DOWN and RIGHT - fewer deaths lead to fewer births, not more. 
            This is the demographic transition, and it happens everywhere that develops.",
            style = "font-size: 16px;"),
            p("Next, explore WHY this happens and what the future holds.",
              style = "font-style: italic;")
                   )
            )
          )
          
                 ) # End tabPanel
          
) # End navbarPage



# Minimal server (does nothing)
server <- function(input, output, session) {}

shinyApp(ui = ui, server = server)