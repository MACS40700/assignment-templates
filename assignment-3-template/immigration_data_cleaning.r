# Immigration Data Cleaning Script
# Cleans Census Table 2: Foreign-Born Population by Region 1850-1990
# Author: Your Analysis
# Purpose: Prepare immigration data for baby name diversity correlation

library(readxl)
library(dplyr)
library(tidyr)
library(stringr)

# Read the Excel file
clean_immigration_data <- function(file_path = "table02.xlsx") {

  cat("🔍 Reading immigration data...\n")

  # Read the raw data
  raw_data <- read_excel(file_path, sheet = "Table 2", col_names = FALSE)

  cat("📊 Raw data dimensions:", nrow(raw_data), "rows x", ncol(raw_data), "columns\n")

  # Identify data sections
  # Numbers section starts at row 10, Percentages at row 24

  # Extract the NUMBER section (rows 10-22)
  cat("🔢 Extracting numbers section...\n")

  numbers_data <- raw_data[10:22, 1:10]  # Rows 10-22, columns A-J

  # Set proper column names based on header rows (7-8)
  colnames(numbers_data) <- c(
    "Year",
    "Total_Foreign_Born",
    "Region_Reported_Total",
    "Europe",
    "Asia",
    "Africa",
    "Oceania",
    "Latin_America",
    "Northern_America",
    "Region_Not_Reported"
  )

  # Clean the data
  cat("🧹 Cleaning the data...\n")

  # Remove asterisks from years and convert to numeric
  numbers_data$Year <- as.numeric(str_remove_all(numbers_data$Year, "\\*|\\s"))

  # Convert all numeric columns, handling NAs
  numeric_cols <- colnames(numbers_data)[-1]  # All except Year

  numbers_data <- numbers_data %>%
    mutate(across(all_of(numeric_cols), ~ as.numeric(.)))

  # Sort by year (ascending order)
  numbers_data <- numbers_data %>%
    arrange(Year) %>%
    filter(!is.na(Year))  # Remove any rows without valid years

  cat("✅ Cleaned data dimensions:", nrow(numbers_data), "rows x", ncol(numbers_data), "columns\n")

  # Create summary statistics
  cat("📈 Creating summary variables...\n")

  immigration_clean <- numbers_data %>%
    mutate(
      # Calculate foreign-born percentage of total population (you'll need to add total pop data)
      # For now, we'll create the basic structure

      # European percentage of foreign-born
      Europe_Pct_of_FB = round((Europe / Total_Foreign_Born) * 100, 1),

      # Non-European percentage
      Non_Europe_FB = Total_Foreign_Born - Europe,
      Non_Europe_Pct_of_FB = round((Non_Europe_FB / Total_Foreign_Born) * 100, 1),

      # Policy periods (for your analysis)
      Policy_Period = case_when(
        Year <= 1920 ~ "Pre_Restriction",
        Year > 1920 & Year <= 1965 ~ "Johnson_Reed_Era",
        Year > 1965 ~ "Post_1965_Reform",
        TRUE ~ "Other"
      ),

      # Immigration trend indicators
      Immigration_Level = case_when(
        Total_Foreign_Born >= 13000000 ~ "High",
        Total_Foreign_Born >= 10000000 ~ "Medium",
        TRUE ~ "Low"
      )
    )

  # Print summary
  cat("\n📋 DATA SUMMARY:\n")
  cat("Years covered:", min(immigration_clean$Year), "to", max(immigration_clean$Year), "\n")
  cat("Peak immigration year:", immigration_clean$Year[which.max(immigration_clean$Total_Foreign_Born)],
      "with", max(immigration_clean$Total_Foreign_Born, na.rm = TRUE), "foreign-born\n")
  cat("Lowest immigration year:", immigration_clean$Year[which.min(immigration_clean$Total_Foreign_Born)],
      "with", min(immigration_clean$Total_Foreign_Born, na.rm = TRUE), "foreign-born\n")

  # Show policy periods
  cat("\n🏛️ POLICY PERIODS:\n")
  print(immigration_clean %>%
    group_by(Policy_Period) %>%
    summarise(
      Years = paste(min(Year), "to", max(Year)),
      Avg_Foreign_Born = round(mean(Total_Foreign_Born, na.rm = TRUE)),
      .groups = "drop"
    ))

  return(immigration_clean)
}

