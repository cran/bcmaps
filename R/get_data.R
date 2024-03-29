# Copyright 2017 Province of British Columbia
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.

#' Get a B.C. spatial layer
#'
#'
#' @param layer the name of the layer. The list of available layers can be
#' obtained by running `available_layers()`
#'
#' @inheritParams bc_bound_hres
#'
#' @return the layer requested
#' @export
#'
#' @examples
#' \dontrun{
#'  get_layer("bc_bound_hres")
#' }
get_layer <- function(layer, ask = interactive(), force = FALSE) {

  available <- available_layers()

  available_row <- available[available[["layer_name"]] == layer, ]

  if (nrow(available_row) != 1L && layer != "test") {
    stop(layer, " is not an available layer")
  }

  get_catalogue_data(layer, ask = ask, force = force)
}

rename_sf_col_to_geometry <- function(x) {
  geom_col_name <- attr(x, "sf_column")
  if (geom_col_name == "geometry") return(x)

  names(x)[names(x) == geom_col_name] <- "geometry"
  attr(x, "sf_column") <- "geometry"
  x
}

#' List available data layers
#'
#' A data.frame of all available layers in the bcmaps package. This drawn
#' directly from the B.C. Data Catalogue and will therefore be the most current list
#' layers available.
#'
#' @return A `data.frame` of layers, with titles, and a `shortcut_function` column
#' denoting whether or not a shortcut function exists that can be used to return the
#' layer. If `TRUE`, the name of the shortcut function is the same as the `layer_name`.
#' A value of `FALSE` in this column means the layer is available via `get_data()` but
#' there is no shortcut function for it.
#'
#' A value of `FALSE` in the `local` column means that the layer is not stored in the
#' bcmaps package but will be downloaded from the internet and cached
#' on your hard drive.
#'
#' @examples
#' \dontrun{
#' available_layers()
#' }
#' @export
available_layers <- function() {
  layers_df
  names(layers_df)[1:2] <- c("layer_name", "title")
  structure(layers_df, class = c("avail_layers", "tbl_df", "tbl", "data.frame"))
}

#' @export
print.avail_layers <- function(x, ...) {
  print(structure(x, class = setdiff(class(x), "avail_layers")))
  cat("\n------------------------\n")
  cat("All layers are downloaded from the internet and cached\n")
  cat(paste0("on your hard drive at ", data_dir(),"."))
}

shortcut_layers <- function(){
  al <- available_layers()
  al <- al[al$using_shortcuts,]
  al <- al[!is.na(al$layer_name),]
  names(al)[1:2] <- c("layer_name", "title")
  #structure(al, class = c("avail_layers", "tbl_df", "tbl", "data.frame"))
  al
}

shortcut_layer_names <- function() {
  shortcut_layers()[["layer_name"]]
}

get_catalogue_data <- function(what, release = "latest", force = FALSE, ask = TRUE) {
  fname <- paste0(what, ".rds")
  dir <- data_dir()
  fpath <- file.path(dir, fname)
  layers_df <- shortcut_layers()

  if (!file.exists(fpath) | force) {
    check_write_to_data_dir(dir, ask)
    recordid <- layers_df$record[layers_df$layer_name == what]
    resourceid <- layers_df$resource[layers_df$layer_name == what]
    ret <- bcdata::bcdc_get_data(recordid, resourceid)
    class(ret) <- setdiff(class(ret), 'bcdc_sf')
    ret <- sf::st_make_valid(ret)
    ret <- sf::st_transform(ret, 'EPSG:3005')
    saveRDS(ret, fpath)
  } else {
    ret <- readRDS(fpath)
    time <- attributes(ret)$time_downloaded
    update_message_once(paste0(what, ' was updated on ', format(time, "%Y-%m-%d")))
  }

  ret
}
