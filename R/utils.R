#' Evaluate and set new class.
#'
#' This function returns an evaluated \code{fnc(x)} expression.
#'
#' Passed function \code{fnc} is called on passed object \code{x} and the new
#' class based on passed \code{fnc}'s name is set for \code{x}.
#'
#' @param x Object that goes into \code{fnc} call.
#' @param fnc Function to call on object \code{x}.
#'
#' @noRd
#'
eval_and_set_class <- function(x, fnc) {
  classes <- paste0(c("exp", "log"), "ed")
  value <- fnc(x)
  fnc_call <- match.call()
  fnc_name <- fnc_call$fnc[3]
  new_class <- paste0(fnc_name, "ed")
  class(value) <- c(class(value), new_class)
  joined_classes <- class(value)

  if (new_class %in% class(x)) {
    warning(paste("The values were already", new_class), call. = FALSE)
  } else if (all(classes %in% joined_classes)) {
    exp_class <- which(joined_classes == classes[1])
    log_class <- which(joined_classes == classes[2])
    class(value) <- joined_classes[-c(exp_class[1], log_class[1])]
  }

  value
}

#' Expect certain object class.
#'
#' Returns an error or passed object.
#'
#' Passed object \code{x} is checked for \code{expected} class.
#'
#' @param x Object checked for \code{expected} class.
#' @param expected Charcter. Name of the \code{expected} class.
#'
#' @noRd
expect_class <- function(x, expected = c("none", "exped", "loged")) {
  expected <- match.arg(expected)

  switch(EXPR = expected,
         none = {
           if (any(c("exped", "loged") %in% class(x))) {
             stop("There is an unexpected class.", call. = FALSE)
           }

           x
         },
         exped = ,
         loged = {
           if (! expected %in% class(x)) {
             stop(paste("The expected class", expected, "is not present."),
                  call. = FALSE)
           }

           x
         }
  )
}
