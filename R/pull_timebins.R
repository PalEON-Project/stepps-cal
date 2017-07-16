#' @title Get calibration pollen samples by time.
#' @import dplyr
#' @description With a given set of bounding dates, extract a calibration dataset from a `download` or `download_list` object frmo `neotoma`.
#' @param x A \code{download} or \code{download_list} object.
#' @param calib_range The age ranges to extract.
#' @return a \code{data.frame}
#' @export
#'
pull_timebins <- function(x, calib_range = c(200,400)){

  if (calib_range[1] > calib_range[2]) {
    calib_range <- calib_range[2:1]
  }

  full_dl <- neotoma::compile_downloads(x) %>%
    filter(age > calib_range[1] & age < calib_range[2])

  full_dl[is.na(full_dl)] <- 0

  full_dl <- full_dl[,c(rep(TRUE, 10), colSums(full_dl[,11:ncol(full_dl)], na.rm = TRUE) > 0)]

  return(full_dl)

}
