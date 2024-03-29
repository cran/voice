% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/smooth_df.R
\name{smooth_df}
\alias{smooth_df}
\title{Smooth numeric variables in a data frame}
\usage{
smooth_df(x, k = 11, id = colnames(x)[1], colnum = NULL, mc.cores = 1)
}
\arguments{
\item{x}{A data frame.}

\item{k}{Integer width of the rolling window. Default: \code{11}.}

\item{id}{The identification column. Default: \code{colname} of the first column of \code{x}.}

\item{colnum}{A \code{char} vector indicating the numeric colnames. If \code{NULL}, uses the columns of the \code{numeric} class.}

\item{mc.cores}{The number of cores to mclapply. By default uses \code{1}.}
}
\value{
Vector of interpolated values with length near to \code{compact.to*length(x)}.
}
\description{
Smooth numeric variables in a data frame
}
\examples{
library(voice)

# get path to audio file
path2wav <- list.files(system.file('extdata', package = 'wrassp'),
pattern = glob2rx('*.wav'), full.names = TRUE)

# minimal usage
M <- extract_features(path2wav, features = c('f0', 'fmt'))
(Ms <- smooth_df(M[-(1:2)]))
dim(M)
dim(Ms)
}
\seealso{
\code{extract_features}
}
