#' Wybory Prezydenta RP 2015
#'
#' Dane z głosowań pierwszej i drugiej tury wyborów Prezydenta RP w 2015 roku.
#'
#' Pakiet zawiera dane z wyborów w różnych formatach:
#'
#' @format Dwie ramki danych
#' \describe{
#' \item{\code{wybory2015_1}}{pierwsza tura}
#' \item{\code{wybory2015_2}}{druga tura}
#' \item{baza danych SQLite}{plik \code{wybory2015.sqlite} w katalogu \code{exdata} zawierająca tabele \code{tura1} oraz \code{tura2}}
#' \item{pliki XLS}{dwa pliki MS Excel \code{wyniki_tura1-1.xls} oraz
#' \code{wyniki_tura2.xls} oryginalnie dystrybuowane przez PKW}
#' }
#'
#' @docType data
#' @name wybory2015
#' @aliases wybory2015_1 wybory2015_2
#' @encoding UTF-8
#' @source Państwowa Komisja Wyborcza \url{http://www.pkw.gov.pl}
NULL


to_english_wybory2015_2 <- function() {
  vnames <- c(
    Województwo = "Voivodship"
  )
}
