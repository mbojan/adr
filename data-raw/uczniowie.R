# Dwie ramki danych o uczniach

library(isnar)
library(tidyverse)

# Edgelista o lubieniu się

l <- igraph::as_data_frame(IBE121, what="both")


uczniowie_relacje <-
l$edges %>%
  select(from, to, type=question)


uczniowie_atrybuty <-
l$vertices %>%
  select(-wraven)



save(uczniowie_relacje, uczniowie_atrybuty, file="../data/uczniowie.rda")
