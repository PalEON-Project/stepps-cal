#' Create the raster grid for the analysis.
#'
#' @importFrom raster raster
#' @param veg_box The bounding box for the vegetation data, as a vector with elements \code{c(W,S,N,E)}.
#' @param resolution The grid resolution for the output raster, in the native output projection.
#' @param proj A projection string using \code{proj4} standards.  Default is Gt. Lakes & St. Lawrence Albers: \code{'+init=epsg:3175'}.
#'
#' @importFrom raster raster
#' @return A raster, returned from the \code{raster} package.
#' @export
#'
#' @examples
build_grid <- function(veg_box, resolution = 8000, proj = '+init=epsg:3175') {
  raster::raster(xmn = veg_box[1],
                 xmx = veg_box[3],
                 ymn = veg_box[2],
                 ymx = veg_box[4],
                 resolution = resolution,
                 crs = proj)
}
