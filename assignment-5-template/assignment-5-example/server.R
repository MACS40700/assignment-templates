library(shiny)
library(bslib)
library(plotly)
library(ggridges)
library(tidyverse)


server <- function(input, output, session) {
    
    # Set default tab
    observe({
        updateNavlistPanel(session, "nav", selected = "The Story")
    })
    
    # Reactive data filtering
    chart_data <- reactive({
        combined_data |> 
            filter(region %in% input$region_filter)
    })
    
    # Update country choices based on filtered data
    observe({
        countries <- sort(unique(chart_data()$country))
        updateSelectInput(session, "highlight_country",
                          choices = c("None" = "", countries))
    })
    
    # Main bubble chart
    output$bubble_chart <- renderPlotly({
        
        # Get data for selected year
        year_data <- chart_data() |>
            filter(year == input$year_slider)
        
        
        
        region_colors <- c(
            "Asia" = "#ff6b6b", 
            "Europe" = "#ffd93d", 
            "Americas" = "#6bcf7f", 
            "Africa" = "#4ecdc4", 
            "Oceania" = "#8e44ad"
        )
        
        # Create the animated plot
        p <- year_data |> 
            ggplot(aes(
                x = child_mortality, 
                y = fertility,
                text = paste("Country:", country,
                             "<br>Year:", year,
                             "<br>Child Mortality:", child_mortality,
                             "<br>Fertility Rate:", fertility,
                             "<br>Population:", scales::comma(population))
            )
            ) +
            
            # add large text in the background
            geom_text(
                aes(label = year),
                x = 250,
                y = 4,
                size = 30,
                color = "grey90",
                alpha = 0.5
            ) +
            
            # Add bubbles
            geom_point(
                aes(size = population, fill = region), 
                color = "black", alpha = 0.8, 
                stroke = 0.1, shape = 21
            ) +
            
            # Customize scales
            scale_x_continuous(
                name = "Child mortality (deaths per 1,000 births)",
                limits = c(0, 500),
                breaks = seq(0, 500, 50),
                expand = c(0.02, 0)
            ) +
            scale_y_continuous(
                name = "Fertility rate (children per woman)",
                limits = c(0, 9),
                breaks = seq(1, 8, 1),
                expand = c(0.02, 0)
            ) +
            scale_size_continuous(
                name = "Population",
                range = c(2, 20),
                labels = scales::comma_format(),
                guide = guide_legend(override.aes = list(alpha = 1))
            ) +
            scale_fill_manual(
                name = "Region",
                values = region_colors,
                guide = guide_legend(override.aes = list(size = 5, alpha = 1))
            ) +
            theme_minimal() +
            theme(
                legend.title = element_text(size = 12, face = "bold"),
                legend.text = element_text(size = 10),
                axis.title = element_text(size = 12, face = "bold"),
                axis.text = element_text(size = 10),
                axis.title.x = element_text(margin = margin(t = 15)),
                axis.title.y = element_text(margin = margin(r = 15)),
                plot.title = element_text(size = 16, face = "bold", hjust = 0.5, margin = margin(10, 10, 10, 10)),
            ) +
            labs(
                title = "Child Mortality vs Fertility Rates",
                caption = "Data: Gapminder Foundation"
            )
        
        
        # Convert to plotly
        ggplotly(p, tooltip = "text") |>
            layout(showlegend = TRUE)
    })
    
    
    
    # GDP vs Child Mortality ridgeline plot
    output$gdp_ridgeline <- renderPlot({
        
        # Get data for selected year
        year_data <- combined_data |>
            filter(year == input$gdp_year)
        
        # Create GDP quartiles
        gdp_data <- year_data |>
            mutate(
                gdp_quartile = ntile(gdp, 4),
                income_group = fct_recode(factor(gdp_quartile),
                                          "Poorest 25%" = "1",
                                          "Lower-middle 25%" = "2", 
                                          "Upper-middle 25%" = "3",
                                          "Richest 25%" = "4"
                )
            )
        
        income_colors <- c(
            "Poorest 25%" = "#4ecdc4",      
            "Lower-middle 25%" = "#ff6b6b",   
            "Upper-middle 25%" = "#6bcf7f", 
            "Richest 25%" = "#ffd93d"       
        )
        
        # Create ridgeline plot
        ggplot(gdp_data, aes(x = child_mortality, y = income_group, fill = income_group)) +
            geom_density_ridges(alpha = 0.7) +
            scale_fill_manual(values = income_colors) +
            labs(
                x = "Child Mortality (deaths per 1,000 births)",
                y = "Income Groups",
                title = paste("Child Mortality by Income Level in", input$gdp_year)
            ) +
            theme_minimal() +
            theme(
                legend.position = "none",
                plot.title = element_text(size = 20, face = "bold", hjust = 0.5, margin = margin(b = 15)),
                axis.title = element_text(size = 16, face = "bold"),
                axis.text = element_text(size = 13),
                axis.title.x = element_text(margin = margin(t = 15)),
                axis.title.y = element_text(margin = margin(r = 15)),
                panel.grid.minor = element_blank()
            )
        
    })
    
    # Education vs Fertility butterfly chart
    output$butterfly_education <- renderPlot({
        
        # Get data for selected country
        country_data <- edu_fr |>
            filter(country == input$butterfly_country) |>
            mutate(
                fertility_left = -fertility,
                education_right = female_edu
            )
        
        # Create butterfly plot
        ggplot(country_data, aes(x = year)) +
            geom_col(aes(y = fertility_left), fill = "#6bcf7f", alpha = 0.7) +
            geom_col(aes(y = education_right), fill = "#4ecdc4", alpha = 0.7) +
            geom_hline(yintercept = 0, color = "black") +
            coord_flip() +
            
            
            scale_y_continuous(
                breaks = seq(-8, 100, 2),
                labels = function(x) ifelse(x < 0, abs(x), x),
            ) +
            
            labs(
                x = "Year",
                y = " ← Fertility (children)    |    Education (years) →",
                title = paste("Demographic Transition in", input$butterfly_country)
            ) +
            theme_minimal() +
            theme(
                legend.position = "none",
                plot.title = element_text(size = 20, face = "bold", hjust = 0.5, margin = margin(b = 15)),
                axis.title = element_text(size = 16, face = "bold"),
                axis.text = element_text(size = 13),
                axis.title.x = element_text(margin = margin(t = 15)),
                axis.title.y = element_text(margin = margin(r = 15)),
                panel.grid.minor = element_blank()
            )
    })
    
    observe({
        countries <- sort(unique(combined_data$country))
        updateSelectInput(session, "butterfly_country",
                          choices = countries,
                          selected = countries[1])  # Select first country by default
    })
    
    
    # Regional fertility projections
    output$regional_projections <- renderPlot({
        
        # Create line chart
        ggplot(projection_data, aes(x = year, y = avg_fertility, color = region)) +
            geom_line(size = 1) +
            geom_hline(yintercept = 2, linetype = "dashed", color = "gray30") +
            labs(
                title = "World Fertility Converging to Replacement Level",
                x = "Year",
                y = "Children per Woman",
                color = "Region",
            ) +
            scale_y_continuous(limits = c(1, 7)) +
            scale_color_manual(values = region_colors) +
            theme_minimal() +
            theme(
                legend.title = element_text(size = 18, face = "bold"),
                legend.text = element_text(size = 15),
                plot.title = element_text(size = 22, face = "bold", hjust = 0.5, margin = margin(b = 15)),
                axis.title = element_text(size = 16, face = "bold"),
                axis.text = element_text(size = 13),
                axis.title.x = element_text(margin = margin(t = 15)),
                axis.title.y = element_text(margin = margin(r = 15)),
            )
        
    })
    
    # Excess population calculation
    # output$excess_population_text <- renderText({
    #   
    #   # Calculate excess population (simplified)
    #   excess_calc <- combined_data |>
    #     filter(year == 2020) |>
    #     filter(!is.na(fertility), fertility > 2) |>
    #     mutate(
    #       excess_fertility = fertility - 2,
    #       annual_excess_births = excess_fertility * population * 0.02,
    #       # Assume 40 years to reach replacement level
    #       total_excess = annual_excess_births * 20  # Rough calculation
    #     ) |>
    #     summarise(total_excess_population = sum(total_excess, na.rm = TRUE))
    #   
    #   paste0("Estimated additional population during transition: ",
    #          scales::comma(round(excess_calc$total_excess_population / 1e9, 1)),
    #          " billion people\n\n",
    #          "This represents temporary growth as mortality falls before fertility adjusts. ",
    #          "After 2060, global population is projected to stabilize and then decline.")
    # })
}