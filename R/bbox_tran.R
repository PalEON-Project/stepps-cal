#' @title Generate bounding box for Neotoma
#' @description From a vegetation matrix with \code{x} and \code{y} columns (or \code{lat}/\code{long}), generate a bounding box to be used for the \code{loc} parameter in the \code{neotoma} function \code{get_dataset()}.
#' @param x A \code{data.frame} or \code{matrix} with the vegetation data and its coordinates.
#' @param formula The formula, as a string
#' @param from The proj4 string.
#' @export

bbox_tran <- function(x, coord_formula = '~ x + y', from, to) {

  sp::coordinates(x) <- formula(coord_formula)
  sp::proj4string(x) <- sp::CRS(from)
  bbox <- as.vector(sp::bbox(sp::spTransform(x, CRSobj = sp::CRS(to))))
  return(bbox)
}
