library(testthat)
library(stepps)

context("Checking that the data objects are stored as expected.")

test_that("Vegetation data reflects the original context:", {
  data("plss_vegetation")
  data("downloads")
  expect_true(exists("plss_vegetation"), info = "PLSS vegetation is missing from the package.")
  expect_true(exists("downloads"), info = "Neotoma pollen data is not present.")
  expect_is(downloads, "download_list", info = "The neotoma pollen data is not in a download_list class")
  expect_equal(nrow(plss_vegetation), 8013)
  expect_equal(ncol(plss_vegetation), 25)
  rm(plss_vegetation)
  rm(downloads)
})

context("Checking that data for the vingette is present and available:")
test_that("Vignette data is as expected:", {
  expect_false(system.file("extdata", "dict-comp2stepps.csv", package="stepps") == "", "dict-comp2stepps.csv is missing")
  expect_false(system.file("extdata", "pollen.equiv.csv", package="stepps") == "", "pollen.equiv.csv is missing")
  expect_false(system.file("extdata", "pollen.equiv.stepps.csv", package="stepps") == "", "pollen.equiv.stepps.csv is missing")
  expect_false(system.file("extdata", "pol_trans.csv", package="stepps") == "", "pol_trans.csv is missing")
  expect_false(system.file("extdata", "pol_trans_edited.csv", package="stepps") == "", "pol_trans_edited.csv is missing")
  expect_false(system.file("extdata", "veg_trans.csv", package="stepps") == "", "veg_trans.csv is missing")
  expect_false(system.file("extdata", "veg_trans_edited.csv", package="stepps") == "", "veg_trans_edited.csv is missing")
  })
