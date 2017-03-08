#' Kopiuj dane do lokalnego katalogu
#'
#' W katalogu roboczym tworzy podkatalog 'data' i kopiuje tam wszystkie pliki
#' potrzebne podczas warsztatu.
#'
#' @param folder napis, katalog, do którego skopiować dane. Domyślnie 'data'.
#' @param dryrun czy wypisać "na sucho" operacje do wykonania
#'
#' @encoding UTF-8
#'
#' @export
kopiuj_dane <- function(folder="data", dryrun=FALSE)
{
  exdata_dir <- system.file("exdata", package="adr")
  fnames <- list.files(exdata_dir)
  if(dryrun)
  {
    cat("Czy katalog", folder, "istnieje? : ")
    folder_exists <- file.exists(folder)
    cat(folder_exists, "\n")
    if(folder_exists) {
      cat("Zawiera on nastepujace pliki:\n")
      print(list.files(folder))
    }
    cat("Pliki do skopiowania:\n")
    cat(file.path(exdata_dir, fnames), sep="\n")
    return(NULL)
  }
  dir.create(folder)
  for( f in fnames )
  {
    cat("Kopiowanie", sQuote(f), "do", folder, "... ")
    r <- file.copy( from=file.path(exdata_dir, f),
            to=file.path(folder, f ) )
    if(r) {
      cat("OK\n")
    } else {
      stop("not OK")
    }
  }
}
