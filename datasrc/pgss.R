library(foreign)

pgss1999in <- read.table("pgss1999in.tab", header=TRUE, sep="\t", as.is=TRUE)
taxdata <- read.spss("tax_data.sav")
sexdata <- read.spss("sex_data.sav")
earnings <- read.spss("earnings_data.sav")
pgss1 <- read.csv2("pgss1.csv")

vnames <- c(names(pgss1999in), names(taxdata), names(sexdata), names(earnings), names(pgss1))
unames <- unique(vnames)


#============================================================================ 

library(memisc)

f <- spss.system.file("P0053SAV.sav")
f <- Iconv(f, from="CP1250", to="UTF-8")
has <- unames %in% names(f)

d <- subset(f, select=c(
recordid,
pgssyear,
hompop,
weight,
voiev16,
region8,
size,
babies,
preteen,
teens,
adults,
q7a,
q7b,
q7c,
q7d,
q8,
q9age,
q18st,
q22isc9,
q22sei,
q22ops,
q32,
q33,
q34,
q41a,
q102a,
q102b,
q102c,
q102d,
q102e,
q102f,
q102g,
q104,
q105,
q106,
q107,
q135,
q131ed,
g5a,
g5b,
g5c,
g5d,
g5e,
g5f,
g5g,
g5h,
g5i,
g5j,
g5k,
in5a,
in5b,
in5c,
in5d,
in5e,
in5f,
in5g,
in5h,
in5i,
in5j,
in5k,
in5l,
in6a,
in6b,
in6c,
in6d,
in6e,
in6f,
in6g,
in6h,
in6i,
in6j,
in6k,
in6l) )

m.ratio <- c("recordid", "pgssyear", "hompop", "weight", "size", "babies",
             "preteen", "teens", "adults", "q9age", "q32", "q34", "q135",
             paste0("in5", letters[1:12]),
             paste0("in6", letters[1:12]) )
m.interval <- c("q22sei", "q22ops")
for( v in m.ratio ) measurement(d[[v]]) <- "ratio"
for( v in m.interval ) measurement(d[[v]]) <- "interval"


pgss <- as.data.frame(d, stringsAsFactors=FALSE)

save(pgss, file="../data/pgss.rda")


#============================================================================ 
# Co kiedy zadane?

vnames <- names(pgss)[-c(1:2)]
library(dplyr)
library(tidyr)
z <- mutate_each_(pgss, funs(!is.na(.)), vnames)
zz <- gather(z, variable, isna, -recordid, -pgssyear) %>% 
  group_by(variable, pgssyear) %>%
  summarise(nna=sum(isna)) %>%
  spread(pgssyear, nna)
zzz <- as.data.frame(zz)
zzz$opis <- description(d)[-c(1:2)]

# Zapisz do Excela
library(XLConnect)
wb <- loadWorkbook("../inst/exdata/pgss-info.xls", create=TRUE)
createSheet(wb, "PGSS informacje")
writeWorksheet(wb, zzz, sheet="PGSS informacje")
saveWorkbook(wb)



#============================================================================ 
# Podzbiory


# PGSS inequality (tab-delimited)
# bez itemów 'k' i 'l'
vnames <- c("recordid", "pgssyear", "hompop", "q32", "q135",
             paste0("in5", letters[1:10]),
             paste0("in6", letters[1:10]) )
pgss1999ineq <- subset(pgss, pgssyear==1999, select=vnames)
write.table(pgss1999ineq, file="../inst/exdata/pgss1999ineq.tab", row.names=FALSE, col.names=TRUE, sep="\t")

