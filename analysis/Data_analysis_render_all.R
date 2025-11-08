# render_all.R

use_here <- requireNamespace("here", quietly = TRUE)
h <- if (use_here) here::here else function(...) file.path(...)

# ---- Stable bslib cache (works across bslib versions) ----
cache_dir <- h(".bslib-cache")
options(bslib.cache_dir = cache_dir)
if (dir.exists(cache_dir)) unlink(cache_dir, recursive = TRUE, force = TRUE)
dir.create(cache_dir, recursive = TRUE, showWarnings = FALSE)

# Intermediates so temp files aren't cleaned mid-render
inter_dir <- h("output", "_intermediates")
dir.create(inter_dir, recursive = TRUE, showWarnings = FALSE)

# Plates to render
plates <- paste0("Test", 7:10)

# Spike standard lookup
spike_lookup <- data.frame(
  plate = c("Test7", "Test8", "Test9", "Test10"),
  spike_std = c("st1", "st1", "st4", "std1"),
  stringsAsFactors = FALSE
)

render_one <- function(plate) {
  input    <- h("analysis", "Data_analysisALLPLATES.Rmd")
  out_dir  <- h("output", plate)
  out_file <- paste0(plate, "_plate_report.html")
  dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
  
  spike_std <- spike_lookup$spike_std[match(plate, spike_lookup$plate)]
  
  rmarkdown::render(
    input       = input,
    params      = list(
      plate = plate,
      spike_std = spike_std,
      data_root = h("data")
    ),
    output_file = out_file,
    output_dir  = out_dir,
    intermediates_dir = inter_dir,
    clean       = TRUE,
    # Make sure fonts/resources are NOT inlined (prevents .woff2 races)
    output_options = list(
      self_contained = FALSE,
      embed_resources = FALSE
    ),
    envir       = new.env(parent = globalenv())
  )
}

invisible(lapply(plates, render_one))
