# render_all.R

use_here <- requireNamespace("here", quietly = TRUE)
h <- if (use_here) here::here else function(...) file.path(...)


plates <- paste0("Test", 7:10)

render_one <- function(plate) {
  input    <- h("analysis", "Data_analysis.Rmd")
  out_dir  <- h("data", plate)
  out_file <- paste0(plate, "_plate_report.html")
  
  rmarkdown::render(
    input       = input,
    params      = list(plate = plate, data_root = h("data")),
    output_file = out_file,
    output_dir  = out_dir,
    # either omit envir entirely (recommended) or:
    envir       = new.env(parent = globalenv())
  )
}

invisible(lapply(plates, render_one))
