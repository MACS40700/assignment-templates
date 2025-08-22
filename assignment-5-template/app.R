library(shiny)
library(plotly)
library(tidyverse)

# Load your data here (replace with your actual file paths)
# df <- read.csv("your_combined_data.csv")

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
                   wellPanel(
                     fluidRow(
                       column(3, 
                              actionButton("play_pause", "Play", icon = icon("play"),
                                           class = "btn-primary btn-lg")
                       ),
                       column(6,
                              sliderInput("year_slider", "Year:", 
                                          min = 1960, max = 2020, value = 1960, step = 1)
                       ),
                       column(3,
                              selectInput("highlight_country", "Highlight Country:",
                                          choices = c("None" = "", "Bangladesh", "Nigeria", "South Korea"))
                       )
                     )
                   ),
                   
                   plotlyOutput("bubble_chart", height = "600px"),
                   
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
            style = "font-size: 16px;")
                   )
            )
          )
                 ),
          
          tabPanel("The Answer",
                   h2("Future Projections Coming Soon...")
          )
)

server <- function(input, output, session) {
  
  # Your data processing will go here
  # For now, creating dummy data for testing
  dummy_data <- data.frame(
    country = rep(c("Bangladesh", "Nigeria", "South Korea"), each = 61),
    year = rep(1960:2020, 3),
    child_mortality = c(seq(200, 50, length.out = 61),
                        seq(180, 80, length.out = 61),
                        seq(100, 10, length.out = 61)),
    fertility_rate = c(seq(7, 2.5, length.out = 61),
                       seq(6.5, 5, length.out = 61),
                       seq(6, 1.5, length.out = 61)),
    population = rep(c(150000000, 200000000, 50000000), each = 61),
    region = rep(c("Asia", "Africa", "Asia"), each = 61)
  )
  
  output$bubble_chart <- renderPlotly({
    
    # Filter data for selected year
    year_data <- dummy_data %>%
      filter(year == input$year_slider) %>%
      filter(region %in% input$region_filter)
    
    # Create plot
    p <- ggplot(year_data, aes(x = child_mortality, y = fertility_rate,
                               size = population, color = region,
                               text = paste("Country:", country,
                                            "<br>Year:", year,
                                            "<br>Child Mortality:", child_mortality,
                                            "<br>Fertility Rate:", fertility_rate))) +
      geom_point(alpha = 0.7) +
      scale_size_continuous(range = c(5, 20), guide = "none") +
      labs(
        x = "Child Mortality (deaths per 1,000 births)",
        y = "Fertility Rate (children per woman)",
        color = "Region"
      ) +
      xlim(0, 250) +
      ylim(1, 8) +
      theme_minimal()
    
    # Highlight selected country
    if (input$highlight_country != "") {
      highlight_data <- year_data %>% filter(country == input$highlight_country)
      p <- p + 
        geom_point(data = highlight_data, 
                   size = 10, color = "red", shape = 1, stroke = 3)
    }
    
    ggplotly(p, tooltip = "text")
  })
}

shinyApp(ui = ui, server = server)