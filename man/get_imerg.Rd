% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_imerg.R
\name{get_imerg}
\alias{get_imerg}
\alias{get_imerg.default}
\alias{get_imerg.sf}
\alias{get_imerg.geojson}
\title{Get Integrated Multisatellite Retrievals for GPM (IMERG) data}
\usage{
get_imerg(object, dates, operation = 5, ...)

\method{get_imerg}{default}(object, dates, operation = 5, ...)

\method{get_imerg}{sf}(object, dates, operation = 5, as.sf = FALSE, ...)

\method{get_imerg}{geojson}(object, dates, operation = 5, as.geojson = FALSE, ...)
}
\arguments{
\item{object}{input, an object of class \code{\link[base]{data.frame}} (or
any other object that can be coerced to data.frame), \code{\link[terra]{SpatVector}}, 
\code{\link[terra]{SpatRaster}}, \code{\link[sf]{sf}} or \code{geojson}}

\item{dates}{a character of start and end dates in that order in the format
"YYYY-MM-DD"}

\item{operation}{optional, an integer that represents which type of
statistical operation to perform on the dataset}

\item{...}{additional arguments passed to \code{\link[terra]{terra}} 
or \code{\link[sf]{sf}} methods
See details}

\item{as.sf}{logical, returns an object of class \code{\link[sf]{sf}}}

\item{as.geojson}{logical, returns an object of class \code{geojson}}
}
\value{
A data frame of \acronym{imerg} data:
\item{id}{the index for the rows in \code{object}}
\item{dates}{the dates from which imerg was requested}
\item{lon}{the longitude as provided in \code{object}}
\item{lat}{the latitude as provided in \code{object}}
\item{imerg}{the IMERG value}
}
\description{
The IMERG dataset provides near-real time global observations of 
 rainfall at 10km resolution, which can be used to estimate total
 rainfall accumulation from storm systems and quantify the intensity 
 of rainfall and flood impacts from tropical cyclones and other storm 
 systems. IMERG is a daily precipitation dataset available from 2015 
 to present within the latitudes 70 and -70.
}
\details{
\bold{operation}: supported operations are:  
 \tabular{rll}{
 \bold{operation}      \tab    \tab \bold{value}\cr
 max                   \tab =  \tab 0\cr
 min                   \tab =  \tab 1\cr
 median                \tab =  \tab 2\cr
 sum                   \tab =  \tab 4\cr
 average               \tab =  \tab 5 (\emph{default value})\cr
 }

\bold{dist}: numeric, buffer distance for each \code{object} coordinate

\bold{nQuadSegs}: integer, number of segments per buffer quadrant
}
\examples{
\dontshow{if (interactive()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
lonlat <- data.frame(lon = c(-55.0281,-54.9857),
                     lat = c(-2.8094, -2.8756))

dates <- c("2017-12-15", "2017-12-31")

dt <- get_imerg(lonlat, dates)

dt
\dontshow{\}) # examplesIf}
}
