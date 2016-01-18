#' Open a built gitbook.
#'
#' This function is a wrapper to the system call of \code{open} which should
#' open the book in the system's default web browser.
#'
#' @param out.dir location of the built gitbook.
#'
#' @export
openGitbook <- function(out.dir = file.path(getwd(), "_book")) {
	if (!grepl("_book", out.dir)) {
	  browseURL(file.path(out.dir, "_book", "index.html"))
	} else {
	  browseURL(file.path(out.dir, "index.html"))
	}
}
