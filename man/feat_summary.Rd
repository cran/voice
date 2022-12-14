% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/feat_summary.R
\name{feat_summary}
\alias{feat_summary}
\title{Returns summary measures of 'voice::extract_features'}
\usage{
feat_summary(
  x,
  groupBy = "wav_path",
  wavPath = unique(x$wav_path),
  wavPathName = "wav_path",
  filesRange = NULL,
  features = "f0",
  gender = "u",
  windowShift = 5,
  numFormants = 8,
  numcep = 12,
  dcttype = c("t2", "t1", "t3", "t4"),
  fbtype = c("mel", "htkmel", "fcmel", "bark"),
  resolution = 40,
  usecmp = FALSE,
  mc.cores = 1,
  full.names = TRUE,
  recursive = FALSE,
  check.mono = FALSE,
  stereo2mono = FALSE,
  overwrite = FALSE,
  freq = 44100,
  round.to = 4,
  verbose = TRUE
)
}
\arguments{
\item{x}{An Extended data frame to be tagged with media information.}

\item{groupBy}{A variable to group the summary measures. The argument must be a character vector. Default: \code{groupBy = 'wav_path'}.}

\item{wavPath}{A vector containing the path(s) to WAV files. May be both as \code{dirname} or \code{basename} formats.}

\item{wavPathName}{A string containing the WAV path name. Default: \code{wavPathName = 'wav_path'}}

\item{filesRange}{The desired range of directory files (default: \code{NULL}, i.e., all files). Should only be used when all the WAV files are in the same folder.}

\item{features}{Vector of features to be extracted. (default: 'f0','formants','mfcc','df','pf','rf','rcf','rpf'). The following features may contain a variable number of columns: \code{'cep'}, \code{'dft'}, \code{'css'} and \code{'lps'}.}

\item{gender}{\code{= <code>} set gender specific parameters where <code> = \code{'f'}[emale], \code{'m'}[ale] or \code{'u'}[nknown] (default: \code{'u'}). Used by \code{wrassp::ksvF0}, \code{wrassp::forest} and \code{wrassp::mhsF0}.}

\item{windowShift}{\code{= <dur>} set analysis window shift to <dur>ation in ms (default: 5.0). Used by \code{wrassp::ksvF0}, \code{wrassp::forest}, \code{wrassp::mhsF0}, \code{wrassp::zcrana}, \code{wrassp::rfcana}, \code{wrassp::acfana}, \code{wrassp::cepstrum}, \code{wrassp::dftSpectrum}, \code{wrassp::cssSpectrum} and \code{wrassp::lpsSpectrum}.}

\item{numFormants}{\code{= <num>} <num>ber of formants (default: 8). Used by \code{wrassp::forest}.}

\item{numcep}{Number of Mel-frequency cepstral coefficients (cepstra) to return (default: 12). Used by \code{tuneR::melfcc}.}

\item{dcttype}{Type of DCT used. \code{'t1'} or \code{'t2'}, \code{'t3'} for HTK \code{'t4'} for feacalc (default = \code{'t2'}). Used by \code{tuneR::melfcc}.}

\item{fbtype}{Auditory frequency scale to use: \code{'mel'}, \code{'bark'}, \code{'htkmel'}, \code{'fcmel'} (default: \code{'mel'}). Used by \code{tuneR::melfcc}.}

\item{resolution}{\code{= <freq>} set FFT length to the smallest value which results in a frequency resolution of <freq> Hz or better (default: 40.0). Used by \code{wrassp::cssSpectrum}, \code{wrassp::dftSpectrum} and \code{wrassp::lpsSpectrum}.}

\item{usecmp}{Logical. Apply equal-loudness weighting and cube-root compression (PLP instead of LPC) (default: \code{FALSE}). Used by \code{tuneR::melfcc}.}

\item{mc.cores}{Number of cores to be used in parallel processing. (default: \code{1})}

\item{full.names}{Logical. If \code{TRUE}, the directory path is prepended to the file names to give a relative file path. If \code{FALSE}, the file names (rather than paths) are returned. (default: \code{TRUE}) Used by \code{base::list.files}.}

\item{recursive}{Logical. Should the listing recursively into directories? (default: \code{FALSE}) Used by \code{base::list.files}.}

\item{check.mono}{Logical. Check if the WAV file is mono. (default: \code{TRUE})}

\item{stereo2mono}{Logical. Should files be converted from stereo to mono? (default: \code{TRUE})}

\item{overwrite}{Logical. Should converted files be overwritten? If not, the file gets the suffix \code{_mono}. (default: \code{FALSE})}

\item{freq}{Frequency in Hz to write the converted files when \code{stereo2mono=TRUE}. (default: \code{44100})}

\item{round.to}{Number of decimal places to round to. (default: \code{NULL})}

\item{verbose}{Logical. Should the running status be showed? (default: \code{TRUE})}
}
\value{
A tibble data frame containing summarized numeric columns using mean, standard deviation, variation coefficient, media, interquartile range and median absolute deviation.
}
\description{
Returns summary measures of 'voice::extract_features'
}
\details{
\code{filesRange} should only be used when all the WAV files are in the same folder.
}
\examples{
library(voice)

# get path to audio file
path2wav <- list.files(system.file('extdata', package = 'wrassp'),
pattern <- glob2rx('*.wav'), full.names = TRUE)

# creating Extended synthetic data
E <- dplyr::tibble(subject_id = c(1,1,1,2,2,2,3,3,3),
wav_path = path2wav)

# minimal usage
feat_summary(E)

# canonical data
feat_summary(E, 'subject_id')
}
