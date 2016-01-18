#' This will build a gitbook from the source markdown files.
#'
#' This function is simply a wrapper to a system call to \code{gitbook}.
#'
#' \url{https://github.com/GitbookIO/gitbook}
#'
#' @param source.dir location containing the source files.
#' @param out.dir location of the built book.
#' @param format the format of book. Options are pdf or ebook. If omitted,
#'        this will build a website.
#' @param buildRmd should \code{\link{buildRmd}} be called first.
#' @param gitbook.params other parameters passed to the gitbook command.
#' @param ... other parameters passed to \code{\link{buildRmd}}.
#' @export
buildGitbook <- function(source.dir = getwd(),
						 out.dir = paste0(getwd(), "/_book"),
						 buildRmd = TRUE,
						 format,
						 gitbook.params, ...) {
	if (buildRmd) {
		message("Building R markdown files...")
		buildRmd(source.dir, ...)
		message("R Markdown files successfully built!")
	}

	buildCmd <- "build"
	if (!missing(format)) { buildCmd <- format }
	cmd <- paste("gitbook", buildCmd, source.dir, paste0("--output=", out.dir))
	if (!missing(gitbook.params)) { cmd <- paste(cmd, gitbook.params)}
	message(cmd)
	system(cmd)

	  # Post-process hack to fix broken img urls.
	  # https://github.com/GitbookIO/gitbook/issues/99
	  # Will also fix links to the Introduction
	  # https://github.com/GitbookIO/gitbook/issues/113
		files <- list.files(out.dir, "*.html", recursive=TRUE)
		for (j in seq_along(files)) {
			fconn <- file(paste0(out.dir, "/", files[j]))
			file <- readLines(fconn)
			close(fconn)
			file <- gsub('./">', './index.html">', file)
			fconn <- file(paste0(out.dir, "/", files[j]))
			writeLines(file, fconn)
			close(fconn)
		}
}
