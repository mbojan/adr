#' Koduj lub dekoduj napisy z UTF-8 do Windows lub vice versa
#'
#' Zmiana strony kodowej UTF-8 <-> CP1250. Przydatne w przypadku interakcji z
#' bazami danych takimi, jak SQLite, w których kwerendy muszą być wysyłane w
#' UTF-8. W tym samym kodowaniu zwracane są wyniki.
#'
#' @param x ramka, lub wektor napisów do (de)kodowania, patrz Details
#' @param from_encoding,to_encoding strona kodowa źródłowa i docelowa
#' @param ... inne argumenty dla \code{\link{iconv}}
#'
#' Funkcja \code{dekoduj} bierze ramkę danych z zwraca ją ze wszystkimi
#' kolumnami napisowymi (character) przekodowanymi z UTF-8 na kodowanie CP1250
#' (Windows po Polsku).
#'
#' Funkcja \code{koduj} bierze wektor napisów w kodowaniu CP1250 i zwraca
#' przekształcony na UTF-8.
#'
#' @encoding UTF-8
#' @export 
dekoduj <- function(x, ...) UseMethod("dekoduj")

#' @method dekoduj data.frame
#' @rdname dekoduj
#' @export
dekoduj.data.frame <- function(x, from_encoding = "UTF-8", to_encoding = "cp1250", ...)
{
  # names of columns are encoded in specified encoding
  my_names <- iconv(names(x), from=from_encoding, to=to_encoding, ...)

  # if any column name is NA, leave the names
  # otherwise replace them with new names
  if(any(is.na(my_names))){
    names(x)
  } else {
    names(x) <- my_names
  }

  # get column classes
  x_char_columns <- sapply(x, class)
  # identify character columns
  x_cols <- names(x_char_columns[x_char_columns == "character"])

  # convert all string values in character columns to 
  # specified encoding
  x[x_cols] <- lapply(x[x_cols], iconv, from=from_encoding, to=to_encoding, ...)
  # return x
  return(x)
}



#' @method dekoduj default
#' @rdname dekoduj
#' @export
dekoduj.default <- function(x, from_encoding="UTF-8", to_encoding="CP1250", ...)
{
  iconv(x, from=from_encoding, to=to_encoding, ...)
}



#' @export
#' @rdname dekoduj
koduj <- function(x, from_encoding="", to_encoding="UTF-8", ...) {
  iconv(x, from=from_encoding, to=to_encoding, ...)
}
