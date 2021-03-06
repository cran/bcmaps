% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get-non-catalogue-data.R
\name{fsa}
\alias{fsa}
\title{British Columbia Forward Sortation Areas}
\source{
http://www12.statcan.gc.ca/census-recensement/2011/geo/bound-limit/files-fichiers/2016/lfsa000b16a_e.zip
}
\usage{
fsa(class = "sf", ask = interactive(), force = FALSE)
}
\arguments{
\item{class}{what class you want the object in? \code{"sf"} (default) or \code{"sp"}.}

\item{ask}{Should the function ask the user before downloading the data to a cache? Defaults to the value of interactive().}

\item{force}{Should you force download the data?}
}
\description{
British Columbia Forward Sortation Areas
}
\examples{
\dontrun{
my_layer <- fsa()
my_layer_sp <- fsa(class = 'sp')
}
}
