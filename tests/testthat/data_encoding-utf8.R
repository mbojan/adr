Warszawa %>%
  dplyr::transmute(
    Dzielnica,
    "% kobiet" = kobiety / (kobiety + mężczyźni) * 100
  )
