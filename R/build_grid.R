#' Create the raster grid for the analysis.
#'
#' @importFrom raster raster
#' @param veg_box
#' @param resolution
#' @param proj
#'
#' @return
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
