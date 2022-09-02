## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
ini0 <- Sys.time()

## ---- message=FALSE, warning=FALSE--------------------------------------------
# packs
library(voice)

# get path to audio file
path2wav <- list.files(system.file('extdata', package = 'wrassp'),
                       pattern <- glob2rx('*.wav'), full.names = TRUE)

## -----------------------------------------------------------------------------
# minimal usage
M <- extract_features(path2wav, verbose = FALSE)
M

## -----------------------------------------------------------------------------
# creating Extended synthetic data
E <- dplyr::tibble(subject_id = c(1,1,1,2,2,2,3,3,3), wav_path = path2wav)
E

# minimal usage
tag(E, verbose = FALSE)

# canonical data
tag(E, groupBy = 'subject_id', verbose = FALSE)

