#' @title Get calibration pollen samples by time.
#' @import dplyr
#' @description With a given set of bounding dates, extract a calibration dataset from a `download` or `download_list` object frmo `neotoma`.
#' @param x A \code{download} or \code{download_list} object.
#' @param calib_range The age ranges to extract.
#' @param aggregate If \code{TRUE} then the function will aggregate by site using the time bins defined.
#' @param bins A sequence of
#' @return a \code{data.frame}
#' @export
#'
pull_timebins <- function(x, calib_range = c(200,1000), aggregate = FALSE, bins = NULL){

  age <- NULL # Used to avoid errors in the dplyr piping below.

  assertthat::assert_that('download_list' %in% class(x),
                          msg = "`pull_timebins()` requires a download_list object to operate.")

  if (calib_range[1] > calib_range[2]) {
    calib_range <- calib_range[2:1]
    warning('Time bins were reversed so that the earliest age is listed first.')
  }

  full_dl <- neotoma::compile_downloads(x) %>%
    filter((age > calib_range[1] & age < calib_range[2]))

  full_dl[is.na(full_dl)] <- 0

  full_dl <- full_dl[,c(rep(TRUE, 10),
                        colSums(full_dl[,11:ncol(full_dl)], na.rm = TRUE) > 0)]

  if(aggregate == TRUE & is.null(bins)) {

      full_dl$age.old <- calib_range[2]
    full_dl$age.young <- calib_range[1]
          full_dl$age <- NA
        full_dl$depth <- NA

    sum_cols <- colnames(full_dl)[!colnames(full_dl) %in% colnames(full_dl)[1:10]]
    nsm_cols <- colnames(full_dl)[ colnames(full_dl) %in% colnames(full_dl)[1:10]]

    full_dl <- full_dl %>%
      group_by_at(vars(one_of(nsm_cols))) %>%
      summarise_at(vars(one_of(sum_cols)),
                   .funs = sum, na.rm = TRUE)
  }

  return(full_dl)

}
