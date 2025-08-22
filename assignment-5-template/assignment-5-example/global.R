# global.R
library(shiny)
library(shinythemes)
library(bslib)      
library(plotly)
library(ggridges)
library(tidyverse)
library(gapminder)


# Function to transform Gapminder CSV data from wide to long format
# Adds region information and filters by year range
transform_gapminder_data <- function(file_path, value_name, year_range = c(1960, 2100)) {
    
    # Extract region mapping from gapminder package
    regions <- gapminder |> 
        select(country, continent) |> 
        distinct() |> 
        rename(region = continent)
    
    # Read the CSV file
    data <- read_csv(file_path)
    
    # Transform to long format
    data_long <- data |> 
        pivot_longer(cols = -country, names_to = "year", values_to = {{value_name}}) |> 
        mutate(year = as.integer(year)) |> 
        filter(year >= year_range[1], year <= year_range[2]) |> 
        inner_join(regions, join_by(country == country)) |> 
        select(country, region, year, {{value_name}})
    
    return(data_long) # Returns: country, region, year, value_name (e.g., gdp)
}

# Read GDP data with all columns as character to handle 'k' suffix
gdp_long <- read_csv("./data/gdp_pcap.csv", col_types = cols(.default = "c")) |> 
    pivot_longer(cols = -country, names_to = "year", values_to = "gdp") |> 
    mutate(year = as.integer(year))

# Check for non-numeric endings in GDP data
# Identifies values ending with 'k' (thousands) or other non-digit characters
gdp_long |> 
    select(gdp) |> 
    mutate(ending = str_sub(gdp, start = str_length(gdp))) |>
    select(ending) |> 
    filter(!str_detect(ending, "\\d")) |> 
    distinct() # Result: just one ending - 'k' for thousands

# Correct GDP values by converting 'k' suffix to actual thousands
gdp_corrected <- gdp_long |> 
    mutate(gdp = if_else(
        str_detect(gdp, "k"), 
        as.double(str_remove(gdp, "k")) * 1000, 
        as.double(gdp))
    ) # Despite the warning, there are no NA values


# Transform all datasets using the helper function
fertility_long <- transform_gapminder_data("./data/children_per_woman_total_fertility.csv", "fertility")
child_mort_long <- transform_gapminder_data("./data/child_mortality_0_5_year_olds_dying_per_1000_born.csv", "child_mortality")
population_long <- transform_gapminder_data("./data/pop.csv", "population")



# Correct population values by handling M (millions) and k (thousands) suffixes
population_corrected <- population_long |> 
    mutate(population = case_when(
        str_detect(population, "M$") ~ parse_number(population) * 1000000,
        str_detect(population, "k$") ~ parse_number(population) * 1000,
        TRUE ~ parse_number(population)
    ))

# Combine all datasets with forecasts included
combined_data_with_forecast <- fertility_long |> 
    inner_join(child_mort_long, by = c("country", "year")) |> 
    inner_join(population_corrected, by = c("country", "year")) |> 
    inner_join(gdp_corrected, by = c("country", "year")) |> 
    mutate(
        log_pop = log10(population)  # Add log-transformed population for scaling
    )

# Filter to exclude forecast years (keep only historical data up to 2024)
combined_data <- combined_data_with_forecast |> 
    filter(year <= 2024)


# Data to plot GDP vs Child Mortality
gdp_mort <- combined_data |> 
    filter(year == 1984) |> 
    select(country, gdp, child_mortality) |> 
    mutate(
        gdp_quantile = ntile(gdp, 4), # GDP split into 4 quartiles to prevent data imbalance in one group
        income_grp = fct_recode(
            factor(gdp_quantile),
            "Poorest 25%" = "1",
            "Lower-middle 25%" = "2",
            "Upper-middle 25%" = "3",
            "Richest 25%" = "4"
        )
    )


# Data to plot Fertility vs Avg Education Women Received
edu_fr <- transform_gapminder_data("./data/mean_years_in_school_women_25_to_34_years.csv", "female_edu") |> 
    inner_join(fertility_long, by = c("country", "region", "year")) |> 
    filter(year <= 2024)

# data used to project fertility rate up to 2100
projection_data <- combined_data_with_forecast |> 
    group_by(region, year) |> 
    summarise(avg_fertility = mean(fertility, na.rm = TRUE))


region_colors <- c(
    "Asia" = "#ff6b6b", 
    "Europe" = "#ffd93d", 
    "Americas" = "#6bcf7f", 
    "Africa" = "#4ecdc4", 
    "Oceania" = "#8e44ad"
)



