#' Title
#'
#' @param veg
#' @param pollen
#'
##' @return A list with parameters:
##'  * K  - Number of taxa
##'  * N_cores - Number of cores
##'  * N_cells - Number of cells in the veg data
##'  * N_hood - Number of veg cells contributing to each pollen sample site
##'  * y - Pollen counts (*n* cores x *p* taxa - a wide table)
##'  * r - Veg proportions (same structure)
##'  * idx_cores - The index of the veg cell for each core
##'  * idx_hood - The indices of cells for each contributing neighborhood
##'  * d - distance matrix (spatial distance from cores to veg cells)
##'  * N_pot - Number of potential contributing cells
##'  * d_pot - The actual contributing cells for each pollen sample
##' @md
##' @export
##'
##' @examples
prep_input <- function(veg, pollen, target_taxa) {

  col_test <- all(na.omit(target_taxa) %in% colnames(veg)) &
    all(target_taxa %in% colnames(pollen))

  assertthat::assert_that(col_test,
                          msg = 'All defined taxa must be in both the pollen and vegetation data.')

  output_list <- list(K       = ncol(veg),
                      N_cores = length(unique(pollen$site.name)),
                      N_cells = nrow(veg),
                      y       = analogue::tran(pollen[,target_taxa], 'proportion'),
                      r       = analogue::tran(pollen[,target_taxa], 'proportion'))

  # * idx_cores - The index of the veg cell for each core
  # * idx_hood - The indices of cells for each contributing neighborhood
  # * d - distance matrix (spatial distance from cores to veg cells)
  # * N_pot - Number of potential contributing cells
  # * d_pot - The actual contributing cells for each pollen sample

  return(output_list)
}
