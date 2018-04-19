#' @title Generate bounding box for Neotoma
#' @description From a vegetation matrix with \code{x} and \code{y} columns (or \code{lat}/\code{long}), generate a bounding box to be used for the \code{loc} parameter in the \code{neotoma} function \code{get_dataset()}.
#' @param x A \code{data.frame} or \code{matrix} with the vegetation data and its coordinates.
#' @param coord_formula The formula, as a string
#' @param from The object \code{proj4} string (e.g., \code{+init=epsg:4121 +proj=longlat +ellps=GRS80}).
#' @param to The target \code{proj4} projection string (e.g., \code{+init=epsg:3175}).
#'
#' @return A \code{numeric} vector, of length 4.
#'
#' @importFrom stats formula
#' @examples{
#'   data(plss_vegetation)
#'
#'   pol_box <- bbox_tran(plss_vegetation, '~ x + y',
#'     '+init=epsg:3175',
#'     '+init=epsg:4326')
#' }
#' @export

bbox_tran <- function(x, coord_formula = '~ x + y', from, to) {

  sp::coordinates(x) <- stats::formula(coord_formula)
  sp::proj4string(x) <- sp::CRS(from)
  bbox <- as.vector(sp::bbox(sp::spTransform(x, CRSobj = sp::CRS(to))))

  return(bbox)
}
