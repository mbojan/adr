define run-r
R CMD BATCH --no-save --no-restore $< && touch $(<:.R=.Rdone)
endef

scripts=warszawa pgss polpan wybory2015

.PHONY: default
default: $(scripts:=.Rdone) shp.done

#============================================================================ 

warszawa.Rdone: warszawa.R $(wildcard warszawa-*.csv) rekody.xls
	$(run-r)
	cp $(wildcard warszawa-*.csv) ../inst/exdata/

pgss.Rdone: pgss.R P0053SAV.sav pgss1.csv sex_data.sav tax_data.sav pgss1999in.tab earnings_data.sav
	$(run-r)
	cp sex_data.sav tax_data.sav earnings_data.sav ../inst/exdata/

polpan.Rdone: polpan.R polpanvote.rds
	$(run-r)

wybory2015.Rdone: wybory2015.R wyniki_tura1-1.xls wyniki_tura2.xls
	$(run-r)
	cp wyniki_tura1-1.xls wyniki_tura1-1.xls ../inst/exdata/

shp.done:
	cp POL_adm1.* ../inst/exdata/ && touch $@
