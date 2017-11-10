suppressPackageStartupMessages({
  library(dplyr)
})

r <- Warszawa %>%
  filter( Dzielnica == "Bia³o³êka" ) %>%
  select(mê¿czyŸni)

stopifnot( nrow(r) == 1 && ncol(r) == 1)
