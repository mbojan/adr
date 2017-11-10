context("Testing data encoding issues using UTF-8")


test_that("Mutating Warszawa", {
  skip_on_appveyor()

  data(Warszawa)
  expect_silent(
    Warszawa %>%
      dplyr::transmute(
        Dzielnica,
        "% kobiet" = kobiety / (kobiety + mężczyźni) * 100
      )
  )
})
