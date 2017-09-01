context("transformation")

x <- 1:5
log_x <- log(x)
exp_x <- exp(x)

test_that("adding classes", {
  expect_equal(class(log_x), c("numeric", "loged"))
  expect_equal(class(exp_x), c("numeric", "exped"))
})

test_that("removing classes", {
  log_log_x <- log(log_x)
  log_x <- exp(log_log_x)
  x <- exp(log_x)

  expect_equal(class(x), "numeric")
  expect_equal(class(log_x), c("numeric", "loged"))
})

test_that("warning transformation messages", {
  expect_warning(log(log_x), "loged")
  expect_warning(exp(exp_x), "exped")
})

test_that("warning expectation messages", {
  expect_error(expect_none(log_x), "unexpected")
  expect_error(expect_loged(x), "loged")
  expect_error(expect_exped(x), "exped")
})
