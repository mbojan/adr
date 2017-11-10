Warszawa %>%
  dplyr::transmute(
    Dzielnica,
    "% kobiet" = kobiety / (kobiety + mê¿czyŸni) * 100
  )
