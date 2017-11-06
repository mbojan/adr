context("Testing data encoding issues using CP1250")


test_that("Mutating Warszawa", {
  data(Warszawa)
  expect_silent(
    Warszawa %>%
      dplyr::transmute(
        Dzielnica,
        "% kobiet" = kobiety / (kobiety + m??czy?ni) * 100
      )
  )
})
