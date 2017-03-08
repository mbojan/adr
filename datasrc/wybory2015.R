library(RSQLite)
library(XLConnect)

wb1 <- loadWorkbook("wyniki_tura1-1.xls")
t1 <- readWorksheet(wb1, 1, check.names=TRUE)

wb2 <- loadWorkbook("wyniki_tura2.xls")
t2 <- readWorksheet(wb2, 1, check.names=TRUE)

# Kropki na podkreślniki
names(t1) <- gsub("\\.+", "_", names(t1))
names(t2) <- gsub("\\.+", "_", names(t2))


#============================================================================ 
# Baza SQLite

dbname <- file.path("..", "inst", "exdata", "wybory2015.sqlite")
unlink(dbname)

con <- dbConnect(dbDriver("SQLite"), db=dbname)
dbWriteTable(con, "tura1", as.data.frame(t1, stringsAsFactors=FALSE), overwrite=TRUE)
dbWriteTable(con, "tura2", as.data.frame(t2, stringsAsFactors=FALSE), overwrite=TRUE)
dbDisconnect(con)

#============================================================================ 
# Pliki RDA

wybory2015_1 <- t1
Encoding(names(wybory2015_1)) <- "UTF-8"
Encoding(wybory2015_1$Województwo) <- "UTF-8"
Encoding(wybory2015_1$Gmina) <- "UTF-8"
Encoding(wybory2015_1$Siedziba) <- "UTF-8"

wybory2015_2 <- t2
Encoding(names(wybory2015_2)) <- "UTF-8"
Encoding(wybory2015_2$Województwo) <- "UTF-8"
Encoding(wybory2015_2$Gmina) <- "UTF-8"

save(wybory2015_1, file="../data/wybory2015_1.rda")
save(wybory2015_2, file="../data/wybory2015_2.rda")

