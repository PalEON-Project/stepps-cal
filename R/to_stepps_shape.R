#' Convert object to shape.
#'
#' @param x The data.frame to convert to a SpatialPointsDataFrame object
#' @param coord_fun The coordinate columns, as a string formula
#' @param proj The data ection in `proj` format.
#'
#' @return A \code{SpatialPointsDataFrame}.
#' @importFrom sp coordinates proj4string CRS
#' @export
#'
#' @examples \dontrun{
#' veg_mean <- readr::read_csv('data/composition_v0.3.csv')
#' veg_table <- readr::read_csv('data/veg_trans_edited.csv')
#' veg_trans <- translate_taxa(veg_mean, veg_table ,id_cols = colnames(veg_mean)[1:4])
#' veg_table <- to_stepps_shape(veg_trans,
#'                              '~ x + y',
#'                              '+init=epsg:3175')
#' }
to_stepps_shape <- function(x, coord_fun, proj) {
  sp::coordinates(x) <- formula(coord_fun)
  sp::proj4string(x) <- sp::CRS(proj)
  return(x)
}
