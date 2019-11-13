library(dplyr)

florida <- read.table("florida.txt", header=TRUE, as.is=TRUE) %>%
  tibble::as_tibble()

usethis::use_data(florida)
