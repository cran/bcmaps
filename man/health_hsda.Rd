% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shortcuts.R
\name{health_hsda}
\alias{health_hsda}
\title{Health Service Delivery Area Boundaries}
\source{
\code{bcdata::bcdc_get_data(record = '71c930b9-563a-46da-a10f-ead49ccbc390', resource = 'c5dad467-229b-4378-852b-ff92479a65b6')}
}
\usage{
health_hsda(ask = interactive(), force = FALSE)
}
\arguments{
\item{ask}{Should the function ask the user before downloading the data to a cache? Defaults to the value of interactive().}

\item{force}{Should you force download the data?}
}
\value{
The spatial layer of \code{health_hsda} as an \code{sf} object.
}
\description{
Health Service Delivery Area Boundaries
}
\examples{
\dontrun{
my_layer <- health_hsda()
}

}
\seealso{
Other BC layers: 
\code{\link{airzones}()},
\code{\link{bc_bound_hres}()},
\code{\link{bc_bound}()},
\code{\link{bc_cities}()},
\code{\link{bec}()},
\code{\link{census_dissemination_area}()},
\code{\link{census_division}()},
\code{\link{census_economic}()},
\code{\link{census_metropolitan_area}()},
\code{\link{census_subdivision}()},
\code{\link{census_tract}()},
\code{\link{ecoprovinces}()},
\code{\link{ecoregions}()},
\code{\link{ecosections}()},
\code{\link{fsa}()},
\code{\link{gw_aquifers}()},
\code{\link{health_chsa}()},
\code{\link{health_ha}()},
\code{\link{health_lha}()},
\code{\link{hydrozones}()},
\code{\link{mapsheets_250K}()},
\code{\link{mapsheets_50K}()},
\code{\link{municipalities}()},
\code{\link{nr_areas}()},
\code{\link{nr_districts}()},
\code{\link{nr_regions}()},
\code{\link{regional_districts}()},
\code{\link{tsa}()},
\code{\link{water_districts}()},
\code{\link{water_precincts}()},
\code{\link{watercourses_15M}()},
\code{\link{watercourses_5M}()},
\code{\link{wsc_drainages}()}
}
\concept{BC layers}
