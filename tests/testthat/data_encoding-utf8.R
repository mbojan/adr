suppressPackageStartupMessages({
  library(dplyr)
})

r <- Warszawa %>%
  filter( Dzielnica == "Białołęka" ) %>%
  select(mężczyźni)

stopifnot( nrow(r) == 1 && ncol(r) == 1)
