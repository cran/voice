% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_mono.R
\name{is_mono}
\alias{is_mono}
\title{Verify if an audio is mono}
\usage{
is_mono(x)
}
\arguments{
\item{x}{Path to WAV audio file.}
}
\value{
Logical. `TRUE` indicates a mono (one-channel) file. `FALSE` indicates a non-mono (two-channel) file.
}
\description{
Verify if an audio is mono
}
\examples{
library(voice)

# get path to audio file
path2wav <- list.files(system.file('extdata', package = 'wrassp'),
pattern = glob2rx('*.wav'), full.names = TRUE)

is_mono(path2wav[1])
sapply(path2wav, is_mono)
}
