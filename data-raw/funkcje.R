readxl <- function(fname, sheet)
{
  wb <- XLConnect::loadWorkbook(fname)
  readWorksheet(wb, sheet=sheet)
}
