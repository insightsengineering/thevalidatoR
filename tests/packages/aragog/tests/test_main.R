library(aragog)
library(testthat)

check_spider <- function() {
  stopifnot(identical(aragog(), "Aragog"))
}

test_that("The spider's name is Aragog", {
  check_spider()
})
