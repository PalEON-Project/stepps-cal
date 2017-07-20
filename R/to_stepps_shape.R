#' Convert object to shape.
#'
#' @param x
#' @param coord_fun
#' @param proj
#'
#' @return
#' @export
#'
#' @examples
to_stepps_shape <- function(x, coord_fun, proj) {
  coordinates(x) <- formula(coord_fun)
  proj4string(x) <- CRS(proj)
  return(x)
}
