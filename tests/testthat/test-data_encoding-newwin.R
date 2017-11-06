context("Yet another test file for data encoding")

test_that("it works", {
  data("Warszawa")
  library(dplyr)

  Warszawa %>%
    mutate(
      dupa = kobiety / mężczyźni
    )
})
