library(aragog)

#' buckbeak
#'
#' Hagrid's hippogriff name
#' @author Insights Engineering <ie@example.com>
#' @title Get the hippogriff's name
#' @return string. The hippogriff's name
#' @export
buckbeak <- function() {
  return("Buckbeak")
}

#' hagrids_pets
#'
#' Hagrid's pets' names
#' @author Insights Engineering <ie@example.com>
#' @title Get Hagrid's pets' names
#' @return string. The spider and the hippogriff's name
#' @export
hagrids_pets <- function() {
  return(paste(c("Buckbeak", "and", aragog()), collapse = " "))
}
