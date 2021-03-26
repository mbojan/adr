library(dplyr)
requireNamespace("haven")
requireNamespace("here")
requireNamespace("tidyr")
requireNamespace("labelled")
requireNamespace("tibble")
requireNamespace("writexl")

# PGSS subset -------------------------------------------------------------

pgss <- haven::read_sav(
  here::here("data-raw", "P0053SAV.sav"),
  col_select = c(
    "recordid", "pgssyear", "hompop", "weight", "voiev16",
    "region8", "size", "babies", "preteen", "teens", "adults",
    "q7a", "q7b", "q7c", "q7d", "q8",
    "q9age", "q18st", "q22isc9", "q22sei", "q22ops", "q32", "q33", "q34", "q41a",
    "q102a", "q102b", "q102c", "q102d", "q102e", "q102f", "q102g", "q104", "q105",
    "q106", "q107", "q135", "q131ed", "g5a", "g5b", "g5c", "g5d", "g5e", "g5f",
    "g5g", "g5h", "g5i", "g5j", "g5k", "in5a", "in5b", "in5c", "in5d", "in5e",
    "in5f", "in5g", "in5h", "in5i", "in5j", "in5k", "in5l", "in6a", "in6b", "in6c",
    "in6d", "in6e", "in6f", "in6g", "in6h", "in6i", "in6j", "in6k", "in6l"
  ),
  encoding = "CP1250"
)

usethis::use_data(pgss)



# Variable summary --------------------------------------------------------

# What measured when in PGSS

pgss.info <- pgss %>%
  mutate(across(- one_of("recordid", "pgssyear"), ~ !is.na(.))) %>%
  tidyr::pivot_longer(
    - one_of("recordid", "pgssyear"),
    names_to = "variable",
    values_to = "isna"
  ) %>%
  group_by(variable, pgssyear) %>%
  summarise( nna = sum(isna), .groups = "drop" ) %>%
  tidyr::pivot_wider(names_from = pgssyear, values_from = nna) %>%
  left_join(
    labelled::var_label(pgss) %>%
      unlist() %>%
      tibble::enframe(name = "variable", value = "label"),
    by = "variable"
  )

# CSV version (used in the vignette) to `exdata `
readr::write_csv(
  pgss.info,
  file = here::here("inst", "exdata", "pgss-info.csv")
)
