library(tidyverse)

yob_files <- list.files("./data/names", pattern = ".txt$", full.names = TRUE)

babynames <- map_dfr(yob_files, \(x) read_csv(x, col_names = c("name", "sex", "n"), id = "file"))



babynames <- babynames |>
    mutate(year = as.integer(str_extract(file, "\\d+")), .before = file) |>
    select(-file)


write_csv(babynames, "babynames.csv")


statewise_files <- list.files("./data/namesbystate", pattern = ".TXT$", full.names = TRUE)

name_by_state <- map_dfr(statewise_files, \(x) read_csv(x, col_names = c("state", "sex", "year", "name", "n"), id = "file"))

name_by_state |> view()

statewise_files
