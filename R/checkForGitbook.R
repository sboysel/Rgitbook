#' Check if Gitbook is installed.
#'
#' If Gitbook is not installed it will try to do so. If the installion fails or
#' Node.js is not installed, an error will be thrown.
#'
#' @param quiet logical indicating whether messages should be printed.
#' @export
checkForGitbook <- function(quiet = FALSE) {
	if (identical(Sys.which("npm"), "")) {
		stop("Cannot find node.js. You can install it from http://nodejs.org/download/")
	}
	if (identical(Sys.which("gitbook"), "")) {
		if (!quiet) {
		  stop("gitbook-cli not found.  Run 'npm install gitbook-cli -g' as root")
		}
	}
	if (!quiet) {
	  message("gitbook is installed and available")
	}
	invisible(TRUE)
}
