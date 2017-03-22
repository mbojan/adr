#' Dane o uczniach pewnej klasy podstawowej
#'
#' Dane o 26-tu uczniach klasy podstawowej z pewnej szkoły w Polsce.
#'
#' @docType data
#' @name uczniowie
#' @aliases uczniowie_relacje uczniowie_atrybuty
#' @encoding UTF-8
#'
#' @format Dwie ramki danych z następującymi kolumnami:
#'
#' \code{uczniowie_relacje} kto z kim
#' \describe{
#' \item{from}{ID nadawcy relacji}
#' \item{to}{ID odbiorcy relacji}
#' \item{type}{Rodzaj relacji: "play", "notplay", "secret", "work"}
#' }
#'
#' \code{uczniowie_atrybuty} własności uczniów
#' \describe{
#' \item{name}{ID ucznia}
#' \item{isei08_m}{Status społeczno-ekonomiczny (ISEI) matki}
#' \item{isei08_f}{Status społeczno-ekonomiczny (ISEI) ojca}
#' \item{female}{Czy dziecko to dziewczynka}
#' }
#'
#' @source
#' Instyt Badań Edukacyjnych, badanie Szkolne Uwarunkowania Efektywności Kształcenia (SUEK)
NULL
