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

bcmaps_env <- new.env(parent = emptyenv())

.onLoad <- function(...) {
  assign("bcmaps_update_message", FALSE, envir = bcmaps_env)
}


bcmapsStartupMessage <- function() {
  "Support for Spatial objects (`sp`) was removed in {bcmaps} v2.0.0. Please use `sf` objects with {bcmaps}."
}

.onAttach <- function(lib, pkg)
{
  # startup message
  msg <- bcmapsStartupMessage()
  packageStartupMessage(msg)
  invisible()
}
