#' Gridded Public Land Survey Vegetation Composition
#'
#' @title plss_vegetation
#' @docType data
#' @author Simon Goring
#' @description A gridded vegetation dataset based on original Public Land Survey notes from the 1800s and early 1900s.
#' @format A \code{data.frame} with 8013 rows and 25 columns.
#' \describe{
#'   \item{x}{Easting/Westing coordinates in the Albers-Great Lakes/St Lawrence projection (epsg:3175)}
#'   \item{y}{Northing/Southing coordinates in the Albers-Great Lakes/St Lawrence projection (epsg:3175)}
#'   \item{region}{Source for the vegetation data, based on geographic location.}
#'   \item{water}{Percentage of the cell containing water.}
#'   \item{taxon columns}{Proportion of a tree taxon within a cell based on a spatial model published in Paciorek et al., 2016}
#'}
#'
#' @references {
#'   Goring SJ, Williams JW, Mladenoff DJ, Cogbill CV, Record S, Paciorek CJ, Jackson ST, Dietze MC, Matthes JH, McLachlan JS. 2016. Novel and Lost Forests in the Upper Midwestern United States, from New Estimates of Settlement-Era Composition, Stem Density, and Biomass. PLoS One. 11: e0151935.
#'
#'   Paciorek C, Goring SJ, Thurman A, Cogbill C, Williams J, Mladenoff D, Peters JA, Zhu J, McLachlan JS. 2016. Statistically-estimated tree composition for the northeastern United States at Euro-American settlement. PLoS ONE. 11: e0150087.
#'
#'   Dawson A, Paciorek C, McLachlan J, Goring S, Williams JW, Jackson S. 2016. Quantifying pollen-vegetation relationships to reconstruct ancient forests using 19th-century forest composition and pollen data. Quaternary Science Reviews. 137:156-175.
#' }

"plss_vegetation"
