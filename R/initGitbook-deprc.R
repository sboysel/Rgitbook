#' Create files and folders based on contents of SUMMARY.md.
#'
#' This first calls system command \code{gitbook init} but then will change
#' the all the file extensions from \code{.md} to \code{.Rmd} excluding
#' \code{SUMMARY.md} and \code{README.md}.
#'
#' @param dir source directory for the Gitbook.
#'
initGitbook <- function(dir) {
  if (missing(dir)) {
    stop("dir parameter is required.")
  }
	dir <- normalizePath(dir)
	mdfiles <- list.files(dir, "*.md$", recursive = TRUE, full.names = TRUE)
	mdfiles <- mdfiles[!grepl("README|SUMMARY|references|.Rmd", mdfiles)]

	knitr.header <- c( # TODO: make a package option?
		"```{r knitsetup, echo=FALSE, results='hide', warning=FALSE, message=FALSE, cache=FALSE}",
		"opts_knit$set(base.dir='./', fig.path='', out.format='md')",
		"opts_chunk$set(prompt=TRUE, comment='', results='markup')",
		"# See yihui.name/knitr/options for more Knitr options.",
		"##### Put other setup R code here",
		"",
		"```",
		""
	)

	for (md in mdfiles) {
		file <- file(md)
		lines <- readLines(file)
		close(file)

		#if the knitsetup block isn't already in the file, then add it
		if (!grepl("*```\\{r knitsetup,*", lines)[1]) {
			lines <- c(knitr.header, lines)
			file <- file(md)
			writeLines(lines, con = file)
			close(file)
		}
	}
	rmdfiles <- gsub('*/*.md$', '.Rmd', mdfiles)
	file.rename(mdfiles, rmdfiles)
	invisible()
}
