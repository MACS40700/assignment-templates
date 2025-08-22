library(rvest)
library(dplyr)
library(purrr)

url <- "your_actual_url_here"
page <- read_html(url)

# Extract headers
headers <- page %>%
    html_elements("div.subcontainer table.sortable thead th") %>%
    html_text(trim = TRUE)

# Extract data rows
rows <- page %>%
    html_elements("div.subcontainer table.sortable tbody tr")

# Process each row
data_list <- map(rows, function(row) {
    row %>%
        html_elements("td") %>%
        html_text(trim = TRUE)
})

# Convert to data frame
df <- map_dfr(data_list, ~{
    tibble(!!!set_names(.x, headers))
})

# Save results
write_csv(df, "music_chart_data.csv")
