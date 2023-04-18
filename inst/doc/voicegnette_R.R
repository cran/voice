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

## ---- message=FALSE, warning=FALSE--------------------------------------------
url0 <- 'https://github.com/filipezabala/voiceAudios/blob/main/wav/doremi.wav?raw=true'
download.file(url0, paste0(tempdir(), '/doremi.wav'), mode = 'wb')
# embedr::embed_audio(url0)X

## ---- message=FALSE, warning=FALSE--------------------------------------------
M <- voice::extract_features(tempdir(), features = 'f0', round.to = 6)
summary(M)

## ---- message=FALSE, warning=FALSE--------------------------------------------
# Plot
plot(M$f0)
legend(-40, 170, 'Do (C)' , bty = 'n')
legend(100, 190, 'Re (D)' , bty = 'n')
legend(240, 290, 'Mi (E)' , bty = 'n')
legend(370, 220, 'Fa (F)' , bty = 'n')
legend(500, 250, 'Sol (G)', bty = 'n')
legend(620, 270, 'La (A)' , bty = 'n')
legend(770, 300, 'Si (B)' , bty = 'n')
legend(900, 320, 'Do (C)' , bty = 'n')

## ---- message=FALSE, warning=FALSE--------------------------------------------
# compress
M1 <- voice::interp_df(M, 0.01, id = 3)

# assign notes
M1$f0_spn <- voice::notes(M1$f0)

# duration
d1 <- voice::duration(M1$f0_spn)

# gm by Renfei Mao
library(gm)
m <- gm::Music()
m <- m +
  gm::Meter(4, 4) +
  gm::Line(pitches = as.list(as.character(d1$note)),
           durations = as.list(d1$dur_line)) +
  gm::Tempo(170)
gm::show(m, to = c('score', 'audio'))

