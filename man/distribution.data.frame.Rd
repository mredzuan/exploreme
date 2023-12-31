% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/distribution.R
\name{distribution.data.frame}
\alias{distribution.data.frame}
\title{Method's function to generate distribution or quantiles values for numeric vector}
\usage{
\method{distribution}{data.frame}(x, remove_na = TRUE, probs = c(0, 0.25, 0.5, 0.75, 1), ...)
}
\arguments{
\item{x}{data.frame object}

\item{remove_na}{A logical evaluating to TRUE or FALSE indicating whether NA values should be stripped before the computation proceeds.}

\item{probs}{numeric vector of probabilities with values in value from 0 to 1 (e.g: default c(0, 0.25, 0.5, 0.75, 1))}

\item{...}{Ignored}
}
\value{
A list of statistical distribution which include min, max, and quantile values of numeric values from data.frame
}
\description{
Method's function to generate distribution or quantiles values for numeric vector
}
\seealso{
\code{\link[=distribution]{distribution()}}
}
