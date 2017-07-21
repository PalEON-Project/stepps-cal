#' Convert object to shape.
#'
#' @param x The data.frame to convert to a SpatialPointsDataFrame object
#' @param coord_fun The coordinate columns, as a string formula
#' @param proj The data ection in `proj` format.
#'
#' @return
#' @importFrom sp coordinates proj4string CRS
#' @export
#'
#' @examples
to_stepps_shape <- function(x, coord_fun, proj) {
  sp::coordinates(x) <- formula(coord_fun)
  sp::proj4string(x) <- sp::CRS(proj)
  return(x)
}
