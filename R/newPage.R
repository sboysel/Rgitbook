#' Generate R markdown file
#'
#' @param filename target filename.  Default is 'newpage.Rmd'.
#' @param dir target destination of the file.  Default is current working directory.
#' @param title title to insert into Rmd file.  Default is 'Title'.
#' @examples
#' newPage()
#' newPage(filename = "mynewpage")
#' newPage(filename = "mynewpage.Rmd", title = "A custom title")
#' @export
newPage <- function(filename = "newpage.Rmd",
                    dir = getwd(),
                    title = "Title") {
  if (!grepl(".Rmd$", filename)) {
    filename <- paste0(filename, ".Rmd")
  }
  dir <- normalizePath(dir)
  filename <- file.path(dir, filename)
  title <- paste("#", title)
  knitr.header <- c( # TODO: make a package option?
    "```{r knitsetup, echo=FALSE, results='hide', warning=FALSE, message=FALSE, cache=FALSE}",
    "opts_knit$set(base.dir='./', fig.path='', out.format='md')",
    "opts_chunk$set(prompt=TRUE, comment='', results='markup')",
    "# See yihui.name/knitr/options for more Knitr options.",
    "##### Put other setup R code here",
    "",
    "```",
    "",
    title,
    ""
  )
  conn <- file(filename)
  writeLines(knitr.header, con = conn)
  close(conn)
  message(paste(filename, "created."))
  invisible()
}