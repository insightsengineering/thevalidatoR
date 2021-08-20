library(buckbeak)
library(testthat)

check_hippogriff <- function() {
  stopifnot(identical(buckbeak(), "Buckbeak"))
}

check_hagrids_pets <- function() {
  stopifnot(identical(hagrids_pets(), "Buckbeak and Aragog"))
}

test_that("The hippogriff's name is Buckbeak", {
  check_name()
})

test_that("Hagrid's pets' names are Buckbeak and Aragog", {
  check_hagrids_pets()
})
