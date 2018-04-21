#' Generate tables
#'
#' @description This function is used to help support the generation of the taxon
#' translation tables, by exporting a \code{download} or \code{download_list} file's
#' taxon table.
#' @param taxa A table containing taxa, either from a `download`, a `download_list` or
#' @param output A string representing the file path for export.  Can be NULL.
#'
#' @return A \code{data.frame} with two columns: \describe{
#'   \item{target}{The original pollen taxon to be translated}
#'   \item{match}{The simplified taxon to be used in calibration}
#' }
#'
#' @importFrom neotoma taxa
#' @importFrom assertthat assert_that
#' @importFrom utils write.csv
#' @export
#'
#' @examples {
#' data(downloads)
#'
#' # For the sake of package checks we'll use a temporary file.
#'
#' generate_tables(downloads, output = tempfile())
#' }
#'

generate_tables <- function(taxa, output = NULL) {

  if (!any(c('download', 'download_list') %in% class(taxa))) {
    assertthat::assert_that('data.frame' %in% class(taxa),
                            msg = "taxa must be a neotoma download object or a data.frame.")

    taxon <- data.frame(target = colnames(taxa), match = NA, stringsAsFactors = FALSE)

  } else {

    taxon <- data.frame(suppressWarnings(neotoma::taxa(taxa)),
                        match = NA,
                        stringsAsFactors = FALSE)
    colnames(taxon)[1] <- 'target'
  }

  if (is.null(output)) {
    return(taxon)
  } else {
    utils::write.csv(taxon, output, row.names = FALSE)
  }
}
