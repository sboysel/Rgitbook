#' Initializes a new Gitbook.
#'
#' This will initalize a new Gitbook in the given directory. When done, it will
#' also change the working directory.
#'
#' @param dir location of the built gitbook.
#' @param example_sections If TRUE, sample chapters are created.
#'
#' @export
newGitbook <- function(dir, example_sections = TRUE) {
	if (missing(dir)) {
	  stop("dir parameter is required.")
	}

	dir <- path.expand(dir)
	message(paste0('Creating ', dir))
	if (!dir.exists(dir)) {
	  dir.create(dir, recursive = TRUE, showWarnings = FALSE)
	}

	message('Writing .bookignore...')
	bookignore <- system.file("templates", ".bookignore", package = "Rgitbook")
	file.copy(bookignore, file.path(dir, '.bookignore'))

	message('Writing .gitignore...')
	bookignore <- system.file("templates", ".gitignore", package = "Rgitbook")
	file.copy(bookignore, file.path(dir, '.gitignore'))

	message('Writing README.md...')
	bookignore <- system.file("templates", "README.md", package = "Rgitbook")
	file.copy(bookignore, file.path(dir, 'README.md'))

	message('Writing SUMMARY.md...')
	bookignore <- system.file("templates", "SUMMARY.md", package = "Rgitbook")
	file.copy(bookignore, file.path(dir, 'SUMMARY.md'))

	message('Writing REFERENCES.Rmd...')
	bookignore <- system.file("templates", "REFERENCES.Rmd", package = "Rgitbook")
	file.copy(bookignore, file.path(dir, 'REFERENCES.Rmd'))

	# Example Sections
	if (example_sections) {
	  sections <- file.path(dir, c("section1", "section2"))
	  n <- 1
	  for (s in sections) {
	    dir.create(s, recursive = TRUE, showWarnings = FALSE)
	    newPage(filename = "README.Rmd", dir = s, title = paste("Section", n))
	    newPage(filename = "example1.Rmd", dir = s, title = paste("Example", 1))
	    newPage(filename = "example2.Rmd", dir = s, title = paste("Example", 2))
	    n <- n + 1
	  }
	  example_summary <- c(
	    "",
	    "* [Section 1](section1/README.md)",
	    "\t* [Example 1](section1/example1.md)",
	    "\t* [Example 2](section1/example2.md)",
	    "* [Section 2](section2/README.md)",
	    "\t* [Example 1](section2/example1.md)",
	    "\t* [Example 2](section2/example2.md)"
	    )
	  cat(example_summary, file = file.path(dir, 'SUMMARY.md'), sep = "\n",
	      append = TRUE)
	}

	message('Writing references.bib...')
	gitbook.ref <- utils::bibentry(
		bibtype = "Manual",
		title = "Gitbook: Build beautiful interactive books using GitHub/Git and Markdown",
		author = person("Samy Pess\U00E9 and Aaron O'Mullan"),
		year = 2014,
		url = "http://www.gitbook.io/")
	knitcitations::write.bibtex(c(knitr = citation("knitr")[1],
	  knitcitations = utils::citation("knitcitations"),
		devtools = utils::citation("devtools"),
		gitbook = gitbook.ref),
		file = file.path(dir, "references.bib"))

	message("You can now open README.md and SUMMARY.md.")
	message(paste0("Once you are done editing SUMMARY.md, initGitbook()",
	  "will create the file and folder structure for your new Gitbook."))

	invisible()
}