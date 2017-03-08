#' POLPAN: zachowania wyborcze
#'
#' Podzbiór Polskiego Badania Panelowego POLPAN. Zmienne dotyczące udziału w
#' wyborach parlamentarnych 1989, 1991, 1993, 1997, 2001, 2005, i 2007.
#'
#' @docType data
#' @name polpan
#' @encoding UTF-8
#' 
#' @format Ramka danych zawierająca 6671 obserwacji i 23 zmienne:
#' \describe{
#' \item{polpanid}{ID respondenta}
#' \item{yrbirth}{rok urodzenia}
#' \item{female}{płeć, czy R. jest kobietą}
#' \item{w1988, w1993, w1998, w2003, w2008}{zmienne logiczne czy R. brał udział w danej fali badania}
#' \item{parXXXXvote}{czy R. głosował w wyborach w XXXX roku}
#' \item{parXXXXchoice}{na kogo R. głosował w XXXX roku}
#' }
#'
#'
#' @source Polskie Badanie Panelowe POLPAN \url{http://www.polpan.org}
NULL
