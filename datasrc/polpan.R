polpan <- readRDS("polpanvote.rds")
vnames <- names(polpan)
todrop <- "gender"
polpan <- polpan[, !(vnames %in% todrop)]
save(polpan, file="../data/polpan.rda")
