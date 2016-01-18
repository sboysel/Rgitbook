library(Rgitbook)
context("newGitbook")

# test_that("newGitbook generates proper errors, messages, and files", {
#   dir.create("temp")
#   temp_files <- file.path("temp", c(".bookignore", ".gitignore",
#     "references.bib", "README.md", "SUMMARY.md", "REFERENCES.Rmd"))
#   newGitbook(dir = "temp", example_sections = FALSE)
#   expect_true(all(file.exists(temp_files)))
#   unlink("temp", recursive = TRUE)
# })