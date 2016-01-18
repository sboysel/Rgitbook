#' Open a built gitbook.
#'
#' This function is a wrapper to the system call of \code{open} which should
#' open the book in the system's default web browser.
#'
#' @param out.dir location of the built gitbook.  The function will open
#' "_book/index.html" in a web browser.
#'
#' @export
openGitbook <- function(out.dir = getwd()) {
  out.dir <- normalizePath(out.dir)
	if (!any(grepl("_book", dir(out.dir)))) {
	  stop(paste("Gitbook not found in", out.dir))
	} else {
	  browseURL(file.path(out.dir, "_book", "index.html"))
	  invisible(TRUE)
	}
}
