# render_all.R

use_here <- requireNamespace("here", quietly = TRUE)
h <- if (use_here) here::here else function(...) file.path(...)

# List of plates to render
plates <- paste0("Test", 8:10)

# Define which spike standard is used for each plate
spike_lookup <- data.frame(
  plate = c("Test7", "Test8", "Test9", "Test10"),
  spike_std = c("st1", "st1", "st4", "std1"),
  stringsAsFactors = FALSE
)

render_one <- function(plate) {
  input    <- h("analysis", "Data_analysisALLPLATES.Rmd")
  out_dir  <- h("output", plate)
  out_file <- paste0(plate, "_plate_report.html")
  
  # look up the spike for this plate
  spike_std <- spike_lookup$spike_std[match(plate, spike_lookup$plate)]
  
  rmarkdown::render(
    input       = input,
    params      = list(
      plate = plate,
      spike_std = spike_std,   # spike!
      data_root = h("data")
    ),
    output_file = out_file,
    output_dir  = out_dir,
    envir       = new.env(parent = globalenv())
  )
}

# Run rendering for all plates
invisible(lapply(plates, render_one))

