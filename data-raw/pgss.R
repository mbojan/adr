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
