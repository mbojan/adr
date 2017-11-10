context("Testing data encoding issues")

test_that("UTF-8 tests run without errors", {
  expect_silent(
    source("data_encoding-utf8.R", encoding="UTF-8")
  )
})
