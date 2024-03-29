% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/defunct.R
\name{self_union}
\alias{self_union}
\title{Union a SpatialPolygons* object with itself to remove overlaps, while retaining attributes}
\usage{
self_union(x)
}
\arguments{
\item{x}{A \code{SpatialPolygons} or \code{SpatialPolygonsDataFrame} object}
}
\value{
A \code{SpatialPolygons} or \code{SpatialPolygonsDataFrame} object
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#defunct}{\figure{lifecycle-defunct.svg}{options: alt='[Defunct]'}}}{\strong{[Defunct]}}

This function is defunct as of bcmaps 2.0.0.
Use \code{raster::union()} for \code{SpatialPolygonsDataFrame}s, or
\code{sf::st_union()} with \code{sf} objects instead.
}
\keyword{internal}
