% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/main.r
\name{getMD}
\alias{getMD}
\title{Get mapping table}
\usage{
getMD(data, qtid, key)
}
\arguments{
\item{data}{character}

\item{qtid}{character}

\item{key}{character}
}
\description{
Get mapping table
}
\examples{
\dontrun{
getMD(data='keyMap',qtid='000001.SZ,000001.SH',key=key)
getMD(data='keyMap',qtid=c('000001.SZ','000001.SH'),key=key)
}
}
\author{
Dan Zhang
}

