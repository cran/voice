## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
ini0 <- Sys.time()

## ---- message=FALSE, warning=FALSE, eval=FALSE--------------------------------
#  # CRAN (stable)
#  install.packages('voice', dep = TRUE)
#  
#  # Github (development)
#  devtools::install_github('filipezabala/voice')

## ---- message=FALSE, warning=FALSE--------------------------------------------
wavFiles <- list.files(system.file('extdata', package = 'wrassp'),
                       pattern <- glob2rx('*.wav'), full.names = TRUE)

## ---- message=FALSE, warning=FALSE--------------------------------------------
M <- voice::extract_features(wavFiles)
dplyr::glimpse(M)

## ---- message=FALSE, warning=FALSE--------------------------------------------
E <- dplyr::tibble(subject_id = c(1,1,1,2,2,2,3,3,3), wav_path = wavFiles)
E

## ---- message=FALSE, warning=FALSE--------------------------------------------
voice::tag(E)

## ---- message=FALSE, warning=FALSE--------------------------------------------
voice::tag(E, groupBy = 'subject_id')

