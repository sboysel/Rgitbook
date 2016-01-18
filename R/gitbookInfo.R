#' Returns the version information about the currently installed gitbook and
#' what is avaialble from \url{https://www.npmjs.org/}.
#'
#' @return a character vector with two elements, \code{installed.version} and
#'         \code{available.version}.
#'
#' @export
gitbookInfo <- function() {
	checkForGitbook(quiet = TRUE)
	installed <- system("gitbook --version", intern = TRUE)
	current <- system("npm view gitbook-cli version", intern = TRUE)
	if (length(current) > 0) {
		current <- current[1]
		if (current == installed) {
			message(paste("gitbook-cli is up-to-date with version", current))
		} else {
			message(paste("A new version of gitbook-cli is available. Version",
						   installed, "installed,", current, "available."))
		}
	} else {
		warning(paste("Could not get the current available version of",
					  "gitbook-cli.  Are you connected to the interent?"))
	}
	invisible(c(installed.version = installed, available.version = current))
}
