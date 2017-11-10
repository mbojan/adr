context("Testing data encoding issues")

test_that("UTF-8 tests run without errors", {
  expect_silent(
    source("data_encoding-utf8.R", encoding="UTF-8")
  )
})

test_that("CP1250 tests run without errors", {
  expect_silent(
    source("data_encoding-cp1250.R", encoding="CP1250")
  )
})



test_that("CP1250 tests run on Windows with polish locale", {
  skip_on_os("linux")
  expect_silent({
    loc <- Sys.getlocale()
    Sys.setlocale("Polish_Poland.CP1250")
    source("data_encoding-cp1250.R")
    suppressMessages(Sys.setlocale(loc))
  })
})
