## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
ini0 <- Sys.time()

## ----eval=FALSE---------------------------------------------------------------
# # Development version from GitHub
# install.packages('devtools')
# devtools::install_github('filipezabala/voice')
# 
# # Stable version from CRAN
# install.packages('voice')

## ----message=FALSE, warning=FALSE---------------------------------------------
# packs
library(voice)
library(tidyverse)

# get path to audio file
wavDir <- list.files(system.file('extdata', package = 'wrassp'),
                     pattern = glob2rx('*.wav'), full.names = TRUE)

## ----message=FALSE, warning=FALSE---------------------------------------------
# minimal usage
M <- voice::extract_features(wavDir)
glimpse(M)

## ----message=FALSE, warning=FALSE---------------------------------------------
# creating Extended synthetic data
E <- dplyr::tibble(subject_id = c(1,1,1,2,2,2,3,3,3), wav_path = wavDir)
E

# minimal usage
voice::tag(E)

# canonical data
voice::tag(E, groupBy = 'subject_id')

## ----message=FALSE, warning=FALSE, eval=FALSE---------------------------------
# url0 <- 'https://github.com/filipezabala/voiceAudios/raw/refs/heads/main/wav/doremi.wav'
# download.file(url0, paste0(tempdir(), '/doremi.wav'), mode = 'wb')
# voice::embed_audio(url0) # See https://github.com/mccarthy-m-g/embedr for more details.

## ----message=FALSE, warning=FALSE, eval=FALSE---------------------------------
# M <- voice::extract_features(tempdir())
# summary(M)

## ----message=FALSE, warning=FALSE, fig.width=7.5, fig.height=4, eval=FALSE----
# voice::piano_plot(M, 0) # f0
# voice::piano_plot(M, 0:1) # f0 + f1

## ----message=FALSE, warning=FALSE, eval=FALSE---------------------------------
# (f0_spn <- voice::assign_notes(M, fmt = 0, min_points = 22, min_percentile = .85)) # f0
# (f1_spn <- voice::assign_notes(M, fmt = 1, min_points = 22, min_percentile = .85)) # f1

## ----message=FALSE, warning=FALSE, eval=FALSE---------------------------------
# library(gm)
# line_0 <- gm::Line(as.character(f0_spn))
# m0 <- gm::Music() +
#   gm::Meter(4, 4) +
#   line_0
# gm::show(m0, to = c('score', 'audio'))

## ----message=FALSE, warning=FALSE, eval=FALSE---------------------------------
# line_0 <- gm::Line(as.character(f0_spn))
# line_1 <- gm::Line(as.character(f1_spn))
# m1 <- gm::Music() +
#   gm::Meter(4, 4) +
#   line_0 + line_1
# gm::show(m1, to = c('score', 'audio'))

## ----eval=FALSE---------------------------------------------------------------
# # download
# url0 <- 'https://github.com/filipezabala/voiceAudios/raw/main/wav/sherlock0.wav'
# wavDir <- normalizePath(tempdir())
# download.file(url0, paste0(wavDir, '/sherlock0.wav'), mode = 'wb')

## ----eval=FALSE---------------------------------------------------------------
# # diarize
# voice::diarize(fromWav = wavDir, toRttm = wavDir, token = 'YOUR_TOKEN')

## ----eval=FALSE---------------------------------------------------------------
# # read_rttm
# (rttm <- voice::read_rttm(wavDir))

## ----eval=FALSE---------------------------------------------------------------
# # split audio wave
# voice::splitw(fromWav = wavDir, fromRttm = wavDir, to = wavDir)
# dir(wavDir, pattern = '.[Ww][Aa][Vv]$')

