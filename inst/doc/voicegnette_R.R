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
wavDir <- list.files(system.file('extdata', package = 'wrassp'),
                     pattern = glob2rx('*.wav'), full.names = TRUE)

## ---- message=FALSE, warning=FALSE--------------------------------------------
# minimal usage
M <- voice::extract_features(wavDir)
M

## ---- message=FALSE, warning=FALSE--------------------------------------------
# creating Extended synthetic data
E <- dplyr::tibble(subject_id = c(1,1,1,2,2,2,3,3,3), wav_path = wavDir)
E

# minimal usage
voice::tag(E)

# canonical data
voice::tag(E, groupBy = 'subject_id')

