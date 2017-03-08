#============================================================================ 
# Dane o dzielnicach Warszawy
#============================================================================ 

library(dplyr)
library(tidyr)
library(mbtools)
library(XLConnect)
source("funkcje.R")

# Dane o terenach dzielnic Warszawy z Banku Danych Lokalnych GUS
teren <- read.csv2("warszawa-teren.csv", stringsAsFactors=FALSE)
teren <- teren %>% mutate(teren = recode(Kierunki.wykorzystania.powierzchni, readxl("rekody.xls", "teren"))) %>%
  filter(Kod != 1465011, Kod != 1465998) %>%
  separate(Jednostka.terytorialna, c("Dzielnica", "xx"), " - ") %>%
  mutate( Strona_wisly = recode(Dzielnica, readxl("rekody.xls", "wisla")))
teren_flat <- teren %>% select(Kod, Dzielnica, Strona_wisly, teren, Wartość) %>%
  filter(!is.na(teren)) %>% spread(teren, Wartość)

ludnosc <- read.csv2("warszawa-ludnosc.csv", stringsAsFactors=FALSE)
ludnosc2014 <- ludnosc %>% filter(Lata == 2014, !(Kod %in% c(1465000, 1465011, 1465998))) %>% rename(ludnosc=Wartość) %>% spread(Płeć, ludnosc) %>% select(Kod, kobiety, mężczyźni)

gestosc <- read.csv2("warszawa-gestosc.csv", stringsAsFactors=FALSE)
gestosc2014 <- gestosc %>% filter(Lata == 2014, !(Kod %in% c(1465000, 1465011, 1465998))) %>% 
  rename(gestosc=Wartość) %>% select(Kod, gestosc)

# Połączenie danych
Warszawa <- teren_flat %>% left_join(ludnosc2014) %>% left_join(gestosc2014)

Encoding(Warszawa$Dzielnica) <- "UTF-8"

save(Warszawa, file="../data/Warszawa.rda")


#============================================================================ 
# Plik Excel

wb <- loadWorkbook("../inst/exdata/Warszawa.xlsx", create=TRUE)
createSheet(wb, "Warszawa")
writeWorksheet(wb, Warszawa, sheet="Warszawa")
saveWorkbook(wb)