# Function to prepare data for correlation with name diversity
prepare_for_analysis <- function(immigration_data, name_diversity_data = NULL) {

  cat("\n🔗 Preparing data for correlation analysis...\n")

  # Create interpolated data for missing years if needed
  # (You mentioned the 1930-1960 gap - we can interpolate or flag it)

  immigration_for_analysis <- immigration_data %>%
    select(Year, Total_Foreign_Born, Europe_Pct_of_FB, Non_Europe_Pct_of_FB, Policy_Period) %>%
    # Add decade indicator for easier merging
    mutate(Decade = paste0(floor(Year/10)*10, "s"))

  # If you have name diversity data, merge it here
  if (!is.null(name_diversity_data)) {
    cat("🔀 Merging with name diversity data...\n")
    # Assuming name_diversity_data has columns: year, diversity_metric
    final_data <- immigration_for_analysis %>%
      left_join(name_diversity_data, by = c("Year" = "year"))
  } else {
    final_data <- immigration_for_analysis
    cat("⚠️ No name diversity data provided - returning immigration data only\n")
  }

  return(final_data)
}

# Function to create quick plots for validation
create_quick_plots <- function(immigration_data) {

  cat("\n📊 Creating validation plots...\n")

  library(ggplot2)

  # Plot 1: Immigration over time
  p1 <- ggplot(immigration_data, aes(x = Year, y = Total_Foreign_Born)) +
    geom_line(color = "blue", size = 1) +
    geom_point(color = "darkblue") +
    geom_vline(xintercept = c(1924, 1965), linetype = "dashed", color = "red") +
    annotate("text", x = 1924, y = max(immigration_data$Total_Foreign_Born) * 0.9,
             label = "Johnson-Reed\nAct 1924", hjust = 1.1) +
    annotate("text", x = 1965, y = max(immigration_data$Total_Foreign_Born) * 0.9,
             label = "Immigration\nAct 1965", hjust = -0.1) +
    labs(title = "U.S. Foreign-Born Population 1850-1990",
         subtitle = "Shows clear impact of immigration policy changes",
         x = "Year", y = "Foreign-Born Population") +
    theme_minimal()

  # Plot 2: European vs Non-European immigration
  p2 <- immigration_data %>%
    select(Year, Europe, Non_Europe_FB) %>%
    pivot_longer(cols = c(Europe, Non_Europe_FB), names_to = "Region", values_to = "Population") %>%
    ggplot(aes(x = Year, y = Population, fill = Region)) +
    geom_area(alpha = 0.7) +
    labs(title = "Composition of Foreign-Born Population",
         subtitle = "European vs Non-European Immigration",
         x = "Year", y = "Foreign-Born Population") +
    scale_fill_manual(values = c("Europe" = "steelblue", "Non_Europe_FB" = "orange")) +
    theme_minimal()

  return(list(timeline = p1, composition = p2))
}

# Main execution function
main <- function() {
  cat("🚀 STARTING IMMIGRATION DATA CLEANING PIPELINE\n")
  cat("=" %R% 50, "\n")

  # Clean the data
  immigration_clean <- clean_immigration_data("./data/table02.xlsx")

  # Prepare for analysis
  analysis_ready <- prepare_for_analysis(immigration_clean)

  # Create plots
  plots <- create_quick_plots(immigration_clean)

  # Save cleaned data
  cat("\n💾 Saving cleaned data...\n")
  write.csv(immigration_clean, "immigration_data_clean.csv", row.names = FALSE)
  write.csv(analysis_ready, "immigration_for_analysis.csv", row.names = FALSE)

  cat("✅ PIPELINE COMPLETE!\n")
  cat("Files saved:\n")
  cat("  📄 immigration_data_clean.csv - Full cleaned dataset\n")
  cat("  📄 immigration_for_analysis.csv - Analysis-ready data\n")

  # Return both datasets
  return(list(
    full_data = immigration_clean,
    analysis_data = analysis_ready,
    plots = plots
  ))
}

# Helper function to fix string operation
`%R%` <- function(x, y) paste(rep(x, y), collapse = "")

# Run the pipeline
# Uncomment the line below to execute:
results <- main()

cat("📖 USAGE INSTRUCTIONS:\n")
cat("1. Make sure table02.xlsx is in your working directory\n")
cat("2. Run: results <- main()\n")
cat("3. Access cleaned data: results$full_data\n")
cat("4. View plots: results$plots$timeline or results$plots$composition\n")
cat("5. Use results$analysis_data for correlation with name diversity\n")
