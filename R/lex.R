#' Exponentiate or logharitmize the value.
#'
#' \code{exp} and \code{log} returns exponentiated or logharitmized values.
#'
#' \code{exp} and \code{log} functions call the corresponding ones from base
#' package, but also they set new class to values so that they can be checked
#' later for they current state. This makes easier to track if the used values
#' are in their normal or transformated form.
#'
#' @param x Numeric.
#'
#' @examples
#' mini_iris <- iris[c(1, 51, 101), ]
#' mini_iris
#' mini_iris$Sepal.Length <- exp(mini_iris$Sepal.Length)
#' mini_iris$Petal.Width <- log(mini_iris$Petal.Width)
#' mini_iris
#' class(mini_iris$Sepal.Length)
#' class(mini_iris$Petal.Width)
#' mini_iris$Sepal.Length <- log(mini_iris$Sepal.Length)
#' mini_iris$Petal.Width <- exp(mini_iris$Petal.Width)
#' mini_iris
#' class(mini_iris$Sepal.Length)
#' class(mini_iris$Petal.Width)
#'
#' @export
#'
exp <- function(x) {
  eval_and_set_class(x, base::exp)
}

#' @rdname exp
#'
#' @export
#'
log <- function(x) {
  eval_and_set_class(x, base::log)
}

#' Expect certain object class.
#'
#' Returns an error or passed object.
#'
#' Passed object \code{x} is checked for expected class.
#'
#' @param x Object checked for \code{expected} class.
#'
#' @examples
#' mini_iris <- iris[c(1, 51, 101), ]
#' expect_none(mini_iris$Sepal.Length)
#' mini_iris$log_Sepal.Length <- exp(mini_iris$Sepal.Length)
#' expect_exped(mini_iris$log_Sepal.Length)
#' \dontrun{expect_loged(mini_iris$Sepal.Length)}
#'
#' @export
#'
expect_none <- function(x) {
  expect_class(x, "none")
}

#' @rdname expect_none
#'
#' @export
#'
expect_exped <- function(x) {
  expect_class(x, "exped")
}

#' @rdname expect_none
#'
#' @export
#'
expect_loged <- function(x) {
  expect_class(x, "loged")
}
