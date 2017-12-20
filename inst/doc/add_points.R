## ----options, include=FALSE----------------------------------------------
knitr::opts_chunk$set(eval = requireNamespace("bcmaps.rdata", quietly = TRUE),
                      fig.width = 7, fig.height = 7)

## ----message=FALSE-------------------------------------------------------
library(sf)
library(bcmaps)

## ------------------------------------------------------------------------
set.seed(42)
spp <- data.frame(site_num = LETTERS[1:10], spp_present = sample(c("yes", "no"), 10, replace = TRUE),
                 lat = runif(10, 49, 60), long = runif(10, -128, -120), 
                 stringsAsFactors = FALSE)
head(spp)

## ----warning=FALSE-------------------------------------------------------
spp <- st_as_sf(spp, coords = c("long", "lat"))
summary(spp)
plot(spp["spp_present"])

## ----warning=FALSE-------------------------------------------------------
spp <- st_set_crs(spp, 4326)

## ----collapse=TRUE-------------------------------------------------------
bc_bound <- get_layer("bc_bound")
st_crs(bc_bound)
st_crs(spp)

## ------------------------------------------------------------------------
spp <- transform_bc_albers(spp)

## ----fig.height=4, fig.width=6, warning=FALSE----------------------------
plot(spp["spp_present"], expandBB = rep(0.2, 4), graticule = TRUE)
plot(st_geometry(bc_bound), add = TRUE)

## ------------------------------------------------------------------------
ecoreg <- ecoregions()
st_join(spp, ecoreg["ECOREGION_NAME"])

