rmarkdown::render(
  "graph_critique.Rmd", 
  output_format = "md_document", 
  output_file = "README.md"
)


rmarkdown::render(
  "graph_critique.Rmd",
  output_format = "html_document"
)
