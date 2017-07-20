#' Preparing output for the STAN run of the STEPPS Model
#'
#' @param veg
#' @param pollen
#' @param target_taxa
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
##'
##' @importFrom sp spTransform
##' @export
##'
##' @examples
prep_input <- function(veg, pollen, target_taxa, grid, hood) {

  if(!class(veg) == 'SpatialPointsDataFrame') {
    stop('veg data must be a SpatialPointsDataFrame, use `to_stepps_shape()`')
  }

  if(!class(pollen) == 'SpatialPointsDataFrame') {
    stop('veg data must be a SpatialPointsDataFrame, use `to_stepps_shape()`')
  }

  veg    <- sp::spTransform(veg,    CRSobj = CRS(proj4string(grid)))
  pollen <- sp::spTransform(pollen, CRSobj = CRS(proj4string(grid)))

  col_test <- all(na.omit(target_taxa) %in% names(veg)) &
    all(target_taxa %in% names(pollen))

  assertthat::assert_that(col_test,
                          msg = 'All defined taxa must be in both the pollen and vegetation data.')

  output_list <- list(K       = ncol(veg),
                      N_cores = nrow(pollen),
                      N_cells = nrow(veg),
                      y       = analogue::tran(pollen@data[,target_taxa], 'proportion'),
                      r       = analogue::tran(pollen@data[,target_taxa], 'proportion'))

  num_grid <- setValues(grid, 1:ncell(grid))
  output_list$idx_cores <- extract(num_grid, pollen)

  # * idx_hood - The indices of cells for each contributing neighborhood
  output_list$d        <- pointDistance(pollen, veg)
  output_list$idx_hood <- output_list$d < hood
  # * N_pot - Number of potential contributing cells
  # * d_pot - The actual contributing cells for each pollen sample

  return(output_list)
}
