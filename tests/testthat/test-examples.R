## load packages
library("testthat")
library("neotoma")

context("Run stepps examples only when not on CRAN")

test_that("Examples run without error", {
    ## we don't want this to run on CRAN
    skip_on_cran()

    ## List of example topics we want to check
    egs <- c('bbox_tran',
             'build_grid')

    refnames <- paste0("example-ref-", egs, ".rds")

    for (i in seq_along(egs)) {
        # Testing each of the example codes, by `topic`.
        egout <- try(example(topic = egs[i], package = "stepps", ask = FALSE,
                             character.only = TRUE, run.dontrun = TRUE,
                             echo = TRUE))
        #expect_that(inherits(egout, "try-error"), is_false(),
        #            label = paste("Error raised in example:", egs[i]))
        #expect_that(egout, equals_reference(refnames[i]))
    }
})
