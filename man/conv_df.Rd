% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/conv_df.R
\name{conv_df}
\alias{conv_df}
\title{Convolute data frames using multicore.}
\usage{
conv_df(
  x,
  compact.to,
  id = colnames(x)[1],
  colnum = NULL,
  drop.x = TRUE,
  drop.zeros = FALSE,
  to.data.frame = TRUE,
  round.off = NULL,
  weight = NULL,
  mc.cores = 1
)
}
\arguments{
\item{x}{A data frame.}

\item{compact.to}{Percentage of remaining points after compaction If equals to 1 and keep.zeros = T, the original vector is presented.}

\item{id}{The identification column. Default: \code{colname} of the first column of \code{x}.}

\item{colnum}{A \code{char} vector indicating the numeric colnames. If \code{NULL}, uses the columns of the \code{numeric} class.}

\item{drop.x}{Logical. Drop columns containing .x? Default: \code{TRUE}.}

\item{drop.zeros}{Logical. Drop repeated zeros or compress to 1 zero per null set? Default: \code{FALSE}.}

\item{to.data.frame}{Logical. Should the return be a data frame? If \code{FALSE} returns a list. Default: \code{TRUE}.}

\item{round.off}{Number of decimal places of the convoluted vector. Default: \code{NULL}.}

\item{weight}{Vector of weights with same length of \code{y}. Default: \code{NULL}.}

\item{mc.cores}{The number of cores to mclapply. By default uses \code{1}.}
}
\value{
A vector of convoluted values with length near to \code{compact.to*length(x)}.
}
\description{
Convolute data frames using multicore.
}
\examples{
library(voice)

# get path to audio file
path2wav <- list.files(system.file('extdata', package = 'wrassp'),
pattern <- glob2rx('*.wav'), full.names = TRUE)

# getting Media data frame
M <- extract_features(dirname(path2wav), features = c('f0','formants'),
mc.cores = 1, verbose = FALSE)

\donttest{
(cM.df <- conv_df(M[,-(1:2)], 0.1, mc.cores = 1))
(cM.df2 <- conv_df(M[,-(1:2)], 0.1, drop.x = FALSE, mc.cores = 1))

dim(M)
dim(cM.df)
dim(cM.df2)
(cM.list <- conv_df(M[,-(1:2)], 0.1, to.data.frame = FALSE, mc.cores = 1))
}
}
\seealso{
\code{conv}, \code{conv_mc}
}
