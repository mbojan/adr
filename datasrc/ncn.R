library(XLConnect)
library(tidyverse)

ncn <-
loadWorkbook("zestawienie-grantobiorcy-2013-2015.xlsx") %>%
  readWorksheet(1) %>%
  mutate(
    grupa = mbtools::carryover(ifelse(is.na(Nazwa.jednostki.głównej), GWO, NA)),
    Pracownicy.naukowi..wg.danych.dla.2015.r.. = as.numeric(recode::recode(Pracownicy.naukowi..wg.danych.dla.2015.r.., "BRAK DANYCH", NA)),
    Przyznana.kwota..Pracowanicy.naukowi.2013.2015 = as.numeric(gsub("[^0-9]", "", Przyznana.kwota..Pracowanicy.naukowi.2013.2015))
  ) %>%
  filter(!is.na(Nazwa.jednostki.głównej)) %>%
  select(
    - Wnioski.złożone..2013.2015,
    - Pozyskane.granty..2013.2015,
    - Współczynnik.sukcesu.2013.2015,
    - Przyznana.kwota.2013.2015,
    - Przyznana.kwota..Pracowanicy.naukowi.2013.2015
  ) %>%
  gather(variable, value,
         -GWO, -Kategoria.naukowa..dane.dla.2015.r..,
         -Nazwa.jednostki.uczelnianej, -Nazwa.jednostki.głównej,
         - Źródło.danych..pracownicy.naukowi.,
         - grupa
  ) %>%
  mutate(
    kategoria_naukowa_2015 = ifelse(Kategoria.naukowa..dane.dla.2015.r.. == "BRAK DANYCH", NA, Kategoria.naukowa..dane.dla.2015.r..)
  ) %>%
  select(
    -Kategoria.naukowa..dane.dla.2015.r..
  ) %>%
rename(
    jednostka_glowna = Nazwa.jednostki.głównej,
    jednostka_uczelniana = Nazwa.jednostki.uczelnianej,
    zrodlo_danych = Źródło.danych..pracownicy.naukowi.
  ) %>%
  mutate(
      v = recode::recode(
        gsub("[0-9.r]", "", variable),
        "Pacownicynaukowiwgdanychdla", "liczba_pracownikow",
        "Pozyskaneganty", "wnioski_finansowane",
        "Pzyznanakwota", "kwota",
        "Wnioskizłożone", "wnioski_zlozone",
        "Wnioskizłożonew", "wnioski_zlozone"
      )
  ) %>%
  extract(
    variable,
    "rok",
    "([0-9]{4})",
    convert=TRUE,
    remove=TRUE
  ) %>%
  spread(v, value) %>%
  mutate(
    GWO = ifelse(GWO == "BRAK DANYCH", NA, GWO),
    GWO_grupa = substr(GWO, 1, 2),
    GWO_typ_jednostki = substr(GWO, 3, 3),
    GWO_dziedzina = substr(GWO, 4, 6)
  )


save(ncn, file="../data/ncn.rda")
