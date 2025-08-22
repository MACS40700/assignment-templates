rmarkdown::render(
  "analysis.Rmd", 
  output_format = "md_document", 
  output_file = "README.md"
)


rmarkdown::render(
  "analysis.Rmd",
  output_format = "html_document"
)
