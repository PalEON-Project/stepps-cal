# stepps - Pollen based spatio-temporal paleo-vegetation reconstruction.

[![Travis build status](https://travis-ci.org/PalEON-Project/stepps-cal.svg?branch=master)](https://travis-ci.org/PalEON-Project/stepps-cal) [![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

`stepps` is an R package to undertake the calibration and reconstruction of the Bayesian pollen-based vegetation reconstruction method presented in [Dawson *et al* (2016)](https://doi.org/10.1016/j.quascirev.2016.01.012).

This package is in development and is likely to undergo rapid, and, potentially back-incompatible revisions in the near future.  Be aware & be cautious when using from GitHub.

# Contributions

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md).  By participating in this project you agree to abide by its terms.

## GitHub Management

Best working practice for contributing to this package is as follows:

1. Fork the repository to your own account
2. Changes to existing files should be done *in those files*.  New files may be added, but do not duplicate existing functions.  Commit often.  If you are working on a fork, be sure to try syncing with the original branch:

```
$ git fetch upstream
```

More information about fetching the upstream branch and then merging with your local files can be found in the [GitHub help for managing forks](https://help.github.com/articles/syncing-a-fork/).  This then brings your local `master` branch up to date with any changes you've made, and preserves your changes as part of the `git` workflow.

3. Now you can push to your GitHub account (`git push`) and initiate a pull request from your fork. This is documented on the GitHub Help for [Creating a pull request from a fork](https://help.github.com/articles/creating-a-pull-request-from-a-fork/).


# Installation

You can install stepps from github with:

``` r
# install.packages("devtools")
devtools::install_github("PalEON-Project/stepps-cal")
```
